package com.sendi.system.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.entity.Functionmoudle;
import com.sendi.system.service.FunctionModuleService;

/**
 * 菜单功能控制器
 * 
 * @author liujinghua
 * @date 2014-05-14 12：03
 */
@Controller
@RequestMapping("/functionModuleController")
public class FunctionModuleController extends BaseController {
	
	@Autowired
	private FunctionModuleService functionModuleService;

	/**
	 * 查询菜单列表
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(params = "listallMoudletoMenu")
	public void listallMoudletoMenu(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String menu = functionModuleService.listallMoudletoMenu(request);
		writeResponseText(menu, response);
	}
	
	/**
	 * 模块管理功能的左边的 左边-模块信息（树）********
	 */
	@RequestMapping(params = "listmoudletree")
	public void listmoudletree(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String treeJson = functionModuleService.listmoudletree(request);
		writeResponseText(treeJson,response);
		 
	}
	 
	/**
	 * 模块管理，中间的列表数据读取
	 */
	@RequestMapping(params = "moudleInit")
	public void moudleInit(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<Functionmoudle> datas = functionModuleService.moudleInit(request);
		writeJSONArray(datas, request, response);
		 
	}
	
	/**
	 * 模块管理，新增
	 */
	@RequestMapping(params = "addMoudlefunction")
	public void addMoudlefunction(HttpServletRequest request,
			HttpServletResponse response) {
			try{
				functionModuleService.addMoudlefunction(request, response);
				writeResponseText("{success:true,msg:'success'}",response);
			}catch (Exception e) {
				writeResponseText("{success:false,msg:'faild',errors:{"+e.getMessage()+"}}",response);
				e.printStackTrace();
			}
	}
	
	/**
	 * 模块管理，修改
	 */
	@RequestMapping(params = "excuteModifymoudle")
	public void excuteModifymoudle(HttpServletRequest request,
			HttpServletResponse response) {
			try{
				functionModuleService.excuteModifymoudle(request, response);
				writeResponseText("{success:true,msg:'success'}",response);
			}catch (Exception e) {
				writeResponseText("{success:false,msg:'faild',errors:{"+e.getMessage()+"}}",response);
				e.printStackTrace();
			}
	}
	
	/**
	 * 模块管理，删除
	 */
	@RequestMapping(params = "excuteDeletemoudle")
	public void excuteDeletemoudle(HttpServletRequest request,
			HttpServletResponse response) {
			try{
				functionModuleService.excuteDeletemoudle(request, response);
				writeResponseText("{success:true,msg:'success'}",response);
			}catch (Exception e) {
				writeResponseText("{success:false,msg:'faild',errors:{"+e.getMessage()+"}}",response);
				e.printStackTrace();
			}
	}
	
	/**
	 * 混合模式上面菜单查询
	 * 
	 */
	@RequestMapping(params = "listallMoudletoMenuBar")
	public void listallMoudletoMenuBar(HttpServletRequest request,
			HttpServletResponse response) {
			String json = functionModuleService.listallMoudletoMenuBar(request);
			writeResponseText(json,response);
	}
	
	/**
	 * 混合模式左边菜单查询
	 * 
	 */
	@RequestMapping(params = "listmoudletreenode")
	public void listmoudletreenode(HttpServletRequest request,
			HttpServletResponse response) {
			String json = functionModuleService.listmoudletreenode(request);
			writeResponseText(json,response);
	}
}
