<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><%=(String)application.getAttribute("sendi_system_title")%> </title>
<%@include file="/page/common/common4.jsp"%>
<script type="text/javascript" src="${ctx}/system/js/mainclass_common.js"></script>
<script type="text/javascript" src="${ctx}/system/js/push.js"></script>
<script type="text/javascript" src="${ctx}/system/js/main_common.js"></script>
</head>
<script type="text/javascript"  src="${ctx}/system/js/swfobject.js"/></script>
 
   
<body>
<div id="north" style="display:block;width: 100%"> 
	<div  id='banerdiv'  style="solid #ccc;width:100%;float: left;padding-top: 30"></div> 
 	<div  id='menudiv'  style="solid #ccc;width:100%;float: left;padding-top: 35"></div>
</div>
</body>
</html>