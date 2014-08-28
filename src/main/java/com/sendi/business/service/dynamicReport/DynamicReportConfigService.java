package com.sendi.business.service.dynamicReport;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.business.entity.dynamicReport.JformReportHead;
import com.sendi.business.entity.dynamicReport.JformReportItem;
import com.sendi.system.service.CommonService;

@Service
public class DynamicReportConfigService extends CommonService<JformReportHead> {

	public List<JformReportHead> queryConfigedReport(HttpServletRequest request) {
		String coding = request.getParameter("coding");
		String name = request.getParameter("name");
		String sql = request.getParameter("sql");
		String description = request.getParameter("description");
		// System.out.println("coding : "+request.getParameter("coding"));
		// System.out.println("name : "+request.getParameter("name"));
		// System.out.println("sql : "+request.getParameter("sql"));
		// System.out.println("description : "+request.getParameter("description"));
		StringBuffer query_sql = new StringBuffer("select ID,CGR_SQL,CODE,CONTENT,NAME from jform_cgreport_head where 1=1");
		if (coding != null && !coding.trim().equals("")) {
			query_sql.append(" and CODE like '%" + coding + "%'");
		}
		if (name != null && !name.trim().equals("")) {
			query_sql.append(" and NAME like '%" + name + "%'");
		}
		if (sql != null && !sql.trim().equals("")) {
			query_sql.append(" and CGR_SQL like '%" + sql + "%'");
		}
		if (description != null && !description.trim().equals("")) {
			query_sql.append(" and CONTENT like '%" + description + "%'");
		}
		System.out.println(query_sql);
		List<JformReportHead> beanList = new ArrayList<JformReportHead>();
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			stat = conn.createStatement();
			rs = stat.executeQuery(query_sql.toString());
			while (rs.next()) {
				JformReportHead bean = new JformReportHead();
				bean.setId(rs.getString("ID"));
				bean.setCoding(rs.getString("CODE"));
				bean.setName(rs.getString("NAME"));
				bean.setSql(rs.getString("CGR_SQL"));
				bean.setDescription(rs.getString("CONTENT"));
				beanList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, stat, rs);
		}

