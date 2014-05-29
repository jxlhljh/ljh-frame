package com.sendi.system.socket;

 

import java.io.IOException;
import java.io.PrintStream;
import java.net.Socket;


public class PolicyThread extends Thread{
	/**
	 * @author Jaja as-max.cn
	 */
	
	private Socket inSocket;
	private PrintStream ps;
	private static final String SECURITY_FILE="<?xml version=\"1.0\"?>"+
													"<cross-domain-policy>"+
													"<site-control permitted-cross-domain-policies=\"all\"/>"+
													"<allow-access-from domain=\"*\" to-ports=\"*\" />"+ 
												"</cross-domain-policy>\0\r\n" ;
	
	public PolicyThread(Socket s){
		inSocket=s;
	}
	
	public void run(){
		try {
			
			ps=new PrintStream(inSocket.getOutputStream());
			ps.print(PolicyThread.SECURITY_FILE);
			ps.flush();
			ps.close();
			ps=null;
			//this.interrupt();
			//System.gc();
			System.out.println("PolicyThread return securty file%%");
			System.out.println("843 socket clicent status:isClosed:"+inSocket.isClosed()+"  isConnected:"+inSocket.isConnected());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
