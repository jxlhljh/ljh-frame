package com.sendi.system.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.bean.Page;
import com.sendi.system.entity.Dctdata;
import com.sendi.system.service.DctDataService;

@Controller
@RequestMapping("/dctDataController")
public class DctDataController extends BaseController{
	
	@Autowired
	private DctDataService dctDataService;

	/**
	 * 查询字典列表
	 * @param request
	 * @param response
	 * @param dcttypenote
	 * @param start
	 * @param limit
	 */
	@RequestMapping(params = "queryDctData")
	public void queryDctData(HttpServletRequest request,
			HttpServletResponse response,
			String dcttypenote, Integer start, Integer limit) {
		Page page = dctDataService.queryDctData(dcttypenote, start/limit + 1, limit);
		writeResponseText(page.formToJson(), response);
	}
	
	/**
	 * 字典类型选树下拉框数据查询
	 * 
	 */
	@RequestMapping(params = "queryDctDataAndreturn")
	public void queryDctDataAndreturn(HttpServletRequest request,
			HttpServletResponse response,
			String dcttypenote, Integer start, Integer limit) {
		List<Dctdata> datas = dctDataService.queryDctDataAndreturn();
		writeResponseText(JSONArray.fromObject(datas).toString(), response);
	}
	
	/**
	 * 修改前查询
	 */
	@RequestMapping(params = "excutModifyQueryDctData")
	public void excutModifyQueryDctData(HttpServletRequest request,
			HttpServletResponse response,
			Integer id){
		try {
			Dctdata dctdata = dctDataService.getEntity(Dctdata.class, id);
			writeResponseText("{success:true,datas:"+JSONObject.fromObject(dctdata).toString()+"}",response);
	   	} catch (Exception e) {
			
			e.printStackTrace();
			writeResponseText("{success:false,msg:'faild',errors:{"+e.getMessage()+"}}",response);
		}
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(params = "excuteModifyDctData")
	public void excuteModifyDctData(HttpServletRequest request,
			HttpServletResponse response,
			Dctdata dctdata) {
		try {

			dctDataService.excuteModifyDctData(dctdata);

			this.writeResponseText("{success:true,msg:'修改成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'修改失败'}", response);
			e.printStackTrace();
		}
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(params = "addDctData")
	public void addDctData(HttpServletRequest request,
			HttpServletResponse response,
			Dctdata dctdata) {
		try {

			dctDataService.addDctData(dctdata);
			
			this.writeResponseText("{success:true,msg:'新增成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'新增失败'}", response);
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(params = "excuteDeleteDctData")
	public void excuteDeleteDctData(HttpServletRequest request,
			HttpServletResponse response,
			String  deleterecord) {
		try {

			dctDataService.excuteDeleteDctData(deleterecord);

			this.writeResponseText("{success:true,msg:'删除成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'删除失败'}", response);
			e.printStackTrace();
		}
	}
	
}
