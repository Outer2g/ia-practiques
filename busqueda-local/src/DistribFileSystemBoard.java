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

    private int[] transmissionTimeByServer; // How many files does each server serve

    // Documentar decisión
    private int[] requestServer; // Which is the server that serves that request

    private int totalTransmissionTime;
    private long totalTransmissionTimeSq;


    public DistribFileSystemBoard(DistribFileSystemBoard otherBoard) {
        transmissionTimeByServer = new int[nServers];
        requestServer = new int[nRequests];

        totalTransmissionTime = otherBoard.totalTransmissionTime;
        totalTransmissionTimeSq = otherBoard.totalTransmissionTimeSq;

        System.arraycopy(otherBoard.transmissionTimeByServer, 0,
                         transmissionTimeByServer, 0, nServers);
        System.arraycopy(otherBoard.requestServer, 0, requestServer, 0, nRequests);
    }

    // Initialization is done via generateInitialState{n}
    public DistribFileSystemBoard() {}

    private void createDataStructures() {
        transmissionTimeByServer = new int[nServers]; // All values initialized to 0 by default
        requestServer = new int[nRequests];

        totalTransmissionTime = 0;
        totalTransmissionTimeSq = 0L;
    }

    private void checkRequest(int request) { // TODO: Remove on production
        assert(request >= 0 && request < nRequests);
    }

    private void checkServer(int server) { // TODO: Remove on production
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
        assert(nServ > 1);

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

    public int totalServerTransmissionTime(int server) {
        checkServer(server);
        return transmissionTimeByServer[server];
    }

    public int getTransmissionTime(int server, int request) {
        return servers.tranmissionTime(server, requests.getRequest(request)[0]);
    }

    public int getTransmissionTimeUser(int server, int user) {
        return servers.tranmissionTime(server, user);
    }

    /**
     * Assumes the request is currently assigned to a server
     * Returns true if it's already in the server, false otherwise
     *
     * Ramification factor: O(nRequests*replicationsPerFile)
     (replicationsPerFile es como máximo minReplicationsPerFile + 3)
     * Allows to reach all space of solutions
     */
    public void assignRequest(int server, int request) {
        checkRequest(request);
        checkServer(server);

        final int previousServer = requestServer[request];
        requestServer[request] = server;

        final int user = requests.getRequest(request)[0];

        final int ttPrevious = getTransmissionTimeUser(previousServer, user);
        final int ttNew      = getTransmissionTimeUser(server,         user);

        totalTransmissionTime += ttNew - ttPrevious;

        final int previousTTbefore = transmissionTimeByServer[previousServer];
        final int newTTbefore      = transmissionTimeByServer[server];

        transmissionTimeByServer[previousServer] -= ttPrevious;
        transmissionTimeByServer[server] += ttNew;

        final int previousTTafter = transmissionTimeByServer[previousServer];
        final int newTTafter      = transmissionTimeByServer[server];

        totalTransmissionTimeSq += newTTafter*newTTafter
                + previousTTafter*previousTTafter
                - newTTbefore*newTTbefore
                - previousTTbefore*previousTTbefore;
    }

    /**
     * Assumes the request is not yet assigned to any server
     */
    private void assignRequestInitial(int server, int request) {
        checkRequest(request);
        checkServer(server);

        requestServer[request] = server;

        final int transmissionTime = getTransmissionTime(server, request);

        transmissionTimeByServer[server] += transmissionTime;
        totalTransmissionTime += transmissionTime;
        totalTransmissionTimeSq += transmissionTime*transmissionTime;
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

        final int server2 = requestServer[request2];
        final int server1 = requestServer[request1];

        return server1 != server2 && // Doesn't make sense to swap among equal servers
               (file1 == file2 || // Avoids further checks sometimes
               servers.fileLocations(file1).contains(server2) &&
               servers.fileLocations(file2).contains(server1));

    }



    /*
    Ramification factor: nRequests*(nRequests-1)/2
    Does not allow to reach all space of solutions
     */
    public void swapRequests(int request1, int request2) {
        assert(interchangeable(request1, request2)); // TODO: Remove on production

        final int server1 = requestServer[request1];
        final int server2 = requestServer[request2];

        requestServer[request1] = server2;
        requestServer[request2] = server1;

        final int user1 = requests.getRequest(request1)[0];
        final int user2 = requests.getRequest(request2)[0];

        final int tt21 = getTransmissionTimeUser(server2, user1);
        final int tt12 = getTransmissionTimeUser(server1, user2);
        final int tt22 = getTransmissionTimeUser(server2, user2);
        final int tt11 = getTransmissionTimeUser(server1, user1);

        totalTransmissionTime += tt21 + tt12 - tt22 - tt11;
        totalTransmissionTimeSq += tt21*tt21 + tt12*tt12 - tt22*tt22 - tt11*tt11;

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
    tiempo de transmision de los servidores.

     Coste en caso peor: O(nRequests*replicationsPerFile)
     (replicationsPerFile es como máximo minReplicationsPerFile + 3)
    **/
    public void generateInitialState2() {
        createDataStructures();

    	for (int request = 0; request < nRequests; ++request) {
            final int file = requests.getRequest(request)[1];

            final Set<Integer> serversWithFile = servers.fileLocations(file);

            int minTransmissionTime = Integer.MAX_VALUE;
            int bestServer = -1;

            for (int server : serversWithFile) {
                final int transmissionTime = transmissionTimeByServer[server];

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

    public int getMaxServerTransmissionTime() {
        int max = 0;

        for (int tt : transmissionTimeByServer)
            if (tt > max) max = tt;

        return max;
    }

    public int getTotalTransmissionTime() {
        return totalTransmissionTime;
    }

    public double getTransmissionTimeVariance() {

        final double totalTransmissionTimeSq2 = totalTransmissionTime*((double)(totalTransmissionTime)/nServers);

        return (totalTransmissionTimeSq - totalTransmissionTimeSq2)/nServers;
    }


    public String toStringVerbose() {
        final StringBuilder builder = new StringBuilder();

        builder.append("<Request>: <Server attending request>\n\n");
        for (int request = 0; request < nRequests;  ++request)
            builder.append(request).append(": ").append(requestServer[request]).append("\n");

        builder.append("\n<Server>: <Total transmission time>\n\n");
        for (int server = 0; server < nServers; ++server)
            builder.append(server).append(": ").append(transmissionTimeByServer[server]).append("\n");

        return builder.toString();
    }

    @Override
    public String toString() {
        return "Variance: " + getTransmissionTimeVariance() + ", TotalTT: " + getTotalTransmissionTime() + ", MaxTT: " + getMaxServerTransmissionTime();
    }

    public String toJson() {
        return "{ \"tt_variance\": " + getTransmissionTimeVariance() +
               ", \"total_tt\": "    + getTotalTransmissionTime()    +
               ", \"max_tt\": "      + getMaxServerTransmissionTime() +
               ", \"heuristic\": "   + DistribFileSystemMain.heuristicFunction
                                       .getHeuristicValue(this) +
               " }";
    }
}
