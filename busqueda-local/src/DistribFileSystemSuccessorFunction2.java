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
public class DistribFileSystemSuccessorFunction2 implements SuccessorFunction {
    @Override
    public List getSuccessors(Object state) {
        List<Successor> ret = new ArrayList<Successor>();
        DistribFileSystemBoard estat = (DistribFileSystemBoard) state;
        Requests reqs = estat.requests;
        Servers servs = estat.servers;
        // swap requests
        //for each req, swap it with every other possible req
        int nreqs = reqs.size();
        for (int reqId = 0 ;reqId < nreqs;++reqId){
            //gets Req info 0 = userID 1 = FileId
            int [] request = reqs.getRequest(reqId);
            Set<Integer> loc = servs.fileLocations(request[1]);
            for (int servId = reqId+1; servId < nreqs;++servId){
                int [] request2 = reqs.getRequest(servId);
                //if both files are equal means that we can swap the two requests
                if (request[1] == request2[1]){
                    DistribFileSystemBoard newState = new DistribFileSystemBoard(estat);
                    estat.swapRequests(reqId,servId);
                    ret.add(new Successor("swapped", newState));
                }
                else {
                    Set<Integer> loc2 = servs.fileLocations(request2[1]);
                    if (estat.checkReqOnServers(reqId,loc2) && estat.checkReqOnServers(servId,loc)){
                        DistribFileSystemBoard newState = new DistribFileSystemBoard(estat);
                        newState.swapRequests(reqId,servId);
                        ret.add(new Successor("swapped", newState));
                    }
                }
            }
            //move req to available servers (so magic)
            for (Integer s : loc){
                if (estat.whoIsServing(reqId) != s){
                    DistribFileSystemBoard newState = new DistribFileSystemBoard(estat);
                    newState.assignRequest(s,reqId);
                    ret.add(new Successor("moved",newState));
                }
            }
        }
        return ret;
    }
}
