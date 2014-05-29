 
 /*
  * //这是一个对像，调用AddTemplateTab接口方法可以增加在模板浏览栏目上Tab。参数如下tabid,tabtext,taburl 	
  * 示例
  * window.parent.moudleTabInterface.AddTemplateTab(....);
  */
  

var moudleTabInterface; 
 

Ext.onReady(function (){
	  	     Ext.MessageBox.wait( '正在加载模块数据，请稍等....','SYSTEM');
	   	         var store=new Ext.data.JsonStore({
			    	root: 'data',
			    	totalProperty: 'totalCount',
			    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
			  		fields: [ 'id','text','moudleid','icon','orderid','iconcls'],
					url:rootPath+"/sendisystem/listFirstMoudle.do"
			    });
			    store.load({params:{start:0, limit:1000,userpowerfilter:'userpowerfilter'}});
			    store.on('load',function(_store, _records )
			    {
			       	   var module=new Array();
					   var len=_records.length;
					  
					   for(i=0;i<len;i++)
					   {
					        module[i]=new AjaxFuncitonMoudle({
					         MoudleTitle:_records[i].get('text'),
					         rootleafid:_records[i].get('id'),
					         iconCls :_records[i].get('iconcls')
					      });
					     
					    }
					   moudleTabInterface=new MoudleTab({});
						var sysconf={
						southTitle:sendi_sys_config_para.sendi_system_title,
						moudletab:moudleTabInterface,
						functionMoudleItmes:module
						};
						var sysMainFrame=new SystemMainFrame(sysconf);
 						    // document.getElementById('north').style.paddingtop=50;
							  // alert(document.getElementById('north').style.paddingtop);
							 // document.getElementById('banerdiv').style.height=20;
						   
					 var flashvars = {
			        sockeid:"testwarningswangalgn",
			        serverlocation:serverip,
			        serverport:sendi_sys_config_para.sendi_system_socketport,
			        logout_url:rootPath+"/logout.do",
			         user_name:userName,
			         user_id:user_id,
			          isusesocket:sendi_sys_config_para.sendi_system_isusesocket,//yes ,no
			          backgroundImage:rootPath+"/page/image/banner.jpg",
			          current_session_id:current_session_id,
			          sendi_system_conectlost_notice_module:sendi_sys_config_para.sendi_system_conectlost_notice_module
			        };
			      //  flashvars.user_name=userName;
			        
			        var params = {};
			        var attributes = {};
			         swfobject.embedSWF(rootPath+"/system/loginbanner.swf", "banerdiv", "100%", "100%", "9.0.0", false, flashvars, params, attributes); 
			         Ext.MessageBox.hide();
			         moudleTabInterface.removeTab(sendi_sys_config_para.sendi_system_overviewname);
			              moudleTabInterface.AddTemplateTab(
			          sendi_sys_config_para.sendi_system_overviewname,
			        '总览',
			         fullpath+sendi_sys_config_para.sendi_system_overviewurl			         
			         );
			 	    });
			    
		 
});