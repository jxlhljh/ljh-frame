 
 /*
  * //这是一个对像，调用AddTemplateTab接口方法可以增加在模板浏览栏目上Tab。参数如下tabid,tabtext,taburl 	
  * 示例
  * window.parent.moudleTabInterface.AddTemplateTab(....);
  */
  
 
  
var moudleTabInterface; 
  var tb =  Ext.create('Ext.toolbar.Toolbar', {height :29,cls:'x-panel-header x-unselectable'});
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
	 
	  	     Ext.MessageBox.wait( '正在加载模块数据，请稍等....','SYSTEM');
	  	     
	  	      moudleTabInterface=Ext.create('MoudleTab',{});
	  	     
				   	var sysconf={
						southTitle:sendi_sys_config_para.sendi_system_title,
						moudletab:moudleTabInterface					 
						};
					
						//var sysMainFrame=new SystemMainFrame(sysconf);
						var sysMainFrame= Ext.create('SystemMainFrame',sysconf);
						sysMainFrame.on('afterlayout',function(){
						 if(!isLoadData)
					 {
					  
				flashvars = {
			        sockeid:"testwarningswangalgn",
			        serverlocation:serverip,
			        serverport:sendi_sys_config_para.sendi_system_socketport,
			        logout_url:rootPath+"/logout.do",
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
				    url:rootPath+'/sendisystem/listallMoudletoMenu.do',
				    success:function(_response,_options){
				  	   tb.render('menudiv');   
				      var _records=Ext.JSON.decode(_response.responseText); 
				  
					   var len=_records.length;
					  
  var scrollMenu = Ext.create('Ext.menu.Menu');
  for (var i = 0; i < 1; ++i){
        scrollMenu.add({
        	id:i+1,
            text: 'Item ' + (i + 1),
            leaf:true,
            menu1:'',
            icon:"/blocplatform/page/image/1.gif",
            iconcls:'',
            openurl:"/blocplatform/system/functionmoudle.jsp",
            handler :function(_node){ 
            	//alert('ddd');
            	Ext.getCmp('moudleID').openTab(_node)
            } 
        });
    }
					  
					  
				   for(i=0;i<1;i++)
					   {	 
					       tb.add({
        icon: 'preview.png',
      //  cls: 'x-btn-text-icon',
        text: 'Scrolling Menu',
        menu: scrollMenu
    });    
   }
 /* var item =  { "handler":function(_node){ Ext.getCmp('moudleID').openTab(_node); },
  				"icon":"/blocplatform/page/image/1.gif","iconcls":" ",
  				"leaf":true,
  				"menu1":null,
  				"moudleid":"moudlemanager",
  				"moudletitle":"",
  				"moudletype":"",
  				"openurl":"/blocplatform/system/functionmoudle.jsp",
  				"text":"模块管理"};
    */
    /* for(i=0;i<len;i++){
					   tb.add({
					     	 text:'<b>'+_records[i].text+'</b>',
					    	 menu:_records[i].menu,
					    	 iconCls:_records[i].iconcls
					     });  	 
					   } ; */ 
 					tb.suspendLayout = false;
    				tb.doLayout();
					
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
			 	 }
		 	});
	// 调整窗口大小时避免变灰
	Ext.EventManager.onWindowResize(function(w,h){		
		if(isReload){
			Ext.getCmp('northid').setHeight(65);
			var panel = Ext.getCmp('content-panel');
			panel.setPosition(position);
			panel.setHeight(panel.getSize().height+20);
			//此处先注释
			//moudleTabInterface.syncSize();
			moudleTabInterface.syncFx();
		}else{
			isReload = true;
			Ext.getCmp('northid').setHeight(65);
			position = moudleTabInterface.getPosition();
		}		 
    },this,true);   
});