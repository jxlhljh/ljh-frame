
function thisMovie(movieName) {
         if (navigator.appName.indexOf("Microsoft") != -1) {
             return window[movieName];
         } else {
             return document[movieName];
         }
 }
function socketCallBack(returnmsg) //socket 回调函数，当socket 接收到服务器端数据时，回调该函数
{
   var retobj=Ext.decode(returnmsg);
  
   if(retobj.callbackmoudleid=='all'||retobj.callbackmoudleid=='self')
   {
   	
   	  var cstr=retobj.callbackfun+'('+Ext.encode(retobj.pushmsg)+')';
   	  eval(cstr);
   	  
   }
   else  //只有该模块打开的情况才执行push
   {
                      try
                      {
                      	 var callstr='window.'+retobj.callbackmoudleid+'.'+retobj.callbackfun+'('+Ext.encode(retobj.pushmsg)+')';
				 		   eval(callstr);
                      }
                      catch(e)
                      {
                      	
                      }
       			 
   }
   
}

function forcelogout(msgid)
{
	 
	var arr=msgid.split(',');
	var len=arr.length;
	
	for(var i=0;i<len;i++)
	{
 
	   if(arr[i]==current_session_id)
	   {
	     //  alert('你将被强制退出系统!');
	       logoutsys();
	   }
	}
}
function logoutsys()
{
 
	window.location.href=fullpath+"/logout.do";
}

 var flashvars = {
			        sockeid:"testwarningswangalgn",
			        serverlocation:serverip,
			        serverport:sendi_sys_config_para.sendi_system_socketport,
			        logout_url:fullpath+"/logout.do",
			         user_name:userName,
			         user_id:user_id,
			         isusesocket:sendi_sys_config_para.sendi_system_isusesocket,//yes ,no
			          backgroundImage:fullpath+"/page/image/sendilogo.jpg",
			         current_session_id:current_session_id,
			         sendi_system_conectlost_notice_module:sendi_sys_config_para.sendi_system_conectlost_notice_module
			        };
			      //  flashvars.user_name=userName;
			        
			        var params = {};
			        var attributes = {};
  swfobject.embedSWF(fullpath+"/system/desktop/sendilogo.swf", "banerdiv", "0%", "0%", "9.0.0", false, flashvars, params, attributes); 