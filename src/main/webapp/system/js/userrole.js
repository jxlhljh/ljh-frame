var functionid =""; //模块的id
var useroleid;
var opergrid; //按钮设置模块
var selectedTreeId = 0;
function getRootPath(){
 	 var strFullPath=window.document.location.href;
	 var strPath=window.document.location.pathname;
	 var pos=strFullPath.indexOf(strPath);
	 var prePath=strFullPath.substring(0,pos);
	 var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
	 return postPath;
 }
var rootPath=getRootPath();

function selected(_val,m,record){
    if(record.data['auth']=='T'){
    	m.css='x-grid-back-green';
    	return _val; 
    }else if(record.data['auth']=='F'){
    	return _val;
    }
}

var storeOper = new Ext.data.JsonStore({
	root: 'datas',
	totalProperty: 'totalCount',
	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
	fields: [ 'id','auth','operationcode','operationname','functionid'],
	url: fullpath+'/sysRoleOperationController.do?queryRoleOperation',
	remoteSort:true,
	listeners : {   
        'load' : function() {   
			for(var i=0; i<storeOper.getCount(); i++){  
				if(storeOper.getAt(i).data["auth"]=='T'){  
					opergrid.getSelectionModel().selectRow(i,true);  
		 		}     
			}  
        }   
    }   
});
var smOper=new Ext.grid.CheckboxSelectionModel({singleSelect:false});
var colmlOper=new Ext.grid.ColumnModel([
	smOper,
    {header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden :true},
    {header: "模块ID", width: 120, sortable: true, dataIndex: 'functionid',hidden:true},
    {header: "是否已选", width: 90, sortable: true,align:'center', dataIndex: 'auth',hidden:true},
    {header: "按钮名称", width: 180, sortable: true,align:'center', dataIndex:'operationname',renderer:selected},
    {header: "模块编码", width: 85, sortable: true,align:'center', dataIndex: 'operationcode',hidden:true}
]);
var toolbarOper = new Ext.Toolbar({
  	scope:this,height:25, items:[{
			text: "请点击'保存修改'按钮",
			handler:function(){}
	}]
});



