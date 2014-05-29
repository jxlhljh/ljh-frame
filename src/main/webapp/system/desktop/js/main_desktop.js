 
 /*
  * //这是一个对像，调用AddTemplateTab接口方法可以增加在模板浏览栏目上Tab。参数如下tabid,tabtext,taburl 	
  * 示例
  * window.parent.moudleTabInterface.AddTemplateTab(....);
  */
var wholedesktop;
var moudleTabInterface={
AddTemplateTab:function(tabid,tabtext,taburl)
{
 		 var desktop =wholedesktop.getDesktop();
       
            win = desktop.createWindow({
                id: 'destoptemplatewanglang'+tabid,
                title:tabtext,
                  width:1024,
                height:550,
               	html: '<iframe src=\"'+taburl+'\" width=\"100%\" height=\"100%\" frameborder=\"0\">',
                iconCls: 'bogus',
                shim:false,
                animCollapse:false,
                constrainHeader:true,
                maximizable  :false
            });
        
        win.show();
},
AddShutCutTab:function(tabid,tabtext,taburl)
{
  	 var desktop =wholedesktop.getDesktop();
      var win = desktop.getWindow(tabid);
        if(!win){
          
            win = desktop.createWindow({
                id:tabid,
                title:tabtext,
                width:1024,
                height:550,
               	html: '<iframe   id=\"'+tabid+'\" name=\"'+tabid+'\"  src=\"'+taburl+'\" width=\"100%\" height=\"100%\" frameborder=\"0\">',
               // iconCls: 'bogus',
                shim:false,
                animCollapse:false,
                constrainHeader:true,
                maximizable  :false
            });
          
        }
         win.show();
}

};
MyDesktopWind = Ext.extend(Ext.app.Module, {
	      constructor:function(_conf)
		  {
		     	if(_conf==null)
					_conf={};
					Ext.apply(this,_conf);
				 	MyDesktopWind.superclass.constructor.call(this,{
				 	 
				  	})
		  },
    init : function(){
        this.launcher = {
            text: this.text,
            iconCls:this.iconcls,
            handler : this.createWindow,
            scope: this,
            windowId:this.moudleid
        }
       }
 
});
function createWin(src)
{
  if(wholedesktop!=null)
  {
  	    if(src.leaf)
  	    {
  	     
  	    var desktop =wholedesktop.getDesktop();
        var win = desktop.getWindow(src.moudleid);
        if(!win){
            win = desktop.createWindow({
                id:src.moudleid,
                title:src.text,
                width:1024,
                height:550,
               	html: '<iframe id=\"'+src.moudleid+'\" name=\"'+src.moudleid+'\"   src=\"'+src.openurl+'\" width=\"100%\" height=\"100%\" frameborder=\"0\">',
                iconCls:src.iconcls,
                shim:false,
                animCollapse:false,
                constrainHeader:true,
                maximizable  :false
            });
        }
        win.show();
  	    }
     
  }
}
function openOverview(moudleid,vurl)
{
   if(wholedesktop!=null)
  {
  	     var desktop =wholedesktop.getDesktop();
        var win = desktop.getWindow(moudleid);
        if(!win){
            win = desktop.createWindow({
                id:moudleid,
                title:'总览',
                width:1024,
                height:550,
               	html: '<iframe id=\"'+moudleid+'\" name=\"'+moudleid+'\"   src=\"'+vurl+'\" width=\"100%\" height=\"100%\" frameborder=\"0\">',
                shim:false,
                animCollapse:false,
                constrainHeader:true,
                maximizable  :false
            });
        }
        win.show();
    }
}
MyDesktopWindMenuModule = Ext.extend(MyDesktopWind, {
		
	    constructor:function(_conf)
		  {
		     	if(_conf==null)
					_conf={};
					Ext.apply(this,_conf);
				 	MyDesktopWindMenuModule.superclass.constructor.call(this,{
				 	 
				  	})
		  },
	    init : function(){
        this.launcher = {
      	    text: this.text,
            iconCls:this.iconcls,
            scope: this,
            windowId:this.moudleid,
            handler: function() {
				return false;
			},
     	  menu: this.menu
        }
    }
});

 
 
var  moduleMyDesktopWind=new Array();

Ext.onReady(function (){
	  	     Ext.MessageBox.wait( '正在加载模块数据，请稍等....','SYSTEM');
	  	  	          Ext.Ajax.request({
				    url:fullpath+'/sendisystem/listallMoudletoMenu.do',
				    success:function(_response,_options){
				  	 
				        var _records=Ext.util.JSON.decode(_response.responseText);  
					   var len=_records.length;
				 	   for(i=0;i<len;i++)
					   {
					   	 
					       moduleMyDesktopWind[i]=new MyDesktopWindMenuModule({
					         MoudleTitle:_records[i].text,
					         text:'<b>'+_records[i].text+'</b>',
					     	 menu:_records[i].menu,
					     	 iconCls:_records[i].iconcls
					      });
					     
					    }
					    
	  	   				  MyDesktop = new Ext.app.App({
							init :function(){
								Ext.QuickTips.init();
							},
						
							getModules : function(){
								
								return  moduleMyDesktopWind;
							},
 
						    getStartConfig : function(){
						        return {
						            title: "欢迎你 <font color=green size=2><b>"+userName+'</b></font> '+ sendi_sys_config_para.sendi_system_title,
						            iconCls: 'user',
						            toolItems: [{
						                text:'Settings',
						                iconCls:'settings',
						                scope:this
						            },'-',{
						                text:'Logout',
						                iconCls:'logout',
						                scope:this,
						                handler:function()
						                {
						                   window.location.href=fullpath+"/logout.do";
						                }
						            }]
						        };
						    }
						});
						wholedesktop=MyDesktop;
						
			         Ext.MessageBox.hide();
			         openOverview(sendi_sys_config_para.sendi_system_overviewname,fullpath+sendi_sys_config_para.sendi_system_overviewurl);
			  		},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','查询模块信息失败');
				   },
				   params: {userpowerfilter:'userpowerfilter',isusedesktop:'yes'}
				});
				
	 	 
		 
});