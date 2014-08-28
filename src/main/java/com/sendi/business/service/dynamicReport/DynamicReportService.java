package com.sendi.business.service.dynamicReport;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.sendi.business.utils.DynamicReportConstant;
import com.sendi.business.utils.DynamicReportQueryParamUtil;
import com.sendi.system.service.CommonService;

@Service
public class DynamicReportService extends CommonService {

	// 获取下拉树选项的内容
	public Map<String, Object> queryReportConfig(String configId) {
		System.out.println("queryReportConfig  configId:"+configId);
		String sql = "select * from jform_cgreport_head where CODE='"+configId+"' ";
		//System.out.println("sql:"+sql);
		Map<String, Object>  head_map = null;
		try{
			head_map = jdbcTemplate.queryForMap(sql);
		}catch (Exception e) {
			throw new RuntimeException("动态报表配置不存在!");
		}
		String cgrheader_id=(String)head_map.get("ID");
		//System.out.println("CGRHEAD_ID :"+cgrheader_id);
		
		String sql2 = "select * from jform_cgreport_item where CGRHEAD_ID='"+cgrheader_id+"' ";
		String sql3 = "select * from dctdata where dcttypeen in (select DICT_CODE from jform_cgreport_item where CGRHEAD_ID='"+cgrheader_id+"' AND DICT_CODE !='')";
		//System.out.println("sql2:"+sql2);
		//System.out.println("sql3:"+sql3);
		
		List<Map<String, Object>> item_list = jdbcTemplate.queryForList(sql2);
		List<Map<String, Object>> box_list = jdbcTemplate.queryForList(sql3);//下拉框
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("headers", head_map);
		result.put("config_fieldList", item_list);
		result.put("config_boxList", box_list);

		return result;
	}

	/**
	 * 动态报表数据查询
	 * @param configId 配置id-code
	 * @param page 分页页面
	 * @param rows 分页大小
	 * @param request 
	 * @param response
	 */
	public String dataQry(HttpServletRequest request) {
		String configId=request.getParameter("configId");
		//step.1 根据id获取该动态报表的配置参数
		Map<String,Object> cgReportMap = queryReportConfig(configId);
		
		//step.2 获取该配置的查询SQL
		Map configM = (Map) cgReportMap.get(DynamicReportConstant.MAIN);
		String querySql = (String) configM.get(DynamicReportConstant.CONFIG_SQL);
		List<Map<String,Object>> items = (List<Map<String, Object>>) cgReportMap.get(DynamicReportConstant.ITEMS);
		Map queryparams =  new LinkedHashMap<String,Object>();
		for(Map<String,Object> item:items){
			String isQuery = (String) item.get(DynamicReportConstant.ITEM_ISQUERY);
			if(DynamicReportConstant.BOOL_TRUE.equalsIgnoreCase(isQuery)){
				//step.3 装载查询条件
				DynamicReportQueryParamUtil.loadQueryParams(request, item, queryparams);
			}
		}
		
		String sql = getFullSql(querySql.toString(),queryparams);
		String start = StringUtils.trimToEmpty(request.getParameter("start"));
		String limit = StringUtils.trimToEmpty(request.getParameter("limit"));
		
		System.out.println(sql);
		
		return this.queryDataLimit(sql.toString(), items, start, limit);
	}
	
	
	//这里类似于commonService里面的getDataLimit方法，因为这里要处理字典翻译及替换值
	//因为在这里重写一个方法
	private String queryDataLimit(String sql,List<Map<String,Object>> items, String start,String limit){
		String dataStr = "";
		String countSQL = "select count(*) from ("+sql+") t";
		String dataSQL = sql + " limit "+(StringUtils.isBlank(start)?0:start)+","+(StringUtils.isBlank(limit)?15:limit) ;
		List<Map<String,Object>> datasList = jdbcTemplate.queryForList(dataSQL);
		HashMap dataMap = new HashMap();
		dataMap.put("totalCount",jdbcTemplate.queryForObject(countSQL, Integer.class));
		
		//1处理字典
		dealDic(datasList,items);
		//2处理替换值
		dealReplace(datasList,items);
		
		dataMap.put("datas",datasList);
		JSONObject jsons = JSONObject.fromObject(dataMap);
		dataStr = jsons.toString();
		return dataStr;
	}
	
