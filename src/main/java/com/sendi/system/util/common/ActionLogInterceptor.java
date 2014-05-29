package com.sendi.system.util.common;

import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.sendi.system.bean.ApplicationContextHelper;
import com.sendi.system.bean.SysActionLogBean;
import com.sendi.system.bean.SysActionLogConfBean;
import com.sendi.system.bean.SysLogHelper;
import com.sendi.system.constants.Globals;

/**
 * 全局拦截器，目前用于，用户操作记录sys_action_log
 * @author liujinghua
 * 日期: 2014-05-18 晚上 19:21
 *
 */
public class ActionLogInterceptor implements HandlerInterceptor{
	
	private String startTime = "";
	
	@Autowired
	private ApplicationContextHelper applicationContextHelper;
	
	@Autowired
	private SysLogHelper sysLogHelper;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		startTime = DateUtil.getDateTime(new Date());
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception {
	}
	
	/**
	 * 在sys_actionlog_conf表中如果配置了操作的跟踪，加入日志内容
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		//只处理HandlerMethod类的日志
		if(handler instanceof HandlerMethod){
			
			HandlerMethod hm = (HandlerMethod)handler;
			
			HashMap<String, SysActionLogConfBean> hash=(HashMap<String, SysActionLogConfBean>)applicationContextHelper.servletContext.getAttribute(Globals.SysActionLogConf);
		    if(hash==null) return; //
		    
			String actionId = StringUtils.substringAfterLast(request.getRequestURI(), "/");
		    SysActionLogConfBean logConf = hash.get(actionId +"|"+hm.getMethod().getName());
		    if(logConf==null) return; //不在配置范围内，直接略过

		    SysActionLogBean logBean = new SysActionLogBean();
			String userName = (String)request.getSession().getAttribute(Globals.Sesusername); 
            //String logContentHead = "用户:"+userName+currentTime;   
            logBean.setActionId(logConf.getActionId());
            logBean.setMethodId(logConf.getMethodId());
            logBean.setActionName(logConf.getActionName());
            logBean.setMethodName(logConf.getMethodName());
            logBean.setActionDesc(logConf.getActionDesc());
            logBean.setLogUser(userName);
            logBean.setLogStarttime(startTime);
            String result = ex==null?"SUCCESS":"FAIL";
            logBean.setClientIp(request.getRemoteAddr());
            logBean.setLogEndtime(DateUtil.getDateTime(new Date()));
            logBean.setLogResult(result);
            logBean.setReqParameters(this.getRequestParameters(request));
            
            this.sysLogHelper.LogActionLog(logBean);
			
		}
	}
	
	private String getRequestParameters(HttpServletRequest request) 
    {
    	String str="";
        Enumeration<String> e = request.getParameterNames();
        String parameterName, parameterValue;
        while(e.hasMoreElements())
        {
            parameterName = e.nextElement();
            parameterValue = request.getParameter(parameterName);
            str=str+(parameterName + ":" + parameterValue + " | ");            
        }
        
        int maxSize = 200; //最大支持200个字符串
        if(str.length()>maxSize) str = StringUtils.substring(str, 0, maxSize);
        return str;
    }
}
