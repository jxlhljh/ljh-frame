package com.sendi.system.socket;

 

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;


public class Server843Thread extends Thread{
 	private ServerSocket server843;
	
	public Server843Thread(){
		try {
			server843=new ServerSocket(843);
			System.out.println("Server Socket  thread start... in port 843");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void run(){
		try {
			while(true){
				handleIncoming(server843.accept());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void handleIncoming(Socket s){
		System.out.println("843 socket clicent....");
		BufferedReader br;
		try {
			br = new BufferedReader(new InputStreamReader(s.getInputStream()));
			char[] ch=new char[22];
			br.read(ch, 0, 22);
			StringBuffer sb=new StringBuffer();
			for(int i=0;i< ch.length;i++){
				sb.append(ch[i]);
			}
			String st=sb.toString();
		 
			if(st.indexOf("<policy-file-request/>")!=-1){
		 		new PolicyThread(s).start();
			}else{
				br.close();
				br=null;
				ch=null;
				sb=null;
				System.gc();
			}
		
		}catch (IOException e) {
			e.printStackTrace();
		}
	}

}
