/**
 * Created by albert on 08/03/16.
 */

import IA.DistFS.Requests;
import IA.DistFS.Servers;

import java.util.Iterator;
import java.util.Set;
import java.util.stream.IntStream;

public class DistribFileSystemBoard {
    public static Requests requests;
    public static Servers servers;

    private static int nRequests; // O(nUsers*requestsPerUser)
    private static int nServers;
    private static int nFiles; // Siempre es 1000
    private static int nUsers;
    private static int maxRequestsPerUser; // 1 <= requestsPerUser <= maxRequestsPerUser
    private static int minReplicationsPerFile; // minReplicationsPerFile <= replicationsPerFile <= minReplicationsPerFile + 2

    // Tiempo de transmisión total de cada servidor
    private int[] serverTT;

    // Que servidor sirve cada peticion
    private int[] requestServer;

    // TODO: Quizas mantener la suma de tiempos de transmission, o de sus cuadrados

    public DistribFileSystemBoard(DistribFileSystemBoard otherBoard) {
        serverTT = new int[nServers];
        requestServer = new int[nRequests];

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

        serverTT = new int[nServers];
        requestServer = new int[nRequests];
    }

    // TODO: Borrar en la entrega
    private void checkRequest(int request) {
        assert(request >= 0 && request < nRequests);
    }

    // TODO: Borrar en la entrega
    private void checkServer(int server) {
        assert(server >= 0 && server < nServers);
    }


    public static int getNRequests() {
        return nRequests;
    }
    public static int getNServers() { return nServers; }


    public static void generateProblem(int nUsers, int maxRequests, int nServ,
                                       int nRep, int reqSeed, int servSeed)
            throws Servers.WrongParametersException
    {
        servers = new Servers(nServ, nRep, servSeed);
        requests = new Requests(nUsers, maxRequests, reqSeed);

        nServers = nServ;
        nFiles = servers.size();

        minReplicationsPerFile = nRep;
        maxRequestsPerUser = maxRequests;

        DistribFileSystemBoard.nUsers = nUsers;
        DistribFileSystemBoard.nRequests = requests.size();
    }

    public int whoIsServing(int request) {
        checkRequest(request);
        return requestServer[request];
    }

    public int totalServerTT(int server) {
        checkServer(server);
        return serverTT[server];
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
     * No se sale del espacio de soluciones
     */
    public void assignRequest(int server, int request) {
        checkRequest(request);
        checkServer(server);

        final int previousServer = requestServer[request];
        requestServer[request] = server;

        final int user = requests.getRequest(request)[0];

        serverTT[previousServer] -= getTTUser(previousServer, user);
        serverTT[server]         += getTTUser(server,         user);
    }

    /**
     * Asume que la peticion no esta asignada a ningun servidor
     */
    private void assignRequestInitial(int server, int request) {
        checkRequest(request);
        checkServer(server);

        requestServer[request] = server;
        serverTT[server] += getTT(server, request);
    }

    /**
     * Asume que las dos peticiones estan asignadas a un servidor
     * @return Cierto si el servidor asignado a request1 puede servir request2 y
     *         viceversa y los dos servidores son diferentes
     */
    public boolean interchangeable(int request1, int request2) {
        checkRequest(request1);
        checkRequest(request2);

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
        // TODO: Borrar en la entrega
        assert(interchangeable(request1, request2));

        final int server1 = requestServer[request1];
        final int server2 = requestServer[request2];

        requestServer[request1] = server2;
        requestServer[request2] = server1;
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
    }

    /**
     * Asigna las peticiones intentando minimizar la variabilidad entre el
     * tiempo de transmision entre servidores
     *
     * Coste en caso peor: O(nRequests*minReplicationsPerFile)
     */
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

            assignRequestInitial(bestServer, request);
        }
    }

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
    }


    // TODO: Mirar cual de las dos alternativas es mejor
    public int getMaxServerTT() {
        return IntStream.of(serverTT).parallel().max().getAsInt();
    }

    /*
    public int getMaxServerTT() {
        int max = 0;

        for (int tt : serverTT)
            if (tt > max) max = tt;

        return max;
    }*/

    public int getTotalTT() {
        // TODO: Mirar si esto funca en la FIB
        return IntStream.of(serverTT).parallel().sum();
    }

    /*
    public int getTotalTT() {
        int sum = 0;

        for (int tt : serverTT) sum += tt;

        return tt;
    }*/

    // Poco estable numericamente
    public double getTTVariance() {
        final int totalTT = getTotalTT();
        final double mean = totalTT/(double)(nServers);

        double sumDiff = 0.0D;

        for (int tt : serverTT) {
            final double diff = tt - mean;
            sumDiff += diff*diff;
        }

        return sumDiff/nServers;
    }

    // Estable numericamente pero mucho mas costoso por la division
    public double getTTVarianceStable() {
        double mean = 0.0D;
        double M2 = 0.0D;

        for (int i = 0; i < nServers; ++i) {
            final int tt = serverTT[i];
            final double delta = tt - mean;
            mean += delta/(i + 1);
            M2 += delta*(tt - mean);
        }

        if (nServers < 2)
            return 0;
        else
            return M2/(nServers - 1);
    }


    public String toStringVerbose() {
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
        return "Variance: " + getTTVariance() + ", TotalTT: " + getTotalTT() + ", MaxTT: " + getMaxServerTT();
    }

    public String toJson() {
        return "{ \"tt_variance\": " + getTTVariance() +
               ", \"total_tt\": "    + getTotalTT()    +
               ", \"max_tt\": "      + getMaxServerTT() +
               ", \"heuristic\": "   + DistribFileSystemMain.heuristicFunction
                                       .getHeuristicValue(this) +
               " }";
    }
}
