package com.sendi.system.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.stereotype.Component;

/*
 * 系统日志记录类
 */
@Component
public class SysLogHelper {
	
	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public void Log(final String username,final String loginhost,final String resutl,final String operatetime,final String logcontent,final String operatename)
	{
		
		final String sql="insert into syslogs (logname,loguser,logterminal,logresult,logcontent,logtime) values(?,?,?,?,?,?)";
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				  PreparedStatement pst = conn.prepareStatement(sql);
				  pst.setString(1, operatename);
				  pst.setString(2, username);
				  pst.setString(3, loginhost);
				  pst.setString(4, resutl);
				  pst.setString(5, logcontent);
				  pst.setString(6, operatetime);
				return pst;
			}
		});
	}
	
	public void LogActionLog(final SysActionLogBean bean)
	{
		final String sql="insert into sys_action_log(actionId,actionName,methodId,methodName,actionDesc,logUser,clientIp,logResult,logStarttime,logEndtime,reqParameters) values(?,?,?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
					PreparedStatement pst=con.prepareStatement(sql);
					pst.setString(1, bean.getActionId());
					pst.setString(2, bean.getActionName());
					pst.setString(3, bean.getMethodId());
					pst.setString(4, bean.getMethodName());
					pst.setString(5, bean.getActionDesc());
					pst.setString(6, bean.getLogUser());
					pst.setString(7, bean.getClientIp());
					pst.setString(8, bean.getLogResult());
					pst.setString(9, bean.getLogStarttime());
					pst.setString(10, bean.getLogEndtime());
					pst.setString(11, bean.getReqParameters());
				return pst;
			}
		});
	}
	
	public void LogJobhistory(final String jobdesc,final String jobstartTime,
			final String jboendTime, final String jobName, final String jobGroupname)
	{
		
		final String sql="insert into sys_job_interface_log  (jobdesc,jobstart_time,jobend_time,job_name,job_groupname) values(?,?,?,?,?)";
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				  PreparedStatement pst = conn.prepareStatement(sql);
				  pst.setString(1, jobdesc);
				  pst.setString(2, jobstartTime);
				  pst.setString(3, jboendTime);
				  pst.setString(4, jobName);
				  pst.setString(5, jobGroupname);
				return pst;
			}
		});
	}

}
