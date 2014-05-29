package com.sendi.system.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.quartz.CronExpression;
import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SimpleTrigger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.system.bean.ApplicationContextHelper;
import com.sendi.system.bean.Page;
import com.sendi.system.bean.SysLogHelper;
import com.sendi.system.constants.Globals;
import com.sendi.system.entity.SysJobInterface;

/**
 * 定时任务配置
 * @author liujinghua
 *
 */
@Service
public class SysJobInterfaceService extends CommonService<SysJobInterface> {
	
	@Autowired
	private ApplicationContextHelper applicationContextHelper;
	
	@Autowired
	private SysLogHelper sysLogHelper;
	/**
	 * 查询
	 * @return
	 */
	public Page querysysJobInterfaceData(String description,String interfaceid,Integer pageNo,Integer pageSize){
		StringBuffer hql = new StringBuffer("from SysJobInterface where 1=1");
		if(StringUtils.isNotEmpty(description)){
			hql.append(" and description like '%").append(description).append("%'");
		}
		if(StringUtils.isNotEmpty(interfaceid)){
			hql.append(" and interfaceid like '%").append(interfaceid).append("%'");
		}
		return this.getPageList(hql.toString(), pageNo, pageSize);
	}
	
	/**
	 * 增加
	 */
	@Transactional
	public void addsysJobInterface(SysJobInterface sysJobInterface){
		this.save(sysJobInterface);
		
		//1、增加接口后，同步启动定时任务
		this.addJob(sysJobInterface);
	}
	
	/**
	 * 修改
	 */
	@Transactional
	public void excuteModifysysJobInterface(SysJobInterface sysJobInterface){
		this.saveOrUpdate(sysJobInterface);
		
		//1修改接口后，同步修改启动定时任务 ,先删除，后增加2步完成
		this.delJob(sysJobInterface);
		this.addJob(sysJobInterface);
	}
	
	/**
	 * 删除
	 */
	@Transactional
	public void excuteDeletesysJobInterface(String deleterecord){
		String hql = "from SysJobInterface where 1=1 and id in ("+deleterecord+")";
		List<SysJobInterface> datas = this.findByQueryString(hql);
		for(int i=0;i<datas.size();i++){
			//1、同步删除
			this.delJob(datas.get(i));
		}
		hql = "delete SysJobInterface where id in ("+deleterecord+")";
		this.executeHql(hql);
		
	}
	
	/**
	 * 增加接口记录后，加入内存，并启动增加的接口任务，加入调度
	 * @param sysjob
	 * @return
	 */
	private boolean addJob(SysJobInterface sysjob)
	{
		if(sysjob.getIsactive().equals("off"))
		{
			return true;
		}
		try
		{
			Scheduler scheduler=(Scheduler) applicationContextHelper.servletContext.getAttribute(Globals.Scheduler);
			
			if(scheduler == null) return true;//scheduler为空表示全局的定时任务都没有启动，何谈同步，直接返回
			
			Class<Job> t = (Class<Job>) Class.forName(sysjob
					.getInterfacecalss());
			if(sysjob.getJobtype().equals("c"))
			{
				JobDetail jobDetail = new JobDetail(sysjob.getInterfaceid(),
						"complicate", t);
				jobDetail.setDescription(sysjob.getDescription());
				jobDetail.getJobDataMap().put("sessionFactory",	this.sessionFactory);
				jobDetail.getJobDataMap().put("applicationContextHelper",this.applicationContextHelper);
				jobDetail.getJobDataMap().put("sysLogHelper", this.sysLogHelper);
				jobDetail.addJobListener("wanglangjoblistener");

				CronTrigger cronTrigger = new CronTrigger("CronTrigger"
						+ sysjob.getInterfaceid(), "CronTriggergroup");

				CronExpression cexp = new CronExpression(sysjob.getCronexpression());
				cronTrigger.setCronExpression(cexp);
				scheduler.scheduleJob(jobDetail, cronTrigger);
				logger.info("add complicate job:"+sysjob.getInterfaceid());
			}
			else
			{
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				JobDetail jobDetail = new JobDetail(sysjob.getInterfaceid(),"simple", t);
				jobDetail.getJobDataMap().put("sessionFactory",	this.sessionFactory);
				jobDetail.getJobDataMap().put("applicationContextHelper",this.applicationContextHelper);
				jobDetail.getJobDataMap().put("sysLogHelper", this.sysLogHelper);
		       SimpleTrigger simpleTrigger = new SimpleTrigger("CronTrigger"+sysjob.getInterfaceid(), "CronTriggergroupsimple");
		       simpleTrigger.setStartTime(sdf.parse(sysjob.getJobstartTime()));
		       simpleTrigger.setRepeatInterval(sysjob.getJobRepeatInterval());
		       simpleTrigger.setRepeatCount(sysjob.getJobRepeatcount());
		       scheduler.scheduleJob(jobDetail, simpleTrigger);
		       logger.info("add simple job:"+sysjob.getInterfaceid());
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		return true;
	}
	
	private boolean delJob(SysJobInterface sysjob)
	{
		try
		{
			Scheduler scheduler=(Scheduler)this.applicationContextHelper.servletContext.getAttribute(Globals.Scheduler);
			if(scheduler == null) return true;//scheduler为空表示全局的定时任务都没有启动，何谈同步，直接返回

			if(sysjob.getJobtype().equals("c"))
			{
				scheduler.deleteJob(sysjob.getInterfaceid(), "complicate");
				logger.info("remove complicate job:"+sysjob.getInterfaceid());
			}
			else
			{
				scheduler.deleteJob(sysjob.getInterfaceid(), "simple");
				logger.info("remove simple job:"+sysjob.getInterfaceid());
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			throw new RuntimeException(ex.getMessage());
		}
		return true;
	}
}
