package com.sendi.system.bean;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

 

/*
 * 在线用户
 */
@Component
public class OnlineUser {
	
	public HashMap<String,com.sendi.system.entity.User>      onlineUser=new HashMap<String, com.sendi.system.entity.User>();
    public HashMap<String,LoginInfo> loginInfo=new HashMap<String, LoginInfo>();
    public HashMap<String, String> loginstatusmap=new HashMap<String, String>();
    public HashMap<String,HttpSession> loginSessions=new HashMap<String,HttpSession>();
    
    @Autowired
    public PushHelper pushHelper;
    
    @Autowired
    public SysLogHelper sysLogHelper;
    
    public void removOnlineUser(String uid)
    {
    	com.sendi.system.entity.User u=this.onlineUser.remove(uid);
     	LoginInfo li=this.loginInfo.remove(uid);
    	this.loginstatusmap.remove(uid);
    	this.loginSessions.remove(uid);//this.loginSessions.get(uid).invalidate();注解的部分会报错，不知道为啥，不管了先处理了再说
    	this.pushHelper.PushMsg(uid,"update_online_user");
    	if(li!=null&&u!=null)
    	{
     		this.sysLogHelper.Log(u.getUserId(), li.loginhost, "success", new Date().toLocaleString(),"logout to system","logout");
//    		behaviourHelper.logout(u.getUserId(), li.loginhost);
     	 	try
     	 	{
     	 		li.session.invalidate();
     	 	}
     	 	catch (Exception e) {
				e.printStackTrace();
			}
     	}
      
    	
    }
	public HashMap<String, com.sendi.system.entity.User> getOnlineUser() {
		return onlineUser;
	}

	public void setOnlineUser(HashMap<String, com.sendi.system.entity.User> onlineUser) {
		this.onlineUser = onlineUser;
	}

	public HashMap<String, LoginInfo> getLoginInfo() {
		return loginInfo;
	}

	public void setLoginInfo(HashMap<String, LoginInfo> loginInfo) {
		this.loginInfo = loginInfo;
	}

	public HashMap<String, String> getLoginstatusmap() {
		return loginstatusmap;
	}

	public void setLoginstatusmap(HashMap<String, String> loginstatusmap) {
		this.loginstatusmap = loginstatusmap;
	}
	public PushHelper getPushHelper() {
		return pushHelper;
	}
	
	@Autowired
	public void setPushHelper(PushHelper pushHelper) {
		this.pushHelper = pushHelper;
	}
	public SysLogHelper getSysLogHelper() {
		return sysLogHelper;
	}
	
	@Autowired
	public void setSysLogHelper(SysLogHelper sysLogHelper) {
		this.sysLogHelper = sysLogHelper;
	}
}
