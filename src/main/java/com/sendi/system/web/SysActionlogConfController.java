package com.sendi.system.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.bean.ApplicationContextHelper;
import com.sendi.system.entity.SysActionlogConf;
import com.sendi.system.preload.PreLoadActionLogConf;
import com.sendi.system.service.SysActionlogConfService;

/**
 * Action配置管理控制器
 * @author liujinghua 2014-05-18 晚上 23：11
 */
@Controller
@RequestMapping("/sysActionlogConfController")
public class SysActionlogConfController extends BaseController {
	
	@Autowired
	private ApplicationContextHelper applicationContextHelper;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private SysActionlogConfService sysActionlogConfService;

	@RequestMapping(params = "query")
	public void query(HttpServletRequest request, HttpServletResponse response) {
		List<SysActionlogConf> datas = sysActionlogConfService.query();
		this.writeJSONArray(datas, request, response);
	}

	@RequestMapping(params = "add")
	public void add(HttpServletRequest request, HttpServletResponse response,
			String methodName, String actionDesc, Integer flag, String actionId, String actionName,String methodId) {
		try {
			if(StringUtils.isEmpty(methodName) || StringUtils.isEmpty(actionDesc) ||StringUtils.isEmpty(actionId) || 
				 StringUtils.isEmpty(actionId) || StringUtils.isEmpty(methodId)){
				throw new RuntimeException("some parameters(methodName,actionDesc,actionId, actionName,methodId) must pass to action,but found null!");
			}
			sysActionlogConfService.add(methodName, actionDesc, actionName,flag, actionId,methodId);
			this.writeResponseText("{success:true,msg:'操作成功'}",response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'数据库异常'}",response);
			e.printStackTrace();
		}
	}
	
	@RequestMapping(params = "update")
	public void update(HttpServletRequest request, HttpServletResponse response,
			String methodName, String actionDesc, Integer flag, String actionId, String actionName,String methodId) {
		try {
			if(StringUtils.isEmpty(methodName) || StringUtils.isEmpty(actionDesc) ||StringUtils.isEmpty(actionId) || 
					 StringUtils.isEmpty(actionId) || StringUtils.isEmpty(methodId)){
				throw new RuntimeException("some parameters(methodName,actionDesc,actionId, actionName,methodId) must pass to action,but found null!");
			}
			sysActionlogConfService.update(methodName, actionDesc, actionName,flag, actionId,methodId);
			this.writeResponseText("{success:true,msg:'操作成功'}",response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'数据库异常'}",response);
			e.printStackTrace();
		}
	}
	
	@RequestMapping(params = "delete")
	public void delete(HttpServletRequest request, HttpServletResponse response,
			String actionId, String methodId) {
		try {
			if(StringUtils.isEmpty(actionId) || StringUtils.isEmpty(methodId)){
				throw new RuntimeException("find some errors: uactionId,methodId is null!");
			}
			sysActionlogConfService.delete(actionId, methodId);
			this.writeResponseText("{success:true,msg:'删除成功'}",response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'数据库异常'}",response);
			e.printStackTrace();
		}
	}
	
	@RequestMapping(params = "reload")
	public void reload(HttpServletRequest request, HttpServletResponse response) {
		try {
			PreLoadActionLogConf preLoadActionLogConf = new PreLoadActionLogConf();//
			//1、对preLoadActionLogConf注入reload所需要的bean
			preLoadActionLogConf.setJdbcTemplate(jdbcTemplate);
			preLoadActionLogConf.setApplicationContextHelper(applicationContextHelper);
			
			sysActionlogConfService.reload(preLoadActionLogConf);
			
			this.writeResponseText("{success:true,msg:'重载成功'}",response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'重载异常'}",response);
			e.printStackTrace();
		}
	}
}
