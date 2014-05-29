package com.sendi.system.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.bean.Page;
import com.sendi.system.entity.SysProloadConf;
import com.sendi.system.service.SysProloadConfService;

/**
 * 系统预加载配置
 * 
 * @author liujinghua
 */
@Controller
@RequestMapping("/sysProloadConfController")
public class SysProloadConfController extends BaseController{

	@Autowired
	private SysProloadConfService sysProloadConfService;

	/**
	 * 查询
	 * @return
	 */
	@RequestMapping(params = "querysysPreloadData")
	public void querysysPreloadData(HttpServletRequest request,
			HttpServletResponse response, String description,
			String interfaceid, Integer start, Integer limit) {
		Page page = sysProloadConfService.querysysPreloadData(description, interfaceid, start/limit + 1, limit);
		writeResponseText(page.formToJson(), response);
	}

	/**
	 * 增加
	 */
	@RequestMapping(params = "addsysPreload")
	public void addsysPreload(HttpServletRequest request,
			HttpServletResponse response, SysProloadConf sysProloadConf)
			throws Exception {
		try {

			sysProloadConfService.addsysPreload(sysProloadConf);

			this.writeResponseText("{success:true,msg:'操作成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}

	/**
	 * 修改
	 */
	@RequestMapping(params = "excuteModifysysPreload")
	public void excuteModifysysPreload(HttpServletRequest request,
			HttpServletResponse response, SysProloadConf sysProloadConf)
			throws Exception {
		
		try {

			sysProloadConfService.excuteModifysysPreload(sysProloadConf);

			this.writeResponseText("{success:true,msg:'操作成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}

	/**
	 * 删除
	 */
	@RequestMapping(params = "excuteDeletesysPreload")
	public void excuteDeletesysPreload(HttpServletRequest request,
			HttpServletResponse response, String deleterecord) {
		try {

			sysProloadConfService.excuteDeletesysPreload(deleterecord);

			this.writeResponseText("{success:true,msg:'操作成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}

}
