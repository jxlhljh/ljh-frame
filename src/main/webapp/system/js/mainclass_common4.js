Ext.namespace("com.sendi.system.maincommon");
 

 function getRootPath()
 {
 	 var strFullPath=window.document.location.href;
	 var strPath=window.document.location.pathname;
	 var pos=strFullPath.indexOf(strPath);
	 var prePath=strFullPath.substring(0,pos);
	 var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
	 return postPath;
 }
 var rootPath=getRootPath();
  
//系统主外框
Ext.define('SystemMainFrame',{
		  isrenderTo:false,
		  extend: 'Ext.container.Viewport',
  		  constructor:function(_conf)
		  { 
		  		if(_conf==null)
					_conf={};
					Ext.apply(this,_conf);
				 	this.superclass.constructor.call(this,{
				 	 scope:this,
				 	  layout: 'border',
				 	  items: [ 
				 	  		 {				 xtype:'component',
				 	  		 				 id:'northid',
				                   			 region:'north',
				                   			 el:'north',
				                   			 height:65
				                   			 
               				},
					   
					        {
					        	xtype:'tabpanel',
								id: 'content-panel',
								region: 'center', 
								layout: 'card',
								margins: '30 5 5 7',
								activeItem: 0,
								border: true,
								frame:true,
						        tabPosition: 'bottom',
								items: this.moudletab
					     	}
				 	  
				 	  ]
					 
					})
		  }   
}
);

//模块Tab 类
Ext.define('MoudleTab',{
  id:'moudleID',	
  extend: 'Ext.tab.Panel',
 constructor:function(_conf)
 // initComponent:function(_conf)
		  { 
		     	if(_conf==null)
					_conf={};
					Ext.apply(this,_conf);
				 	this.superclass.constructor.call(this,{
				 		    region:'center',
		                    deferredRender:false,
		                    activeTab:0,
				 		 	enableTabScroll:true,
							activeItem: 0,
							 tabPosition: 'bottom',
							defaults: {bodyStyle: 'padding:0px', autoScroll: true},
							items:[{
								id: sendi_sys_config_para.sendi_system_overviewname,
								title: '总览' 
							}]
				  	})
		  },
  openTab:function(_node)
  {
		
  	      var main = Ext.getCmp('content-panel');
  	       var tab = main.getComponent(1);
  	      
  	        if(_node.leaf)
  	        {	
  	       	   if (false) {//this.findParentBy(_node.id + '') != null
  	       			 
					  //this.findParentBy(_node.id + '').show();
					} else {
				   		this.add({
						id: _node.id + '',
						title: _node.text, //_node.moudleid
						//html: '<iframe id=\"'+_node.id+'\" name=\"'+_node.id+'\"  src=\"' +_node.openurl+ '\" width=\"100%\" height=\"100%\" frameborder=\"0\">',
						html:'eeeeeeee',
						closable:true
				}).show();
				}
  	        }
	  	 
  },
  removeTab:function(id)
  {
     this.remove(id,true);
  },
  AddTemplateTab:function(tabid,tabtext,taburl)  //外部接口，增加浏览的Tab
  {
     this.add({
						id: tabid+'',
						title:tabtext,
						html: '<iframe src=\"'+taburl+ '\" width=\"100%\" height=\"100%\" frameborder=\"0\">',
						closable:true
				}).show();
  },
  socketInvoke:function(str)  //调用socket接口发送数据
  {
    thisMovie("banerdiv").socketInvoke(obj);
  }
})
 