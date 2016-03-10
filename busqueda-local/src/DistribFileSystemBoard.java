/**
 * Created by albert on 08/03/16.
 */

import IA.DistFS.Requests;
import IA.DistFS.Servers;

public class DistribFileSystemBoard {
    private static Requests requests;
    private static Servers servers;

    private int[] nFilesServed; // How many files does each server serve

    // Documentar decisión
    private int[] requestServer; // Which is the server that serves that request


    public DistribFileSystemBoard(int[] nFilesServedToAssign, int[] requestServerToAssign) {
        this.nFilesServed = new int[nFilesServedToAssign.length];
        this.requestServer = new int[requestServerToAssign.length];

        System.arraycopy(nFilesServedToAssign, 0, this.nFilesServed, 0,
                         nFilesServedToAssign.length);
        System.arraycopy(requestServerToAssign, 0, this.requestServer, 0,
                         requestServerToAssign.length);
    }

    public DistribFileSystemBoard() {
        // TODO: Implement
    }

    public static void generateRequests(int users, int requests, int seed) {
        DistribFileSystemBoard.requests = new Requests(users, requests, seed);
    }

    public static void generateServers(int nserv, int nrep, int seed)
            throws Servers.WrongParametersException
    {
        DistribFileSystemBoard.servers = new Servers(nserv, nrep, seed);
    }

    public int whoIsServing(int requestID) {
        return requestServer[requestID];
    }

    public int howManyIsServing(int serverID) {
        return nFilesServed[serverID];
    }

    public void assignRequest(int serverID, int requestID) {
        int previousServer = this.requestServer[requestID];
        --this.nFilesServed[previousServer];

        this.requestServer[requestID] = serverID;
        ++this.nFilesServed[serverID];
    }

    /**
     *
     * @param requestID1
     * @param requestID2
     */
    public void swapRequests(int requestID1,int requestID2){
        int server1 = requestServer[requestID1];
        int server2 = requestServer[requestID2];(destinationServer).it

        this.requestServer[requestID2] = server1;
        this.requestServer[requestID1] = server2;
    }

    private void generateStandard() {

    }
    
    /**Asigna cada petición al primer servidor que tenga el archivo
    no tiene en cuenta ni el tiempo ni el equilibrio entre servidores
    Todas las peticiones se concentrarán en los x primeros servidores del set
    **/
    private void initialState1(){
    	int nRequests = requests.size();
    	int nServers = servers.size();
    	
    	nFilesServed = new int[nRequests];
    	nServers = new int[nServers];
    	
    	for (int i = 0; i < nRequests; ++i){
	    int[] infoReq = requests.getRequest(i);
	    Set destinationServer = servers.fileLocations(infoReq[1]);
	    Iterator<int> it = destinationServer.Iterator();
	    if(it.hasNext()){
	      int serverAssigned= it.next();
	      requestServer[i] = serverAssigned;
	      ++nFilesServed[serverAssigned];
	    }
	}
    }
    
    /**Assigna una petición a cada servidor que contenga el archivo equilibrando el 
    numero de peticiones por servidor. No tiene en cuenta el tiempo de transmision   
    **/
    private void initialState2(){
    	int nRequests = requests.size();
    	int nServers = servers.size();
    	
    	nFilesServed = new int[nRequests];
    	nServers = new int[nServers];
    	int max = 1;
    	
    	for (int i = 0; i < nRequests; ++i){
	    int[] infoReq = requests.getRequest(i);
	    Set destinationServer = servers.fileLocations(infoReq[1]);
	    Iterator<int> it = destinationServer.Iterator();
	    
	    boolean equilibrated = true;
	    
	    if(it.hasNext() && equilibrated){
	      int serverAssigned= it.next();
	      if(nFilesServed[serverAssigned] < max)
		equilibrated = false;
		requestServer[i] = serverAssigned;
		++nFilesServed[serverAssigned];
	      }
	    }else{
	      if(equilibrated){
	      --i;
	      ++max;
	    }	      	      
	}
    }
    
    /**
    **/
    private void initialState3(){
    }
}
