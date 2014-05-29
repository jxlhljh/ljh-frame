<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
 String workflowtemplateid=request.getParameter("workflowtemplateid"); //流程模板ID
 workflowtemplateid=(workflowtemplateid==null||workflowtemplateid.trim().length()==0)?"":workflowtemplateid;
 String workflowtinstanceid=request.getParameter("workflowtinstanceid");
 String workflowstate=request.getParameter("workflowstate");
 String businessid=request.getParameter("businessid");
 if(workflowtinstanceid==null||workflowtinstanceid.trim().length()==0)
 {
  out.write("<b><font color=red fontsize=13>流程实例ID为空，控制无法找到对应流程，请联系管理员</font><b>");
  return;
 }
if(session.getAttribute("user_id")==null)
{
    out.write("<b><font color=red fontsize=13>登录超时,请重新登录!</font><b>");
     return;
}
String user_id=session.getAttribute("user_id").toString();//user表对应的主键KEY
String userName=session.getAttribute("userName").toString();
String userid=session.getAttribute("userid").toString();//登录账号ID
String currnetstep=request.getParameter("currnetstep");
 
%>
<script>
//流程处理的全局变量
  var workflowtemplateid='<%=workflowtemplateid%>';
  var workflowtinstanceid='<%=workflowtinstanceid%>';
 
  var user_id='<%=user_id%>';
  var userName='<%=userName%>';  
  var userid='<%=userid%>';  
 
  var businessid='<%=businessid%>'; 
  var currnetstep='<%=currnetstep%>'; 
  var workflowstate='<%=workflowstate%>'; 
  
</script>