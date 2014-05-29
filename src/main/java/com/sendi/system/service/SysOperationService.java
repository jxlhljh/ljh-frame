package com.sendi.system.service;


import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysOperationService{
	private final Logger logger  =  LoggerFactory.getLogger(getClass());
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	//查询按钮列表
	@Transactional(readOnly = true)
	public String operationQuery(String functionid){
		String sql = "select id,operationcode,operationname,functionid from sys_operation where functionid = '"+functionid+"'";
		List<Map<String,Object>> result = jdbcTemplate.queryForList(sql);
		return JSONArray.fromObject(result).toString();
	}
	
		//新增
		public void operationAdd(String operationcode,String functionid,String operationname){
			String sql = "insert into sys_operation ( &fields& ) values ( &values&)";
			if(operationcode!=null && functionid!=null && operationname!=null) {
				sql = sql.replace("&fields&", "operationcode,operationname,functionid");
				sql = sql.replace("&values&", "'"+operationcode+"','"+operationname+"','"+functionid+"'");
				logger.info(sql);
				jdbcTemplate.execute(sql);
			}
		}
		
		//修改
		public void operationChange(String operationcode,String functionid,String operationname,String id){
			StringBuffer sql = new StringBuffer();
			sql.append("update sys_operation SET ");
			if(operationcode!=null && functionid!=null && operationname!=null) {
				sql.append("operationcode = '"+operationcode+"',");
				sql.append("operationname = '"+operationname+"',");
				sql.append("functionid = '"+functionid+"' ");
				sql.append("WHERE id = '"+id+"'");
				
				logger.info(sql.toString());
				jdbcTemplate.update(sql.toString());
			}	
		}
		//删除
		public void operationDelete(String ids){
			
			if(StringUtils.isEmpty(ids)) throw new RuntimeException("error: deleted record failed, id is not allowed null!");
			
			String sql = "";
			if(ids.contains(",")){
				ids = ids.replace(",", "','");
				sql = "DELETE FROM sys_operation WHERE id in('"+ids+"')";
			}else{
				sql = "DELETE FROM sys_operation WHERE id = '"+ids+"' ";
			}
			
			logger.info(sql.toString());
			jdbcTemplate.update(sql.toString());
		}
}
