<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/page/common/common.jsp"%>
<script type="text/javascript" src="${ctx}/page/common/dctcombo.js"></script>
<script type="text/javascript" src="${ctx}/system/js/hosttree.js"></script>
<title>设备树管理</title>
<style type="text/css">
<!--
.treediv{width:20%; position:absolute; height:500px;left:0;margin:0 0 0 0px; border:0px #000 ; }
.grid{width:80%;position:absolute;  height:500px;left:20%;margin:0 0 0 0px; border:0px #000; }
-->
</style>
</head>
<body>
<div id="treediv" class="treediv" ></div>
 <div id="grid" class="grid" ></div>
</body>
</html>