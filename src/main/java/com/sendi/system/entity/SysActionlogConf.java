package com.sendi.system.entity;

public class SysActionlogConf implements java.io.Serializable {
	 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String actionName;
	private String methodId;
	private String methodName;
	private String actionDesc;
	private String actionId;
	private int flag;

	// Constructors

	/** default constructor */
	public SysActionlogConf() {
	}

 

	public SysActionlogConf(String actionName, String methodId,
			String methodName, String actionDesc, String actionId, int flag) {
		super();
		this.actionName = actionName;
		this.methodId = methodId;
		this.methodName = methodName;
		this.actionDesc = actionDesc;
		this.actionId = actionId;
		this.flag = flag;
	}



	public String getActionName() {
		return actionName;
	}



	public void setActionName(String actionName) {
		this.actionName = actionName;
	}



	public String getMethodId() {
		return methodId;
	}



	public void setMethodId(String methodId) {
		this.methodId = methodId;
	}



	public String getMethodName() {
		return methodName;
	}



	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}



	public String getActionDesc() {
		return actionDesc;
	}



	public void setActionDesc(String actionDesc) {
		this.actionDesc = actionDesc;
	}



	public String getActionId() {
		return actionId;
	}



	public void setActionId(String actionId) {
		this.actionId = actionId;
	}



	public int getFlag() {
		return flag;
	}



	public void setFlag(int flag) {
		this.flag = flag;
	}


 

}