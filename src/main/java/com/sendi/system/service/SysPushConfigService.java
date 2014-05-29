package com.sendi.system.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.sendi.system.bean.Page;
import com.sendi.system.entity.SysPushConfig;

@Service
public class SysPushConfigService extends CommonService<SysPushConfig>{

	
	/**
	 * 查询
	 */
	public Page<SysPushConfig> queryPushConfigData(String description,String pushid,Integer pageNo,Integer pageSize){

		StringBuffer hql=new StringBuffer("from SysPushConfig where 1=1 ");

		if(StringUtils.isNotEmpty(description)){
			hql.append(" and description like '%").append(description).append("%'");
		}
		if(StringUtils.isNotEmpty(pushid)){
			hql.append(" and pushid like '%").append(pushid).append("%'");
		}
		
		return getPageList(hql.toString(), pageNo, pageSize);
	}
	
	/**
	 * 新增
	 */
	public void addPushConfig(SysPushConfig sysPushConfig){
		this.save(sysPushConfig);
	}
	
	/**
	 * 修改
	 */
	public void excutModifyQueryPushConfig(SysPushConfig sysPushConfig){
		this.updateEntitie(sysPushConfig);
	}
	
	/**
	 * 删除
	 */
	public void excuteDeletePushConfig(String deleterecord){
		String hql="delete SysPushConfig where id in ("+deleterecord+")";
		this.executeHql(hql);
	}
}
