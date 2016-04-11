/**
 * Created by albert on 08/03/16.
 */

import IA.DistFS.Requests;
import IA.DistFS.Servers;

import java.util.Iterator;
import java.util.Set;

public class DistribFileSystemBoard {
    public static Requests requests;
    public static Servers servers;

    private static int nRequests; // O(nUsers*requestsPerUser)
    private static int nServers;
    private static double nServersInverse; // Multiplicar por el inverso es mas eficiente que dividir

    // Tiempo de transmisión total de cada servidor
    private int[] serverTT;

    /**
     * Explicacion:
     *  La estructura de datos Set<Integer>[] requestsByServer
     *  seria equivalente. Además, nos iria bien tanto para el operador de
     *  swap como para el operador de move.
     *
     *  Nos iria bien en el swap porque para ver que peticiones podemos
     *  intercambiar con una peticion dada X actualmente servida por S
     *  (sabemos rapidamente quien la sirve por la forma en la que recorremos las peticiones),
     *  solo tendriamos que mirar aquellas peticiones Y que estan siendo servidas
     *  por algun servidor T de los que pueden servir X, comprobar que S puede servir Y,
     *  y intercambiar X con Y borrando X del set de S y Y del set de T y añadiendo
     *  X al set de T y Y al set de S.
     *
     *  Nos iria bien en el move porque para mover una peticion X actualmente
     *  servida por S solo tendriamos que borrar X del set de S y añadirla
     *  en el set de alguno de los otros servidores que pueden servir X.
     *  Nuevamente podemos saber rapidamente que servidor atiende una peticion
     *  por la forma en la que recorremos las peticiones.
     *
     *  Hemos escogido esta otra implementacion (que nos sigue yendo bien para
     *  el operador de move, pero no para el de swap, ya que no podemos saber
     *  rapidamente que peticiones esta sirviendo un servidor X dado), porque
     *  en los experimentos hemos visto que el conjunto de operadores swap+move
     *  no daba soluciones mejores que el conjunto move, y esta estructura de datos,
     *  si bien nos da un coste asimptotico en mediana igual para el operador de move,
     *  tiene una constante mas pequeña que la estructura de datos con el set,
     *  que tendra su overhead en el recorrido del Set y por los dos bucles
     *  anidados que tendriamos que hacer siempre que quisieramos recorrer todas
     *  las peticiones.
     *  */
    private int[] requestServer; // Que servidor sirve cada peticion

    private int totalTT;


    public DistribFileSystemBoard(DistribFileSystemBoard otherBoard) {
        serverTT = new int[nServers];
        requestServer = new int[nRequests];

        totalTT = otherBoard.totalTT;

        System.arraycopy(otherBoard.serverTT, 0,
                serverTT, 0, nServers);
        System.arraycopy(otherBoard.requestServer, 0, requestServer, 0, nRequests);
    }

    // La inicializacion se lleva a cabo con generateInitialState{i}
    // Se hace así para que se incialicen siempre las ED antes de empezar
    // a generar el estado, y así evitar que estas tengan "basura" de generaciones
    // anteriores (en el caso de que se encadenen varias generaciones de estados
    // iniciales sobre una misma instancia)
    public DistribFileSystemBoard() {}

    private void createDataStructures() {
        // Todos los valores inicializados a 0 por defecto
        totalTT = 0;

        serverTT = new int[nServers];
        requestServer = new int[nRequests];
    }

    public static int getNRequests() {
        return nRequests;
    }


    public static void generateProblem(int nUsers, int maxRequests, int nServ,
                                       int nRep, int reqSeed, int servSeed)
            throws Servers.WrongParametersException
    {
        servers = new Servers(nServ, nRep, servSeed);
        requests = new Requests(nUsers, maxRequests, reqSeed);

        nServers = nServ;
        nServersInverse = 1.0D/nServers;

        DistribFileSystemBoard.nRequests = requests.size();
    }

