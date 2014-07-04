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
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Service;

import com.sendi.system.bean.ApplicationContextHelper;
import com.sendi.system.bean.PreloadI;
import com.sendi.system.constants.Globals;
import com.sendi.system.entity.UserZonePower;

/**
 * 用户登录后在此类作一些加载操作，如设置全局的session信息等等
 * @author liujinghua 日期：2014-07-03
 */

@Service
public class AfterLoginService extends PreloadI {
	private final static String UserButtonOperationsJson ="user_button_operations_json"; 

	@Autowired
	private ApplicationContextHelper applicationContextHelper;

	private String userid;
	private String roleid;
	private HttpServletRequest request;
	
	public void doLoad() {
		loadUserButtionOperations();//加载用户按钮操作权限
		loadUserZonePower();//加载用户区域权限
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
