import aima.search.framework.HeuristicFunction;

/**
 * Created by albert on 08/03/16.
 */
public class DistribFileSystemHeuristicFunctionCrit2 implements HeuristicFunction {
    private static final double VARIANCE_FACTOR = 20.0D;

    @Override
    public double getHeuristicValue(Object state) {
        DistribFileSystemBoard b = (DistribFileSystemBoard) state;

        final double[] meanVariance = b.getTTMeanVariance();

        final double mean = meanVariance[0];
        final double variance = meanVariance[1];
        final double meanSq = mean*mean;

        // En vez de calcular la desviacion mediana con una raiz cuadrada (costosa)
        // Elevamos al cuadrado la media para que este en el mismo orden que la varianza

        // Notar que la mediana ya nos da la info del tiempo total de transmision
        // ya que el numero de servidores es constante

        return meanSq + VARIANCE_FACTOR*variance;
    }
}
