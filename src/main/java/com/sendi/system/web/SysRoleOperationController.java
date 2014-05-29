package com.sendi.system.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.service.SysRoleOperationService;

@Controller
@RequestMapping("/sysRoleOperationController")
public class SysRoleOperationController extends BaseController{
	
	@Autowired
	private SysRoleOperationService sysRoleOperationService;
	
	@RequestMapping(params = "operationRoleQuery")
	public void operationRoleQuery(HttpServletRequest request,
			HttpServletResponse response,String functionid,String useroleid){
		String jsons = sysRoleOperationService.operationRoleQuery(functionid, useroleid);
		writeResponseText(jsons, response);
	}
	
}
