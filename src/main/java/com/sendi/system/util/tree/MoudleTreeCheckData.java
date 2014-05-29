package com.sendi.system.util.tree;

import java.util.ArrayList;

/*
 * 3态复杂框树，
 */
public class MoudleTreeCheckData {
  public String text;	
  public int id;
  public boolean leaf=false;
  /*
   * 只能有如下3个值：none,part,all
   */
  public String checked="none";
  /*
   * 如果需要筛选框时，设置Ext.ux.TreeCheckNodeUI
   */
  public String uiProvider="Ext.ux.TreeCheckNodeUI";
  
  
  public MoudleTreeCheckData(){}
	public MoudleTreeCheckData(String text, int id, boolean leaf, String checked,
		String uiProvider) {
	super();
	this.text = text;
	this.id = id;
	this.leaf = leaf;
	this.checked = checked;
	this.uiProvider = uiProvider;
	 
}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getUiProvider() {
		return uiProvider;
	}
	public void setUiProvider(String uiProvider) {
		this.uiProvider = uiProvider;
	}
 
}
