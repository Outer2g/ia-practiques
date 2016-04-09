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
public class DistribFileSystemSuccessorFunctionMove implements SuccessorFunction {
    public static void applyMove(DistribFileSystemBoard board, int request, List<Successor> successors) {
        final int file = DistribFileSystemBoard.requests.getRequest(request)[1];

        final int actualServer = board.whoIsServing(request);

        final Set<Integer> serversWithFile = DistribFileSystemBoard.servers.fileLocations(file);

        // Borramos el que lo este sirviendo ahora mismo para evitar
        // añadir como sucesor el mismo estado actual
        serversWithFile.remove(actualServer);

        for (int server : serversWithFile) {
            final DistribFileSystemBoard newBoard = new DistribFileSystemBoard(board);
            newBoard.assignRequest(server, request);
            successors.add(new Successor("Now " + request + " served by " + server, newBoard));
        }

        // Y luego lo volvemos a añadir al conjunto para dejarlo como estaba
        serversWithFile.add(actualServer);
    }

    @Override
    public List getSuccessors(Object state) {
        final List<Successor> successors = new ArrayList<>();

        final DistribFileSystemBoard board = (DistribFileSystemBoard) state;

        if (DistribFileSystemMain.PRINT_HEURISTICS)
            System.out.println(DistribFileSystemMain.heuristicFunction.getHeuristicValue(board));

        for (int request = 0; request < DistribFileSystemBoard.getNRequests(); ++request)
            applyMove(board, request, successors);

        assert(!successors.isEmpty());

        return successors;
    }
}
