package com.sendi.system.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.system.entity.SysActionlogConf;
import com.sendi.system.preload.PreLoadActionLogConf;

/**
 * Action配置管理控制器
 * @author liujinghua
 * 日期 2014-05-18 晚上22：37
 */

@Service
@Transactional
public class SysActionlogConfService {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	/**
	 * 查询
	 */
	@Transactional(readOnly = true)
	public List<SysActionlogConf> query(){
		final List<SysActionlogConf> list = new ArrayList<SysActionlogConf>();
		StringBuffer sql = new StringBuffer("select * from sys_actionlog_conf where 1=1 ");
		
		jdbcTemplate.query(sql.toString(),new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				SysActionlogConf bean = new SysActionlogConf();
				bean.setActionDesc(rs.getString("actionDesc"));
				bean.setActionId(rs.getString("actionId"));
				bean.setActionName(rs.getString("actionName"));
				bean.setFlag(rs.getInt("flag"));
				bean.setMethodId(rs.getString("methodId"));
				bean.setMethodName(rs.getString("methodName"));
				list.add(bean);
			}
		});
		return list;
	}
	
	/**
	 * 新增
	 */
	public void add(String methodName,String actionDesc,String actionName,Integer flag,String actionId,String methodId){
		String sql = "insert into sys_actionlog_conf(methodName,actionDesc,actionId,flag,actionName,methodId) values (?,?,?,?,?,?)";
		jdbcTemplate.update(sql, new Object[]{methodName,actionDesc,actionName,flag,actionId,methodId});
	}
	
	/**
	 * 修改
	 */
	public void update(String methodName,String actionDesc,String actionName,Integer flag,String actionId,String methodId){
		String sql = "update sys_actionlog_conf set methodName = ?,actionDesc=?,actionName=?,flag=? where actionId=? and methodId = ?";
		jdbcTemplate.update(sql, new Object[]{methodName,actionDesc,actionName,flag,actionId,methodId});
	}
	
	/**
	 * 删除
	 * @param actionId 以逗号分隔
	 * @param methodId 以逗号分隔
	 */
	public void delete(String actionId,String methodId){
		String [] sub_actionId = actionId.split(",");
		String [] sub_methodId = methodId.split(",");
		String sql = "delete from  sys_actionlog_conf where actionId = ? and methodId = ?";
		List<Object[]> args = new ArrayList<Object[]>();
		for(int i=0;i<sub_actionId.length;i++){
			args.add(new Object[]{sub_actionId[i],sub_methodId[i]});
		}
		jdbcTemplate.batchUpdate(sql,args);
	}
	
	/**
	 * 重载
	 */
	public void reload(PreLoadActionLogConf preLoadActionLogConf){
		if(preLoadActionLogConf==null) return;
		preLoadActionLogConf.doLoad();
	}
}
