package com.sendi.system.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.bean.Page;
import com.sendi.system.entity.SysPushConfig;
import com.sendi.system.service.SysPushConfigService;

@Controller
@RequestMapping("/sysPushConfigController")
public class SysPushConfigController extends BaseController{
	
	@Autowired
	private SysPushConfigService sysPushConfigService;
	
	
	/**
	 * 查询
	 * @return
	 */
	@RequestMapping(params = "queryPushConfigData")
	public void queryPushConfigData(HttpServletRequest request,
			HttpServletResponse response, String description,String pushid, Integer start, Integer limit) {
		Page page = sysPushConfigService.queryPushConfigData(description, pushid, start/limit + 1, limit);
		writeResponseText(page.formToJson(), response);
	}
	
	/**
	 * 查询一条记录，用于修改
	 */
	@RequestMapping(params = "excutModifyQueryPushConfig")
	public void excutModifyQueryPushConfig(HttpServletRequest request,
			HttpServletResponse response,Integer id)
	{
		try {
			String hql="from SysPushConfig where 1=1 and id="+id; 
		 	SysPushConfig sysPushConfig = sysPushConfigService.singleResult(hql);
			writeResponseText("{success:true,datas:"+JSONObject.fromObject(sysPushConfig).toString()+"}",response);
	   	} catch (Exception e) {
			e.printStackTrace();
	   		writeResponseText("{success:false,msg:'faild',errors:{"+e.getMessage()+"}}",response);
		}
	}

	/**
	 * 增加
	 */
	@RequestMapping(params = "addPushConfig")
	public void addPushConfig(HttpServletRequest request,
			HttpServletResponse response, SysPushConfig sysPushConfig)
			throws Exception {
		try {

			sysPushConfigService.addPushConfig(sysPushConfig);

			this.writeResponseText("{success:true,msg:'操作成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}

	/**
	 * 修改
	 */
	@RequestMapping(params = "excuteModifyPushConfig")
	public void excuteModifyPushConfig(HttpServletRequest request,
			HttpServletResponse response, SysPushConfig sysPushConfig)
			throws Exception {
		
		try {

			sysPushConfigService.excutModifyQueryPushConfig(sysPushConfig);

			this.writeResponseText("{success:true,msg:'操作成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}

	/**
	 * 删除
	 */
	@RequestMapping(params = "excuteDeletePushConfig")
	public void excuteDeletePushConfig(HttpServletRequest request,
			HttpServletResponse response, String deleterecord) {
		try {

			sysPushConfigService.excuteDeletePushConfig(deleterecord);

			this.writeResponseText("{success:true,msg:'操作成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}
	
}
