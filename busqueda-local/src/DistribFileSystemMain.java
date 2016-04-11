import IA.DistFS.Servers;
import aima.search.framework.*;
import aima.search.informed.HillClimbingSearch;
import aima.search.informed.SimulatedAnnealingSearch;

import java.math.BigDecimal;
import java.util.*;

/**
 * Created by albert on 10/03/16.
 */
public class DistribFileSystemMain {

    private static boolean NON_INTERACTIVE = false;
    public static boolean PRINT_HEURISTICS = false;
    private static boolean PRINT_SOLUTION = false;
    private static boolean CHECK_SOLUTION = false;


    public static HeuristicFunction heuristicFunction;
    private static SuccessorFunction successorFunction;

    private static Random R = new Random();

    private static SearchAgent agent;

    private enum Option {
        N_STEPS_ANNEALING, STITER_ANNEALING, K_ANNEALING, LAMBDA_ANNEALING,

        N_USERS, MAX_REQUESTS_USER, RANDOM_SEED_REQUESTS,

        N_SERVERS, MIN_REPLICATIONS_PER_FILE, RANDOM_SEED_SERVERS,

        HEURISTIC, SUCCESSOR, GENERATOR, ALGORITHM
    }

    private static EnumMap<Option, Object>
            constants = new EnumMap<Option, Object>(Option.class) {{
        put(Option.N_STEPS_ANNEALING, new BigDecimal(10000));
        put(Option.STITER_ANNEALING, new BigDecimal(100));
        put(Option.K_ANNEALING, new BigDecimal(500000));
        put(Option.LAMBDA_ANNEALING, new BigDecimal(0.0001));

        put(Option.N_USERS, new BigDecimal(R.nextInt(298) + 2));
        put(Option.MAX_REQUESTS_USER, new BigDecimal(R.nextInt(14) + 1));
        put(Option.RANDOM_SEED_REQUESTS, new BigDecimal(1234));

        put(Option.N_SERVERS, new BigDecimal(R.nextInt(98) + 2));
        put(Option.RANDOM_SEED_SERVERS, new BigDecimal(1234));

        put(Option.HEURISTIC, "criteria 2"); // criteria 1, criteria 2
        put(Option.SUCCESSOR, "move"); // move, move+swap
        put(Option.GENERATOR, "mintt"); // sequential, minmax, mintt
        put(Option.ALGORITHM, "hill_climbing"); // hill_climbing, simulated_annealing
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

        put("heuristic", Option.HEURISTIC);
        put("successor", Option.SUCCESSOR);
        put("generator", Option.GENERATOR);
        put("algorithm", Option.ALGORITHM);
    }};

    private static void consolelog(final String msg) {
        if (!NON_INTERACTIVE) System.out.println(msg);
    }

    private static void outputHelp() {
        System.out.println(
            "\n Usage: dfs [opciones | parámetros]\n\n" +

            " Opciones:\n" +
            "   -h, --help: Escribir esta información\n" +
            "   -s, --print-solution: Escribir la solución encontrada\n" +
            "   -c, --check-solution: Comprobar la solución y mostrar un mensaje indicatorio\n" +
            "   -H, --print-heuristics: Escribir los valores del heurístico para aquellos estados a los que va propagando el algoritmo\n" +
            "   -n, --non-interactive: Escribir unicamente en formato json información sobre la ejecución del algoritmo y la calidad de la solución\n\n" +

            " Este programa tiene varios parámetros para los algoritmos y la generación del problema.\n" +
            " Todos los parámetros son opcionales ya que existen valores por defecto para todos ellos.\n" +
            " Para los parámetros del problema, por defecto se les asignan valores aleatorios dentro de\n" +
            " un rango razonable. Para los parámetros de los algoritmos se han fijado unos valores por defecto.\n" +
            " Todos los parámetros se pueden sobreescribir mediante el formato nombre_param=valor\n\n" +

            " Parámetros: <nombre_param>: <descripción> {valor_por_defecto}\n" +
            "   steps: Nombre de pasos del algoritmo de Simulated Annealing. { " + getIntConstant(Option.N_STEPS_ANNEALING) + " }\n" +
            "   stiter: Nombre de iteraciones de cada cambio de temperatura del algoritmo de Simulated Annealing. { " + getIntConstant(Option.STITER_ANNEALING) + " }\n" +
            "   k: Parámetro k del algoritmo de Simulated Annealing. { " + getIntConstant(Option.K_ANNEALING) + " }\n" +
            "   lambda: Parámetro lambda del algoritmo de Simulated Annealing. { " + getDoubleConstant(Option.LAMBDA_ANNEALING) + " }\n\n" +

            "   n_users: Nombre de usuarios. { ALEATORIO(2,300) }\n" +
            "   n_servers: Nombre de servidores. { ALEATORIO(2,100) }\n" +
            "   max_requests: Nombre máximo de peticiones por usuario. { ALEATORIO(1,15) }\n" +
            "   repl_per_file: Nombre mínimo de replicaciones por fichero. { ALEATORIO(1, n_servers/2) }\n" +
            "   seed_servers, seed_rq: Semillas aleatorias para la generación de los servidores y peticiones. { 1234 }\n\n" +

            "   heuristic: Función heurística. [criteria 1, criteria 2] { criteria 2 }\n" +
            "   successor: Función generadora de sucesores. [move, move+swap], { move } \n" +
            "   generator: Generador del estadio inicial. [sequential, mintt, minmax] { mintt } \n" +
            "   algorithm: Algoritmo. [hill_climbing/simulated_annealing] { hill_climbing }\n\n" +

            " Ejemplo: dfs --print-solution algorithm=simulated_annealing -c lambda=0.000001 seed_servers=2222\n"
        );
    }

