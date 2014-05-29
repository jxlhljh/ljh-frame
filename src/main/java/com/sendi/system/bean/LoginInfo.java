package com.sendi.system.bean;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

 
public class LoginInfo implements Serializable{   
        /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		public String userid;
        public String userName;
        public HttpServletRequest request;
        public HttpSession session;
        public String loginhost;
        public String logintime;
        
		public HttpServletRequest getRequest() {
			return request;
		}
		public void setRequest(HttpServletRequest request) {
			this.request = request;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getLoginhost() {
			return loginhost;
		}
		public void setLoginhost(String loginhost) {
			this.loginhost = loginhost;
		}
		public String getLogintime() {
			return logintime;
		}
		public void setLogintime(String logintime) {
			this.logintime = logintime;
		}
		public HttpSession getSession() {
			return session;
		}
		public void setSession(HttpSession session) {
			this.session = session;
		}
        
   
}
