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
public class   DistribFileSystemSuccessorFunction implements SuccessorFunction {
    @Override
    public List getSuccessors(Object state) {
        List<Successor> ret = new ArrayList<Successor>();
        DistribFileSystemBoard estat = (DistribFileSystemBoard) state;
        Requests reqs = estat.requests;
        Servers servs = estat.servers;
        // swap requests
        //for each req, swap it with every other possible req
        int nreqs = reqs.size();
        for (int i = 0 ;i < nreqs;++i){
            int [] request = reqs.getRequest(i);
            Set<Integer> loc = servs.fileLocations(request[1]);
            for (int j = i+1; j < nreqs;++j){
                int [] request2 = reqs.getRequest(j);
                //if both files are equal means that we can swap the two requests
                if (request[1] == request2[1]){
                    DistribFileSystemBoard newState = new DistribFileSystemBoard(estat);
                    estat.swapRequests(i,j);
                    ret.add(new Successor("grdgdr", newState));
                }
                else {
                    Set<Integer> loc2 = servs.fileLocations(request2[1]);
                    if (estat.checkReqOnServers(i,loc2) && estat.checkReqOnServers(j,loc)){
                        DistribFileSystemBoard newState = new DistribFileSystemBoard(estat);
                        newState.swapRequests(i,j);
                        ret.add(new Successor("gdrgdr", newState));
                    }
                }
            }
            //move req to available servers (so magic)
            for (Integer s : loc){
                DistribFileSystemBoard newState = new DistribFileSystemBoard(estat);
                //if (!newState.assignRequest(s,i)) ret.add(new Successor("dadawdaw", newState));
            }
        }
        return ret;
    }
}
