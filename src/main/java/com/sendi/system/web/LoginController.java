package com.sendi.system.web;

import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sendi.system.bean.LoginInfo;
import com.sendi.system.bean.OnlineUser;
import com.sendi.system.bean.SysLogHelper;
import com.sendi.system.constants.Globals;
import com.sendi.system.entity.SystemPower;
import com.sendi.system.entity.User;
import com.sendi.system.entity.UserRole;
import com.sendi.system.entity.UserRoleRelation;
import com.sendi.system.service.UserRoleService;
import com.sendi.system.socket.SocketSever;
import com.sendi.system.util.common.DateUtil;

/**
 * 登录类控制器
 * 
 * @author liujinghua
 * @date 2014-05-14 10：32
 */
@Controller
@RequestMapping("/loginController")
public class LoginController extends BaseController{
	
	private static final String LOGIN_ = "/login";
	
	@Autowired
	private SysLogHelper sysLogHelper;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired 
	private SocketSever socketSever;
	
	@Autowired
	private OnlineUser onlineUser;

	/**
	 * 登录
	 */
	@RequestMapping(params = "login")
	public ModelAndView login(HttpServletRequest request) {

		String login_rand = request.getParameter("login_rand");
		String login_username = request.getParameter("login_username");
		String login_password = request.getParameter("login_password");

		try {
			
			//1、验证码校验
			if (request.getSession().getAttribute("rand") != null) {
				if (!request.getSession().getAttribute("rand").toString()
						.equals(login_rand)) {
					request.setAttribute("loginMSG", "验证码输入错误");
					return new ModelAndView(LOGIN_);
				}
			}
			
			//2、未加载好信息直接退出
			ServletContext sc = request.getSession().getServletContext();
			Object mtuser = sc.getAttribute("sendi_sys_user_info");
			Object mtrole = sc.getAttribute("sendi_sys_userRoleRelation_info");
			Object mtpower = sc.getAttribute("sendi_sys_moudlePower_info");
		 	if(mtuser==null||mtrole==null||mtpower==null)
		 	{
		 		request.setAttribute("loginMSG", "用户相关信息未加载，无法登录");
				return new ModelAndView(LOGIN_);
		 	}
		 	
		 	//3、判断用户名密码
		 	HashMap<String,User> usermap=(HashMap<String,User>)mtuser;
			HashMap<String,UserRoleRelation> userRoleRelation=(HashMap<String,UserRoleRelation>)mtrole;
			HashMap<String,SystemPower>      systemPower=(HashMap<String,SystemPower>)mtpower;
			User u=usermap.get(login_username);
			
			if(u==null)
			{
				this.sysLogHelper.Log(login_username, request.getRemoteAddr(), "fail", new Date().toLocaleString(),"unknow user:"+login_username+"login to system","login");
				request.setAttribute("loginMSG", "未知用户名登录");
				return new ModelAndView(LOGIN_);
		 	}else{
		 		
		 		if(!u.getPassword().equals(login_password))
				{
					this.sysLogHelper.Log(login_username, request.getRemoteAddr(), "fail", new Date().toLocaleString(),"user:"+login_username+"login to system","login");
					request.setAttribute("loginMSG", "密码不正确");
					return new ModelAndView(LOGIN_);
				}
				if(u.getIsactive().equals("off")&&!u.getUserId().equals("admin")) //系统管理员不能禁用
				{
					this.sysLogHelper.Log(login_username, request.getRemoteAddr(), "fail", new Date().toLocaleString(),"user:"+login_username+"login to system","login");
					request.setAttribute("loginMSG", "该用户已被禁用");
					return new ModelAndView(LOGIN_);
			 	}
				
				//判断密码是否已过有限期2010 07 22 超级管理员不需要提示
				if(u.getIstip().equals("on")&&!u.getUserId().equals("admin"))
				{
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
				    Date  d=sdf.parse(u.getPwddate());
				    int p= DateUtil.diffDateD(d,new Date());
				    if(p>=u.getPwdvalicity())
				    {
				    	this.sysLogHelper.Log(login_username, request.getRemoteAddr(), "fail", new Date().toLocaleString(),"user:"+login_username+"login to system","login");
						String pwdurl=request.getContextPath()+"/system/modipwd.jsp";
				    	request.setAttribute("loginMSG", u.getUserId()+":该用户密码已过期,请<a target='_blank' href='"+pwdurl+"'>修改密码</a>");
				    	return new ModelAndView(LOGIN_);
				    }
					
				}
				
				 ////登录IP限制判断2010 07 22
				 //先获取该用户的所有角色，如果以限制IP登录的角色做为筛选的结果,超级管理员允许在任务IP登录
				String roleid = null;//系统改了，现在每个用户只有一个角色，不支持对应多个角色
				HashMap<String,String> roldidsarr=new HashMap<String,String>();
				{
				 	 Collection<UserRoleRelation> urlist= userRoleRelation.values();
				 	 StringBuffer hqlb=new StringBuffer("from UserRole where isvalidataip ='on' and id in(");
					 for(UserRoleRelation urr:urlist)
					 {
					 	 if(urr.getUserid().intValue()==u.getId().intValue())
						 {
					 		 roleid=urr.getRoleid()+"";
							 roldidsarr.put(roleid, roleid);
							 hqlb.append(roleid).append(",");
						 }
				 	 }
					 if(roldidsarr.size()==0) //说明该用户未分配任务角色，不能登录 
					 {
						    this.sysLogHelper.Log(login_username, request.getRemoteAddr(), "fail", new Date().toLocaleString(),"user:"+login_username+"login to system","login");
							request.setAttribute("loginMSG", "该用户未分配任务角色，不能登录");
							return new ModelAndView(LOGIN_);
					 }
					 //获取所有限制IP登录的角色	 
					hqlb.append("-1000").append(") ");
					List usrole = userRoleService.findByQueryString(hqlb.toString());
					 
					boolean canlogin=false;
					if(usrole.size()==0)canlogin=true; //说明该用户的所有角色不开启IP登录限制 
					for(Object ook:usrole)
					{
						UserRole urle=(UserRole)ook;
						if(urle.getLoginip().indexOf(request.getRemoteAddr())!=-1) //只要在该角色中找到允许登录的IP，则让用户登录
						{
							canlogin=true;
							break;
						}
					}
					if(!canlogin) 
					{
						   this.sysLogHelper.Log(login_username, request.getRemoteAddr(), "fail", new Date().toLocaleString(),"user:"+login_username+"login to system","login");
							request.setAttribute("loginMSG", "该用户所在角色，在该终端IP下不允许登录");
							return new ModelAndView(LOGIN_);
						
					}
	 			}
				
				//6、加入socket监听
				 HttpSession hs= request.getSession();
				 try
				 {
				 LoginInfo loginInfo= new LoginInfo();
				 loginInfo.setUserid(u.getUserId()+"");
				 loginInfo.setUserName(u.getUserName());
				 loginInfo.setLogintime(new Date().toLocaleString());
				 loginInfo.setRequest(request);
				 loginInfo.setLoginhost(request.getRemoteAddr());
				 loginInfo.session=hs;
				 
				 if(socketSever.isUsesocket())
				 {
					 HashMap<String, HashMap<String,Socket>>  socketmap=socketSever.getSocketmap();
					 
					 HashMap<String,Socket> relateuser=socketmap.get(u.getId()+""); //同一个用户的多个socket
				       
						 //登记在线用户,原则是从用户真正登录显示主界面，socket连接成功后才算登录成功，但由于socket server是全局的，
						 //没法获取sesion中的信息，所以只好在登录的action做登记,当真正登录时才将信息设成成功 
					 	//由于socket存在网络超时无法连接的情况，修改为此处直接登记成功 2013-04-10 by linjh	
						 if(relateuser!=null&&relateuser.size()>=u.getMaxlogincount())
						 {
							 this.sysLogHelper.Log(login_username, request.getRemoteAddr(), "fail", new Date().toLocaleString(),"login to system","login");
						     request.setAttribute("loginMSG", login_username+",该用户登录次数已超过最大允许值:"+u.getMaxlogincount());
						     return new ModelAndView(LOGIN_);
						 }
						 else
						 {
							 onlineUser.getLoginInfo().put(hs.getId(), loginInfo);
							 onlineUser.onlineUser.put(hs.getId(), u);
							 onlineUser.loginstatusmap.put(hs.getId(),"login"); //状态未知，2种状态login(登录),unknow状态需要在真正的socket连接建立后才能将状态改为login
							 hs.setAttribute(Globals.SesloginInfo,loginInfo);
							// OnlineCounterListener sessionListener=new OnlineCounterListener(onlineUser);
							//this.getRequest().getSession(false).setAttribute("listener",sessionListener);
						 }
				 }else{
					 hs.setAttribute("loginInfo",loginInfo);
				 }
				 
				 }catch (Exception e) {
						this.sysLogHelper.Log(login_username, request.getRemoteAddr(), "fail", new Date().toLocaleString(),"login to system","login");
						e.printStackTrace();
						request.setAttribute("loginMSG","error:"+e.getMessage());
						return new ModelAndView(LOGIN_);
			    }
				 
				 for(LoginInfo l : onlineUser.getLoginInfo().values()){
					 System.out.println("logined ...."+l.getUserName()+" "+l.getSession().getId());
				 }
				
				//7、登录成功，将登录信息设置在session中
				request.getSession().setAttribute(this.SESSION_USER_ID, u.getUserId()+"");
				request.getSession().setAttribute(this.SESSION_USER_NAME, u.getUserName()+"");
				request.getSession().setAttribute(this.SESSION_ROLE_ID, roleid+"");
				request.getSession().setAttribute(this.SESSION_USER_ID_TABLEKEY, u.getId()+"");
				
				//8、查询用户的菜单权限
				{
				 	    HashMap<String,String> powerMap=new HashMap<String, String>();
						Collection<SystemPower> syplist=systemPower.values();
					    for(SystemPower o:syplist)
					    {
					       if(roldidsarr.get(o.getRoleid()+"")!=null)
					       {
					    	   powerMap.put(o.getMoudleid()+"",o.getPowerstate()); 
					       }
				 	    }
				 	    request.getSession().setAttribute("userSystemPower", powerMap);
			 	}
				
				this.sysLogHelper.Log(login_username, request.getRemoteAddr(), "success", new Date().toLocaleString(),"login to system","login");
				return new ModelAndView("system/main_common");
		 	}
		 	
		} catch (Exception ex) {
			ex.printStackTrace();
			request.setAttribute("loginMSG", ex.getMessage());
			return new ModelAndView(LOGIN_);
		}
	}
	
