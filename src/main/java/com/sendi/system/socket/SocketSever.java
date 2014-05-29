package com.sendi.system.socket;
 
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sendi.system.bean.OnlineUser;
import com.sendi.system.entity.SysPushConfig;
import com.sendi.system.service.UserRoleService;
  
/*
 * 全局服务器
 * 客户端在连接服务器端时，需要一个握手的过程，也就是当客户端加载完成并连接socket成功后，需要再发送sockid，加入管理
 */
 
@Component
public class SocketSever {
	
	Log logger=LogFactory.getLog(SocketSever.class);
	//以用户id为主键的socket记录，这样的话，每一个用户只能同时登录一次，不能重复登录
	//根据该缓存可以开发在线用户模块,如果要踢除用户显示通过该socket就可以做到了
	//2010 、07、22 由于单用户登录带来的不便，采用 HashMap<userid,HashMap<sessionid,Socket>>的数据结果
	 private HashMap<String, HashMap<String,Socket>> socketmap=new HashMap<String,  HashMap<String,Socket>>();
	 private HashMap<String, Socket> outinterface=new HashMap<String, Socket>();//外部程序如perl连接 socket做的处理
	 
     private  HashMap<String,SysPushConfig> pushBeanconfigmap;
     /*
      * 外部socket接口
      */
     private HashMap<String,SocketI> sysSocketI;
     
     @Autowired
     private UserRoleService userRoleService;
     
     private  int port=8811;
     private boolean usesocket=false;//是否使用socket服务
     
     @Autowired
     private OnlineUser onlineUser; 
 
     public   void startServer()  //启动服务器
     {
    	  if(usesocket)
    	 {
    		 //不启动843端口，多监听一个端口不如少一个
    		//  Server843Thread s8t=new  Server843Thread();
        	//  s8t.start();
     	   	  Server_Thread st=new Server_Thread(this.socketmap,this.port,onlineUser,this);
        	  st.start();
    	 }
      }
  /*
   * 针对单一用户Session的推送
   * user_id 用户主键id
   */    
 public synchronized void push(Object msg,String pushid,String sessionid,String user_id)
 {
	  if(sessionid!=null&&sessionid.trim().length()>0&&user_id!=null)
	  {
		      PrintWriter writer = null; // 输出流
	   	   
	          SysPushConfig spc=pushBeanconfigmap.get(pushid);
	        	if(spc!=null)
	        	{
		  		 HashMap<String,Socket>  tl=this.socketmap.get(user_id);
	        	  if(tl==null)return;
	        	  Socket tr=tl.get(sessionid);
	        	 
        			   if(tr!=null&&tr.isConnected())
	   	    			{
	   	    				try
	   	    				{  
	   	    					writer = new PrintWriter(tr.getOutputStream(), false);
	   	    				} catch (Exception ie) {
	   	    				
	   	    				}
	   	    				// 使用第i各套接字输出流，输出消息
	   	    				if (writer != null)
	   	    				{
	   	    					try
	   	    					{
   	   	    					SocketReturnPara srp=new SocketReturnPara();
	   	   	    				srp.setCallbackfun(spc.getCallbackfun());
	   	   	    				srp.setCallbackmoudleid(spc.getCallbackmoudleid());
	   	   	    				srp.setPushmsg(msg);
	   	   	    				String pushmsg=JSONObject.fromObject(srp).toString();
	   	   	    				System.out.println("pushmsg_single_session:"+pushmsg);
	   	   	    			    writer.println(pushmsg);
	   	   	    				writer.flush();
	   	    					}
	   	    					catch (Exception e) {
								e.printStackTrace();
							}
	   	   	    			
	   	    			 	}
	   	    		 	}
        		 
	        	}
   }
	 
 }
      
