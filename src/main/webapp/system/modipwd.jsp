<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/page/common/common.jsp"%>
<script type="text/javascript" src="${ctx}/system/js/modipwd.js"></script>
<title>用户密码修改</title>

<style type="text/css">
.ADKPasswordStrength_low{ background-color:#CC0000;}
.ADKPasswordStrength_middle{ background-color:#33CCFF;}
.ADKPasswordStrength_height{ background-color:#66FF00;}
</style> 
<script type="text/javascript">
var ADKPasswordStrength =
{
   Level : ["高","一般","弱"],
   LevelValue : [30,20,0],//强度值
   Factor : [1,2,5],//字符加数,分别为字母，数字，其它
   KindFactor : [0,0,10,20],//密码含几种组成的加数
   Regex : [/[a-zA-Z]/g,/\d/g,/[^a-zA-Z0-9]/g] //字符正则数字正则其它正则
}
ADKPasswordStrength.StrengthValue=function(pwd)
{
   var strengthValue = 0;
   var ComposedKind = 0;
   for(var i = 0 ; i < this.Regex.length;i++)
   {
       var chars = pwd.match(this.Regex[i]);
        if(chars != null)
        {
                strengthValue += chars.length * this.Factor[i];
                ComposedKind ++;
         }
     }
    strengthValue += this.KindFactor[ComposedKind];
    return strengthValue;
} 
    
ADKPasswordStrength.StrengthLevel = function(pwd)
{
   var value = this.StrengthValue(pwd);
    for(var i = 0 ; i < this.LevelValue.length ; i ++)
    {
        if(value >= this.LevelValue[i] )
        return this.Level[i];
    }
}

ADKPasswordStrength.Check=function(iobj,sobj)
{
    var inputobj,showobj;
    
    inputobj=typeof(iobj)=="string"?document.getElementById(iobj):iobj;
    showobj=typeof(sobj)=="string"?document.getElementById(sobj):sobj;

    if(!showobj || !inputobj)
        return;

    var lv=ADKPasswordStrength.StrengthLevel(inputobj.value);
    if(lv=="高")
    {
        showobj.innerHTML="高";
        showobj.className="ADKPasswordStrength_height"
    }
    else if(lv=="一般")
    {
        showobj.innerHTML="一般";
        showobj.className="ADKPasswordStrength_middle"
    }
    else if(lv=="弱")
    {
        showobj.innerHTML="弱";
        showobj.className="ADKPasswordStrength_low"
    }
}
</script>

</head>
<body>
<div id="searchform" ></div>
<div id="lb"></div>
</body>
</html>