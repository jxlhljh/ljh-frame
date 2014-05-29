package com.sendi.system.bean;

import java.net.InetAddress;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import net.sf.json.JSONArray;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;

import com.sendi.system.constants.Globals;
import com.sendi.system.entity.Functionmoudle;
import com.sendi.system.entity.SysConfigPara;
import com.sendi.system.entity.SysProloadConf;
import com.sendi.system.entity.SysPushConfig;
import com.sendi.system.entity.SysSocketInterface;
import com.sendi.system.entity.SystemPower;
import com.sendi.system.entity.User;
import com.sendi.system.entity.UserRoleRelation;
import com.sendi.system.socket.SocketI;
import com.sendi.system.socket.SocketSever;
import com.sendi.system.util.tree.MoudleTreeNode;
import com.sendi.system.util.tree.TreeHelper;

/**
 * 类描述：系统启动加载项类
 * 
 * @author liujinghua
 * @date： 日期：2014-05-14 时间：上午10:30:48 系统需要在启动时预加载的数据都尽量在这里配置 push bean 配置 的预加载
 *        系统外部socket 接口的配置 目前对于用户信息，角色信息，模块信息，设备信息都放在这里加载， 对于各模块中可能出现的更新，则重新加载
 *        ，模块信息则非常重新加载，则是更新，通过内存查询进行更新，而不是重做
 *        但如果这种操作太频繁，则会影响系统的性能，因此，想法是开发阶段，进行此类动作，当进行生产阶段时，可以选择通过重启
 *        或者以后开发的系统命令功能，发送相关重载命令即可
 * */
public class PreloadBeanconfig {
	
	@Autowired
	public ApplicationContextHelper applicationContextHelper;
	
	@Autowired
	public SysLogHelper sysLogHelper;
	
	@Autowired
	public PushHelper pushHelper;

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SocketSever socketSever;

	private HashMap<String,SocketI> sysSocketI=new HashMap<String, SocketI>();
	private HashMap<String, SysPushConfig> pushBeanconfigmap = new HashMap<String, SysPushConfig>();
	private HashMap<String, SysSocketInterface> sysSocketInterface = new HashMap<String, SysSocketInterface>();
	private HashMap<String, String> sysconfigpara = new HashMap<String, String>();
	private HashMap<String, MoudleTreeNode> moudletreemap = new HashMap<String, MoudleTreeNode>();
	private HashMap<String, User> usermap = new HashMap<String, User>();
	private HashMap<String, UserRoleRelation> userRoleRelation = new HashMap<String, UserRoleRelation>();
	private HashMap<String, SystemPower> systemPower = new HashMap<String, SystemPower>();
	private HashMap<String, SysProloadConf> sysPreloadMap = new HashMap<String, SysProloadConf>();
	private HashMap<String, HashSet<String>> moudleid2roleid = new HashMap<String, HashSet<String>>();

