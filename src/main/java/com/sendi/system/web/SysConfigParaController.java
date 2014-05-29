package com.sendi.system.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.entity.SysConfigPara;
import com.sendi.system.service.SysConfigParaService;

/**
 * 按锯操作控制器
 * 
 * @author liujinghua
 * @date 2014-05-15 16：55
 */
@Controller
@RequestMapping("/sendisystem/sysConfigParaController")
public class SysConfigParaController extends BaseController {
	private final String PARANAME = "paraName";
	private final String PARAVALUE = "paraValue";
	private final String PARADESC = "paraDesc";
	private final String ID = "id";
	private final String DELETERECORD = "deleterecord";
	
	@Autowired
	private SysConfigParaService sysConfigParaService;

	/**
	 * 查询按钮列表
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(params = "sysConfigParaQuery")
	public void sysConfigParaQuery(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String paraDesc = StringUtils.trimToEmpty(request.getParameter(this.PARADESC));
		String paraName = StringUtils.trimToEmpty(request.getParameter(this.PARANAME));
		List<SysConfigPara> datas = sysConfigParaService.sysConfigParaQuery(paraDesc,paraName);
		writeJSONArray(datas, request, response);
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(params = "addSysConfigPara")
	public void addSysConfigPara(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try{
			String paraName = request.getParameter(this.PARANAME);
			String paraValue = request.getParameter(this.PARAVALUE);
			String paraDesc = request.getParameter(this.PARADESC);
			sysConfigParaService.addSysConfigPara(paraName,paraValue,paraDesc);
			writeResponseText("{success:true,msg:'success'}",response);
	 	} catch (Exception e) {
			writeResponseText("{success:false,msg:'fail',errors:{"+e.getMessage()+"}}",response);
		 	e.printStackTrace();
		}
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(params = "excuteModifySysConfigPara")
	public void excuteModifySysConfigPara(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try{
			Integer id = Integer.parseInt(request.getParameter(this.ID));
			String paraName = request.getParameter(this.PARANAME);
			String paraValue = request.getParameter(this.PARAVALUE);
			String paraDesc = request.getParameter(this.PARADESC);
			sysConfigParaService.excuteModifySysConfigPara(id,paraName,paraValue,paraDesc);
			writeResponseText("{success:true,msg:'success'}",response);
	 	} catch (Exception e) {
			writeResponseText("{success:false,msg:'fail',errors:{"+e.getMessage()+"}}",response);
		 	e.printStackTrace();
		}
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(params = "excuteDeleteSysConfigPara")
	public void excuteDeleteSysConfigPara(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try{
			String deleterecord = request.getParameter(this.DELETERECORD);
			sysConfigParaService.excuteDeleteSysConfigPara(deleterecord);
			writeResponseText("{success:true,msg:'success'}",response);
	 	} catch (Exception e) {
			writeResponseText("{success:false,msg:'fail',errors:{"+e.getMessage()+"}}",response);
		 	e.printStackTrace();
		}
	}
	
	/**
	 * 重载
	 */
	@RequestMapping(params = "reloadConfig")
	public void reloadConfig(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try{
			sysConfigParaService.reloadConfig(request);
			writeResponseText("{success:true,msg:'success'}",response);
	 	} catch (Exception e) {
			writeResponseText("{success:false,msg:'fail',errors:{"+e.getMessage()+"}}",response);
		 	e.printStackTrace();
		}
	}
	
	
	
}
