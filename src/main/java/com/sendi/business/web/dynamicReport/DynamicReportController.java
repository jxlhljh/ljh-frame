package com.sendi.business.web.dynamicReport;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.business.service.dynamicReport.DynamicReportService;
import com.sendi.system.constants.Globals;
import com.sendi.system.util.common.FreemarkerHelper;
import com.sendi.system.web.BaseController;

@Controller
@RequestMapping("/dynamicReportController")
public class DynamicReportController extends BaseController {
	@Autowired
	private DynamicReportService dynamicReportService;

	@RequestMapping(params = "list")
	public void list(HttpServletRequest request, HttpServletResponse response,String configId) {
		try {

			System.out.println("configId:"+configId);
			Map<String, Object> configs = dynamicReportService.queryReportConfig(configId);
			
			String path = request.getContextPath();
			configs.put("contextRootPath", request.getContextPath());
			configs.put("fullpath", request.getScheme()+"://"+request.getServerName()+":"+Globals.Port+path);

			// step.2 获取列表ftl模板路径
			FreemarkerHelper viewEngine = new FreemarkerHelper();
			String html = viewEngine.parseTemplate("/com/sendi/business/web/dynamicReport/DynamicReport.ftl",configs);

			writeResponseText(html, response);
		} catch (Exception e) {
			e.printStackTrace();
			writeResponseText("{success:false,msg:'"+e.getMessage()+"'}", response);
		}
	}

	/**
	 * 动态报表数据查询
	 * 
	 * @param configId
	 *            配置id-code
	 * @param page
	 *            分页页面
	 * @param rows
	 *            分页大小
	 * @param request
	 * @param response
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "dataQry")
	public void dataQry(String configId, String page, String field,
			String rows, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			writeResponseText(dynamicReportService.dataQry(request), response);
		} catch (Exception e) {
			e.printStackTrace();
			writeResponseText("{success:false,msg:'程序错误'}", response);
		}
	}
}