    public int whoIsServing(int request) {
        return requestServer[request];
    }

    public int getTT(int server, int request) {
        return servers.tranmissionTime(server, requests.getRequest(request)[0]);
    }

    public int getTTUser(int server, int user) {
        return servers.tranmissionTime(server, user);
    }

    /**
     * Asume que la peticion ya esta asignada a un servidor
     *
     * Factor de ramificacion: nRequests*minReplicationsPerFile
     *
     * Permite llegar a cualquier solucion del espacio
     *
     * No se sale del espacio de soluciones
     */
    public void assignRequest(int server, int request) {
        final int previousServer = requestServer[request];
        requestServer[request] = server;

        final int user = requests.getRequest(request)[0];

        final int previousTT = getTTUser(previousServer, user);
        final int newTT      = getTTUser(server,         user);

        serverTT[previousServer] -= previousTT;
        serverTT[server]         += newTT;

        totalTT += newTT - previousTT;
    }

    /**
     * Asume que la peticion no esta asignada a ningun servidor
     */
    private void assignRequestInitial(int server, int request) {
        requestServer[request] = server;
        serverTT[server] += getTT(server, request);
    }

    /**
     * Asume que las dos peticiones estan asignadas a un servidor
     * @return Cierto si el servidor asignado a request1 puede servir request2 y
     *         viceversa y los dos servidores son diferentes
     */
    public boolean interchangeable(int request1, int request2) {
        final int file1 = requests.getRequest(request1)[1];
        final int file2 = requests.getRequest(request2)[1];

        final int server2 = requestServer[request2];
        final int server1 = requestServer[request1];

        return server1 != server2 && // No tiene sentido intercambiar entre el mismo server
               servers.fileLocations(file1).contains(server2) &&
               servers.fileLocations(file2).contains(server1);

    }

    /*
        Factor de ramificacion: nRequests*(nRequests - 1)/2

        No permite acceder a cualquier solucion del espacio

        No se sale del espacio de soluciones
     */
    public void swapRequests(int request1, int request2) {
        final int server1 = requestServer[request1];
        final int server2 = requestServer[request2];

        requestServer[request1] = server2;
        requestServer[request2] = server1;

        final int tt21 = getTT(server2, request1);
        final int tt12 = getTT(server1, request2);
        final int tt22 = getTT(server2, request2);
        final int tt11 = getTT(server1, request1);

        serverTT[server1] += tt12 - tt11;
        serverTT[server2] += tt21 - tt22;

        totalTT += tt21 + tt12 - tt22 - tt11;
    }

    /**
     * Asigna cada peticion al primer servidor que tenga el archivo
     * No tiene en cuenta ni el tiempo ni el equilibrio entre servidores
     *
     * Quiza en un caso de la vida real seria mas adecuado escoger el servidor
     * aleatoriamente
     *
     * Coste: theta(nRequests) (optimo)
     */
    public void generateInitialStateSequential() {
        createDataStructures();

    	for (int request = 0; request < nRequests; ++request) {
            final int file = requests.getRequest(request)[1];

            final Set<Integer> serversWithFile = servers.fileLocations(file);
            final Iterator<Integer> it = serversWithFile.iterator();

            // Asumimos que siempre hay almenos un servidor con el fichero
            final int serverAssigned = it.next();

            assignRequestInitial(serverAssigned, request);
	    }

        totalTT = computeTotalTT();
    }


    /**
     * Asigna cada peticion al servidor con menor tiempo de transmision de entre
     * todos los que tienen el archivo.
     *
     * No tiene en cuenta el equilibrio entre servidores
     *
     * Coste: theta(nRequests*minReplicationsPerFile)
     */
    public void generateInitialStateMinTT() {
        createDataStructures();

        for (int request = 0; request < nRequests; ++request) {
            final int[] infoRequest = requests.getRequest(request);

            final int user = infoRequest[0];
            final int file = infoRequest[1];

            final Set<Integer> serversWithFile = servers.fileLocations(file);

            int min_tt = Integer.MAX_VALUE;
            int best_server = -1;

            // Buscamos el servidor con el menor tiempo de transmision con el usuario
            for (int server : serversWithFile) {
                int tt = servers.tranmissionTime(server, user);

                if (tt < min_tt) {
                    min_tt = tt;
                    best_server = server;
                }
            }

            assignRequestInitial(best_server, request);
        }

        totalTT = computeTotalTT();
    }

