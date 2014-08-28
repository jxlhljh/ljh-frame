<%@page import="com.sendi.system.constants.Globals"%>
<%@ page isELIgnored="false" %>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
		String path = request.getContextPath();
		//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+Globals.Port+path;
	    String  serverip=request.getServerName();
	    HashMap<String,String> sendi_sys_config_para;
        Object o=application.getAttribute("sendi_sys_config_para");
        String sys_config_string="{}";
        if(o!=null)
		{
		  sendi_sys_config_para=(HashMap<String,String>)o;
		  sys_config_string=JSONObject.fromObject(sendi_sys_config_para).toString();
		 
		}
        String user_button_operations_json = (String)session.getAttribute("user_button_operations_json");//button json
        
        //On the right side of the device tree
        HashMap<String,String> sys_right_tree_srj_para;
        Object o2=application.getAttribute("sys_right_tree_srj");
        String sys_right_tree_srj_string="{}";
        if(o!=null)
		{
        	sys_right_tree_srj_para=(HashMap<String,String>)o2;
        	sys_right_tree_srj_string=JSONObject.fromObject(sys_right_tree_srj_para).toString();
		 
		}
 %>
<script type="text/javascript">
  //for global use
  var contextRootPath = "${ctx}";
  var IsNewSession = ${pageContext.session.new} ;
  var userName="<%=session.getAttribute("username")%>";
  var user_id="<%=session.getAttribute("userid")%>";
  var userid_tablekey="<%=session.getAttribute("userid_tablekey")%>";
  var role_id="<%=session.getAttribute("roleid")%>";
  var fullpath="<%=basePath%>";
  var serverip="<%=serverip%>";
  var sendi_sys_config_para=<%=sys_config_string%>;
  var current_session_id="<%=session.getId()%>";
  var user_button_operations_json = '<%=user_button_operations_json%>';
  var sys_right_tree_srj_string='<%=sys_right_tree_srj_string%>';
  
  
</script>
