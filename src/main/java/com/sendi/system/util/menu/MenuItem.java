package com.sendi.system.util.menu;

public class MenuItem {
	public int id;
	public String text;
	public Menu menu;
	public String handler="function(_node){Ext.getCmp('moudleID').openTab(_node);}";
	  public boolean leaf=false;
	  public String openurl;
	  public String icon;
	  public String moudletype;
	  public String moudletitle;
	  public String moudleid;
	  public String iconcls;
	  public String dependtree;
	  
	public String getDependtree() {
		return dependtree;
	}
	public void setDependtree(String dependtree) {
		this.dependtree = dependtree;
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
	public String getMoudletype() {
		return moudletype;
	}
	public void setMoudletype(String moudletype) {
		this.moudletype = moudletype;
	}
	public String getMoudletitle() {
		return moudletitle;
	}
	public void setMoudletitle(String moudletitle) {
		this.moudletitle = moudletitle;
	}
	public String getMoudleid() {
		return moudleid;
	}
	public void setMoudleid(String moudleid) {
		this.moudleid = moudleid;
	}
 
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public String getHandler() {
		return handler;
	}
	public void setHandler(String handler) {
		this.handler = handler;
	}
	public String getIconcls() {
		return iconcls;
	}
	public void setIconcls(String iconcls) {
		this.iconcls = iconcls;
	}
 
	
}
