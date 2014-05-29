package com.sendi.system.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.entity.SysRoleOperation;
import com.sendi.system.service.SysRoleOperationService;

@Controller
@RequestMapping("/sysRoleOperationController")
public class SysRoleOperationController extends BaseController{
	
	@Autowired
	private SysRoleOperationService sysRoleOperationService;
	
	/**
	 * *******查询-授权按钮***************
	 */
	@RequestMapping(params = "queryRoleOperation")
	public void queryRoleOperation(HttpServletRequest request,
			HttpServletResponse response,String functionid,String useroleid){
		String jsons = sysRoleOperationService.queryRoleOperation(functionid, useroleid);
		writeResponseText(jsons, response);
	}
	
	/**
	 * *******保存-授权按钮***************
	 */
	@RequestMapping(params = "saveRoleOperation")
	public void saveRoleOperation(HttpServletRequest request,
			HttpServletResponse response,String operationcode,String functionid,String useroleid){
		SysRoleOperation sysRoleOperation = new SysRoleOperation(operationcode,functionid,useroleid);
		String msg = sysRoleOperationService.saveRoleOperation(sysRoleOperation);
		if(msg.length()>0){
			writeResponseText("{success:false,msg:'后台错误'}", response);
		}else{
			writeResponseText("{success:true,msg:'保存成功'}", response);
		}
	}
	
}
