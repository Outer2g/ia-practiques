package IA.PathFinderDemo;

import aima.search.framework.HeuristicFunction;

public class ProbPathFinderHeuristicFunction implements HeuristicFunction  {

    @Override
  public boolean equals(Object obj) {
      boolean retValue;
      
      retValue = super.equals(obj);
      return retValue;
  }
  
  public double getHeuristicValue(Object state) {
   ProbPathFinderBoard board=(ProbPathFinderBoard)state;
   return (board.euclidean());
  }
  
}
