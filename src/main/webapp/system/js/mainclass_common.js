Ext.namespace("com.sendi.system.maincommon");

var theSelectedDeviceTreeNode;

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
 
 var firstLoad = true;
 var powerstring = '';
  
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
				                   			 height:this.northHeight==null?65:this.northHeight
				                   			 
               								 }),
               		 
		               /*		 {
						        region: 'south',
						        title:this.southTitle==null? 'Information':this.southTitle,
						        collapsible: false,
						        split: false,
						        height: 7,
						        minHeight: 7
					   		 },*/
					   
					        {
								id: 'content-panel',
								region: 'center', 
								layout: 'card',
								margins: '30 0 0 0',
								activeItem: 0,
								border: true,
								frame:true,
						        tabPosition: 'bottom',
								items: this.moudletab
					     	},{
								region : 'east',
								layout : 'fit',
								width:200,
								margins: '30 0 5 0',
								border:true,
								hidden : true,//默认隐藏，靠functionmoudle里面的dependtree字段来控制
								collapsible :true,
								title: '设备管理树',
								id : 'device_tree',
								tools : [{
											id : 'refresh',
											handler : function (event,toolEl,panel,tc){
												panel.getComponent(0).getComponent(0).root.reload();//刷新树形面板的数据
											}											
										}],
								items:[
									new Ext.TabPanel({
										activeTab: 0,
										tabPosition : 'bottom',
								    	items:[
								        	new MyTreePanel()
								    	]
									})
								]
					     	}
				 	  ]
					 
					});
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
							 tabPosition: 'bottom',
							defaults: {bodyStyle: 'padding:0px', autoScroll: true},
							items:[{
								id: sendi_sys_config_para.sendi_system_overviewname,
								title: '总览' 
							}]
				  	});
				  	
				  	//修改切换下面的tab时右边设备树不变化的bug
				  	this.on("tabchange",function(_activeTabNode){
				  		if(_activeTabNode.getActiveTab().title!='总览'){
				  			firstLoad = false;//刚进系统时不需要处理，提升性能
				  		}
				  		
				  		if(firstLoad==false){
				  			if(!_activeTabNode.getActiveTab().isdependtree){//不需要依耐设备树情况，将树隐藏
								Ext.getCmp("device_tree").hide();
							}else if(firstLoad==false){
								Ext.getCmp("device_tree").show();//需要依耐设备树情况，将树显示
							}
							_activeTabNode.ownerCt.ownerCt.doLayout();//刷新
				  		}
				  		
				  	});
		  },
  openTab:function(_node)
  {
  			var _dependtree = _node.id != 'overview' && _node.dependtree == 'on';   //为false则不需要设备树
  	        if(_node.leaf)
  	        {
  	       	   if (this.findById(_node.id + '') != null) {
					this.findById(_node.id + '').show();
				} else {
					this.add({
						id: _node.id + '',
						isdependtree:_dependtree,
						title: _node.text,
						html: '<iframe id=\"'+_node.moudleid+'\" name=\"'+_node.moudleid+'\"  src=\"' +_node.openurl+ '\" width=\"100%\" height=\"100%\" frameborder=\"0\">',
						closable:true
					}).show();
				}
				
				if(!_dependtree){//不需要依耐设备树情况，将树隐藏
					this.ownerCt.ownerCt.getComponent("device_tree").hide();
				}else{
					this.ownerCt.ownerCt.getComponent("device_tree").show();//需要依耐设备树情况，将树显示
				}
				this.ownerCt.ownerCt.doLayout();//刷新
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

 
//子功能功能
 
/***************右边设备树列表******************************************/
MyTreePanel = Ext.extend(Ext.tree.TreePanel , {
	zonetreeroot:null,
	constructor:function(){
		
		var zonetreeLoder=	new Ext.tree.TreeLoader({
      		 url:fullpath+'/userZoneController.do?loadRightDevTree',
      		 uiProviders:{'col':Ext.ux.TreeCheckNodeUI}
	        });
		
		zonetreeroot=new Ext.tree.AsyncTreeNode({
	         text:'根结点',
			 id:'-1',
			 icon:fullpath+'/icons/home_page_icon/home.gif'
	         });
	         zonetreeLoder.on("beforeload", function(treeLoader, node) {
	         zonetreeLoder.baseParams.zonecode=node.id;
	         zonetreeLoder.baseParams.isleaf=node.leaf;
	    },zonetreeLoder);
	         
		MyTreePanel.superclass.constructor.call(this , {
		      	id: 'device-tree-panel',
		      	title : '设备管理树',
		        containerScroll:true,
				animate:true,
				border:false,
				rootVisible:false,
				enableDrag:false,
				enableDD:false,
				autoScroll : true,
				root : zonetreeroot,
				loader : zonetreeLoder
		}) ;
		
		theSelectedDeviceTreeNode = this;	
	},
	getCheckedNodes:function(){
		powerstring = '';
		var node = zonetreeroot;
		iteratorNode(node);
   		return powerstring;
	}
}) ;

function iteratorNode(node){
	/*
     * 迭代树节点，获取被选中的树节点
     */
			  if (node.childNodes)
   	     {
    	     Ext.each(node.childNodes, function(child) {
               if(child.attributes.checked=='all'||child.attributes.checked=='part')
    	   	  {
    	   	    powerstring+=child.id+"-"+child.attributes.checked+",";
    	   	    if(child.childNodes!=null&&child.childNodes.length>0)
    	   	    {
    	   	    	iteratorNode(child);
    	   	    }
    	   	  }
           }, node);
    	     	
    	 }
}
 