Ext.onReady(function(){
	Ext.QuickTips.init();

	var parentidStore=new Ext.data.JsonStore({
    	root: 'data',
    	totalProperty: 'totalCount',
    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
  		fields: [ 'id','rolename'],
		url:rootPath+"/userRoleController.do?findParentidCombox",
		baseParams:{start:0, limit:5000}
    });	
    
    var parentid=new Ext.form.ComboBox({
		fieldLabel: '继承角色',
		mode:'remote',//'remote'
		allowBlank:false,
		readOnly:true,
		width: 100,
		anchor:'95%',
		store :parentidStore,
		name:'parentidForm',
		id:'parentidForm',
		hiddenName:'parentid',
		valueField : 'id',
    	displayField : 'rolename',
		triggerAction:'all'
	}); 
	parentidStore.load();
	
 	   /////////////grid
	var sm=new Ext.grid.CheckboxSelectionModel({
	singleSelect:false
 	});   
	var colml=new Ext.grid.ColumnModel([
	        new Ext.grid.RowNumberer(),
	        sm,
		    {id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden :true},
            {header: "角色名称", width: 20, sortable: true,  dataIndex: 'rolename'},
            {header: "角色描述", width: 20, sortable: true,  dataIndex: 'roledesc'},
            {header: "继承角色", width: 20, sortable: true,  dataIndex: 'parentname'},
            {header: "开始IP登录限制", width: 20, sortable: true, dataIndex: 'isvalidataip'},
            {header: "登录IP", width: 50, sortable: true, dataIndex: 'loginip'}
             ]
    );
    var store=new Ext.data.JsonStore({
    	root: 'data',
    	totalProperty: 'totalCount',
    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
  		fields: [ 'id','rolename','area','isvalidataip','loginip','parentid','parentname','roledesc','username'],
		url: rootPath+'/userRoleController.do?queryUserrole' ,
		remoteSort:true
    });
    
    //表格数据源控件添加加载前事件处理函数
    store.on('beforeload',function(sto,options){
    	options.params['parentid'] = selectedTreeId;
    });
    
    var pagebar=new Ext.PagingToolbar({
        pageSize:10,
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
        });
     
        /*
         *grid 的tar 
         */
    var rolenamefile= new Ext.form.TextField({
     	            id:'rolename',
                    xtype:'textfield',
                    name:'rolename',fieldLabel: '角色名'
                 });
    var theadbar=new Ext.Toolbar({
     scope:this,height:25,items:[ {
         text: ' 增 加 ',
        enableToggle: true,
         toggleHandler: function()
						 {
						    addwin.show();
						    var basicform=Ext.getCmp('addform').getForm();
						    basicform.reset();
						    basicform.url=rootPath+'/userRoleController.do?addUserrole';
						 },
        pressed: true
    },'-',{
         text: ' 修 改 ',
        enableToggle: true,
        toggleHandler: function()
			 {
			 		var _sm=grid.selModel;
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要修改记录，注意只能单选');
					    return;
					}
					if(sm.getCount()>1)
					{
					   Ext.Msg.alert('信息','每次只能修改一条记录,现取第一条选择的记录做修改');
					}
					 
					var selec_record=_sm.getSelected();
					var id=selec_record.get("id");
					Ext.Ajax.request({
				    url:rootPath+'/userRoleController.do?excutModifyQueryuserrole',
				    success:function(_response,_options){
				   	var obj=Ext.util.JSON.decode(_response.responseText);  //
				     var basicform=Ext.getCmp('addform').getForm();
				       addwin.show();
				   	   basicform.setValues(obj.datas);  //注意设置form值的语句需要在show函数后，因为此时的form还没有创建or Render
				   	   basicform.url=rootPath+'/userRoleController.do?excuteModifyuserrole'
 					},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','查询失败');
				    },
				   params: {id: id }
				});
  				 
			 },
        pressed: true
     },'-',{
        text: ' 删 除 ',
        enableToggle: true,
        toggleHandler: function()
            {
                    var _sm=grid.selModel;
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要删除记录');
					    return;
					}
				    var selec_record=_sm.getSelections();
				    var len=selec_record.length;
				    var id="'";
				    for(var leni=0;leni<len;leni++)
				    {
				    	if(leni==len-1)
				    	{
				    		id+=selec_record[leni].get("id")+"'";
				    	}
				    	else
				    	{
				    	 id+=selec_record[leni].get("id")+"','";
				    	}
				    }
				    Ext.MessageBox.confirm("提示","确认删除角色吗？",function(btn){  
						if(btn=="yes"){ 
					 		Ext.Ajax.request({
							    url:rootPath+'/userRoleController.do?excuteDeleteuserrole',
							    success:function(_response,_options){
							        Ext.Msg.alert('信息','删除成功');
							       store.load({params:{start:0, limit:25}});
							       parentidStore.load();
			 					},
							   failure: function()
							   {
							    Ext.Msg.alert('信息','查询失败');
							   },
							   params: {deleterecord: id }
							});
				 		}
					});
            },
        pressed: true
     }
     ,'-',{
        text: '关联用户',
        enableToggle: true,
        toggleHandler: function(){
      			var _sm=grid.selModel;
				if(_sm.getCount()==0)
				{
				    Ext.Msg.alert('信息','请选择需要关联的角色，注意只能单选');
				    return;
				}
				if(sm.getCount()>1)
				{
				   Ext.Msg.alert('信息','每次只能关联一个角色');
				   return ;
				}
				var selec_record=_sm.getSelected();
				useroleid=selec_record.get("id");
		       fromuserStore.reload({params:{start:0, limit:1000,querytype:'querynoselectuser',useroleid:useroleid}});
			   touserStore.reload({params:{start:0, limit:1000,querytype:'queryselectuser',useroleid:useroleid}});
        },
        pressed: true
     },'-',{
        text: '关联模块权限',
        enableToggle: true,
        toggleHandler: function(){
	     		var _sm=grid.selModel;
				if(_sm.getCount()==0)
				{
				    Ext.Msg.alert('信息','请选择需要关联的角色，注意只能单选');
				    return;
				}
				if(sm.getCount()>1)
				{
				   Ext.Msg.alert('信息','每次只能关联一个角色');
				   return ;
				}
				var selec_record=_sm.getSelected();
				useroleid=selec_record.get("id");
				powertreeLoder.dataUrl=rootPath+'/sysPowerController.do?generateSysPowerTree';
				powertreeroot.setText('模块信息');
				powertreewin.setTitle('');
				hostormodule='m';
				powertreeroot.reload();
				powertreePanel.expandAll();  
			    powertreewin.show();			    
        },
        pressed: true
     },'-',{
        text: '关联区域权限',
        enableToggle: true,
        toggleHandler: function(){
       				var _sm=grid.selModel;
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要关联的角色，注意只能单选');
					    return;
					}
					if(sm.getCount()>1)
					{
					   Ext.Msg.alert('信息','每次只能关联一个角色');
					   return ;
					}
					 
					var selec_record=_sm.getSelected();
					useroleid=selec_record.get("id");
					zonetreeroot.reload();
					userZoneTreePanel.expandAll();  
					zonetreewin.show();
        },
        pressed: true
     }/*{
        text: '关联设备权限',
        enableToggle: true,
        toggleHandler: function(){
       				 var _sm=grid.selModel;
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要关联的角色，注意只能单选');
					    return;
					}
					if(sm.getCount()>1)
					{
					   Ext.Msg.alert('信息','每次只能关联一个角色');
					   return ;
					}
					 
					var selec_record=_sm.getSelected();
					useroleid=selec_record.get("id");
					powertreeLoder.dataUrl=rootPath+'/sendisystem/generateSysHostPowerTree.do';
					powertreeroot.setText('设备信息');
					powertreewin.setTitle('设备权限关联树');
					hostormodule='h';
					powertreeroot.reload();
				    powertreewin.show();			    
        },
        pressed: true
     },'-','角色名','-',rolenamefile,*/
    	 ]
    });
    
    
    var grid=new Ext.grid.GridPanel({
    //	renderTo:"grid",
    	region:'center', 
        height:500,
        title:'角色管理',
        store: store,
        cm:colml,
     	sm:sm,
        trackMouseOver:false,
        disableSelection:true,
        loadMask: {msg:'正加载数据...'},
        viewConfig: {
            forceFit:true            
        },
        bbar:pagebar,
        tbar:theadbar
    });
    
    var loader=new Ext.tree.TreeLoader({ 
		id:'loader',
		//dataUrl:rootPath+"/role_xin/UserroleAction!treeQuery.do",
		name:'loader'
    	//listeners:{ 
	    //	"beforeload":function(treeLoader,node) { 
	    //		treeLoader.baseParams.treetime = Ext.getCmp('endTimeField').getValue();
	    //	} 
    	//}
    }); 
    
    
    var treerole = new Ext.tree.TreePanel({
	        region: 'west',
	        collapsible: true,
	        id:'tree',
	        name:'tree',
	        title: '角色继承关系',
	        width: 200,
	        autoScroll: true,
	        split: true,
	       	loader:loader,
	        rootVisible: false,
	        root : {
		        text:'角色',
				id:'0',
				expanded : true
		    },
	        expanded:true,
	        tools:[{
			    id:'refresh',
			    handler: function(event, toolEl, panel){
			      	var thistree = Ext.getCmp("tree");
			      	thistree.root.reload();
			      	//tree.root.expand(true,true);
			    }
			}],
	        listeners: {
	            click: function(n) {
    				if(n.attributes.id=="0") return;
    				selectedTreeId = n.attributes.id;
	            	store.load({params:{limit:50 ,start:0}});
	            }
	        }
	    });
	    
	    treerole.on('beforeload', function(node) {
	    	//alert(node.id);
                treerole.loader.dataUrl = rootPath+'/userRoleController.do?treeQuery&parentid=' + node.id; // 定义子节点的Loader
            });
    
	 var viewport = new Ext.Viewport({   //视图
           layout:'border',
           items:[treerole,grid]
        });   
	 grid.render();
	 store.load({params:{start:0, limit:25}});
 	      ////////service form 

	 
	   var addform={
	   	            usepurse:'addform', //用途,默认情况下是添加，也可以是modifyform
                    id:'addform',
                    xtype:'form',
                    url:rootPath+'/sendisystem/addUserrole.do',
                   layout:"column",
                   baseCls:"x-plain",
                   style:"padding:5px",
                   items:[{
                      columnWidth:.5,
                      layout:"form",
                      //labelWidth:50,
                      baseCls:"x-plain",
                      items:[{
		                    xtype:'textfield',
		                    name:'rolename',fieldLabel: '角色名', id:'rolename',
		                    allowBlank:false,
		                    anchor:'95%'
		                },{
		                    xtype:'textfield',
		                    name: 'roledesc',fieldLabel: '角色描述', id:'roledesc',
		                    anchor:'95%'
		                },{
		                    xtype:'textfield',
		                    name: 'area',fieldLabel: '地区', 
		                    anchor:'95%'
		                }]
                   },{
                     columnWidth:.5,
                     layout:"form",
                     baseCls:"x-plain",
		             items:[
		             	   {
		                    xtype:'checkbox',
		                    name: 'isvalidataip',fieldLabel: '是否IP登录限制',
		                    anchor:'95%'
		                },{
		                       xtype:'textfield',
		                       name: 'loginip',fieldLabel: '登录IP', id:'loginip', 
		                       anchor:'95%'
		                },parentid
		                 ,
		                {
		                    xtype:'hidden',
		                    name: 'id'
		                 }
		                ]
                   }]
                
                };
	   
	   //////// add window
	   
	 var addwin=new Ext.Window({
                     title:"增加/修改角色信息",
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         frame: true,
			         id:'addwind',
			         width: 500,
				     height:200,
				     layout:"form",
                     labelWidth:55,
                    items:[addform],
                showlock:false,
                buttons:[
                {
                 text:"确定",
                handler:function()
                {
                  if(  Ext.getCmp('addform').getForm().isValid())
                  {
                  	   Ext.getCmp('addform').getForm().submit({
                  						 
		                 		  		   waitTitle:"等待中.....",
		                 		 		   waitMsg:"正在提交数据，请稍.....",
		                 		 		   failure:function()
		                 		 		   {
		                 		 		   		  Ext.Msg.alert('信息', ' 操作失败，请检查服务器!');   
		                 		 		   		  addwin.hide();
		                 		 		   },
		                 		 		   success:function(_form,_action)
		                 		 		   {
		                 		 		   	    Ext.Msg.alert('信息', '操作成功!');
		                 		 		   	      addwin.hide();
		                 		 		   	    store.load({params:{start:0, limit:25}});
		                 		 		   	    parentidStore.load();
		                 		 		     //  Ext.getCmp('queryform').getForm().reset();
		                 		 	 	   }
		                 	 	 		 });
                  }
               
                }
                },
                	
                {
                 text:"取消",
                 handler:function()
                 {
                  addwin.hide();
                 }
                
                }
                
                ]
            });
	 
	
    ///////////////////
              var useroleid;
              var fromuserStore=new Ext.data.JsonStore({
							    	root: 'data',
							    	totalProperty: 'totalCount',
							    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
							  		fields: [ 'userid','username'],
									url:rootPath+"/sendisystem/QuerySelAndUnSelUser.do"
							    });
		  	  var touserStore=new Ext.data.JsonStore({
							    	root: 'data',
							    	totalProperty: 'totalCount',
							    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
							  		fields: [ 'userid','username'],
									url:rootPath+"/sendisystem/QuerySelAndUnSelUser.do"
							    });
		 
					        touserStore.on('load',function(_store, _records )
								    {
								    	   conjoinuserwin.show();
								    	     msForm.getForm().findField('useroleid').setValue(useroleid);
								    })
								    
								    
	 
    
     var msForm= new Ext.FormPanel({
   	       id:'joinuserform',
           xtype:'form',
           url:rootPath+'/sendisystem/addUserToUserrole.do',
           layout:"column",
           baseCls:"x-plain",
           style:"padding:5px",
           items:[
		 		 {
		            xtype:"itemselector",
		            name:"itemselector",
		            //fieldLabel:"ItemSelector",
		            hideLabel:true,
		            dataFields:["userid", "username"],
		            toData:[],
		            msWidth:250,
		            msHeight:230,
		            valueField:"userid",
		            displayField:"username",
		            imagePath:rootPath+"/page/common/MultiSelect/images/",
		            toLegend:"已选用户",
		            fromLegend:"可选用户",
		            fromStore:fromuserStore,
		            toStore:touserStore,
		            toTBar:[{
		                text:"清除所选",
		                handler:function(){
		                    var i=msForm.getForm().findField("itemselector");
		                    i.reset.call(i);
		                }
		            }],
		            fromTBar:[ '用户名',
		            {
		              xtype:'textfield',
		              name:'username',id:'username',
		              enableKeyEvents:true, 
		              listeners :{
		              'keyup':function()
		              {
		                fromuserStore.reload({params:{start:0, limit:1000,querytype:'querynoselectuser',useroleid:useroleid,username:this.getValue()}});
		        
		              }
		             } 
		             }
		             
		            ]
		        },
		         {
                    xtype:'hidden',
                    name: 'useroleid',id:'useroleid'
                 }
        	]
        });
    
    ////
    
    	   
	 var conjoinuserwin=new Ext.Window({
	             title:"角色关联用户",
			     bodyStyle:'padding:5px',
			     layout : 'fit',
			     closeAction :'hide',
			 	 plain: true,
		         frame: true,
		         id:'conjoinuserwin',
		         width: 550,
			     height:340,
			     layout:"form",
	             labelWidth:55,
	            items:[msForm],
	            showlock:false,
                buttons:[
                {
                 text:"确定",
                handler:function()
                {
                  if(  Ext.getCmp('joinuserform').getForm().isValid())
                  {
                  	   Ext.getCmp('joinuserform').getForm().submit({
                  		   
             		  		   waitTitle:"等待中.....",
             		 		   waitMsg:"正在提交数据，请稍.....",
             		 		   failure:function()
             		 		   {
             		 		   		  Ext.Msg.alert('信息', ' 操作失败，请检查服务器!');   
             		 		   		  conjoinuserwin.hide();
             		 		   },
             		 		   success:function(_form,_action)
             		 		   {
             		 		   	    Ext.Msg.alert('信息', '操作成功!');
             		 		   	   conjoinuserwin.hide();
             		 	 	   }
             	 	 		 });
                  }
               
                }
                },
                	
                {
                 text:"取消",
                 handler:function()
                 {
                  conjoinuserwin.hide();
                 }
                
                }
                
                ]
            });
            
            /////////////权限树
       var powerstring;   
       var hostormodule='m';
       var saveurl=rootPath+'/sendisystem/saveSyspower.do';
       var powertreeLoder=	new Ext.tree.TreeLoader({
             dataUrl:rootPath+'/sendisystem/generateSysPowerTree.do',
             uiProviders:{'col':Ext.ux.TreeCheckNodeUI}
        });
        
      var powertreeroot=new Ext.tree.AsyncTreeNode({
	         text:'模块信息',
			 id:-1
	         });
	         powertreeLoder.on("beforeload", function(treeLoader, node) {
	         powertreeLoder.baseParams.Treeid=node.id;
	        powertreeLoder.baseParams.useroleid=useroleid;
	  },powertreeLoder);   
 
       
	var tbar_powertreePanel = new Ext.Toolbar({
	    scope:this,
	    height:25,
	    items:[ {
		    	text:'保存模块权限',
		    	pressed: true,
		    	handler:function(){
            		powerstring="";
            		if(hostormodule=='m'){
                    	saveurl=rootPath+'/sysPowerController.do?saveSyspower';
                    }
                    else{
            			saveurl=rootPath+'/sysPowerController.do?saveSysHostpower';
            		}
          			IteratorTreeNodes(powertreeroot);
       				Ext.Ajax.request({
		    			url:saveurl,
		    			success:function(_response,_options){
			     			Ext.Msg.alert('信息','操作成功');
				     			powertreewin.hide();
 							},
				   			failure: function(){ 
				     			Ext.Msg.alert('信息','操作失败');
			    		},
		   				params: {powerstring: powerstring,useroleid:useroleid}
					});
        		}
			}
		]
	});
	var powertreePanel=new Ext.tree.TreePanel({
		id: 'tree-panel',
        height: 250,
        width:300,
        minSize: 150,
        autoScroll: true,
        rootVisible:true,
        lines: true,
        singleExpand: false,
        useArrows: true,
        loader:powertreeLoder,
        root: powertreeroot,
	   	tbar:tbar_powertreePanel,
        listeners : {  //点击节点，右边panel显示模块的按钮内容
        	'click':function(node,e){
				functionid = node.attributes.id;//alert(functionid+"  "+useroleid);
				opergrid.setTitle('('+node.attributes.text+')按钮权限设置');
				storeOper.load({params:{functionid: functionid,useroleid:useroleid}});
	 		}  
    	}  
	});
 
    var tbar_opergrid = new Ext.Toolbar({
	    scope:this,
	    height:25,
	    items:[ {
		    	text:'保存按钮权限',
		    	pressed: true,
				handler:function(){
	    			if(functionid=="") {Ext.Msg.alert('信息','未选择模块');return;}
	    			var s = opergrid.getStore().getCount();
	    			if(s==0) {Ext.Msg.alert('信息','没发现可设置的按钮');return;}

	    			var _sm = opergrid.selModel;
				    var selec_record=_sm.getSelections();
				    var len = selec_record.length;
				    var operationCodes="";
				    for(var leni=0;leni<len;leni++){
				    	if(leni==len-1){
				    		operationCodes+=selec_record[leni].get("operationcode");
				    	}else{
				    	 	operationCodes+=selec_record[leni].get("operationcode")+",";
				    	}
				    }
				    //alert(operationCodes+"_"+functionid+"_"+useroleid);
			    	Ext.Ajax.request({
				    	url:fullpath+'/sysRoleOperationController.do?saveRoleOperation',
				    	success:function(_response,_options){
				        	Ext.Msg.alert('信息','按钮权限设置成功');
								storeOper.load({params:{functionid: functionid,useroleid:useroleid}});
	 					},
					   	failure: function() {
					    	Ext.Msg.alert('信息','保存失败');
				   		},
				   		params: {operationcode:operationCodes,functionid:functionid,useroleid:useroleid }
					});
				}
			}
		]
	});
    opergrid = new Ext.grid.GridPanel({
    	title:'按钮权限设置',
    	region: 'center',
	    layout : 'fit',
	    store: storeOper,
		cm:colmlOper,
		sm:smOper,
	    trackMouseOver:false,
	    loadMask: {msg:'正加载数据...'},
	    forceFit:false ,
	   	tbar:tbar_opergrid
	});
         
          var powertreewin=new Ext.Window({
	       		title:"",
			     bodyStyle:'padding:5px',
			     layout : 'border',
			     closeAction :'hide',
			 	 plain: true,
		         frame: true,
		         id:'powertreewin',
		         width: 600,
			     height:410,
				items:[{
	             	title:"模块权限关联树",
					xtype:'panel',
		    	   	region:'center',
		    	   	layout:'fit',
		         	width: 390,
	    	  	   	items:[powertreePanel]
				},{
		    	  	xtype:'panel',
		    	   	region:'east',
		    	   	layout:'fit',
		    	   	id:'operationSet',
		         	width: 210,
		    	   	items:[opergrid]
		       }]
            });
            
            
            var zonetreeLoder=	new Ext.tree.TreeLoader({
           		 url:fullpath+'/userZoneController.do?generateRoleZonePowerTree',
            	 uiProviders:{'col':Ext.ux.TreeCheckNodeUI}
		        });
		        
		    var zonetreeroot=new Ext.tree.AsyncTreeNode({
		         text:'全国',
				 id:'-1',
				 icon:fullpath+'/icons/home_page_icon/home.gif'
		         });
		         zonetreeLoder.on("beforeload", function(treeLoader, node) {
		         zonetreeLoder.baseParams.Treeid=node.id;
		         zonetreeLoder.baseParams.zonecode=node.id;
		         zonetreeLoder.baseParams.zonelevel=node.leaf;
		         zonetreeLoder.baseParams.useroleid=useroleid;
		    },zonetreeLoder); 
            
            var  userZoneTreePanel = new Ext.tree.TreePanel({
						id: 'userZoneTreePanel',
				        height: 250,
				        width:300,
				        minSize: 150,
				        autoScroll: true,
				        rootVisible:true,
				        lines: true,
				        singleExpand: false,
				        useArrows: true,
				        loader:zonetreeLoder,
				        root: zonetreeroot
					});
            
            var zonetreewin=new Ext.Window({
            	title:"关联区域权限信息",
			    bodyStyle:'padding:5px',
			    layout : 'fit',
			    closeAction :'hide',
			    plain: true,
		        frame: true,
		        border:false,
		        id:'zonetreewin',
		        width: 500,
			    height:300,
			    items:userZoneTreePanel,
			    buttons:[{
                 	text:"确定",handler:function(){
			                 		powerstring="";
			                 		IteratorTreeNodes(zonetreeroot);
			                 		//alert(powerstring+"**"+useroleid);
			           				Ext.Ajax.request({
						    			url:fullpath+'/userZoneController.do?saveUserZonePower',
						    			success:function(_response,_options){
							     			Ext.Msg.alert('信息','操作成功');
							     			zonetreewin.hide();
			 							},
							   			failure: function(){ 
							     			Ext.Msg.alert('信息','操作失败');
							     			zonetreewin.hide();
							    		},
						   				params: {powerstring: powerstring,useroleid:useroleid}
									});
                 	}
                 },{
                 	text:"取消",handler:function(){
                  		zonetreewin.hide();
                 	}
                 }]
            });
            
            /*
             * 迭代树节点，获取被选中的树节点
             */
            function  IteratorTreeNodes(node)
            {
       			  if (node.childNodes)
            	     {
            	     Ext.each(node.childNodes, function(child) {
                       if(child.attributes.checked=='all'||child.attributes.checked=='part')
            	   	  {
            	   	    powerstring+=child.id+"-"+child.attributes.checked+",";
            	   	   
            	   	    if(child.childNodes!=null&&child.childNodes.length>0)
            	   	    {
            	   	    	 IteratorTreeNodes(child);
            	   	    }
            	   	  }
                              
                   }, node);
            	     	
            	 }
             }
})