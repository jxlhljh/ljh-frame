
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
 
	window.location.href=fullpath+"/loginController.do?logout";
}
 