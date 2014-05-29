Ext.namespace("com.sendi.system.main");

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
SystemMainFrame=Ext.extend(Ext.Viewport,{
		  isrenderTo:false,
  		  constructor:function(_conf)
		  { 
		  		if(_conf==null)
					_conf={};
					Ext.apply(this,_conf);
				 	SystemMainFrame.superclass.constructor.call(this,{
				 	 scope:this,
				 	  layout: 'border',
				 	  items: [ 
				 	  		 new Ext.BoxComponent({ // raw
				 	  		 				 id:'northid',
				                   			 region:'north',
				                   			 el:this.northEL==null?'north':this.northEL,
				                   			 height:this.northHeight==null?86:this.northHeight
               								 }),
               		 
		               		 {
						        region: 'south',
						        title:this.southTitle==null? 'Information':this.southTitle,
						        collapsible: false,
						        split: false,
						        height: 10,
						        minHeight: 10
					   		 },
					   
					        {
								id: 'content-panel',
								region: 'center', 
								layout: 'card',
								margins: '2 5 5 0',
								activeItem: 0,
								border: false,
								items: this.moudletab
					     	},
					     	//////////
					     	{
								region:'west',
					            id:'west-panel',
					            title:'功能模块',
					            split:true,
					            width: 200,
					            minSize: 175,
					            maxSize: 400,
					            collapsible: true,
					            margins:'0 0 0 5',
					            layout:'accordion',
					            layoutConfig:{
					                animate:true
					            },
								items:this.functionMoudleItmes
							}
					     	
					     	
					     	/////////////
				 	  
				 	  ]
					 
					})
		  }   
}
);

//模块Tab 类
MoudleTab=Ext.extend(Ext.TabPanel,{
  id:'moudleID',	
 constructor:function(_conf)
		  { 
		     	if(_conf==null)
					_conf={};
					Ext.apply(this,_conf);
				 	MoudleTab.superclass.constructor.call(this,{
				 		    region:'center',
		                    deferredRender:false,
		                    activeTab:0,
				 		 	enableTabScroll:true,
							activeItem: 0,
							defaults: {bodyStyle: 'padding:0px', autoScroll: true},
							items:[{
								id: 'overview',
								title: '总览' 
							}]
				  	})
		  },
  openTab:function(_node)
  {
  	       
  	        if(_node.leaf)
  	        {
  	       	   if (this.findById(_node.id + '') != null) {
					  this.findById(_node.id + '').show();
					} else {
					this.add({
						id: _node.id + '',
						title: _node.text,
						html: '<iframe id=\"'+_node.attributes['moudleid']+'\" name=\"'+_node.attributes['moudleid']+'\" src=\"' +_node.attributes['openurl']+ '\" width=\"100%\" height=\"100%\" frameborder=\"0\">',
						closable:true
				}).show();
				}
  	        }
	  	 
  },
  AddTemplateTab:function(tabid,tabtext,taburl)  //外部接口，增加浏览的Tab
  {
     this.add({
						id: tabid+'',
						title:tabtext,
						html: '<iframe  id=\"'+tabid+'\" name=\"'+tabid+'\"  src=\"'+taburl+ '\" width=\"100%\" height=\"100%\" frameborder=\"0\">',
						closable:true
				}).show();
  },
   removeTab:function(id)
  {
     this.remove(id,true);
  },
  socketInvoke:function(str)  //调用socket接口发送数据
  {
    thisMovie("banerdiv").socketInvoke(str);
  }
  
})

//子功能功能
FunctionMoudleItem=Ext.extend(Ext.tree.TreePanel,{
 constructor:function(_conf)
		  {
		  	   	if(_conf==null)
					_conf={};
					Ext.apply(this,_conf);
				 	FunctionMoudleItem.superclass.constructor.call(this,{
								containerScroll:true,
								animate:true,
								border:false,
								rootVisible:false,
								enableDD:true,
								root:new Ext.tree.AsyncTreeNode({
										 leaf:false,
										 children:this.MoudleItmes
								}),
								listeners:{
		                            "click":function(_node,event)
		                            {
		                            	Ext.getCmp('moudleID').openTab(_node);
		                            }
		                          }
							})
		  }
})

  var moudleloader=new Ext.tree.TreeLoader({
								             dataUrl:rootPath+'/sendisystem/listmoudletreenode.do'
								        })
AjaxFunctionMoudleItem=Ext.extend(Ext.tree.TreePanel,{
 constructor:function(_conf)
		  {
		      	if(_conf==null)
					_conf={};
					Ext.apply(this,_conf);
				 	AjaxFunctionMoudleItem.superclass.constructor.call(this,{
								containerScroll:true,
								animate:true,
								border:false,
								rootVisible:false,
								enableDD:true,
								loader:moudleloader,
							 	root:new Ext.tree.AsyncTreeNode({
									     text:'root',
										 leaf:false,
									 	 id:this.rootleafid
								}),
								listeners:{
		                            "click":function(_node,event)
		                            {
		                            	Ext.getCmp('moudleID').openTab(_node);
		                            },
		                            'beforeload':function(node)
		                            {      
		                            	    this.loader.baseParams.Treetext = node.text;
         								    this.loader.baseParams.Treeid=node.id;
         								   this.loader.baseParams.userpowerfilter='userpowerfilter'
		                            }
		                          
		                          }
							})
		  }
})



//功能模块总类
FunctionMoudle=Ext.extend(Ext.Panel,{
 constructor:function(_conf)
		  { 
		      	if(_conf==null)
					_conf={};
					Ext.apply(this,_conf);
				 	FunctionMoudle.superclass.constructor.call(this,{
				 	    scope:this,
				 	    title:this.MoudleTitle,
						autoScroll:true,
						border:false,
                        iconCls:'settings',
                        items:[new FunctionMoudleItem(_conf)]
                 	})
		  }
})

//ajax 获取
AjaxFuncitonMoudle=Ext.extend(Ext.Panel,{
 constructor:function(_conf)
		  { 
		      	if(_conf==null)
					_conf={};
					Ext.apply(this,_conf);
				 	AjaxFuncitonMoudle.superclass.constructor.call(this,{
				 	    
				 	    scope:this,
				 	    title:this.MoudleTitle,
						autoScroll:true,
						border:false,
                        items:[new AjaxFunctionMoudleItem(_conf)]
                 	})
		  }
})

 