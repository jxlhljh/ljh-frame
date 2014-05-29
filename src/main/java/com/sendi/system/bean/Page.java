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
	private List<T> data;

	public Page(){}
	
	public Page(Integer totalCount,List<T> data){
		this.totalCount = totalCount;
		this.data = data;
	}
	
	
	public Integer getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}


	public List<T> getData() {
		return data;
	}


	public void setData(List<T> data) {
		this.data = data;
	}

	public String formToJson(){
		String json = "{'totalCount':"+this.totalCount+",'data':"+JSONArray.fromObject(data)+"}";
		return json;
	}
}
