package com.sendi.system.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.bean.Page;
import com.sendi.system.entity.SysJobInterface;
import com.sendi.system.service.SysJobInterfaceService;

/**
 * 定时任务控制器
 * 
 * @author liujinghua
 * 
 */
@Controller
@RequestMapping("/sysJobInterfaceController")
public class SysJobInterfaceController extends BaseController {

	@Autowired
	private SysJobInterfaceService sysJobInterfaceService;

	/**
	 * 查询
	 */
	@RequestMapping(params = "querysysJobInterfaceData")
	public void querysysJobInterfaceData(HttpServletRequest request,
			HttpServletResponse response,
			String description,
			String interfaceid,
			Integer start,
			Integer limit) {
		Page page = sysJobInterfaceService.querysysJobInterfaceData(description, interfaceid, start/limit + 1, limit);
		writeResponseText(page.formToJson(), response);
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(params = "addsysJobInterface")
	public void addsysJobInterface(HttpServletRequest request,
			HttpServletResponse response,SysJobInterface sysJobInterface) {
		
		try {
			
			sysJobInterfaceService.addsysJobInterface(sysJobInterface);
			
			this.writeResponseText("{success:true,msg:'操作成功'}",response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}",response);
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(params = "excuteModifysysJobInterface")
	public void excuteModifysysJobInterface(HttpServletRequest request,
			HttpServletResponse response,SysJobInterface sysJobInterface) {
		
		try {
			
			sysJobInterfaceService.excuteModifysysJobInterface(sysJobInterface);
			
			this.writeResponseText("{success:true,msg:'操作成功'}",response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}",response);
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(params = "excuteDeletesysJobInterface")
	public void excuteDeletesysJobInterface(HttpServletRequest request,
			HttpServletResponse response,String deleterecord) {
		
		try {
			
			sysJobInterfaceService.excuteDeletesysJobInterface(deleterecord);
			
			this.writeResponseText("{success:true,msg:'操作成功'}",response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}",response);
			e.printStackTrace();
		}
		
	}
}
