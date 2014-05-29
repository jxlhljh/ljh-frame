<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户操作日志</title>
<%@include file="/page/common/common.jsp"%>
<%
	String loguser = request.getParameter("loguser")!=null?request.getParameter("loguser"):"";
	String check_time = request.getParameter("check_time")!=null?request.getParameter("check_time"):"";
	String check_end = request.getParameter("check_end")!=null?request.getParameter("check_end"):"";
	out.print("<script>var loguser='"+loguser+"';</script>");
	out.print("<script>var c_time='"+check_time+"';</script>");
	out.print("<script>var c_end='"+check_end+"';</script>");
 %>
<script type="text/javascript" src="${ctx}/page/common/My97DatePicker-4.7-Beta4/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/page/common/MultiSelect/multiselect.css"> 
<script type="text/javascript" src="${ctx}/system/js/userlogquery.js">
</script>
</head>
<body>
  
</body>
</html>