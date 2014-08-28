package com.sendi.business.web.dynamicReport;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.business.entity.dynamicReport.JformReportHead;
import com.sendi.business.entity.dynamicReport.JformReportItem;
import com.sendi.business.service.dynamicReport.DynamicReportConfigService;
import com.sendi.system.web.BaseController;

@Controller
@RequestMapping("/dynamicReportConfigController")
public class DynamicReportConfigController extends BaseController{
	
	@Autowired
	private DynamicReportConfigService service;
	
	@RequestMapping(params = "queryConfigedReport")
	public void queryConfigedReport(HttpServletRequest request,
			HttpServletResponse response){

		List<JformReportHead> list = service.queryConfigedReport(request);
		writeJSONArray(list, request, response);
	}
	
	@RequestMapping(params = "analyzSql")
	public void analyzSql(HttpServletRequest request,
			HttpServletResponse response,String crgSql){
		try {
			List<JformReportItem> list = service.analyzSql(crgSql);
			writeJSONArray(list, request, response);
		} catch (Exception e) {
			e.printStackTrace();
			writeResponseText("{success:false,message:'SQL解析失败'}", response);
		}
	}
	
	@RequestMapping(params = "saveItems")
	public void saveItems(HttpServletRequest request,
			HttpServletResponse response){
		service.saveItems(request);
		writeResponseText("{success:true}", response);
	}
	
	@RequestMapping(params = "showItemsByHeadId")
	public void showItemsByHeadId(HttpServletRequest request,
			HttpServletResponse response){
		List<JformReportItem> list = service.queryItemsByHeadId(request.getParameter("head_id"));
		writeJSONArray(list, request, response);
	}
	
	/**
	 * 修改报表信息
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "updateReportConfig")
	public void updateReportConfig(HttpServletRequest request,
			HttpServletResponse response){
		service.updateReportConfig(request);
		writeResponseText("{success:true}", response);
	}
	
	@RequestMapping(params = "deleteJformHead")
	public void deleteJformHead(HttpServletRequest request,
			HttpServletResponse response){
		System.out.println(request.getParameter("ids"));
		service.deleteJformHeads(request.getParameter("ids"));
		writeResponseText("{success:true}", response);
	}
	
	@RequestMapping(params = "checkHeadCodeUsed")
	public void checkHeadCodeUsed(HttpServletRequest request,
			HttpServletResponse response){
		String message = service.checkHeadCodeUsed(request.getParameter("coding"),request.getParameter("currentCoding"));
		writeResponseText("{success:true,message:'"+message+"'}", response);
	}
}