	private void dealDic(List<Map<String, Object>> result,
			List<Map<String,Object>> beans) {
		for(Map<String,Object> bean:beans){
			String dict_code = (String) bean.get(DynamicReportConstant.ITEM_DICCODE);
			if(StringUtils.isEmpty(dict_code)){
				//不需要处理字典
				continue;
			}else{
				List<Map<String, Object>> dicDatas = queryDic(dict_code);
				for(Map r:result){
					String value = String.valueOf(r.get(bean.get(DynamicReportConstant.ITEM_FIELDNAME)));
					for(Map m:dicDatas){
						String typecode = String.valueOf(m.get("valuetext"));
						String typename = String.valueOf(m.get("displayvalue"));
						if(value.equalsIgnoreCase(typecode)){
							r.put(bean.get(DynamicReportConstant.ITEM_FIELDNAME),typename);
						}
					}
				}
			}
		}
	}
	
	/**
	 * 查询数据字典
	 * @param diccode 字典编码
	 * @return
	 */
	private List<Map<String, Object>> queryDic(String diccode) {
		StringBuilder dicSql = new StringBuilder();
		dicSql.append(" SELECT valuetext,displayvalue FROM dctdata WHERE dcttypeen = '"+diccode+"'");
		List<Map<String, Object>> dicDatas = getDataList(dicSql.toString());
		return dicDatas;
	}
	
	private void dealReplace(List<Map<String, Object>> result,
			List<Map<String,Object>> beans){
		for(Map<String,Object> bean:beans){
			try{
				//获取取值表达式
				String replace = (String) bean.get(DynamicReportConstant.ITEM_REPLACE);
				if(StringUtils.isEmpty(replace)){
					continue;
				}
				String[] groups = replace.split(",");
				for(String g:groups){
					String[] items = g.split("_");
					String v = items[0];//逻辑判断值
					String txt = items[1];//要转换的文本
					for(Map r:result){
						String value = String.valueOf(r.get(bean.get(DynamicReportConstant.ITEM_FIELDNAME)));
						if(value.equalsIgnoreCase(v)){
							r.put(bean.get(DynamicReportConstant.ITEM_FIELDNAME),txt);
						}
					}
				}
			}catch (Exception e) {
				//这里出现异常原因是因为取值表达式不正确
				e.printStackTrace();
				throw new RuntimeException("取值表达式不正确");
			}
		}
	}
	
	/**
	 * 动态报表数据查询
	 * @param configId 配置id-code
	 * @param request 
	 * @param response
	 */
	public List<Map<String,Object>> dataExport(HttpServletRequest request) {
		String configId=request.getParameter("configId");
		//step.1 根据id获取该动态报表的配置参数
		Map<String,Object> cgReportMap = queryReportConfig(configId);
		
		//step.2 获取该配置的查询SQL
		Map configM = (Map) cgReportMap.get(DynamicReportConstant.MAIN);
		String querySql = (String) configM.get(DynamicReportConstant.CONFIG_SQL);
		List<Map<String,Object>> items = (List<Map<String, Object>>) cgReportMap.get(DynamicReportConstant.ITEMS);
		Map queryparams =  new LinkedHashMap<String,Object>();
		for(Map<String,Object> item:items){
			String isQuery = (String) item.get(DynamicReportConstant.ITEM_ISQUERY);
			if(DynamicReportConstant.BOOL_TRUE.equalsIgnoreCase(isQuery)){
				//step.3 装载查询条件
				DynamicReportQueryParamUtil.loadQueryParams(request, item, queryparams);
			}
		}
		
		String sql = getFullSql(querySql.toString(),queryparams);
		System.out.println(sql);
		
		List<Map<String,Object>> datasList = jdbcTemplate.queryForList(sql);
		//1处理字典
		dealDic(datasList,items);
		//2处理替换值
		dealReplace(datasList,items);
		
		return datasList;
	}
	/**
	 * 获取拼装查询条件之后的sql
	 * @param sql
	 * @param params
	 * @return
	 */
	private String getFullSql(String sql,Map params){
		StringBuilder sqlB =  new StringBuilder();
		sqlB.append("SELECT t.* FROM ( ");
		sqlB.append(sql+" ");
		sqlB.append(") t ");
		if (params.size() >= 1) {
			sqlB.append("WHERE 1=1  ");
			Iterator it = params.keySet().iterator();
			while (it.hasNext()) {
				String key = String.valueOf(it.next());
				String value = String.valueOf(params.get(key));
				if (!StringUtils.isEmpty(value) && !"null".equals(value)) {
						sqlB.append(" AND ");
						sqlB.append(" " + key +  value );
				}
			}
		}
		return sqlB.toString();
	}
}
