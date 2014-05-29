<%@ page isELIgnored="false" %>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	     String  serverip=request.getServerName();
	       HashMap<String,String> sendi_sys_config_para;
        Object o=application.getAttribute("sendi_sys_config_para");
        String sys_config_string="{}";
        if(o!=null)
		{
		  sendi_sys_config_para=(HashMap<String,String>)o;
		  sys_config_string=JSONObject.fromObject(sendi_sys_config_para).toString();
		 
		}
 %>
<script type="text/javascript">
  //for global use
  var contextRootPath = "${ctx}";
  var IsNewSession = ${pageContext.session.new} ;
  var userName="<%=session.getAttribute("userName")%>";
   var user_id="<%=session.getAttribute("user_id")%>";
  var fullpath="<%=basePath%>";
   var serverip="<%=serverip%>";
  var sendi_sys_config_para=<%=sys_config_string%>;
  var current_session_id="<%=session.getId()%>";
</script>
