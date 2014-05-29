package com.sendi.system.util.menu;

public class ToolBarItem {
	public int id;
	public String text;
  	public Menu menu;
  	 public String icon;
   public String iconcls;
   public int menuid;
	public int getMenuid() {
	return menuid;
}
public void setMenuid(int menuid) {
	this.menuid = menuid;
}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
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
	public String getIconcls() {
		return iconcls;
	}
	public void setIconcls(String iconcls) {
		this.iconcls = iconcls;
	}
 
 
	
	

}
