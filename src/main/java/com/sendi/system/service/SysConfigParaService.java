package com.sendi.system.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.system.bean.PreloadBeanconfig;
import com.sendi.system.constants.Globals;
import com.sendi.system.entity.SysConfigPara;

/**
 * 系统参数service
 * @author liujinghua
 * 此类使用了EHcache作为缓存，用为了演示ehcache的功能使用了一下
 */

@Service
@Transactional
public class SysConfigParaService extends CommonService<SysConfigPara>{
	
	@Autowired
	private PreloadBeanconfig preloadBeanconfig;
	
	/**
	 * 查询
	 * //将缓存保存进andCache，并使用参数拼接，加上一个字符串(这里使用方法名称)作为缓存的key，不配置key，默认使用方法中的所有参数作为key
	 * //@Cacheable(value = Globals.EhCacheName,key="#paraDesc + #paraName + 'sysConfigParaQuery'")
	 */
	@Transactional(readOnly = true)
	@Cacheable(value = Globals.EhCacheName,key="'sysConfigParaQuery'")
	public List<SysConfigPara> sysConfigParaQuery(String paraDesc,String paraName){
		StringBuffer hql=new StringBuffer("from SysConfigPara where 1=1 and  paraDesc like ? and  paraName like ?");
		return findHql(hql.toString(), "%"+paraDesc+"%","%"+paraName+"%");
	}
	
	/**
	 * 增加
	 * 清除指定key的缓存
	 */
	@CacheEvict(value = Globals.EhCacheName,key="'sysConfigParaQuery'")
	public void addSysConfigPara(String paraName,String paraValue,String paraDesc){
		SysConfigPara sysConfigPara=new SysConfigPara(paraName,  paraValue,paraDesc);
		saveOrUpdate(sysConfigPara);
	}
	
	
	/**
	 * 修改
	 * 清除指定key的缓存
	 */
	@CacheEvict(value = Globals.EhCacheName,key="'sysConfigParaQuery'")
	public void excuteModifySysConfigPara(Integer id,String paraName,String paraValue,String paraDesc){
		SysConfigPara sysConfigPara = get(SysConfigPara.class, id);
		if(sysConfigPara == null) throw new RuntimeException("entity not finded ,so update fail!");
		sysConfigPara.setParaName(paraName);
		sysConfigPara.setParaValue(paraValue);
		sysConfigPara.setParaDesc(paraDesc);
		saveOrUpdate(sysConfigPara);
	}
	
	/**
	 * 删除
	 * 清除所有缓存
	 */
	@CacheEvict(value = Globals.EhCacheName,allEntries = true)
	public void excuteDeleteSysConfigPara(String deleterecord){
		String hql="delete SysConfigPara where id in ("+deleterecord+")";
		executeHql(hql);
	}
	
	/**
	 * 重载
	 */
	public void reloadConfig(HttpServletRequest request){
		preloadBeanconfig.reloadConfig();
	}
	
}
