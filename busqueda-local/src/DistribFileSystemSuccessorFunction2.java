import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;

import IA.DistFS.Requests;
import IA.DistFS.Servers;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by albert on 08/03/16.
 * version will be using the combination of two operators: swap request from server to server and move request to another server
 */
public class DistribFileSystemSuccessorFunction2 implements SuccessorFunction {
    @Override
    public List getSuccessors(Object state) {
        List<Successor> ret = new ArrayList<Successor>();

        DistribFileSystemBoard estat = (DistribFileSystemBoard) state;

        Requests reqs = estat.requests;
        Servers servs = estat.servers;
        // swap requests
        //for each req, swap it with every other possible req
        int nreqs = estat.getNRequests();
        for (int reqId = 0 ;reqId < nreqs;++reqId){
            for (int reqId2 = reqId+1; reqId2 < nreqs;++reqId2){
                if (canSwap(reqId,reqId2,estat)){
                    DistribFileSystemBoard newState = new DistribFileSystemBoard(estat);
                    newState.swapRequests(reqId,reqId2);
                    ret.add(new Successor("swapped", newState));
                }
            }
            //gets Req info 0 = userID 1 = FileId
            int file = DistribFileSystemBoard.requests.getRequest(reqId)[1];
            Set<Integer> serversWithFile = servs.fileLocations(file);
            for (Integer s : serversWithFile){
                if (estat.whoIsServing(reqId) != s){
                    DistribFileSystemBoard newState = new DistribFileSystemBoard(estat);
                    newState.assignRequest(s,reqId);
                    ret.add(new Successor("moved",newState));
                }
            }
        }
        return ret;
    }
    private Boolean canSwap(int reqId1, int reqId2,DistribFileSystemBoard board){
        int server1 = board.whoIsServing(reqId1);
        int server2 = board.whoIsServing(reqId2);
        boolean canFile1, canFile2;
        canFile1 = false; canFile2 = false;
        if (server1 == server2) return false; //Si estan en el mismo server, no tiene sentido hacer swap

        int file1 = DistribFileSystemBoard.requests.getRequest(reqId1)[1];
        int file2 = DistribFileSystemBoard.requests.getRequest(reqId2)[1];
        if (file1 == file2) return true; //if both files are equal means that we can swap the two requests
        Set <Integer> serversWithFile = DistribFileSystemBoard.servers.fileLocations(file1);
        if (serversWithFile.contains(server2)) canFile2 = true;
        Set <Integer> serversWithFile2 = DistribFileSystemBoard.servers.fileLocations(file2);
        if (serversWithFile2.contains(server1)) canFile1 = true;
        return canFile1 && canFile2;
    }

    private static void consolelog(final String msg) {
        System.out.println(msg);
    }
}
