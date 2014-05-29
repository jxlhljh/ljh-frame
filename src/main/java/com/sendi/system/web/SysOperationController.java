package com.sendi.system.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.service.SysOperationService;

/**
 * 按锯操作控制器
 * 
 * @author liujinghua
 * @date 2014-05-15 16：55
 */
@Controller
@RequestMapping("/sendisystem/sysOperationController")
public class SysOperationController extends BaseController {
	private  final String FUNCTIONID = "functionid";
	private  final String OPERATIONCODE = "operationcode";
	private  final String OPERATIONNAME = "operationname";
	private  final String ID = "id";
	
	@Autowired
	private SysOperationService sysOperationService;

	/**
	 * 查询按钮列表
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(params = "operationQuery")
	public void operationQuery(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String functionid = request.getParameter(this.FUNCTIONID);//"179";//
		String buttons = sysOperationService.operationQuery(functionid);
		writeResponseText(buttons, response);
	}
	
	/**
	 * 新增
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(params = "operationAdd")
	public void operationAdd(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try{
			String operationcode = request.getParameter(this.OPERATIONCODE);
			String functionid = request.getParameter(this.FUNCTIONID);
			String operationname = request.getParameter(this.OPERATIONNAME);
			sysOperationService.operationAdd(operationcode,functionid,operationname);
			writeResponseText("{success:true,msg:'success'}",response);
	 	} catch (Exception e) {
			writeResponseText("{success:false,msg:'faild',errors:{"+e.getMessage()+"}}",response);
		 	e.printStackTrace();
		}
	}
	
	/**
	 * 修改
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(params = "operationChange")
	public void operationChange(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try{
			String operationcode = request.getParameter(this.OPERATIONCODE);
			String functionid = request.getParameter(this.FUNCTIONID);
			String operationname = request.getParameter(this.OPERATIONNAME);
			String id = request.getParameter(this.ID);
			sysOperationService.operationChange(operationcode,functionid,operationname,id);
			writeResponseText("{success:true,msg:'success'}",response);
	 	} catch (Exception e) {
			writeResponseText("{success:false,msg:'faild',errors:{"+e.getMessage()+"}}",response);
		 	e.printStackTrace();
		}
	}
	
	/**
	 * 删除
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(params = "operationDelete")
	public void operationDelete(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try{
			String ids = request.getParameter(this.ID);
			sysOperationService.operationDelete(ids);
			writeResponseText("{success:true,msg:'success'}",response);
	 	} catch (Exception e) {
			writeResponseText("{success:false,msg:'faild',errors:{"+e.getMessage()+"}}",response);
		 	e.printStackTrace();
		}
	}
}
