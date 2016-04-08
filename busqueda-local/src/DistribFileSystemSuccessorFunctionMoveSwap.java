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
public class DistribFileSystemSuccessorFunctionMoveSwap implements SuccessorFunction {
    @Override
    public List getSuccessors(Object state) {
        List<Successor> successors = new ArrayList<>();

        DistribFileSystemBoard board = (DistribFileSystemBoard) state;

        // TODO: Comentar cuando se testee el tiempo de ejecucion
        if (DistribFileSystemMain.PRINT_HEURISTICS)
            System.out.println(DistribFileSystemMain.heuristicFunction.getHeuristicValue(board));

        int nReq = DistribFileSystemBoard.getNRequests();

        for (int request = 0; request < nReq; ++request){
            for (int req2 = request + 1; req2 < nReq; ++req2) {
                if (board.interchangeable(request, req2)) {
                    DistribFileSystemBoard newBoard = new DistribFileSystemBoard(board);
                    newBoard.swapRequests(request, req2);
                    successors.add(new Successor("swapped " + request + " with " + req2, newBoard));
                }
            }

            int file = DistribFileSystemBoard.requests.getRequest(request)[1];

            int actualServer = board.whoIsServing(request);

            Set<Integer> serversWithFile = DistribFileSystemBoard.servers.fileLocations(file);

            // Borramos el que lo este sirviendo ahora mismo para evitar
            // añadir como sucesor el mismo estado actual
            serversWithFile.remove(actualServer);

            for (int server : serversWithFile) {
                DistribFileSystemBoard newBoard = new DistribFileSystemBoard(board);
                newBoard.assignRequest(server, request);
                successors.add(new Successor("Now " + request + " served by " + server, newBoard));
            }

            // Y luego lo volvemos a añadir al conjunto para dejarlo como estaba
            serversWithFile.add(actualServer);
        }

        return successors;
    }
}
