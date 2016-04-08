import aima.search.framework.Successor;
import aima.search.framework.SuccessorFunction;

import java.util.*;

/**
 * Created by alex on 10/03/16.
 * version will be using the operator move from one server to another
 */
public class DistribFileSystemSuccessorFunctionMoveSA implements SuccessorFunction {
    @Override
    public List getSuccessors(Object state) {
        List<Successor> successors = new ArrayList<>(1);

        DistribFileSystemBoard board = (DistribFileSystemBoard) state;

        // TODO: Comentar cuando se testee el tiempo de ejecucion
        if (DistribFileSystemMain.PRINT_HEURISTICS)
            System.out.println(DistribFileSystemMain.heuristicFunction.getHeuristicValue(board));


        Random r = new Random();
        int request = r.nextInt(DistribFileSystemBoard.getNRequests());

        int file = DistribFileSystemBoard.requests.getRequest(request)[1];

        int actualServer = board.whoIsServing(request);

        Set<Integer> serversWithFile = DistribFileSystemBoard.servers.fileLocations(file);

        int size = serversWithFile.size();

        // Solo puede pasar si minReplications < 2, pero hacer la especializacion seria demasiado codigo
        if (size == 1)
            successors.add(new Successor("Now " + request + " served by " + actualServer, board));
        else {
            // Borramos el que lo este sirviendo ahora mismo para evitar
            // añadir como sucesor el mismo estado actual
            serversWithFile.remove(actualServer);

            Iterator<Integer> it = serversWithFile.iterator();

            int its = r.nextInt(size);
            while (its-- > 0) it.next();

            int server = it.next();

            DistribFileSystemBoard newBoard = new DistribFileSystemBoard(board);
            newBoard.assignRequest(server, request);
            successors.add(new Successor("Now " + request + " served by " + server, newBoard));

            serversWithFile.add(actualServer);
        }

        return successors;
    }
}
