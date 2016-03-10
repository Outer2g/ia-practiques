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
            int [] elem = reqs.getRequest(i);
            for (int j = i+1; j < nreqs;++j){
                int [] elem2 = reqs.getRequest(i);
                //if both files are equal means that we can swap the two requests
                if (elem[1] == elem2[1]){
                    DistribFileSystemBoard newState = new DistribFileSystemBoard(estat);
                    estat.swapRequests(elem[1],elem2[2]);
                    ret.add(newState);
                }
                else {
                    Set loc = servs.fileLocations(elem[1]);
                    Set loc2 = servs.fileLocations(elem2[1]);

                }
            }
        }
        return null;
    }
}
