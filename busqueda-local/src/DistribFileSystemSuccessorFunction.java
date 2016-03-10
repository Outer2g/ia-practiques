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
        List<DistribFileSystemBoard> ret = new ArrayList<DistribFileSystemBoard>();
        // swap requests
        DistribFileSystemBoard estat = (DistribFileSystemBoard) state;
        //for each req, swap it with every other possible req
        Requests reqs = estat.getRequests();
        Servers servs = estat.getServers();
        int nreqs = reqs.size();
        for (int i = 0 ;i < nreqs;++i){
            int [] request = reqs.getRequest(i);
            for (int j = i+1; j < nreqs;++j){
                int [] request2 = reqs.getRequest(i);
                //if both files are equal means that we can swap the two requests
                if (request[1] == request2[1]){
                    DistribFileSystemBoard newState = new DistribFileSystemBoard(estat);
                    estat.swapRequests(request[1],request2[2]);
                    ret.add(newState);
                }
                else {
                    Set loc = servs.fileLocations(request[1]);
                    Set loc2 = servs.fileLocations(request2[1]);
                    if (estat.checkReqOnServers(request[1],loc2) && estat.checkReqOnServers(request2[1],loc)){
                        DistribFileSystemBoard newState = new DistribFileSystemBoard(estat);
                        newState.swapRequests(request[1],request[2]);
                        ret.add(newState);
                    }
                }
            }
        }
        return ret;
    }
}
