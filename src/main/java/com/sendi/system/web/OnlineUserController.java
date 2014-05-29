package com.sendi.system.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sendi.system.bean.LoginInfo;
import com.sendi.system.bean.OnlineUser;
import com.sendi.system.bean.OnlineUserBean;
import com.sendi.system.bean.PushHelper;
import com.sendi.system.entity.User;

/**
 * 在线用户控制器
 * @author liujinghua
 * @date 2014-05-14 晚上22:34分
 */
@Controller
@RequestMapping("/sendisystem/onlineUserController")
public class OnlineUserController extends BaseController{
	
	@Autowired
	private OnlineUser onlineUser;
	
	@Autowired
	private PushHelper pushHelper;

	/**
	 * 在线用户查询
	 * @param request
	 * @param repResponse
	 */
	@RequestMapping(params = "onlineUserinit")
	public void onlineUserinit(HttpServletRequest request,HttpServletResponse repResponse){
		  HashMap<String, String> loginstatusmap=this.onlineUser.loginstatusmap;
		  HashMap<String,com.sendi.system.entity.User>      onlineUser=this.onlineUser.onlineUser;
	      HashMap<String,LoginInfo> loginInfo=this.onlineUser.loginInfo;
		  Iterator<String> uid=loginstatusmap.keySet().iterator();
		  ArrayList<OnlineUserBean> oub=new ArrayList<OnlineUserBean>();
		  int id=0;
		while(uid.hasNext())
		{
			String ukey=uid.next();
			String uvalue=loginstatusmap.get(ukey);
			if(uvalue.equals("login"))
			{
				OnlineUserBean ob=new OnlineUserBean();
				User u=onlineUser.get(ukey);
				LoginInfo li=loginInfo.get(ukey);
				ob.setId(++id);
				ob.setLoginhost(li.getLoginhost());
				ob.setLogintime(li.getLogintime());
				ob.setUserId(u.getUserId());
				ob.setSessionid(ukey);
				ob.setUserName(u.getUserName());
				oub.add(ob);
		 	}
		}
	 	writeJSONArray(oub,request,repResponse);
	}
	
	/**
	 * 强制用户下线
	 */
	@RequestMapping(params = "forcelogout")
	public void forcelogout(@RequestParam("forceuid") String forceuid,HttpServletResponse response)
	{
	 	this.pushHelper.PushMsg(forceuid, "forcelogout");
	 	this.onlineUser.loginstatusmap.remove(forceuid);
	 	this.onlineUser.loginSessions.remove(forceuid);//.get(forceuid).invalidate();
	 	
	 	writeResponseText("{sucess:'true'}", response);
	}
}
