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
public class   DistribFileSystemSuccessorFunction2 implements SuccessorFunction {
    @Override
    public List getSuccessors(Object state) {
        List<DistribFileSystemBoard> ret = new ArrayList<DistribFileSystemBoard>();
        DistribFileSystemBoard estat = (DistribFileSystemBoard) state;
        Requests reqs = estat.requests;
        Servers servs = estat.servers;
        int nreqs = reqs.size();
        for (int i = 0 ;i < nreqs;++i){
            int [] request = reqs.getRequest(i);
            Set<Integer> loc = servs.fileLocations(request[1]);
            for (Integer s : loc){
                DistribFileSystemBoard newState = new DistribFileSystemBoard(estat);
                if (!newState.assignRequest(s,i)) ret.add(newState);
            }
        }
        return ret;
    }
}
