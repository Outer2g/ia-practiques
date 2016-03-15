import IA.DistFS.Servers;
import aima.search.framework.Problem;
import aima.search.framework.Search;
import aima.search.framework.SearchAgent;
import aima.search.informed.HillClimbingSearch;
import aima.search.informed.SimulatedAnnealingSearch;

import java.math.BigDecimal;
import java.util.*;

/**
 * Created by albert on 10/03/16.
 */
public class DistribFileSystemMain {
    private enum Option {
        N_STEPS_ANNEALING, STITER_ANNEALING, K_ANNEALING, LAMBDA_ANNEALING,

        N_USERS, MAX_REQUESTS_USER, RANDOM_SEED_REQUESTS,

        N_SERVERS, MIN_REPLICATIONS_PER_FILE, RANDOM_SEED_SERVERS
    }

    private static EnumMap<Option, BigDecimal>
            constants = new EnumMap<Option, BigDecimal>(Option.class) {{
        put(Option.N_STEPS_ANNEALING, new BigDecimal(2000));
        put(Option.STITER_ANNEALING, new BigDecimal(100));
        put(Option.K_ANNEALING, new BigDecimal(5));
        put(Option.LAMBDA_ANNEALING, new BigDecimal(0.001));

        put(Option.N_USERS, new BigDecimal(80));
        put(Option.MAX_REQUESTS_USER, new BigDecimal(4));
        put(Option.RANDOM_SEED_REQUESTS, new BigDecimal(1));

        put(Option.N_SERVERS, new BigDecimal(500));
        put(Option.MIN_REPLICATIONS_PER_FILE, new BigDecimal(25));
        put(Option.RANDOM_SEED_SERVERS, new BigDecimal(1));
    }};

    private static final Map<String, Option>
            abbreviations = new HashMap<String, Option>() {{
        put("steps", Option.N_STEPS_ANNEALING);
        put("stiter", Option.STITER_ANNEALING);
        put("k", Option.K_ANNEALING);
        put("lambda", Option.LAMBDA_ANNEALING);

        put("n_users", Option.N_USERS);
        put("max_requests", Option.MAX_REQUESTS_USER);
        put("seed_rq", Option.RANDOM_SEED_REQUESTS);

        put("n_servers", Option.N_SERVERS);
        put("repl_per_file", Option.MIN_REPLICATIONS_PER_FILE);
        put("seed_servers", Option.RANDOM_SEED_SERVERS);
    }};

    private static void consolelog(final String msg) {
        System.out.println(msg);
    }

    private static void parseArgs(String[] args) {
        for (String s : args) {
            String[] key_value = s.split("=");

            if (key_value.length != 2)
                throw new IllegalArgumentException("Invalid argument \"" + s + "\", must be of the form option=value");

            Option option = abbreviations.get(key_value[0]);
            if (option == null) throw new IllegalArgumentException("Invalid option \"" + key_value[0] + "\"");

            constants.put(option, new BigDecimal(key_value[1]));
        }
    }

    public static void main(String[] args) {
        parseArgs(args);

        try {
            DistribFileSystemBoard.generateProblem(
                    constants.get(Option.N_USERS).intValue(),
                    constants.get(Option.MAX_REQUESTS_USER).intValue(),
                    constants.get(Option.N_SERVERS).intValue(),
                    constants.get(Option.MIN_REPLICATIONS_PER_FILE).intValue(),
                    constants.get(Option.RANDOM_SEED_REQUESTS).intValue(),
                    constants.get(Option.RANDOM_SEED_SERVERS).intValue());

        } catch (Servers.WrongParametersException e) {
            e.printStackTrace();
        }

        DistribFileSystemBoard board = new DistribFileSystemBoard();

        board.generateInitialState1();

        consolelog("Initial solution: " + board.toString());

        DistribFSHillClimbingSearch(board);
        DistribFSSimulatedAnnealingSearch(board,
                constants.get(Option.N_STEPS_ANNEALING).intValue(),
                constants.get(Option.STITER_ANNEALING).intValue(),
                constants.get(Option.K_ANNEALING).intValue(),
                constants.get(Option.LAMBDA_ANNEALING).doubleValue());
    }

    private static void DistribFSHillClimbingSearch(DistribFileSystemBoard board) {
        System.out.println("\nDistribFS HillClimbing  -->");
        try {
            Problem problem = new Problem(board,
                                          new DistribFileSystemSuccessorFunction(),
                                          new DistribFileSystemGoalTest(),
                                          new DistribFileSystemHeuristicFunction());

            Search search =  new HillClimbingSearch();
            SearchAgent agent = new SearchAgent(problem, search);

            System.out.println();

            consolelog(search.getGoalState().toString());
            //printActions(agent.getActions());
            printInstrumentation(agent.getInstrumentation());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void DistribFSSimulatedAnnealingSearch(DistribFileSystemBoard board,
                                                          int n_steps,
                                                          int stiter,
                                                          int k,
                                                          double lambda) {
        System.out.println("\nDistribFS Simulated Annealing  -->");

        try {
            Problem problem =  new Problem(board,
                                           new DistribFileSystemSuccessorFunction(),
                                           new DistribFileSystemGoalTest(),
                                           new DistribFileSystemHeuristicFunction());

            SimulatedAnnealingSearch search = new SimulatedAnnealingSearch(n_steps, stiter, k, lambda);

            //search.traceOn();
            SearchAgent agent = new SearchAgent(problem,search);

            System.out.println();
            printActions(agent.getActions());
            printInstrumentation(agent.getInstrumentation());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void printInstrumentation(Properties properties) {
        for (Object o : properties.keySet()) {
            String key = (String) o;
            String property = properties.getProperty(key);
            System.out.println(key + " : " + property);
        }
    }

    private static void printActions(List actions) {
        for (Object action : actions) {
            System.out.println(action.toString());
        }
    }
}
