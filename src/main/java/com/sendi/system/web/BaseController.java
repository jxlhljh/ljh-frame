package com.sendi.system.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sendi.system.util.common.ObjectSorter;

/**
 * 控制器基类，所有的controller都继承此类
 * @author liujinghua
 * @date 2014-05-14 12：03
 */
public abstract class BaseController {
	 
	////公共参数的名称列表
	protected static String SESSION_USER_ID = "userid";
	protected static String SESSION_USER_NAME = "username";
	protected static String SESSION_ROLE_ID = "roleid";
	protected static String SESSION_USER_ID_TABLEKEY = "userid_tablekey";
	protected static String START = "start";
	protected static String LIMIT = "limit";
	protected static String SORT = "sort";
	protected static String DIR = "dir";
	
	protected final Logger logger  =  LoggerFactory.getLogger(getClass());

	public String getCurrentUserId(HttpSession session){
		return (String)session.getAttribute(SESSION_USER_ID);
	}
	
	public String getCurrentUserId_TableKey(HttpSession session){
		return (String)session.getAttribute(SESSION_USER_ID_TABLEKEY);
	}
	
	public String getCurrentUserName(HttpSession session){
		return (String)session.getAttribute(SESSION_USER_NAME);
	}
	
	public String getCurrentRoleId(HttpSession session){
		return (String)session.getAttribute(SESSION_ROLE_ID);
	}
 
	public void writeResponseText(String responseText,HttpServletResponse response){
		try
		{
	        response.setContentType("text/html");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().print(responseText);
		}
		catch (Exception e) {
			 e.printStackTrace();
		}
		
	}
	
	public void writeJSONArray(List array,HttpServletRequest request,HttpServletResponse response){
		
		try
		{
			String start = request.getParameter(START);
			String limit = request.getParameter(LIMIT);
			
			this.sortObjectList(array,request);			
	        response.setContentType("text/html");
	        response.setCharacterEncoding("UTF-8");
	        List<Object> pagedata=new ArrayList<Object>();
	        
	        int starti=Integer.parseInt(start);
	        int limiti=Integer.parseInt(limit);
	        logger.info("list data size:"+array.size());
	        if((starti+limiti+1)>array.size())
	        {
	        	pagedata.addAll(array.subList(starti,array.size()));
	        }
	        else
	        {
	        	pagedata.addAll(array.subList(starti, starti+limiti));
	         
	        }
	        String jsons = JSONArray.fromObject(pagedata).toString();
	       
	       String res="{totalCount:"+array.size()+",data:"+jsons+"}";
	       logger.debug(res);
	       response.getWriter().print(res);
		}
		catch (Exception e) {
			 e.printStackTrace();
		}
	 
	}
	
	/*
     * 对像类型的集合进行排序
     */
    public void sortObjectList(List datas,HttpServletRequest request)
    {
    	String sort = request.getParameter(this.SORT);
    	String dir = request.getParameter(DIR);
    	//数据不为空，且大小大于1才进行排序
    	if(datas!=null&&datas.size()>1&&sort!=null&&dir!=null)
    	{
    		ObjectSorter s=new ObjectSorter(sort,dir);
    		Collections.sort(datas, s);//List 数据源进行排序
    	}
    }
	
}