     //push 消息到客户端 pushid是 sys_push_config 表中pushid
   public 	synchronized void push(Object msg,String pushid)
 	{
   	    PrintWriter writer = null; // 输出流
   	    Socket sock=null;
   	    try
   	    {
   	    	
   	        if(pushBeanconfigmap!=null&&pushBeanconfigmap.size()>0)
   	        {
   	        	SysPushConfig spc=pushBeanconfigmap.get(pushid);
   	        	if(spc!=null)
   	        	{
   	        		String moduleid=spc.getCallbackmoudleid();
   	        		HashSet<String> userids=new HashSet<String>();
   	        		if(moduleid.equalsIgnoreCase("all")||moduleid.equalsIgnoreCase("self")) //所有用户接收push消息
   	        		{
   	        		 Collection< HashMap<String,Socket> > tl= this.socketmap.values(); //数据结构改变后，迭代方式改变了2101.07.22
   	        		 for( HashMap<String,Socket> pp:tl)
   	        		 {
   	        		    Collection<Socket>  cl=pp.values();
   	        			for(Socket s:cl)
   	        			{
   	        				sock=s; 
   		   	    		 	if(sock!=null&&sock.isConnected())
   		   	    			{
   		   	    				try
   		   	    				{  
   		   	    					writer = new PrintWriter(sock.getOutputStream(), false);
   		   	    				} catch (Exception ie) {
   		   	    				
   		   	    				}
   		   	    				// 使用第i各套接字输出流，输出消息
   		   	    				if (writer != null)
   		   	    				{
   		   	    					try
   		   	    					{
   	   	   	    					SocketReturnPara srp=new SocketReturnPara();
   		   	   	    				srp.setCallbackfun(spc.getCallbackfun());
   		   	   	    				srp.setCallbackmoudleid(spc.getCallbackmoudleid());
   		   	   	    				srp.setPushmsg(msg);
   		   	   	    				String pushmsg=JSONObject.fromObject(srp).toString();
   		   	   	    				 System.out.println("pushmsg:"+pushmsg);
   		   	   	    			     writer.println(pushmsg);
   		   	   	    				 writer.flush();
   		   	    					}
   		   	    					catch (Exception e) {
   									e.printStackTrace();
   								}
   		   	   	    			
   		   	    			 	}
   		   	    		 	}
   	        			}
   	        	 	 }
   	        		  
   	          		 	
   	        		}
   	        		else //指定用户接收push消息
   	        		{
   	        			//2010-08-18 从缓存中获取模块对应的权限
   	        		//	String hql="select  sp.roleid from SystemPower sp where sp.moudleid in(select f.id from Functionmoudle f where f.moudleid ='"+moduleid+"') ";
   	   	        	//	List datas=this.serviceSupportImp.findByHQL(hql);
   	        			if(userRoleService.getMoudleid2roleid()==null)
   	        			{
   	        				System.err.println("模块对应的角色id集合为空...");
   	        				return;
   	        			}
   	        	 		HashSet<String> datas=userRoleService.getMoudleid2roleid().get(moduleid);
   	        	 		if(datas==null) 
   	        	 		{
   	        	 		System.err.println("模块对应的角色id集合为空...");
   	        	 		return;
   	        	 		}
   	        	 	
   	   	        		for(String r:datas)  //获取该角色下所有的用户,防止有的用户可能属于多个角色，采用HashSet结构
	   	        	 	{
	   	   	        	 
	   	        	 		try
	   	        	 		{
	   	        	 		String uids= this.userRoleService.roleid2userid.get(r);
	   	        	 		String ua[]=uids.split(",");
	   	        	 		for(String u:ua)
	   	        	 		{
	   	        	 			if(u!=null&&u.trim().length()>0)
	   	        	 			{
	   	        	 				userids.add(u);
	   	        	 			}
	   	        	 			
	   	        	 		}
	   	        	 		}
	   	        	 		catch (Exception e) {
						 	}
	   	        	  	}
   	   	          
	   	   	        	for(String userid:userids)
		        		{
	   	   	        	 
	   	   	        	  HashMap<String,Socket>  tl=this.socketmap.get(userid);
	   	   	        	  if(tl==null)continue;
		        		  Collection<Socket> p=tl.values();
		        		  for(Socket tr:p)
		        		  {
		        			   if(tr!=null&&tr.isConnected())
			   	    			{
			   	    				try
			   	    				{  
			   	    					writer = new PrintWriter(tr.getOutputStream(), false);
			   	    				} catch (Exception ie) {
			   	    				
			   	    				}
			   	    				// 使用第i各套接字输出流，输出消息
			   	    				if (writer != null)
			   	    				{
			   	    					try
			   	    					{
		   	   	    					SocketReturnPara srp=new SocketReturnPara();
			   	   	    				srp.setCallbackfun(spc.getCallbackfun());
			   	   	    				srp.setCallbackmoudleid(spc.getCallbackmoudleid());
			   	   	    				srp.setPushmsg(msg);
			   	   	    				String pushmsg=JSONObject.fromObject(srp).toString();
			   	   	    				System.out.println("pushmsg:"+pushmsg);
			   	   	    			    writer.println(pushmsg);
			   	   	    				writer.flush();
			   	    					}
			   	    					catch (Exception e) {
										e.printStackTrace();
									}
			   	   	    			
			   	    			 	}
			   	    		 	}
		        		  }
		   	    		 	
		        		}
	   	   	        	
   	        		}
   	       	}
   	        	
   	        }
   		  
   			
   	   }catch (Exception e) {
  		 e.printStackTrace();
  	}
   }
 

