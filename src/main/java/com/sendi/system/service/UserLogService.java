package com.sendi.system.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.system.bean.Page;
import com.sendi.system.bean.Userlog;

/**
 * 用户操作日志service类
 * @author liujinghua
 * 日期:2014-05-18 中午 12：02 
 */
@Service
@Transactional
public class UserLogService{
	
	protected final Logger logger  =  LoggerFactory.getLogger(getClass());
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 查询用户操作日志
	 */
	@Transactional(readOnly = true)
	public Page<Userlog> query(String loguser,String check_time,String check_end,Integer start,Integer limit){
		Page<Userlog> page = new Page<Userlog>();
		
		final SimpleDateFormat f1 = new SimpleDateFormat("yyyyMMddHHmmss");
		final SimpleDateFormat f2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String countSql = "";
		String sql = "select * from sys_action_log  where 1 = 1 ";
		if(loguser!=null && !loguser.equals("")){
			sql += " and logUser like '"+loguser+"%'";
		}
		
		if(check_time!=null && !check_time.equals("")){
			sql += " and logStarttime >= '"+check_time.replace("-","").replace(" ", "").replace(":", "")+"'";
		}
		if(check_end!=null && !check_end.equals("")){
			sql += " and logStarttime <= '"+check_end.replace("-","").replace(" ", "").replace(":", "")+"'";
		}
		
		countSql = "select count(*) from ("+sql+") t";
		sql += " order by logStarttime desc limit "+start+","+limit;
		
		logger.info("countSql :  " +countSql);
		logger.info("sql == "+ sql);
		
		Integer totalCount = jdbcTemplate.queryForObject(countSql, Integer.class);//查询总条数
		
		final List<Userlog> list = new ArrayList<Userlog>();
		jdbcTemplate.query(sql,new RowCallbackHandler(){
			public void processRow(ResultSet rs) throws SQLException {
				Userlog log = new Userlog();
				log.setId(rs.getInt("id"));
				log.setActionId(rs.getString("actionId"));
				log.setActionName(rs.getString("actionName"));
				log.setMethodId(rs.getString("methodId"));
				log.setMethodName(rs.getString("methodName"));
				log.setActionDesc(rs.getString("actionDesc"));
				log.setLoguser(rs.getString("logUser"));
				log.setClientIp(rs.getString("clientIp"));
				log.setLogResult(rs.getString("logResult"));
				try {
					log.setLogStarttime(f2.format(f1.parse(rs.getString("logStarttime"))));
					log.setLogEndtime(f2.format(f1.parse(rs.getString("logEndtime"))));
				} catch (ParseException e) {
					throw new RuntimeException(e.getMessage());
				}
				list.add(log);
			}
		});		
		
		page.setTotalCount(totalCount);
		page.setDatas(list);
		
		return page;
	}
}
