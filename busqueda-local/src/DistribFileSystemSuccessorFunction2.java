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
        List<Successor> successors = new ArrayList<Successor>();

        DistribFileSystemBoard board = (DistribFileSystemBoard) state;
        Servers servers = DistribFileSystemBoard.servers;

        // swap requests
        //for each req, swap it with every other possible req
        int nreqs = board.getNRequests();
        for (int req1 = 0; req1 < nreqs; ++req1) {
            for (int req2 = req1 + 1; req2 < nreqs; ++req2) {
                if (board.interchangeable(req1, req2)) {
                    DistribFileSystemBoard newBoard = new DistribFileSystemBoard(board);

                    newBoard.swapRequests(req1, req2);

                    successors.add(new Successor("swapped", newBoard));
                }
            }

            //gets Req info 0 = userID 1 = FileId
            int file = DistribFileSystemBoard.requests.getRequest(req1)[1];
            Set<Integer> serversWithFile = servers.fileLocations(file);

            for (Integer server : serversWithFile) {
                if (board.whoIsServing(req1) != server) {
                    DistribFileSystemBoard newBoard = new DistribFileSystemBoard(board);

                    newBoard.assignRequest(server, req1);

                    successors.add(new Successor("moved", newBoard));
                }
            }
        }

        return successors;
    }
}
