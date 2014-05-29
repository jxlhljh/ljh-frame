package com.sendi.system.socket;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.net.Socket;
import java.util.Properties;

public class SocketClient {
	public static void main(String[] args) throws Exception {
		
		// setProxy();
		makesocketcall();
	 
	}
	public static void setProxy()
	{
	    Properties prop = System.getProperties();
        // 设置http访问要使用的代理服务器的地址
        prop.setProperty("http.proxyHost", "132.96.81.219");
        // 设置http访问要使用的代理服务器的端口
        prop.setProperty("http.proxyPort", "3128");
        // 设置不需要通过代理服务器访问的主机，可以使用*通配符，多个地址用|分隔
     //   prop.setProperty("http.nonProxyHosts", "localhost|192.168.0.*");
        // 设置安全访问使用的代理服务器地址与端口
        // 它没有https.nonProxyHosts属性，它按照http.nonProxyHosts 中设置的规则访问
     //   prop.setProperty("https.proxyHost", "192.168.0.254");
     //   prop.setProperty("https.proxyPort", "443");
        // 使用ftp代理服务器的主机、端口以及不需要使用ftp代理服务器的主机
       // prop.setProperty("ftp.proxyHost", "192.168.0.254");
      //  prop.setProperty("ftp.proxyPort", "2121");
    //    prop.setProperty("ftp.nonProxyHosts", "localhost|192.168.0.*");
        // socks代理服务器的地址与端口
        prop.setProperty("socksProxyHost", "132.96.81.219");
        prop.setProperty("socksProxyPort", "3128");
        // 设置登陆到代理服务器的用户名和密码
       // Authenticator.setDefault(new MyAuthenticator("userName", "Password"));

		
	}
	public static void makesocketcall()
	{
		  try {

			   // 向本机的2121端口发出客户请求
			   Socket socket = new Socket("202.103.182.51", 8811);

			   System.out.println("Established a connection..."+socket.toString());
			   

			   // 由系统标准输入设备构造BufferedReader对象
			   BufferedReader sysin = new BufferedReader(new InputStreamReader(
			     System.in));

			   // 由Socket对象得到输出流,并构造PrintWriter对象
			   PrintWriter out = new PrintWriter(socket.getOutputStream());

			   // 由Socket对象得到输入流,并构造相应的BufferedReader对象
			   BufferedReader in = new BufferedReader(new InputStreamReader(socket
			     .getInputStream()));

			   String line; // 保存一行内容

			   // 从系统标准输入读入一字符串
			   line = sysin.readLine();

			   while (!line.equals("bye")) { // 若从标准输入读入的字符串为 "bye"则停止循环

			    // 将从系统标准输入读入的字符串输出到Server
			    out.println(line);

			    // 刷新输出流,使Server马上收到该字符串
			    out.flush();

			    // 在系统标准输出上打印读入的字符串
			    System.out.println("[Client]: " + line);

			    // 从Server读入一字符串，并打印到标准输出上
			    System.out.println("[Server]: " + in.readLine());

			    // 从系统标准输入读入一字符串
			    line = sysin.readLine();

			   }

			   out.close(); // 关闭Socket输出流
			   in.close(); // 关闭Socket输入流
			   socket.close(); // 关闭Socket
			  } catch (Exception e) {
			   System.out.println("Error. " + e);
			  }

	
		
	}
	
	static class MyAuthenticator extends Authenticator {
	    private String user = "";
	    private String password = "";
	    public MyAuthenticator(String user, String password) {
	        this.user = user;
	        this.password = password;
	    }
	    protected PasswordAuthentication getPasswordAuthentication() {
	        return new PasswordAuthentication(user, password.toCharArray());
	    }}


}

