Ext.namespace("com.sendi.system.maincommon");

var theSelectedDeviceTreeNode='';

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
 
/***************左边列表******************************************/
MyTreePanel = Ext.extend(Ext.tree.TreePanel , {
	constructor:function(){
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
				root : new Ext.tree.AsyncTreeNode({
				         text:'广东省',
						 id:'-1',
						 checked : false,
						 expanded : true
				       }),
				loader : new Ext.tree.TreeLoader({
					         dataUrl:fullpath+'/listUserZoneTree.do',
					         listeners:{ 
						        "beforeload":function(treeLoader,node) { 
								 				//treeLoader.baseParams.node_id=node.id;
								 				treeLoader.baseParams.zonecode=node.id;
						        },
						        "load":function(treeLoader,node) { 
						        	var childNodes = node.childNodes;
						        	if(node.getUI().checkbox){
							        	for(var i=0;i<childNodes.length;i++){
							        		if(node.getUI().checkbox.checked){
							        			childNodes[i].getUI().checkbox.checked = true;
							        			childNodes[i].getUI().addClass('node_checked');
							        		}else{
							        			childNodes[i].getUI().checkbox.checked = false;
							        			childNodes[i].getUI().removeClass('node_checked');
							        		}
							        		
							        	}
						        	}
						        }
					       	}
					})
		}) ;
		
		//绑定选中状态变更事件,增加化横线的效果
		this.on('checkchange', function(node, checked) {
				if (checked) {
					node.getUI().addClass('node_checked');
				} else {
					node.getUI().removeClass('node_checked');
				}

			});
			
		theSelectedDeviceTreeNode=this;
		// 为TreeNode对象添加级联父节点和子节点的方法
		Ext.apply(Ext.tree.TreeNode.prototype, {
					cascadeParent : this.cascadeParent,
					cascadeChildren : this.cascadeChildren
				});
		// Checkbox被点击后级联父节点和子节点
		Ext.override(Ext.tree.TreeEventModel, {
					onCheckboxClick : Ext.tree.TreeEventModel.prototype.onCheckboxClick.createSequence(function(e, node) {
								node.cascadeParent();
								node.cascadeChildren();
							})
				});
	},
	cascadeParent : function(){
		var pn = this.parentNode;
		//if (!pn || !this.getUI().checkbox.checked)
			//return;
		if (this.attributes.checked) {// 级联选中
			pn.getUI().toggleCheck(true);
		} else {// 级联未选中
			var b = true;
			if (pn!=null&&pn.hasChildNodes()) {
				//alert(pn.childNodes.length);
			    for (var i = 0; i < pn.childNodes.length; i++) {
			        //alert(pn.childNodes[i].getUI().checkbox.checked);
			    	if(pn.childNodes[i].getUI().checkbox.checked){
			    		 b = false;
			    	}
			    }
			}
			
			/*Ext.each(pn.childNodes, function(n) {
						if (n.getUI().isChecked()) {
							return b = false;
						}
						return true;
					});*/
			if (b&&pn!=null){
				//alert(b);
				pn.getUI().toggleCheck(false);  	
			}
			
				
		}
		if(pn!=null)
			pn.cascadeParent();
	},
	cascadeChildren : function(){
		var ch = this.attributes.checked;
		//if (!Ext.isBoolean(ch))
			//return;
		Ext.each(this.childNodes, function(n) {

					n.getUI().toggleCheck(ch);
					n.cascadeChildren();
				});
	}
}) ;
 