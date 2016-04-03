import aima.search.framework.HeuristicFunction;

/**
 * Created by albert on 08/03/16.
 */
public class DistribFileSystemHeuristicFunction implements HeuristicFunction {
    @Override
    public double getHeuristicValue(Object state) {
        DistribFileSystemBoard b = (DistribFileSystemBoard) state;

        // Variance more important than transmission time


        double res = b.getTotalTransmissionTime() + b.getTransmissionTimeVariance()*4000 + b.getMaxServerTransmissionTime()*1000;

        return res;
    }
}
