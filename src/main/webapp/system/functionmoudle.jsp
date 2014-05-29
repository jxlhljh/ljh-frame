<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/page/common/common4.jsp"%>
<script type="text/javascript" src="${ctx}/system/js/functionmoudle.js"></script>
<title> 功能模块管理</title>
 <style type="text/css"> 
 .treediv{width:20%; position:absolute; height:500px;left:0;margin:0 0 0 0px; border:0px #000 ; }
.grid{width:80%;position:absolute;  height:500px;left:20%;margin:0 0 0 0px; border:0px #000; }
        .x-grid-row-over .x-grid-cell-inner {
            font-weight: bold;
        }
  </style> 
</head>
<body>
 <div id="treediv" class="treediv" ></div>
 <div id="grid" class="grid" ></div>
</body>
</html>