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
        final List<Successor> successors = new ArrayList<>();

        final DistribFileSystemBoard board = (DistribFileSystemBoard) state;

        if (DistribFileSystemMain.PRINT_HEURISTICS)
            System.out.println(DistribFileSystemMain.heuristicFunction.getHeuristicValue(board));

        final int nReq = DistribFileSystemBoard.getNRequests();

        for (int request = 0; request < nReq; ++request){
            for (int req2 = request + 1; req2 < nReq; ++req2) {
                if (board.interchangeable(request, req2)) {
                    final DistribFileSystemBoard newBoard = new DistribFileSystemBoard(board);
                    newBoard.swapRequests(request, req2);
                    successors.add(new Successor("swapped " + request + " with " + req2, newBoard));
                }
            }

            DistribFileSystemSuccessorFunctionMove.applyMove(board, request, successors);
        }

        return successors;
    }
}
