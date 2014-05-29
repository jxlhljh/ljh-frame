package com.sendi.system.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.system.bean.ApplicationContextHelper;
import com.sendi.system.bean.Page;
import com.sendi.system.bean.PreloadI;
import com.sendi.system.bean.SysLogHelper;
import com.sendi.system.entity.SysProloadConf;

@Service
public class SysProloadConfService extends CommonService<SysProloadConf>{
	@Autowired
	public ApplicationContextHelper applicationContextHelper;
	
	@Autowired
	public SysLogHelper sysLogHelper;
	

	/**
	 * 查询
	 * @return
	 */
	public Page<SysProloadConf> querysysPreloadData(String description,String interfaceid,Integer pageNo,Integer pageSize){
		StringBuffer hql = new StringBuffer("from SysProloadConf where 1=1");
		if(StringUtils.isNotEmpty(description)){
			hql.append(" and description like '%").append(description).append("%'");
		}
		if(StringUtils.isNotEmpty(interfaceid)){
			hql.append(" and interfaceid like '%").append(interfaceid).append("%'");
		}
		return getPageList(hql.toString(), pageNo, pageSize);
	}
	
	
	/**
	 * 增加
	 */
	@Transactional
	public void addsysPreload(SysProloadConf sysProloadConf) throws Exception{
		
		this.save(sysProloadConf);
		
		//成功后重载内存
		reloadPreload(sysProloadConf);
	}
	
	/**
	 * 修改
	 */
	@Transactional
	public void excuteModifysysPreload(SysProloadConf sysProloadConf) throws Exception{
		this.saveOrUpdate(sysProloadConf);
		//成功后重载内存
		reloadPreload(sysProloadConf);
	}
	
	/**
	 * 删除
	 */
	@Transactional
	public void excuteDeletesysPreload(String deleterecord){
		String hql = "delete SysProloadConf where id in ("+deleterecord+")";
		this.executeHql(hql);
	}
	
	public void reloadPreload(SysProloadConf o)
	 {
		try{
			PreloadI c=(PreloadI)Class.forName(o.getInterfacecalss()).newInstance();
			 c.setApplicationContextHelper(applicationContextHelper);
			 c.setSysLogHelper(sysLogHelper);
			 c.setSessionFactory(sessionFactory);
			 c.setJdbcTemplate(jdbcTemplate);
			 c.doLoad(); 
		}catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		 
	 }
}
