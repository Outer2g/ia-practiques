import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;

import java.util.*;

/**
 * Created by albert on 08/03/16.
 * version will be using the combination of two operators: swap request from server to server and move request to another server
 */
public class DistribFileSystemSuccessorFunctionMoveSwapSA implements SuccessorFunction {
    @Override
    public List getSuccessors(Object state) {
        final List<Successor> successors = new ArrayList<>(1);

        final DistribFileSystemBoard board = (DistribFileSystemBoard) state;

        // TODO: Comentar cuando se testee el tiempo de ejecucion
        if (DistribFileSystemMain.PRINT_HEURISTICS)
            System.out.println(DistribFileSystemMain.heuristicFunction.getHeuristicValue(board));

        final Random r = new Random();

        final int nReq = DistribFileSystemBoard.getNRequests();


        // Hay que mirar todos los posibles intercambios y guardarlos en un arraylist
        // Esto es debido a que hacer algo del estilo
        //
        //     if (r.nextBoolean()) aplicarSwap()
        //     else aplicarMove()
        //
        // No estaria uniformemente distribuido, ya que no podemos asumir que
        // el numero de swaps posibles va a ser el mismo que el numero de moves
        // posibles
        final ArrayList<int[]> possibleSwaps = new ArrayList<>();
        for (int req1 = 0; req1 < nReq; ++req1)
            for (int req2 = req1 + 1; req2 < nReq; ++req2)
                if (board.interchangeable(req1, req2))
                    possibleSwaps.add(new int[] { req1, req2 });

        final int randomValue = r.nextInt(nReq + possibleSwaps.size());

        if (randomValue < nReq) { // Aplicar move
            DistribFileSystemSuccessorFunctionMoveSA.applyMoveSA(board, randomValue, successors, r);
        }
        else { // Aplicar swap
            final int[] reqs = possibleSwaps.get(randomValue - nReq);

            final DistribFileSystemBoard newBoard = new DistribFileSystemBoard(board);
            newBoard.swapRequests(reqs[0], reqs[1]);
            successors.add(new Successor("swapped " + reqs[0] + " with " + reqs[1], newBoard));
        }

        assert(!successors.isEmpty());

        return successors;
    }
}
