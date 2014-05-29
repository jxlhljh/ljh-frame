package com.sendi.system.socket;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;

import com.sendi.system.bean.ApplicationContextHelper;
import com.sendi.system.bean.PushHelper;
import com.sendi.system.bean.SysLogHelper;

/*
 * 外部socket接口处理基类，主要应用于perl向java应用传送信息时使用，避免使用wget
 */
public abstract  class SocketI {
    public ApplicationContextHelper applicationContextHelper;
	  
    public PushHelper pushHelper;
    /*
     * 系统日志记录接口
     */
    public SysLogHelper sysLogHelper;
    
    public SessionFactory sessionFactory;
    
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public abstract void doAction(String msg);

	public PushHelper getPushHelper() {
		return pushHelper;
	}

	public void setPushHelper(PushHelper pushHelper) {
		this.pushHelper = pushHelper;
	}

	public SysLogHelper getSysLogHelper() {
		return sysLogHelper;
	}

	public void setSysLogHelper(SysLogHelper sysLogHelper) {
		this.sysLogHelper = sysLogHelper;
	}

	public ApplicationContextHelper getApplicationContextHelper() {
		return applicationContextHelper;
	}

	public void setApplicationContextHelper(
			ApplicationContextHelper applicationContextHelper) {
		this.applicationContextHelper = applicationContextHelper;
	}

}
