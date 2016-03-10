/**
 * Created by albert on 08/03/16.
 */

import IA.DistFS.Requests;
import IA.DistFS.Servers;

public class DistribFileSystemBoard {
    private static Requests requests;
    private static Servers servers;

    private int[] nFilesServed; // How many files does each server serve

    // Documentar decisión
    private int[] requestServer; // Which is the server that serves that request


    public DistribFileSystemBoard(int[] nFilesServedToAssign, int[] requestServerToAssign) {
        this.nFilesServed = new int[nFilesServedToAssign.length];
        this.requestServer = new int[requestServerToAssign.length];

        System.arraycopy(nFilesServedToAssign, 0, this.nFilesServed, 0,
                         nFilesServedToAssign.length);
        System.arraycopy(requestServerToAssign, 0, this.requestServer, 0,
                         requestServerToAssign.length);
    }

    public DistribFileSystemBoard() {
        // TODO: Implement
    }

    public static void generateRequests(int users, int requests, int seed) {
        DistribFileSystemBoard.requests = new Requests(users, requests, seed);
    }

    public static void generateServers(int nserv, int nrep, int seed)
            throws Servers.WrongParametersException
    {
        DistribFileSystemBoard.servers = new Servers(nserv, nrep, seed);
    }

    public int whoIsServing(int requestID) {
        return requestServer[requestID];
    }

    public int howManyIsServing(int serverID) {
        return nFilesServed[serverID];
    }

    public void assignRequest(int serverID, int requestID) {
        int previousServer = this.requestServer[requestID];
        --this.nFilesServed[previousServer];

        this.requestServer[requestID] = serverID;
        ++this.nFilesServed[serverID];
    }

    private void generateStandard() {

    }
}
