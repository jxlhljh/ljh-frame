package com.sendi.system.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.sendi.system.bean.Page;
import com.sendi.system.entity.SysSocketInterface;

@Service
public class SysSocketInterfaceService extends CommonService<SysSocketInterface>{

	/**
	 * 查询
	 */
	public Page<SysSocketInterface> queryPushConfigData(String description,String interfaceid,Integer pageNo,Integer pageSize){

		StringBuffer hql=new StringBuffer("from SysSocketInterface where 1=1 ");

		if(StringUtils.isNotEmpty(description)){
			hql.append(" and description like '%").append(description).append("%'");
		}
		if(StringUtils.isNotEmpty(interfaceid)){
			hql.append(" and interfaceid like '%").append(interfaceid).append("%'");
		}
		
		return getPageList(hql.toString(), pageNo, pageSize);
	}
	
	/**
	 * 新增
	 */
	public void addskInterface(SysSocketInterface sysSocketInterface){
		this.save(sysSocketInterface);
	}
	
	/**
	 * 修改
	 */
	public void excuteModifyskInterface(SysSocketInterface sysSocketInterface){
		this.updateEntitie(sysSocketInterface);
	}
	
	/**
	 * 删除
	 */
	public void excuteDeleteskconfig(String deleterecord){
		String hql="delete SysSocketInterface where id in ("+deleterecord+")";
		this.executeHql(hql);
	}
}
