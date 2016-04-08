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
    @Override
    public List getSuccessors(Object state) {
        List<Successor> successors = new ArrayList<>();

        DistribFileSystemBoard board = (DistribFileSystemBoard) state;

        // TODO: Comentar cuando se testee el tiempo de ejecucion
        if (DistribFileSystemMain.PRINT_HEURISTICS)
            System.out.println(DistribFileSystemMain.heuristicFunction.getHeuristicValue(board));

        for (int request = 0; request < DistribFileSystemBoard.getNRequests(); ++request){
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