	/**
	 * 登出
	 */
	@RequestMapping(params = "logout")
	public ModelAndView logout(HttpServletRequest request) {
		System.out.println("logout...............................");
		HttpSession hs = request.getSession();
		if (hs.getAttribute("userid") != null) {
			String userId = hs.getAttribute("userid").toString();
			String ip = getIp(request);
			// behaviourHelper.logout(userId, ip);
			// this.sysLogHelper.Log(this.login_username,
			// getRequest().getRemoteAddr(), "success", new
			// Date().toLocaleString(),"logout system","logout");
			try {
				// OnlineUser
				// onlineUser=(OnlineUser)this.applicationContextHelper.appctx.getBean("onlineUser");
				// onlineUser.loginstatusmap.remove(hs.getId());
				// //状态未知，2种状态login(登录),unknow状态需要在真正的socket连接建立后才能将状态改为login

				hs.invalidate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ModelAndView(LOGIN_);
	}

	private String getIp(HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		if (ip == null || ip.length() == 0) {
			HttpSession hs = request.getSession();
			System.out.println(request.getRemoteAddr() + "_"
					+ hs.getAttribute("loginInfo"));
			if (hs.getAttribute("loginInfo") != null) {
				// LoginInfo loginInfo =
				// (LoginInfo)hs.getAttribute("loginInfo");
				ip = "192.168.2.1";// loginInfo.loginhost;
			}
		}
		return ip;
	}

}
