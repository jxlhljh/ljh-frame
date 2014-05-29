package com.sendi.system.util.menu;

import net.sf.json.JSONObject;

public class Test {

	public String handler="function (_node){Ext.getCmp('moudleID').openTab(_node);}";
	public String handels="this.createWindow";
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Test t=new Test();
		
	 System.out.println(JSONObject.fromObject(t).toString());

	}
	public String getHandler() {
		return handler;
	}
	public void setHandler(String handler) {
		this.handler = handler;
	}
	public String getHandels() {
		return handels;
	}
	public void setHandels(String handels) {
		this.handels = handels;
	}

}