    private static void parseArgs(String[] args) {
        for (String s : args) {
            String[] key_value = s.split("=");

            if (key_value.length != 2) {
                if (key_value.length == 1) {
                    switch(key_value[0]) {
                        case "-h":case "--help": outputHelp(); System.exit(0); break;
                        case "-s":case "--print-solution": PRINT_SOLUTION = true; break;
                        case "-c":case "--check-solution": CHECK_SOLUTION = true; break;
                        case "-n":case "--non-interactive": NON_INTERACTIVE = true; break;
                        case "-H":case "--print-heuristics": PRINT_HEURISTICS = true; break;
                        default:
                            consolelog("Invalid argument " + key_value[0]);
                            outputHelp();
                            System.exit(1);
                    }
                    continue;
                }
                else
                    throw new IllegalArgumentException("Invalid argument \"" + s + "\", must be of the form option=value");
            }

            Option option = abbreviations.get(key_value[0].toLowerCase());
            if (option == null) throw new IllegalArgumentException("Invalid option \"" + key_value[0] + "\"");

            if (option != Option.HEURISTIC && option != Option.ALGORITHM &&
                option != Option.GENERATOR && option != Option.SUCCESSOR)
                constants.put(option, new BigDecimal(key_value[1]));
            else
                constants.put(option, key_value[1]);
        }
    }

    private static int getIntConstant(Option o) {
        return ((BigDecimal) constants.get(o)).intValue();
    }

    private static double getDoubleConstant(Option o) {
        return ((BigDecimal) constants.get(o)).doubleValue();
    }

    public static String solutionToJson(DistribFileSystemBoard board, int nsteps) {
        return "{ \"tt_variance\": " + board.getTTMeanVariance()[1] +
                ", \"total_tt\": "   + board.computeTotalTT()    +
                ", \"max_tt\": "     + board.getMaxServerTT() +
                ", \"heuristic\": "  + heuristicFunction.getHeuristicValue(board) +
                ", \"steps\": "      + nsteps +
                " }";
    }

