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

    /**
     * Creates a new Board from its attributes
     * @param nFilesServedToAssign
     * @param requestServerToAssign
     */
    public DistribFileSystemBoard(int[] nFilesServedToAssign, int[] requestServerToAssign) {
        this.nFilesServed = new int[nFilesServedToAssign.length];
        this.requestServer = new int[requestServerToAssign.length];

        System.arraycopy(nFilesServedToAssign, 0, this.nFilesServed, 0, nFilesServedToAssign.length);
        System.arraycopy(requestServerToAssign, 0, this.requestServer, 0, requestServerToAssign.length);
    }

    public DistribFileSystemBoard() {
        // TODO: Implement
    }
    public int[] getServers(){ return requestServer;}

    /**
     *
     * @param requestID
     * @return
     */
    public int whoIsServing(int requestID) {
        return requestServer[requestID];
    }

    /**
     *
     * @param serverID
     * @return
     */
    public int howManyIsServing(int serverID) {
        return nFilesServed[serverID];
    }

    /**
     *
     * @param serverID
     * @param requestID
     */
    public void assignRequest(int serverID, int requestID) {
        int previousServer = this.requestServer[requestID];
        --this.nFilesServed[previousServer];

        this.requestServer[requestID] = serverID;
        ++this.nFilesServed[serverID];
    }

    /**
     *
     * @param requestID1
     * @param requestID2
     */
    public void swapRequests(int requestID1,int requestID2){
        int server1 = requestServer[requestID1];
        int server2 = requestServer[requestID2];

        this.requestServer[requestID2] = server1;
        this.requestServer[requestID1] = server2;
    }

    private void generateStandard() {

    }
}
