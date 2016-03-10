import aima.search.framework.HeuristicFunction;

/**
 * Created by albert on 08/03/16.
 */
public class DistribFileSystemHeuristicFunction implements HeuristicFunction {
    @Override
    public double getHeuristicValue(Object state) {
        DistribFileSystemBoard b = (DistribFileSystemBoard) state;

        double res = b.getTotalTransmissionTime() + b.getFilesServedVariance()*4000;

        return res;
    }
}