    public static void main(String[] args) {
        constants.put(Option.MIN_REPLICATIONS_PER_FILE,
                new BigDecimal(R.nextInt(getIntConstant(Option.N_SERVERS)/2 - 1) + 1));

        parseArgs(args);

        consolelog("n_users=" + getIntConstant(Option.N_USERS) +
                   ", n_servers=" + getIntConstant(Option.N_SERVERS) +
                   ", repl_per_file=" + getIntConstant(Option.MIN_REPLICATIONS_PER_FILE) +
                   ", max_requests=" + getIntConstant(Option.MAX_REQUESTS_USER) + "\n");


        try {
            DistribFileSystemBoard.generateProblem(
                    getIntConstant(Option.N_USERS),
                    getIntConstant(Option.MAX_REQUESTS_USER),
                    getIntConstant(Option.N_SERVERS),
                    getIntConstant(Option.MIN_REPLICATIONS_PER_FILE),
                    getIntConstant(Option.RANDOM_SEED_REQUESTS),
                    getIntConstant(Option.RANDOM_SEED_SERVERS));

        } catch (Servers.WrongParametersException e) {
            e.printStackTrace();
            System.exit(1);
        }

        DistribFileSystemBoard board = new DistribFileSystemBoard();

        String gen = constants.get(Option.GENERATOR).toString();

        switch(gen.toLowerCase()) {
            case "sequential": board.generateInitialStateSequential(); break;
            //case "minvariance": board.generateInitialStateMinVar(); break;
            case "mintt": board.generateInitialStateMinTT(); break;
            case "minmax": board.generateInitialStateMinMax(); break;
            default: assert false;
        }

        consolelog("Initial solution: " + board.toString());

        String heuristic = constants.get(Option.HEURISTIC).toString();

        switch(heuristic.toLowerCase()) {
            case "criteria 1": heuristicFunction = new DistribFileSystemHeuristicFunctionCrit1(); break;
            case "criteria 2": heuristicFunction = new DistribFileSystemHeuristicFunctionCrit2(); break;
            default: assert false;
        }

        String successor = constants.get(Option.SUCCESSOR).toString();
        DistribFileSystemBoard goal;

        if (constants.get(Option.ALGORITHM).toString().toLowerCase().equals("hill_climbing")) {
            switch(successor.toLowerCase()) {
                case "move": successorFunction = new DistribFileSystemSuccessorFunctionMove(); break;
                case "move+swap": successorFunction = new DistribFileSystemSuccessorFunctionMoveSwap(); break;
                default: assert false;
            }

            goal = DistribFSHillClimbingSearch(board);
        }
        else {
            switch(successor.toLowerCase()) {
                case "move": successorFunction = new DistribFileSystemSuccessorFunctionMoveSA(); break;
                case "move+swap": successorFunction = new DistribFileSystemSuccessorFunctionMoveSwapSA(); break;
                default: assert false;
            }

            goal = DistribFSSimulatedAnnealingSearch(board,
                    getIntConstant(Option.N_STEPS_ANNEALING),
                    getIntConstant(Option.STITER_ANNEALING),
                    getIntConstant(Option.K_ANNEALING),
                    getDoubleConstant(Option.LAMBDA_ANNEALING));
        }

        if (CHECK_SOLUTION) consolelog(isSolutionOkay(goal) ? "\nSolution is okay" : "\nSolution is wrong!!");
        if (PRINT_SOLUTION) consolelog("\n" + goal.getSolutionDescription());
        if (NON_INTERACTIVE) System.out.print(solutionToJson(goal, Integer.parseInt(agent.getInstrumentation().getProperty("nodesExpanded"))));
    }

    private static boolean isSolutionOkay(DistribFileSystemBoard goal) {
        for (int i = 0; i < DistribFileSystemBoard.getNRequests(); ++i) {
            int server = goal.whoIsServing(i);

            int[] request = DistribFileSystemBoard.requests.getRequest(i);
            Set<Integer> servers = DistribFileSystemBoard.servers.fileLocations(request[1]);

            if (!servers.contains(server)) return false;
        }

        return true;
    }

    private static DistribFileSystemBoard DistribFSHillClimbingSearch(DistribFileSystemBoard board) {
        consolelog("\nDistribFS HillClimbing  -->");

        DistribFileSystemBoard goal = null;
        try {
            Problem problem = new Problem(board,
                                          successorFunction,
                                          new DistribFileSystemGoalTest(),
                                          heuristicFunction);

            Search search =  new HillClimbingSearch();
            agent = new SearchAgent(problem, search);

            consolelog("");

            goal = (DistribFileSystemBoard) search.getGoalState();

            consolelog(goal.toString());
            //checkSolution(goal);
            //printActions(agent.getActions());
            printInstrumentation(agent.getInstrumentation());
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }

        return goal;
    }

    private static DistribFileSystemBoard DistribFSSimulatedAnnealingSearch(DistribFileSystemBoard board,
                                                          int n_steps,
                                                          int stiter,
                                                          int k,
                                                          double lambda) {
        consolelog("\nDistribFS Simulated Annealing  -->");

        DistribFileSystemBoard goal = null;
        try {
            Problem problem =  new Problem(board,
                                           successorFunction,
                                           new DistribFileSystemGoalTest(),
                                           heuristicFunction);

            SimulatedAnnealingSearch search = new SimulatedAnnealingSearch(n_steps, stiter, k, lambda);

            //search.traceOn();
            agent = new SearchAgent(problem,search);

            goal = (DistribFileSystemBoard) search.getGoalState();

            //checkSolution(goal);

            consolelog("");
            printActions(agent.getActions());
            printInstrumentation(agent.getInstrumentation());

            return goal;
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }

        return goal;
    }

    private static void printInstrumentation(Properties properties) {
        for (Object o : properties.keySet()) {
            String key = (String) o;
            String property = properties.getProperty(key);
            consolelog(key + " : " + property);
        }
    }

    private static void printActions(List actions) {
        for (Object action : actions) {
            consolelog(action.toString());
        }
    }
}
