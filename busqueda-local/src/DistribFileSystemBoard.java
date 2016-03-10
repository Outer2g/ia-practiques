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

    private static int nRequests;
    private static int nServers;
    private static int nFiles;
    private static int nUsers;
    private static int maxRequestsPerUser;
    private static int minReplicationsPerFile;

    private int[] nFilesServed; // How many files does each server serve

    // Documentar decisión
    private int[] requestServer; // Which is the server that serves that request


    public DistribFileSystemBoard(DistribFileSystemBoard otherBoard) {
        nFilesServed = new int[otherBoard.nFilesServed.length];
        requestServer = new int[otherBoard.requestServer.length];

        System.arraycopy(otherBoard.nFilesServed, 0, nFilesServed, 0,
                         nFilesServed.length);
        System.arraycopy(otherBoard.requestServer, 0, requestServer, 0,
                         requestServer.length);
    }

    public DistribFileSystemBoard() {}

    private void createDataStructures() {
        nFilesServed = new int[nServers]; // All values initialized to 0 by default
        requestServer = new int[nRequests];
    }
    public int getnRequests(){return nRequests;}
    public Requests getRequests(){return requests;}
    public Servers getServers(){return servers;}

    private void checkRequest(int request) { // TODO: Remove on production
        assert(request >= 0 && request < nRequests);
    }

    private void checkServer(int server) { // TODO: Remove on production
        assert(server >= 0 && server < nServers);
    }
    //checks if request is in the set of servers
    public boolean checkReqOnServers(int request, Set servers){
        return servers.contains(requestServer[request]);
    }

    public static void generateRequests(int nusers, int nrequests, int seed) {
        requests = new Requests(nusers, nrequests, seed);

        maxRequestsPerUser = nrequests;
        nUsers = nusers;
        nRequests = requests.size();
    }

    public static void generateServers(int nserv, int nrep, int seed)
            throws Servers.WrongParametersException
    {
        servers = new Servers(nserv, nrep, seed);

        nServers = nserv;
        nFiles = servers.size();
        minReplicationsPerFile = nrep;
    }

    public int whoIsServing(int request) {
        checkRequest(request);
        return requestServer[request];
    }

    public int howManyIsServing(int server) {
        checkServer(server);
        return nFilesServed[server];
    }

    /**
     * Assumes the request is currently assigned to a server
     *
     * Ramification factor: nServers*nRequests
     * Allows to reach all space of solutions
     */
    public void assignRequest(int server, int request) {
        checkRequest(request);
        checkServer(server);

        final int previousServer = requestServer[request];
        --nFilesServed[previousServer];

        requestServer[request] = server;
        ++nFilesServed[server];
    }

    /**
     * Assumes the request is not yet assigned to any server
     */
    private void assignRequestInitial(int server, int request) {
        checkRequest(request);
        checkServer(server);

        requestServer[request] = server;
        ++nFilesServed[server];
    }

    /**
     * Assumes both requests are assigned to a server
     * @return Whether the server assigned to request1 can serve request2 and viceversa
     */
    public boolean interchangeable(int request1, int request2) {
        checkRequest(request1);
        checkRequest(request2);
        
        final int file1 = requests.getRequest(request1)[1];
        final int file2 = requests.getRequest(request2)[1];

        return servers.fileLocations(file1).contains(requestServer[request2]) &&
               servers.fileLocations(file2).contains(requestServer[request1]);
    }

    /*
    Ramification factor: nRequests*(nRequests-1)/2
    Does not allow to reach all space of solutions
     */
    public void swapRequests(int request1, int request2) {
        assert(interchangeable(request1, request2)); // TODO: Remove on production

        final int server1 = requestServer[request1];
        requestServer[request1] = requestServer[request2];
        requestServer[request2] = server1;
    }

    
    /**Asigna cada petición al primer servidor que tenga el archivo
    no tiene en cuenta ni el tiempo ni el equilibrio entre servidores
    Todas las peticiones se concentrarán en los x primeros servidores del set

     Coste: nRequests
    **/
    public void generateInitialState1() {
        createDataStructures();

    	for (int request = 0; request < nRequests; ++request){
            final int file = requests.getRequest(request)[1];

            final Set<Integer> serversWithFile = servers.fileLocations(file);
            final Iterator<Integer> it = serversWithFile.iterator();

            // Asumimos que siempre hay almenos un servidor con el fichero
            final int serverAssigned = it.next();

            assignRequestInitial(serverAssigned, request);
	    }
    }
    
    /**Assigna una petición a cada servidor que contenga el archivo equilibrando el 
    numero de peticiones por servidor. No tiene en cuenta el tiempo de transmision

     Coste en caso peor: O(nRequests*replicationsPerFile)
     (replicationsPerFile es como máximo minReplicationsPerFile + 3)
    **/
    public void generateInitialState2() {
        createDataStructures();

    	for (int request = 0; request < nRequests; ++request) {
            final int file = requests.getRequest(request)[1];

            final Set<Integer> serversWithFile = servers.fileLocations(file);

            int min_served = Integer.MAX_VALUE;
            int best_server = -1;

            for (int server : serversWithFile) {
                final int nserved = nFilesServed[server];

                if (nserved == 0) {
                    best_server = server;
                    break;
                }
                else if (nserved < min_served) {
                    min_served = nserved;
                    best_server = server;
                }
            }

            assignRequestInitial(best_server, request);
        }
    }
    
    /**Asigna una petición al servidor que contenga el archivo y que tenga
     * menor tiempo de transmisión con el usuario
     * Coste en caso peor: O(nRequests*replicationsPerFile)
     * (replicationsPerFile es como máximo minReplicationsPerFile + 3)
    **/
    public void generateInitialState3() {
        createDataStructures();

        for (int request = 0; request < nRequests; ++request) {
            final int[] infoRequest = requests.getRequest(request);

            final int user = infoRequest[0];
            final int file = infoRequest[1];

            final Set<Integer> serversWithFile = servers.fileLocations(file);

            int min_tt = Integer.MAX_VALUE;
            int best_server = -1;

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

    public int calculateTotalTransmissionTime() {
        int total = 0;

        for (int request = 0; request < nRequests; ++request) {
            int user = requests.getRequest(request)[0];
            int server = requestServer[request];
            total += servers.tranmissionTime(server, user);
        }

        return total;
    }

    public double calculateFilesServedVariance() {
        double mean = 0.0D;
        double M2 = 0.0D;

        for (int server = 0; server < nServers; ++server) {
            int filesServed = nFilesServed[server];
            double delta = filesServed - mean;
            mean += delta/(server+1);
            M2 += delta*(filesServed - mean);
        }

        if (nServers < 2) return 0;
        else return M2/(nServers - 1);
    }

    @Override
    public String toString() {
        final StringBuilder builder = new StringBuilder();

        builder.append("<Request>: <Server attending request>\n\n");
        for (int request = 0; request < nRequests;  ++request)
            builder.append(request).append(": ").append(requestServer[request]).append("\n");

        builder.append("\n<Server>: <Number of files served>\n\n");
        for (int server = 0; server < nServers; ++server)
            builder.append(server).append(": ").append(nFilesServed[server]).append("\n");

        return builder.toString();
    }
}
