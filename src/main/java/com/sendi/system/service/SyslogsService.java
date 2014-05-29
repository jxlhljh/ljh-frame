package com.sendi.system.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.system.bean.Page;
import com.sendi.system.entity.Syslogs;

@Service
public class SyslogsService extends CommonService<Syslogs>{

	
	public Page<Syslogs> querySyslog(String loguser,String logname,String logterminal,String logcontent,Integer pageNo,Integer pageSize){
		StringBuffer hql=new StringBuffer("from Syslogs where 1=1 ");
		if(loguser!=null&&loguser.trim().length()>0)
		{
			hql.append(" and  loguser like '%").append(loguser).append("%' ");
		}
		if(logname!=null&&logname.trim().length()>0)
		{
			hql.append(" and logname like '%").append(logname).append("%' ");
		}
		if(logterminal!=null&&logterminal.trim().length()>0)
		{
			hql.append(" and logterminal like '%").append(logterminal).append("%' ");
		}
		if(logcontent!=null&&logcontent.trim().length()>0)
		{
			hql.append(" and logcontent like '%").append(logcontent).append("%' ");
		}
		
		return this.getPageList(hql.toString(), pageNo, pageSize);
	}
	
	/**
	 * 删除
	 */
	@Transactional
	public void excuteDeleteSyslogs(String deleterecord){
		String hql="delete Syslogs where id in ("+deleterecord+")";
		this.executeHql(hql);
	}
	
}
