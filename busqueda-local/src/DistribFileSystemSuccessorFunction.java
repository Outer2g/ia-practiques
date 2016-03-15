import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;

import IA.DistFS.Requests;
import IA.DistFS.Servers;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by alex on 10/03/16.
 * version will be using the operator move from one server to another
 */
public class DistribFileSystemSuccessorFunction implements SuccessorFunction {
    @Override
    public List getSuccessors(Object state) {
        List<Successor> successors = new ArrayList<>();

        DistribFileSystemBoard board = (DistribFileSystemBoard) state;

        for (int request = 0; request < board.getNRequests(); ++request){
            int file = DistribFileSystemBoard.requests.getRequest(request)[1];

            Set<Integer> serversWithFile = DistribFileSystemBoard.servers.fileLocations(file);

            for (int server : serversWithFile) {
                if (board.whoIsServing(request) != server) {
                    DistribFileSystemBoard newBoard = new DistribFileSystemBoard(board);
                    newBoard.assignRequest(server, request);
                    successors.add(new Successor("Now " + request + " served by " + server, newBoard));
                }
            }
        }

        return successors;
    }
}
