package com.sendi.system.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.system.bean.Page;
import com.sendi.system.constants.Globals;
import com.sendi.system.entity.Dctdata;

/**
 * @author liujinghua
 *
 */
@Service
public class DctDataService extends CommonService<Dctdata> {

	/**
	 * 查询
	 * @return
	 */
	public Page<Dctdata> queryDctData(String dcttypenote, Integer pageNo,
			Integer pageSize) {
		StringBuffer hql = new StringBuffer("from Dctdata where 1=1 ");
		if (StringUtils.isNotEmpty(dcttypenote)) {
			hql.append(" and  dcttypenote like '%" + dcttypenote + "%' ");
		}
		Page<Dctdata> page = this.getPageList(hql.toString(), pageNo, pageSize);
		return page;
	}
	
	/**
	 * 字典类型选树下拉框数据查询
	 * 
	 */
	public List<Dctdata> queryDctDataAndreturn() {
		StringBuffer hql = new StringBuffer("from Dctdata where 1=1 group by dcttypenote");
		List<Dctdata> datas = this.findByQueryString(hql.toString());
		return datas;
	}
	
	
	/**
	 * 新增
	 */
	@Transactional
	public void addDctData(Dctdata dctdata){
		this.save(dctdata);
	}
	
	/**
	 * 修改
	 */
	public void excuteModifyDctData(Dctdata dctdata){
		this.updateEntitie(dctdata);
	}
	/**
	 * 删除
	 */
	@Transactional
	@CacheEvict(value = Globals.EhCacheName,allEntries=true)
	public void excuteDeleteDctData(String deleterecord){
		  String hql="delete Dctdata where id in ("+deleterecord+")";
		  executeHql(hql);
	}
}
