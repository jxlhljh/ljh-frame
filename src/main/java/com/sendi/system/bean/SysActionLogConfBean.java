package com.sendi.system.bean;

public class SysActionLogConfBean
{
	private String actionName;
	private String methodId;
	private String methodName;
	private String actionDesc;
	private String actionId;
	private int flag;
	
	public String getActionName()
	{
		return actionName;
	}
	public void setActionName(String actionName)
	{
		this.actionName = actionName;
	}
	public String getMethodId()
	{
		return methodId;
	}
	public void setMethodId(String methodId)
	{
		this.methodId = methodId;
	}
	public String getMethodName()
	{
		return methodName;
	}
	public void setMethodName(String methodName)
	{
		this.methodName = methodName;
	}
	public String getActionDesc()
	{
		return actionDesc;
	}
	public void setActionDesc(String actionDesc)
	{
		this.actionDesc = actionDesc;
	}
	public String getActionId()
	{
		return actionId;
	}
	public void setActionId(String actionId)
	{
		this.actionId = actionId;
	}
	public int getFlag()
	{
		return flag;
	}
	public void setFlag(int flag)
	{
		this.flag = flag;
	}
}