   class Server_Thread extends Thread
   {
	   public  ServerSocket server;
	   private  int port;
	   private HashMap<String, HashMap<String,Socket>>  socketmap;
	   private OnlineUser onlineUser;
	   private SocketSever ss;
 	   public Server_Thread(HashMap<String, HashMap<String,Socket>>  socketmap, int port,OnlineUser onlineUser,SocketSever ss)
	   {
	 	   this.socketmap=socketmap;
		   this.port=port;
		   this.onlineUser=onlineUser;
		   this.ss=ss;
		  
	   }
 	   //启动服务器监听进程
	   public void run()
	   {
	 		  try{
	 			    System.out.println("Server Socket  thread start... in port "+this.port);
			        server=new ServerSocket(this.port); //创建服务器套接字
			        
			        while(true) {
			        	        Socket socket=server.accept();//若客户机提请求，socket连接
			        	        logger.info("new connection:"+socket.getRemoteSocketAddress().toString());
			        	        new Client_Thread(socket,ss).start();//启动线程
			              }
			     	}catch(Exception e){
			     		e.printStackTrace();
			     	}
			     	finally
			     	{
			     		try {
							server.close();
						} catch (IOException e) {
						 	e.printStackTrace();
						}
			     		
			     	}
       }
	   
	   
   }
      class Client_Thread extends Thread  //与客户机进行通信的线程累
       {
    	    private boolean isSecurityAccess=false;
    	  	Socket socket; //套接字引用变量
 
    	  	private HashMap<String, HashMap<String,Socket>>  sockmap;
            private String socketid="";  
            private String policystr="<?xml version=\"1.0\" encoding=\"UTF-8\" ?><!DOCTYPE cross-domain-policy SYSTEM \"http://www.adobe.com/xml/dtds/cross-domain-policy.dtd\"><cross-domain-policy> <allow-access-from domain=\"*\" to-ports=\"*\" /></cross-domain-policy> \0";
    	    private OnlineUser onlineUser;
    	    private  HashMap<String,SocketI> sysSocketI;
    	    private SocketSever ss;
    	    private  boolean isoutsocket=false;
    	   private String userid;//该用户以应的用户id
    	     public Client_Thread(Socket socket,SocketSever ss)//构造函数
			 {
    	  		this.socket=socket;
    	  		this.sockmap=ss.socketmap;
    	  		this.onlineUser=ss.onlineUser;
    	  		this.sysSocketI=ss.sysSocketI;
    	  		this.ss=ss;
    	  		
    	   	 }
 
