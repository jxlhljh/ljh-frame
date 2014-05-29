package com.sendi.system.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.bean.Page;
import com.sendi.system.entity.SysSocketInterface;
import com.sendi.system.service.SysSocketInterfaceService;

@Controller
@RequestMapping("/sysSocketInterfaceController")
public class SysSocketInterfaceController extends BaseController{
	
	@Autowired
	private SysSocketInterfaceService sysSocketInterfaceService;
	
	
	/**
	 * 查询
	 * @return
	 */
	@RequestMapping(params = "queryskInterfaceData")
	public void queryskInterfaceData(HttpServletRequest request,
			HttpServletResponse response, String description,String interfaceid, Integer start, Integer limit) {
		Page page = sysSocketInterfaceService.queryPushConfigData(description, interfaceid, start/limit + 1, limit);
		writeResponseText(page.formToJson(), response);
	}

	/**
	 * 增加
	 */
	@RequestMapping(params = "addskInterface")
	public void addskInterface(HttpServletRequest request,
			HttpServletResponse response, SysSocketInterface sysSocketInterface)
			throws Exception {
		try {

			sysSocketInterfaceService.addskInterface(sysSocketInterface);

			this.writeResponseText("{success:true,msg:'操作成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}

	/**
	 * 修改
	 */
	@RequestMapping(params = "excuteModifyskInterface")
	public void excuteModifyskInterface(HttpServletRequest request,
			HttpServletResponse response, SysSocketInterface sysSocketInterface)
			throws Exception {
		
		try {

			sysSocketInterfaceService.excuteModifyskInterface(sysSocketInterface);

			this.writeResponseText("{success:true,msg:'操作成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}

	/**
	 * 删除
	 */
	@RequestMapping(params = "excuteDeleteskconfig")
	public void excuteDeleteskconfig(HttpServletRequest request,
			HttpServletResponse response, String deleterecord) {
		try {

			sysSocketInterfaceService.excuteDeleteskconfig(deleterecord);

			this.writeResponseText("{success:true,msg:'操作成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}
	
}
