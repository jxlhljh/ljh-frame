<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.sendi.DeskTopShutCut"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sendi.system.entity.Functionmoudle"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><%=(String)application.getAttribute("sendi_system_title")%> </title>

<%@include file="/page/common/common.jsp"%>
<script type="text/javascript"  src="${ctx}/system/js/swfobject.js"/></script>
<script type="text/javascript" src="${ctx}/system/desktop/js/push.js"></script>
<%@include file="destop.jsp"%>
<script type="text/javascript" src="${ctx}/system/desktop/js/main_desktop.js"></script>
</head>
<%
 /*  if(session.getAttribute("userid")==null);
   {
    out.write("用户未登录，或者Session会话超时,请重登录");
    return;
   } */
  
    WebApplicationContext wc=WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
    DeskTopShutCut dts=(DeskTopShutCut)wc.getBean("deskTopShutCut");
    
    ArrayList<Functionmoudle> shutcuts=dts.getShutcut();
    
 %>
<body scroll="no">

<div id="x-desktop">
    <a  target="_blank" style="margin:5px; float:right;"><div style="height: 0;width: 0;margin: 0px; float:right;" id='banerdiv' ></div><img src="page/image/sendilogo.jpg" /></a>

    <dl id="x-shortcuts">
      <%
      StringBuffer sb=  new StringBuffer("");
      for(Functionmoudle f:shutcuts)
      {
        String onclick="moudleTabInterface.AddShutCutTab('"+f.getMoudleid()+"','"+f.getMoudletitle()+"','"+f.getOpenurl()+"')";
         sb.append("<dt onclick=").append(onclick).append(" >");
        sb.append(" <a href=\"#\" onclick=").append(onclick).append("> <img src=\"").append(f.getShutcuturl()).append("\" onclick=").append(onclick).append("/>");
        sb.append(" <div onclick=").append(onclick).append(">").append(f.getMoudletitle()).append("</div></a>");;
         sb.append("</dt>");
      }
      out.write(sb.toString());
       %>
     
    </dl>
</div>
<div id="ux-taskbar">
	<div id="ux-taskbar-start"></div>
	<div id="ux-taskbuttons-panel"></div>
	<div class="x-clear"></div>
</div>
</body>
</html>