              public void run()
              {
            	   try
            	    {
            		  Pattern p = Pattern.compile("Handshake-sockeid=.*EEOF");  //客户端socket在握手时，发送Handshake-sockeid=【userid】EEOF 字符串
            		  Pattern p2 = Pattern.compile("outinterface-socket=.*EEOF");
               	 	  InputStream is=socket.getInputStream();
                      int count=0;
            	      StringBuffer msg=new StringBuffer("");
            	      int bread;
            	      while(!(socket.isClosed())&&(bread=is.read())!=-1)  //注意只能一个字节一个字节的读取，因为flash 平台自身的握手也会发送policy字符串，且限时为3秒
            	      {
            	    	count++;	  
//            	    	logger.info("--"+(char)bread);
            	        msg.append((char)bread);
            	        if(count>5)
            	        {
            	        	   if(msg.indexOf("policy")!=-1)
                       		   {
                       			  isSecurityAccess=true;
                       			  SendMsg(policystr,socket);
                       			  Thread.sleep(2000);
                       			  is.close();
                       			  this.socket.close();
                       			  
                       		   }
                       		   else
                       		   {
                       			     if(count>18)
                       			     {
                       			      Matcher m  =p.matcher(msg);
                       			      Matcher m2  =p2.matcher(msg);
                          		 	  if(m.matches()) //加入标志 连接成功后会进行一个握手，将用户的信息记录在缓存中,其实就是一个userid(主键)以主键的socket记录
                           			  {
                            			  String t=msg.toString();
                           			 	  t=t.replaceFirst("Handshake-sockeid=", "").replaceFirst("EEOF", "");
                           			 	  String kk[]=t.split(",");//flex端以用户sessonid ,userid做为字符串发送来
                           			 	  HashMap<String,Socket> pp=this.sockmap.get(kk[1]);
                           			  
                           			 	  if(pp==null)
                           			 	  {
                           			 		 pp=new HashMap<String, Socket>();
                           			 	     this.sockmap.put(kk[1],pp); //以用户id做为sockmap的主键
                           			 	  }
                           			 	  pp.put(kk[0],this.socket); //以用户session id为sokcet id 加入到hash中
                           			 	 
                           				  this.socketid=kk[0];
                           				  this.userid=kk[1];
                           			 	  this.onlineUser.loginstatusmap.put(kk[0], "login");
                           			 	  logger.info(msg);
                           			 	  msg.replace(0,msg.length(), "");
                           			 	  count=0;
	                           			    try
	        			                    {
	        			                    	this.ss.push("update_online_user","update_online_user");
	        			                    }
	        			                    catch (Exception e) {
	        									 e.printStackTrace();
	        									 logger.error(e.getMessage());
	        								}
                           		 	  }
                          		 	  else if(m2.matches()) //外部socket接口发送消息  outinterface-socket=perl##%%bsmonitorsocket##%%msgEEOF
                          		 	  {
                          		 		  String isok="no\n";
                          		 		  String t=msg.toString();
                          		 		//  System.out.println("revice out socket msg"+msg);
                           			 	  t=t.replaceFirst("outinterface-socket=", "").replaceFirst("EEOF", "");
                           			 	  String k[]=t.split("##%%"); 
                           			  	  if(k.length==3)
                           			 	  {
                           			      String outsocketid=k[0];
                           			      if(this.ss.outinterface.get(outsocketid)==null)
                           			      {
                           			    	  this.isoutsocket=true;
                           			    	  this.socketid=outsocketid;
                           			     	  this.ss.outinterface.put(outsocketid,this.socket);
                           			      }
                           			 	  String interfaceid=k[1];
                           			 	  logger.info("socket id:"+k[1]);
                           			 	  String outmsg=k[2];
                           			 	  if(this.sysSocketI!=null&&this.sysSocketI.size()>0)
                           			 	  {
                           			 		SocketI si=this.sysSocketI.get(interfaceid);
                           			 		try
                           			 		{
                           			 			if(si!=null)
                           			 			{
                           			 				try
                           			 				{
                           			 					logger.info("socket doAction............");
                           			 				si.doAction(outmsg);
                           			 			    isok="ok\n";
                           			 				}
                           			 				catch (Exception e) {
                           			 					e.printStackTrace();
                           			 					logger.error(e.getMessage());
													}
                           			 			}
                           			 		}
                           			 		catch (Exception e) {
											   e.printStackTrace();
											   logger.error(e.getMessage());
											}
                           			 	  }
                           			  	 }
                           			       msg.replace(0,msg.length(), "");
                        			 	   count=0;
                        			 	  socket.getOutputStream().write(isok.getBytes());
                        			 	  socket.getOutputStream().flush();
                        			 	   
                          		 	  }
                          	 	     }
                       			   	 
                       		   }
            	        }
            	     
            	    	  
            	      }
            		  
            		 
            		 
             	  }catch(Exception e)
            	  {
            		  e.printStackTrace();
            		  logger.error(e.getMessage());
             	  }finally
            	  { 
             		  if(isSecurityAccess)
             		  {
             			  try {
             			      
              			  		 if(socket !=null && socket.isConnected()) socket.close();
  	                         	   socket=null;
  	                            logger.info("policy socket  release");
							} catch (IOException e) {
								 
								e.printStackTrace();
							}
             			 
             		  }
             		  else
             		  {
             			  if(isoutsocket)
             			  {
             				  this.ss.outinterface.remove(this.socketid);
             				 try { 
              		    	  	if(socket !=null) socket.close();
   	                           	 socket=null;
   	                           logger.error("out  client release");
   	                        } catch (Exception e) {}
          			  	  }
             			  else
             			  {
             				
                 		      try { 
                 		    	 this.sockmap.get(this.userid).remove(this.socketid);
               				     this.onlineUser.removOnlineUser(this.socketid);
                 		    	  	if(socket !=null) socket.close();
      	                           	 socket=null;
      	                             logger.error("B client release");
      	                        } catch (Exception e) {
      	                        	e.printStackTrace();
      	                        	logger.error(e.getMessage());
      	                        }
             			  		}
             			  }
             			
             		  }
             		
            		
          }
           public void SendMsg(String msg,Socket sock)
           {
        	   if(sock!=null&&sock.isConnected())
	    			{
        		     PrintWriter writer=null;
	    				try
	    				{  
	    					writer = new PrintWriter(sock.getOutputStream(), false);
	    					 
	    				} catch (Exception ie) {
	    				
	    				}
	    		 		if (writer != null)
	    				{
	    					try
	    					{
	    				     writer.println(msg);
 	    			 	     writer.println();
 	    			 		 writer.flush();
 	    			 		 writer.close();
	    					}
	    					catch (Exception e) {
						e.printStackTrace();
					}
	   	    			
	    			 	}
	    		 	}
        	   
           }
  }

	public HashMap<String, HashMap<String,Socket>>   getSocketmap() {
		return socketmap;
	}
 	public int getPort() {
		return port;
	}
 
	public void setPort(int port) {
		this.port = port;
	}

 	public boolean isUsesocket() {
		return usesocket;
	}
 	public void setUsesocket(boolean usesocket) {
		this.usesocket = usesocket;
	}


	public OnlineUser getOnlineUser() {
		return onlineUser;
	}



	public void setOnlineUser(OnlineUser onlineUser) {
		this.onlineUser = onlineUser;
	}

	public HashMap<String, SocketI> getSysSocketI() {
		return sysSocketI;
	}



	public void setSysSocketI(HashMap<String, SocketI> sysSocketI) {
		this.sysSocketI = sysSocketI;
	}

  
	public HashMap<String, SysPushConfig> getPushBeanconfigmap() {
		return pushBeanconfigmap;
	}



	public void setPushBeanconfigmap(
			HashMap<String, SysPushConfig> pushBeanconfigmap) {
		this.pushBeanconfigmap = pushBeanconfigmap;
	}



	public HashMap<String, Socket> getOutinterface() {
		return outinterface;
	}

 


 

  
}
