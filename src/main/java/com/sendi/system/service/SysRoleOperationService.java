package com.sendi.system.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Service;

@Service
public class SysRoleOperationService {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
		//*********查询-授权按钮***************
		public String operationRoleQuery(String functionid,String useroleid){
				if(functionid ==null || useroleid ==null) throw new RuntimeException("参数错误！参数不能为空");
			
				HashMap dataMap = new HashMap();
				final List<HashMap> list = new ArrayList<HashMap>();
				String sql = "select operationcode,operationname,functionid,'"+useroleid+"' roleid," +
						"ifnull((select ROp.operationcode from sys_role_operation ROp where functionid ='"+functionid+"' and roleid='"+useroleid+"'),'') auth " +
						"from sys_operation where functionid = '"+functionid+"'";
				
				jdbcTemplate.query(sql, new RowCallbackHandler() {
					public void processRow(ResultSet rs) throws SQLException {
						HashMap rowData = new HashMap();  
						rowData.put("operationcode", rs.getString("operationcode"));   
						rowData.put("operationname", rs.getString("operationname"));   
						rowData.put("functionid", rs.getString("functionid"));  
						rowData.put("auth", rs.getString("auth").contains(rs.getString("operationcode"))?"T":"F");   
						list.add(rowData);
					}
				});
				
				dataMap.put("totalCount", list.size());
				dataMap.put("datas",list);
				
				JSONObject jsons = JSONObject.fromObject(dataMap);
				
				return jsons.toString();
		}

}
