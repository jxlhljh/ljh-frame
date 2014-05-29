 
 /*
  * //这是一个对像，调用AddTemplateTab接口方法可以增加在模板浏览栏目上Tab。参数如下tabid,tabtext,taburl 	
  * 示例
  * window.parent.moudleTabInterface.AddTemplateTab(....);
  */
var moudleTabInterface; 
  var tb = new Ext.Toolbar({height :29,cls:'x-panel-header x-unselectable'});
  var module=new Array();
  var isLoadData=false;  
  var ajaxmoudleTree;
Ext.onReady(function (){
	  	     Ext.MessageBox.wait( '正在加载模块数据，请稍等....','SYSTEM');
	  	        var flashvars = {
			        sockeid:"testwarningswangalgn",
			        serverlocation:serverip,
			        serverport:sendi_sys_config_para.sendi_system_socketport,
			        logout_url:rootPath+"/loginController.do?logout",
			         user_name:userName,
			          user_id:user_id,
			          isusesocket:sendi_sys_config_para.sendi_system_isusesocket,//yes ,no
			          backgroundImage:fullpath+"/page/image/banner.jpg",
			           current_session_id:current_session_id,
			          height:70,
			          lablex:1000,
			          sendi_system_conectlost_notice_module:sendi_sys_config_para.sendi_system_conectlost_notice_module
			        };
			         var params = {};
			        var attributes = {};
			         swfobject.embedSWF(fullpath+"/system/loginbanner.swf", "banerdiv", "100%", "100%", "9.0.0", false, flashvars, params, attributes); 
			         
	  	             moudleTabInterface=new MoudleTab({});
	  	             ajaxmoudleTree=new AjaxFunctionMoudleItem({});
						var sysconf={
						southTitle:sendi_sys_config_para.sendi_system_title,
						moudletab:moudleTabInterface,
						toptoobar:tb,
					 	functionMoudleItmes:ajaxmoudleTree
						};
					 	var sysMainFrame=new SystemMainFrame(sysconf);
		
				 	     Ext.Ajax.request({
				      url:fullpath+'/functionModuleController.do?listallMoudletoMenuBar',
				      success:function(_response,_options){
				         var _records=Ext.util.JSON.decode(_response.responseText);  
					   var len=_records.length;
					    tb.addSpacer(); tb.addSpacer(); tb.addSpacer();
					    tb.addSpacer(); tb.addSpacer(); tb.addSpacer();
					    tb.addSpacer(); tb.addSpacer(); tb.addSpacer();
					    tb.addSpacer(); tb.addSpacer(); tb.addSpacer();
					     tb.addSpacer(); tb.addSpacer(); tb.addSpacer();
					         
					      
					   for(i=0;i<len;i++)
					   {
					      tb.add({
					      text:'<b>'+_records[i].text+'</b>',
					      treeMenu:_records[i].menu,
					      MenuTitle:_records[i].text,
					      menuid:_records[i].menuid,
					      handler:function()
					      {
					      	 Ext.getCmp('west-panel').setTitle(this.MenuTitle);
					         //ajaxmoudleTree.root.setText(this.MenuTitle);
					         ajaxmoudleTree.root.id=this.menuid;
					         ajaxmoudleTree.root.reload();
					        },
					      iconCls:_records[i].iconcls
					     })
					      tb.addSeparator();
					     tb.addSpacer();
					     tb.addSpacer();
					    }
 
					
			         Ext.MessageBox.hide();
			         moudleTabInterface.removeTab(sendi_sys_config_para.sendi_system_overviewname);
			              moudleTabInterface.AddTemplateTab(
			          sendi_sys_config_para.sendi_system_overviewname,
			         '总览',
			         fullpath+sendi_sys_config_para.sendi_system_overviewurl			         
			         );
			   		},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','查询模块信息失败');
				   },
				   params: {userpowerfilter:'userpowerfilter'}
				});
			   isLoadData=true;
				 	 	
		
						
						
	  	   
			 
		 
});