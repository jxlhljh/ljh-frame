package com.sendi.system.util.tree;
/*
 * 普通应用中的树模型
 */
public class ConTreeData {
	  public String text;	
	  public int id;
	  public boolean leaf=false;
	  public String openurl;
	  public String icon;
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
	public String getOpenurl() {
		return openurl;
	}
	public void setOpenurl(String openurl) {
		this.openurl = openurl;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
 
	

}