		return beanList;
	}

	private void close(Connection conn, Statement stat, ResultSet rs) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stat != null) {
					stat.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) {
						rs.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {

				}
			}
		}
	}

	public List<JformReportItem> analyzSql(String crgSql) throws Exception {
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		Map<String, String> typeMap = new HashMap<String, String>();
		typeMap.put("INT", "Integer");
		typeMap.put("VARCHAR", "String");
		typeMap.put("DATE", "Date");
		typeMap.put("BIGINT", "Long");
		try {
			conn = getConnection();
			stat = conn.createStatement();
			rs = stat.executeQuery(crgSql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			List<JformReportItem> beanList = new ArrayList<JformReportItem>();
			for (int i = 1; i <= count; i++) {
				JformReportItem bean = new JformReportItem();
				bean.setFieldName(rsmd.getColumnName(i));
				bean.setSort(i);
				bean.setFieldText(rsmd.getColumnName(i));
				String fieldType = typeMap.get(rsmd.getColumnTypeName(i));
				if (fieldType == null) {
					fieldType = "String";
				}
				bean.setFieldType(fieldType);
				bean.setFieldWidth(100);
				bean.setIsShow("显示");
				bean.setShowHref("");
				bean.setQueryModel("单条件查询");
				bean.setExpression("");
				bean.setDctCode("");
				bean.setIsQuery("是");
				beanList.add(bean);
			}
			return beanList;
		} finally {
			close(conn, stat, rs);
		}
	}

	@Transactional
	public void saveItems(HttpServletRequest request) {

		// insert head
		String item_coding = request.getParameter("item_coding");
		String item_name = request.getParameter("item_name");
		String item_sql = request.getParameter("item_sql");
		String item_description = request.getParameter("item_description");
		JSONArray jArray = JSONArray.fromObject(request.getParameter("item_array"));
		String headKey = UUID.randomUUID().toString().replaceAll("-", "");
		jdbcTemplate.update("insert into jform_cgreport_head(ID,CGR_SQL,CODE,CONTENT,NAME) values(?,?,?,?,?)", 
				headKey,item_sql, item_coding, item_description, item_name);

		// insert items
		String sql = "insert into jform_cgreport_item" 
					+ "(ID,S_FLAG,S_MODE,CGRHEAD_ID,DICT_CODE,FIELD_HREF,FIELD_NAME,FIELD_TXT,FIELD_TYPE,FIELD_WIDTH,IS_SHOW,ORDER_NUM,REPLACE_VA)" 
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		List<Object[]> argList = new ArrayList<Object[]>();
		Iterator<JSONObject> iterator = jArray.iterator();
		while (iterator.hasNext()) {
			JSONObject jo = iterator.next();
			Object[] objArray = new Object[] {UUID.randomUUID().toString().replaceAll("-", ""),
												  "是".equals(jo.get("isQuery"))?"Y":"N", 
												  "单条件查询".equals(jo.get("queryModel"))?"single":"range", 
												  headKey, 
												  jo.get("dctCode"), 
												  jo.get("showHref"), 
												  jo.get("fieldName"), 
												  jo.get("fieldText"), 
												  jo.get("fieldType"), 
												  jo.get("fieldWidth"), 
												  "显示".equals(jo.get("isShow"))?"Y":"N", 
												  jo.get("sort"), 
												  jo.get("expression") 
											};
			argList.add(objArray);
		}
		jdbcTemplate.batchUpdate(sql, argList);
	}

	public List<JformReportItem> queryItemsByHeadId(String head_id) {
		List<Map<String, Object>> resultList = jdbcTemplate.queryForList("select * from jform_cgreport_item where CGRHEAD_ID=?", head_id);
		List<JformReportItem> beanList = new ArrayList<JformReportItem>();
		for (Map<String, Object> map : resultList) {
			JformReportItem bean = new JformReportItem();
			bean.setFieldName(String.valueOf(map.get("FIELD_NAME")));
			bean.setSort(Integer.valueOf(String.valueOf(map.get("ORDER_NUM"))));
			bean.setFieldText(String.valueOf(map.get("FIELD_TXT")));
			bean.setFieldType(String.valueOf(map.get("FIELD_TYPE")));
			bean.setFieldWidth(Integer.valueOf(String.valueOf(map.get("FIELD_WIDTH"))));
			bean.setIsShow("Y".equals(String.valueOf(map.get("IS_SHOW")))?"显示":"隐藏");
			bean.setShowHref(String.valueOf(map.get("FIELD_HREF")));
			bean.setQueryModel(String.valueOf("single".equals(map.get("S_MODE"))?"单条件查询":"范围查询"));
			bean.setExpression(String.valueOf(map.get("REPLACE_VA")));
			bean.setDctCode(String.valueOf(map.get("DICT_CODE")));
			bean.setIsQuery(String.valueOf("Y".equals(map.get("S_FLAG"))?"是":"否"));
			beanList.add(bean);
		}
		return beanList;
	}

	public void updateReportConfig(HttpServletRequest request) {
		// insert head
		String head_id = request.getParameter("head_id");
		String item_coding = request.getParameter("item_coding");
		String item_name = request.getParameter("item_name");
		String item_sql = request.getParameter("item_sql");
		String item_description = request.getParameter("item_description");
		JSONArray jArray = JSONArray.fromObject(request.getParameter("item_array"));
		jdbcTemplate.update("update jform_cgreport_head set CGR_SQL=?,CODE=?,CONTENT=?,NAME=? where ID=?",item_sql,item_coding,item_description,item_name,head_id);

		// insert items
		jdbcTemplate.update("delete from jform_cgreport_item where CGRHEAD_ID=?", head_id);
		String sql = "insert into jform_cgreport_item" 
					+ "(ID,S_FLAG,S_MODE,CGRHEAD_ID,DICT_CODE,FIELD_HREF,FIELD_NAME,FIELD_TXT,FIELD_TYPE,FIELD_WIDTH,IS_SHOW,ORDER_NUM,REPLACE_VA)" 
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		List<Object[]> argList = new ArrayList<Object[]>();
		Iterator<JSONObject> iterator = jArray.iterator();
		while (iterator.hasNext()) {
			JSONObject jo = iterator.next();
			Object[] objArray = new Object[] {UUID.randomUUID().toString().replaceAll("-", ""),
												  "是".equals(jo.get("isQuery"))?"Y":"N", 
												  "单条件查询".equals(jo.get("queryModel"))?"single":"range", 
												  head_id, 
												  jo.get("dctCode"), 
												  jo.get("showHref"), 
												  jo.get("fieldName"), 
												  jo.get("fieldText"), 
												  jo.get("fieldType"), 
												  jo.get("fieldWidth"), 
												  "显示".equals(jo.get("isShow"))?"Y":"N", 
												  jo.get("sort"), 
												  jo.get("expression") 
											};
			argList.add(objArray);
		}
		jdbcTemplate.batchUpdate(sql, argList);
	}

	public void deleteJformHeads(String head_id) {
		jdbcTemplate.update("delete from jform_cgreport_head where ID in ('"+head_id.replaceAll(",", "','")+"')");
		jdbcTemplate.update("delete from jform_cgreport_item where CGRHEAD_ID in ('"+head_id.replaceAll(",", "','")+"')");
	}

	public String checkHeadCodeUsed(String coding, String currentCoding) {
		if(coding!=null && !coding.equals("") && coding.equals(currentCoding)){
			return "可用";
		}
		List<Map<String, Object>> list = jdbcTemplate.queryForList("select id from jform_cgreport_head where CODE=?", coding);
		return list.size()>0?"不可用":"可用";
	}
}
