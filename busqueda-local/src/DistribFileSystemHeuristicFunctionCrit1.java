import aima.search.framework.HeuristicFunction;

/**
 * Created by albert on 08/03/16.
 */
public class DistribFileSystemHeuristicFunctionCrit1 implements HeuristicFunction {
    @Override
    public double getHeuristicValue(Object state) {
        DistribFileSystemBoard b = (DistribFileSystemBoard) state;

        return b.getMaxServerTT();
    }
}
