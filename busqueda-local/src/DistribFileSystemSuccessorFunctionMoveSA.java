import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;

import java.util.*;

/**
 * Created by alex on 10/03/16.
 * version will be using the operator move from one server to another
 */
public class DistribFileSystemSuccessorFunctionMoveSA implements SuccessorFunction {

    public static void applyMoveSA(DistribFileSystemBoard board, int request, List<Successor> successors, Random r) {
        final int file = DistribFileSystemBoard.requests.getRequest(request)[1];

        final int actualServer = board.whoIsServing(request);

        final Set<Integer> serversWithFile = DistribFileSystemBoard.servers.fileLocations(file);

        final int size = serversWithFile.size();

        // Solo puede pasar si minReplications < 2, pero hacer la especializacion seria demasiado codigo
        if (size == 1)
            successors.add(new Successor("Now " + request + " served by " + actualServer, board));
        else {
            // Borramos el que lo este sirviendo ahora mismo para evitar
            // añadir como sucesor el mismo estado actual
            serversWithFile.remove(actualServer);

            final Iterator<Integer> it = serversWithFile.iterator();

            int its = r.nextInt(size - 1); // Size-1 porque hemos borrado el actual
            while (--its >= 0) it.next();
            final int server = it.next();

            final DistribFileSystemBoard newBoard = new DistribFileSystemBoard(board);
            newBoard.assignRequest(server, request);
            successors.add(new Successor("Now " + request + " served by " + server, newBoard));

            serversWithFile.add(actualServer);
        }
    }

    @Override
    public List getSuccessors(Object state) {
        final List<Successor> successors = new ArrayList<>(1);

        final DistribFileSystemBoard board = (DistribFileSystemBoard) state;

        if (DistribFileSystemMain.PRINT_HEURISTICS)
            System.out.println(DistribFileSystemMain.heuristicFunction.getHeuristicValue(board));


        final Random r = new Random();
        final int request = r.nextInt(DistribFileSystemBoard.getNRequests());

        applyMoveSA(board, request, successors, r);

        assert(!successors.isEmpty());

        return successors;
    }
}
