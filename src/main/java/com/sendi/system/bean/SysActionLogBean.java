package com.sendi.system.bean;

public class SysActionLogBean
{
	private int id;
	private String actionName;
	private String methodId;
	private String methodName;
	private String actionDesc;
	private String actionId;
	private String logUser;
	private String clientIp;
	private String logResult;
	private String logStarttime;
	private String logEndtime;
	private String ReqParameters;
	public String getReqParameters()
	{
		return ReqParameters;
	}
	public void setReqParameters(String reqParameters)
	{
		ReqParameters = reqParameters;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
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
	public String getLogUser()
	{
		return logUser;
	}
	public void setLogUser(String logUser)
	{
		this.logUser = logUser;
	}
	public String getClientIp()
	{
		return clientIp;
	}
	public void setClientIp(String clientIp)
	{
		this.clientIp = clientIp;
	}
	public String getLogResult()
	{
		return logResult;
	}
	public void setLogResult(String logResult)
	{
		this.logResult = logResult;
	}
	public String getLogStarttime()
	{
		return logStarttime;
	}
	public void setLogStarttime(String logStarttime)
	{
		this.logStarttime = logStarttime;
	}
	public String getLogEndtime()
	{
		return logEndtime;
	}
	public void setLogEndtime(String logEndtime)
	{
		this.logEndtime = logEndtime;
	}
}
