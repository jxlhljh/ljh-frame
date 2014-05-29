<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/page/common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/page/common/MultiSelect/multiselect.css"> 
<script type="text/javascript" src="${ctx}/page/common/MultiSelect/DDView.js"></script>
<script type="text/javascript" src="${ctx}/page/common/MultiSelect/ItemSelector.js"></script>
<script type="text/javascript" src="${ctx}/page/common/MultiSelect/MultiSelect.js"></script>
 <script type="text/javascript" src="${ctx}/page/common/TreeCheckNodeUI.js"></script>
<script type="text/javascript" src="${ctx}/system/js/userrole.js"></script>
<style type="text/css">
  	.x-grid-back-red { 
		background: #e4765c; 
	}
	.x-grid-back-green { 
		background: #93de8b; 
	}
	.x-grid-back-yellow{
		background: #FFFF80;
	}
</style>
<title>角色管理</title>
</head>
<body>
<div id="searchform" ></div>
 <div id="grid" style="width:97%"></div>
</body>
</html>