 
 /*
  * //这是一个对像，调用AddTemplateTab接口方法可以增加在模板浏览栏目上Tab。参数如下tabid,tabtext,taburl 	
  * 示例
  * window.parent.moudleTabInterface.AddTemplateTab(....);
  */
  
var moudleTabInterface; 
  var tb = new Ext.Toolbar({height :29,cls:'x-panel-header x-unselectable'});
     var module=new Array();
        var isLoadData=false;
var isReload = false;
var flashvars;
var position;
var panelSize;
function showWarning(warnStr){
	Ext.Msg.alert('信息',warnStr);
}
Ext.onReady(function (){
	 		 
	//加载设备树中的必要信息
	//var right_tree_json  = eval('(' + sys_right_tree_srj_string + ')');
	
	Ext.MessageBox.wait( '正在加载模块数据，请稍等....','SYSTEM');
	
    moudleTabInterface=new MoudleTab({});
	var sysconf={
		southTitle:sendi_sys_config_para.sendi_system_title,
		moudletab:moudleTabInterface					 
	};
	
	
	var sysMainFrame=new SystemMainFrame(sysconf);
					  
	flashvars = {
        sockeid:"testwarningswangalgn",
        serverlocation:serverip,
        serverport:sendi_sys_config_para.sendi_system_socketport,
        logout_url:rootPath+"/loginController.do?logout",
        user_name:userName,
      	user_id:user_id,
      	isusesocket:sendi_sys_config_para.sendi_system_isusesocket,//yes ,no
      	backgroundImage:rootPath+"/page/image/banner.jpg",
  	 	current_session_id:current_session_id,
      	height:70,
      	lablex:1000,
      	sendi_system_conectlost_notice_module:sendi_sys_config_para.sendi_system_conectlost_notice_module
    };
 	
 	var params = {};
    var attributes = {};
 	swfobject.embedSWF(rootPath+"/system/loginbanner.swf", "banerdiv", "100%", "100%", "9.0.0", false, flashvars, params, attributes); 
			          
	Ext.Ajax.request({
		url:rootPath+'/functionModuleController.do?listallMoudletoMenu',
		success:function(_response,_options){
   			tb.render('menudiv');   
    		var _records=Ext.util.JSON.decode(_response.responseText);  
   			var len=_records.length;
   			tb.addSpacer(); tb.addSpacer(); tb.addSpacer();
    		tb.addSpacer(); tb.addSpacer(); tb.addSpacer();
    		tb.addSpacer(); tb.addSpacer(); tb.addSpacer();
    		tb.addSpacer(); tb.addSpacer(); tb.addSpacer();
 
		   for(i=0;i<len;i++)
		   {
		    
		      tb.add({
		      	text:'<b>'+_records[i].text+'</b>',
		      	menu:_records[i].menu,
		      	iconCls:_records[i].iconcls
		      })
		   		tb.addSeparator();
	     		tb.addSpacer();
		     	tb.addSpacer();
   			}
 
					
			Ext.MessageBox.hide();
			moudleTabInterface.removeTab(sendi_sys_config_para.sendi_system_overviewname);
			moudleTabInterface.openTab({
				leaf:true,
				id:sendi_sys_config_para.sendi_system_overviewname,
				moudleid:sendi_sys_config_para.sendi_system_overviewname,
				openurl:fullpath+sendi_sys_config_para.sendi_system_overviewurl,
				text:'总览'
     		});
		},
	   failure: function()
	   {
	    Ext.Msg.alert('信息','查询模块信息失败');
	   },
	   params: {userpowerfilter:'userpowerfilter'}
	});
	
	isLoadData=true;
			 	
	// 调整窗口大小时避免变灰
	Ext.EventManager.onWindowResize(function(w,h){
		//swfobject.embedSWF(rootPath+"/system/loginbanner.swf", "banerdiv", "100%", "100%", "9.0.0", false, flashvars, {}, {});
		if(isReload){
			Ext.getCmp('northid').setHeight(65);
			var panel = Ext.getCmp('content-panel');
			panel.setPosition(position);
			//panel.setHeight('100%');
			panel.setHeight(panel.getSize().height+20);
			moudleTabInterface.syncSize();
			//alert(Ext.getCmp('northid').getSize().height);
			//tb.setHeight(29);
			//alert(tb.getSize().height);
			//location.reload();
			//Ext.getCmp('northid').setHeight(65);
			//sysMainFrame.syncSize();
			//alert(document.getElementById('menudiv').height);
			//sysMainFrame.syncSize();
			//Ext.getCmp('northid').setHeight(65);
			//tb.setHeight(29);
		}else{
			isReload = true;
			Ext.getCmp('northid').setHeight(65);
			position = moudleTabInterface.getPosition();
		}
		//alert(thisMovie('banerdiv'));
    },this,true);   
});