	public void init() {
		try {
			initBeanMap();
			// 运行预加载类
			executePreloadBean();
			// //启动socket服务
			initSocketServer();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void initBeanMap() throws Exception {

		Session session = sessionFactory.openSession();

		String hql = "from SysPushConfig";
		List datas = session.createQuery(hql).list();
		for (Object o : datas) {
			SysPushConfig slb = (SysPushConfig) o;
			pushBeanconfigmap.put(slb.getPushid(), slb);
		}
		String hql2 = "from SysSocketInterface";
		List datas2 = session.createQuery(hql2).list();
		for (Object o2 : datas2) {
			SysSocketInterface sib = (SysSocketInterface) o2;
			sysSocketInterface.put(sib.getInterfaceid(), sib);
		}

		String hql3 = "from SysConfigPara";
		List datas3 = session.createQuery(hql3).list();
		for (Object o3 : datas3) {
			SysConfigPara sib = (SysConfigPara) o3;
			sysconfigpara.put(sib.getParaName(), sib.getParaValue());
			if (sib.getParaName().equals("sendi_system_title")) // 系统标题做为默认值放到servletContext中
			{
				applicationContextHelper.servletContext.setAttribute("sendi_system_title", sib.getParaValue());
			}
		}

		applicationContextHelper.servletContext.setAttribute("sendi_sys_config_para", sysconfigpara);

		// //// 加载模块树
		String hql4 = "from Functionmoudle";
		List datas4 = session.createQuery(hql4).list();
		for (Object o4 : datas4) {
			Functionmoudle sib = (Functionmoudle) o4;
			MoudleTreeNode tn = new MoudleTreeNode();
			tn.setText(sib.getMoudletitle());
			tn.setTreeId(sib.getId());
			tn.setIsleaf(sib.getIsleaf().equalsIgnoreCase("off") ? false : true);
			tn.setParentId(sib.getParentid());
			tn.setFn(sib);
			moudletreemap.put(sib.getId() + "", tn);
		}
		MoudleTreeNode mroot = new MoudleTreeNode();
		mroot.setIsleaf(false);
		mroot.setText("模块树");
		mroot.setTreeId(-1);
		mroot.setIsroot(true);
		moudletreemap.put("-1", mroot);
		TreeHelper.generateMTree(moudletreemap);
		applicationContextHelper.servletContext.setAttribute("sendi_sys_module_tree", moudletreemap);
		// //// 加载模块树
		
		// //加载用户信息
		String hql5 = "from User";
		List datas5 = session.createQuery(hql5).list();
		for (Object o5 : datas5) {
			User slb = (User) o5;
			usermap.put(slb.getUserId(), slb);
		}
		applicationContextHelper.servletContext.setAttribute("sendi_sys_user_info", usermap);

		String hql6 = "from UserRoleRelation";
		List datas6 = session.createQuery(hql6).list();
		for (Object o6 : datas6) {
			UserRoleRelation slb = (UserRoleRelation) o6;
			userRoleRelation.put(slb.getId() + "", slb);
		}
		applicationContextHelper.servletContext.setAttribute("sendi_sys_userRoleRelation_info", userRoleRelation);

		String hql7 = "from SystemPower";
		List datas7 = session.createQuery(hql7).list();
		for (Object o7 : datas7) {
			SystemPower slb = (SystemPower) o7;
			systemPower.put(slb.getId() + "", slb);
			HashSet<String> tt = moudleid2roleid.get(String.valueOf(slb.getMoudleid().toString()));
			if (tt == null) {
				tt = new HashSet<String>();
				moudleid2roleid.put(String.valueOf(slb.getMoudleid().toString()), tt);
			}
			tt.add(String.valueOf(slb.getRoleid()));
		}
		applicationContextHelper.servletContext.setAttribute("sendi_sys_moudlePower_info", systemPower);
		// 模块ID对应的所有角色id
		applicationContextHelper.servletContext.setAttribute("sendi_sys_moudleid2roleid_info", moudleid2roleid);
		
		// /加载预加载类
		String hql11 = "from SysProloadConf";
		List datas11 = session.createQuery(hql11).list();
		for (Object o11 : datas11) {
			SysProloadConf slb = (SysProloadConf) o11;
			sysPreloadMap.put(slb.getId() + "", slb);
		}
		applicationContextHelper.servletContext.setAttribute("sendi_sys_proload_info", sysPreloadMap);
		
		session.close();
		
		//以下为用jdbcTemplate操作的加载代码
		//10、加载按钮权限
		final List<Map<String,Object>> sys_role_operations = new ArrayList<Map<String,Object>>();
		final String sql = "select functionid,roleid,moudleid,operationcode from sys_role_operation,functionmoudle where sys_role_operation.functionid=functionmoudle.id";
		this.jdbcTemplate.query(sql, new RowCallbackHandler(){
			public void processRow(ResultSet rs) throws SQLException {
				String functionid = rs.getString("functionid");
				String roleid = rs.getString("roleid");
				String moudleid = rs.getString("moudleid");
				String[] operationCodes = rs.getString("operationcode").split(",");
				for(int i=0;i<operationCodes.length;i++){
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("operationcode", operationCodes[i]);
					map.put("functionid", functionid);
					map.put("roleid", roleid);
					map.put("moudleid", moudleid);
					sys_role_operations.add(map);
				}
			}	
		});
		applicationContextHelper.servletContext.setAttribute(Globals.SysRoleOperations, sys_role_operations);
		
		

		///加载服务器地址
		applicationContextHelper.servletContext.setAttribute("sendi_sys_host_address_ip", InetAddress.getLocalHost().getHostAddress());
		applicationContextHelper.servletContext.setAttribute("sendi_sys_host_name_hostname", InetAddress.getLocalHost().getHostName());
		
		// 设置默认的系统时区
		// TimeZone tz=TimeZone.getDefault();
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"));

		///加载服务器地址
		Iterator<String> it=sysSocketInterface.keySet().iterator();
		 while(it.hasNext())
		 {
			 String key=it.next();
			 SysSocketInterface o= sysSocketInterface.get(key);
			 SocketI c=(SocketI)Class.forName(o.getInterfacecalss()).newInstance();
			 c.setApplicationContextHelper(applicationContextHelper);
			 c.setPushHelper(pushHelper);
			 c.setSysLogHelper(sysLogHelper);
			 c.setSessionFactory(sessionFactory);
			 sysSocketI.put(key, c);
	 	 }
		
	}
	
	public void executePreloadBean() {
		//运行所有预加载的类 -- 必须先执行initBeanMap，否则更新初始化无效
		 Iterator<String> it2=sysPreloadMap.keySet().iterator();
		 while(it2.hasNext())
		 {
			 try
			 {
				 String key=it2.next();
				 SysProloadConf o= sysPreloadMap.get(key);
				 PreloadI c=(PreloadI)Class.forName(o.getInterfacecalss()).newInstance();
				 c.setApplicationContextHelper(applicationContextHelper);
				 c.setSysLogHelper(sysLogHelper);
				 c.setSessionFactory(sessionFactory);
				 c.setJdbcTemplate(jdbcTemplate);
				 c.doLoad(); 
			 }
			 catch (Exception e) {
				 e.printStackTrace();
			}
			
	 	 }
		 //运行所有预加载的类
	}

	public void initSocketServer(){
		try{
			 ////启动socket服务-- 必须先执行initBeanMap，否则无法启动
	    	if(sysconfigpara!=null&&sysconfigpara.size()>0)
	    	 {
	    		 String socketsw=sysconfigpara.get("sendi_system_isusesocket"); //socket 服务开关
	    		 String portstr=sysconfigpara.get("sendi_system_socketport"); //socket 服务开关
	    		 if(socketsw!=null&&socketsw.trim().length()>0)
	    		 {
	    			 if(socketsw.equals("yes"))
	    			 {
	    				 this.socketSever.setUsesocket(true);
	    			 }
	    		 }
	    		 if(portstr!=null&&portstr.trim().length()>0)
	    		 {
	    			 this.socketSever.setPort(Integer.parseInt(portstr));
	    		 }
	    	 }
	    	 else
	    	 {
	    		 System.err.println("系统预加载信息失败...,请系统管理员检查");
	    	 }
	    	 this.socketSever.setSysSocketI(this.sysSocketI);
	    	 this.socketSever.setPushBeanconfigmap(pushBeanconfigmap);
			 this.socketSever.startServer();
			 ////启动socket服务
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public void reloadConfig(){
		try{
			initBeanMap();
			String socketsw=sysconfigpara.get("sendi_system_isusesocket"); //socket 服务开关
			if(socketSever != null){
				if(!"yes".equals(socketsw)){
					// close socket server
				}else{
					// update config data
					socketSever.setSysSocketI(this.sysSocketI);
			    	socketSever.setPushBeanconfigmap(pushBeanconfigmap);
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

	public void setApplicationContextHelper(
			ApplicationContextHelper applicationContextHelper) {
		this.applicationContextHelper = applicationContextHelper;
	}
}
