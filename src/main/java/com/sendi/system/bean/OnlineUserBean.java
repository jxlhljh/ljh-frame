package com.sendi.system.bean;

public class OnlineUserBean {
	//user infor
	private String sessionid;
	private Integer id;
	private String userId;
	private String userName;
     public String loginhost;
       public String logintime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getSessionid() {
		return sessionid;
	}
	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}
 
	
	
}
