package com.sendi.system.bean;

import java.io.Serializable;
import java.util.List;

import net.sf.json.JSONArray;

/**
 * 分页对像
 * @author liujinghua
 * @param <T>
 */
public class Page<T> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer totalCount;
	private List<T> datas;

	public Page(){}
	
	public Page(Integer totalCount,List<T> datas){
		this.totalCount = totalCount;
		this.datas = datas;
	}
	
	
	public Integer getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	public String formToJson(){
		String json = "{'totalCount':"+this.totalCount+",'datas':"+JSONArray.fromObject(datas)+"}";
		return json;
	}
}