    /**
     * Asigna las peticiones intentando minimizar la variabilidad entre el
     * tiempo de transmision entre servidores.
     *
     * Descartado por no dar el resultado que se esperaba
     *
     * Coste en caso peor: O(nRequests*minReplicationsPerFile)
     */
    /*
    public void generateInitialStateMinVar() {
        createDataStructures();

    	for (int request = 0; request < nRequests; ++request) {
            final int file = requests.getRequest(request)[1];

            final Set<Integer> serversWithFile = servers.fileLocations(file);

            int minTransmissionTime = Integer.MAX_VALUE;
            int bestServer = -1;

            // Buscamos el servidor que tenga el minimo tiempo de transmision total
            // acumulado de entre todos
            for (int server : serversWithFile) {
                final int transmissionTime = serverTT[server];

                if (transmissionTime == 0) {
                    bestServer = server;
                    break;
                }
                else if (transmissionTime < minTransmissionTime) {
                    minTransmissionTime = transmissionTime;
                    bestServer = server;
                }
            }

            //System.out.println("best: " + bestServer + ", tt: " + minTransmissionTime);

            assignRequestInitial(bestServer, request);
        }

        totalTT = computeTotalTT();
    }*/

    /**
     * Asigna las peticiones intentando minimizar el tiempo de transmision
     * del servidor que lo tiene mayor
     *
     * Coste: theta(nRequests)
     */
    public void generateInitialStateMinMax() {
        createDataStructures();

        int maxTransmissionTime = -1;
        int maxServer = -1;

        for (int request = 0; request < nRequests; ++request) {
            final int file = requests.getRequest(request)[1];

            final Set<Integer> serversWithFile = servers.fileLocations(file);

            // Intentamos no escoger el servidor que tiene el maximo ahora mismo
            Iterator<Integer> it = serversWithFile.iterator();

            int server = it.next();
            if (server == maxServer && it.hasNext()) server = it.next();

            assignRequestInitial(server, request);

            final int tt = serverTT[server];

            if (tt > maxTransmissionTime) {
                maxTransmissionTime = tt;
                maxServer = server;
            }
        }

        totalTT = computeTotalTT();
    }


    public int getMaxServerTT() {
        int max = 0;

        for (int tt : serverTT)
            if (tt > max) max = tt;

        return max;
    }

    public int computeTotalTT() {
        int sum = 0;

        for (int tt : serverTT) sum += tt;

        return sum;
    }

    public int getTotalTT() {
        return totalTT;
    }

    public double[] getTTMeanVariance() {
        double mean = totalTT*nServersInverse;

        double temp = 0;

        for (int tt : serverTT) {
            double diff = mean - tt;
            temp += diff*diff;
        }

        return new double[] { mean, temp*nServersInverse };
    }

    public String getSolutionDescription() {
        final StringBuilder builder = new StringBuilder();

        builder.append("<Request>: <Server attending request>\n\n");
        for (int request = 0; request < nRequests;  ++request)
            builder.append(request).append(": ").append(requestServer[request]).append("\n");

        builder.append("\n<Server>: <Total transmission time>\n\n");
        for (int server = 0; server < nServers; ++server)
            builder.append(server).append(": ").append(serverTT[server]).append("\n");

        return builder.toString();
    }

    @Override
    public String toString() {
        return "StdDevTT: " + Math.sqrt(getTTMeanVariance()[1]) + ", TotalTT: " + getTotalTT() + ", MaxTT: " + getMaxServerTT();
    }
}
