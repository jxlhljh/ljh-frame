package com.sendi.system.preload;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.RowCallbackHandler;

import com.sendi.system.bean.PreloadI;
import com.sendi.system.bean.SysActionLogConfBean;
import com.sendi.system.constants.Globals;

public class PreLoadActionLogConf extends PreloadI
{
	private Log logger=LogFactory.getLog(PreLoadActionLogConf.class);
	private HashMap<String, SysActionLogConfBean> hash=null;
	
	@Override
	public void doLoad()	{
		hash=new HashMap<String, SysActionLogConfBean>();
		
		String sql="select * from sys_actionlog_conf where flag=1";
		this.getJdbcTemplate().query(sql, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				SysActionLogConfBean bean=new SysActionLogConfBean();
				bean.setActionDesc(rs.getString("actionDesc"));
				bean.setActionId(rs.getString("actionId"));
				bean.setActionName(rs.getString("actionName"));
				bean.setMethodId(rs.getString("methodId"));
				bean.setMethodName(rs.getString("methodName"));
				bean.setFlag(rs.getInt("flag"));
				String key=bean.getActionId()+"|"+bean.getMethodId();
				hash.put(key, bean);
			}
		});
		
		logger.info("PreLoadActionLogConf size:"+hash.size());
		this.applicationContextHelper.servletContext.setAttribute(Globals.SysActionLogConf, hash);

	}
}
