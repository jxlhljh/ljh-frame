package com.sendi.system.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Service;

import com.sendi.system.bean.ApplicationContextHelper;
import com.sendi.system.constants.Globals;
import com.sendi.system.entity.SystemPower;

/**
 * 用户登录后在此类作一些加载操作，如设置全局的session信息等等
 * @author liujinghua 日期：2014-07-03
 */

@Service
public class AfterLoginService {
	private final static String UserButtonOperationsJson ="user_button_operations_json"; 

	@Autowired
	private ApplicationContextHelper applicationContextHelper;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private String userid;
	private String roleid;
	private HttpServletRequest request;
	
	public void doLoad() {
		loadUserMenus();//查询用户的菜单权限
		loadUserButtionOperations();//加载用户按钮操作权限
		loadUserZonePower();//加载用户区域权限
	}
	
	/**
	 * 加载用户菜单权限
	 */
	public void loadUserMenus(){
		//8、查询用户的菜单权限
		
		//如果是超级管理员，加载完所有的菜单后直接返回，不需要取菜单权限表，因为菜单权限表里面没有超级管理员的权限信息
		if(StringUtils.equals(Globals.SuperAdmin, this.userid)){
			final HashMap<String,String> powerMap=new HashMap<String, String>();
			final String sql = "select * from functionmoudle";
			this.jdbcTemplate.query(sql, new RowCallbackHandler(){
				public void processRow(ResultSet rs) throws SQLException {
					powerMap.put(rs.getString("id"), "all");
				}	
			});
			
			request.getSession().setAttribute(Globals.userSystemPower, powerMap);
			return ;
		}
		
		//以下是普通的用户进行的权限查询
 	    HashMap<String,String> powerMap=new HashMap<String, String>();
 	    Object mtpower = applicationContextHelper.servletContext.getAttribute(Globals.sendi_sys_moudlePower_info);
		HashMap<String,SystemPower> systemPower=(HashMap<String,SystemPower>)mtpower;
		Collection<SystemPower> syplist=systemPower.values();
	    for(SystemPower o:syplist)
	    {
	    	if (StringUtils.equals(o.getRoleid()+"",this.getRoleid())) {
	    	   powerMap.put(o.getMoudleid()+"",o.getPowerstate()); 
	       }
 	    }
 	    request.getSession().setAttribute(Globals.userSystemPower, powerMap);
	}

	/**
	 * 加载用户按钮操作权限
	 */
	public void loadUserButtionOperations() {
		List<Map<String, Object>> user_button_operations = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> sys_role_operations = (List<Map<String, Object>>) applicationContextHelper.servletContext.getAttribute(Globals.SysRoleOperations);
		for (Map<String, Object> m : sys_role_operations) {
			if (m.get("roleid").equals(roleid)) {
				user_button_operations.add(m);
			}
		}
		request.getSession().setAttribute(AfterLoginService.UserButtonOperationsJson,ListToJson(user_button_operations));
	}
	
	/**
	 *  加载用户区域权限
	 * @param map
	 * @return
	 */
	public void loadUserZonePower(){
		//如果是超级管理员，加载完所有的区域后直接返回，不需要取菜单权限表，因为菜单权限表里面没有超级管理员的权限信息
		if(StringUtils.equals(Globals.SuperAdmin, this.userid)){
			final List<Map<String,Object>> zonePowerMap=new ArrayList<Map<String,Object>>();
			final String sql = "select id as uzid,zonecode,zonename,parentcode,level from user_zone";
			this.jdbcTemplate.query(sql, new RowCallbackHandler(){
				public void processRow(ResultSet rs) throws SQLException {
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("uzid", rs.getString("uzid"));
					map.put("uzpid", "");//这里设置为空，因为也没有啥用处，没有用到过这个字段
					map.put("zonecode", rs.getString("zonecode"));
					map.put("zonename", rs.getString("zonename"));
					map.put("parentcode", rs.getString("parentcode"));
					map.put("level", rs.getString("level"));
					map.put("powerstate", "all");
					map.put("roleid", AfterLoginService.this.roleid);
					zonePowerMap.add(map);
				}	
			});
			request.getSession().setAttribute(Globals.UserZonePowerSessionName, zonePowerMap);
			return ;
		}
		
		//以下是普通的用户进行的权限查询
		List<Map<String,Object>> uzPower = (List<Map<String,Object>>) applicationContextHelper.servletContext.getAttribute(Globals.UserZonePowerInfos);
		List<Map<String,Object>> zonePowerMap=new ArrayList<Map<String,Object>>();
	 	for(Map<String,Object> o :uzPower){
	 		if(StringUtils.equals(this.roleid, o.get("roleid")+""))
	        {
	    	   zonePowerMap.add(o);
	        }
	 	}
		request.getSession().setAttribute(Globals.UserZonePowerSessionName, zonePowerMap);
	}

	public String MapToJson(Map<String, Object> map) {
		Iterator<String> it = map.keySet().iterator();
		String json = "{";
		while (it.hasNext()) {
			String key = it.next();
			json += "\"" + key + "\":";
			if (map.get(key) instanceof String
					&& ((String) map.get(key)).indexOf("[") == -1) {
				json += "\"" + map.get(key) + "\",";
			} else {
				json += "" + map.get(key) + ",";
			}
		}
		if (json.charAt(json.length() - 1) == ',') {
			json = json.substring(0, json.length() - 1) + "}";
		} else {
			json += "}";
		}
		return json;
	}

	public String ListToJson(List<Map<String, Object>> list) {
		String json = "{totalCount:" + list.size() + ", data:[";
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			json += MapToJson(map) + ",";
		}
		if (json.charAt(json.length() - 1) == ',') {
			json = json.substring(0, json.length() - 1) + "]}";
		} else {
			json += "]}";
		}
		return json;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
}
