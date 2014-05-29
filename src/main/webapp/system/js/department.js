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
function  renderdptsts(_value)
{
	if(_value=='active')
	{
		return '有效';
	}
	else
	{
		return '无效';
	}
}
function  renderdptp(_value)
{
	if(_value=='dept')
	{
		return '部门';
	}
	else
	{
		return '组';
	}
}

Ext.onReady(function(){
     var clickleafid=-1;	 
      var dpttreeLoder=new Ext.tree.TreeLoader({
             dataUrl:fullpath+'/sendisystem/listdpttree.do'
        });
    var 	dpttreeroot=new Ext.tree.AsyncTreeNode({
         text:'用户组',
		 id:-1
         });
         
 
   var  dpttreePanel=new Ext.tree.TreePanel({
      	id: 'tree-panel',
    	title: '用户组',
        renderTo:"treediv",
         bodyStyle: 'padding-bottom:15px;background:#eee;',
        split: true,
        height: 500,
        minSize: 150,
        autoScroll: true,
        rootVisible:true,
        lines: true,
        singleExpand: false,
        useArrows: true,
        loader:dpttreeLoder,
        root: dpttreeroot
         }); 
         
     
    dpttreePanel.on("beforeload", function(node) {
          dpttreeLoder.baseParams.Treetext = node.text;
          dpttreeLoder.baseParams.Treeid=node.id;
    }); 
    
    
   dpttreePanel.on("click",function(Node,checked ){
   	     clickleafid=Node.id;
   	     store.reload({params:{start:0, limit:25,clickleafid:Node.id,reloadflag:'yes'}})
   },dpttreePanel);
   
   //////////
   
   	var sm=new Ext.grid.CheckboxSelectionModel({
	singleSelect:false
 	});   
	var colml=new Ext.grid.ColumnModel([
	        new Ext.grid.RowNumberer(),
	        sm,
		    {id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden :true},
            {header: "用户组名称", width: 20, sortable: true,  dataIndex: 'departname'},
            {header: "用户组编码", width: 20, sortable: true, dataIndex: 'departcode'},
            {header: "用户组类型", width: 20, sortable: true, dataIndex: 'departtype',renderer :renderdptp},
            {header: "用户组状态", width: 20, sortable: true, dataIndex: 'departstatus',renderer :renderdptsts},
            {header: "所属城市", width: 20, sortable: true, dataIndex: 'departarea'}
         
            ]
    );
    var store=new Ext.data.JsonStore({
    	root: 'data',
    	totalProperty: 'totalCount',
    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
  		fields: [ 'id','departname','departcode','departtype','departstatus','departarea'],
		url: rootPath+'/sendisystem/dptInit.do' ,
		remoteSort:true
    });
     var pagebar=new Ext.PagingToolbar({
        pageSize:10,
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
        });
    
     
    var departtypestore=new Ext.data.SimpleStore({
             fields: ['departtype', 'departtypetxt'],
             data :  [['dept', '部门'],['group', '组']]
        });

   var departtypecb=new Ext.form.ComboBox({
     anchor:'95%',
     fieldLabel: '用户组类型',
     mode:'local',
     displayField:'departtypetxt',
     valueField:'departtype',
     store :departtypestore,
     name:'departtype',
     hiddenName:'departtype',
     triggerAction:'all'
   }); 
   
    var departstatusstore=new Ext.data.SimpleStore({
             fields: ['departstatus', 'departstatustxt'],
             data :  [['active', '有效'],['na', '无效']]
        });

   var departstatuscb=new Ext.form.ComboBox({
     anchor:'95%',
     fieldLabel: '用户组状态',
     mode:'local',
     displayField:'departstatustxt',
     valueField:'departstatus',
     store :departstatusstore,
     name:'departstatus',
     hiddenName:'departstatus',
      triggerAction:'all'
   }); 
   
   
   
  
        	   var addform={
	   	            usepurse:'addform', //用途,默认情况下是添加，也可以是modifyform
                    id:'addform',
                    xtype:'form',
                    url:rootPath+'/sendisystem/addDepartment.do',
                   layout:"column",
                   baseCls:"x-plain",
                   style:"padding:5px",
                   items:[{
                      columnWidth:.5,
                      layout:"form",
                      labelWidth:70,
                      baseCls:"x-plain",
                      items:[{
		                    xtype:'textfield',
		                    name:'departname',fieldLabel: '用户组名称', id:'departname',
		                    allowBlank:false,
		                    anchor:'95%'
		                }, {
		                     xtype:'textfield',
		                     name: 'departarea',fieldLabel: '用户组城市',id:'departarea',
		                     anchor:'95%'
		                },departstatuscb]
                   },{
                     columnWidth:.5,
                     layout:"form",
                      labelWidth:90,
                     baseCls:"x-plain",
		             items:[
		             	  {
		                    xtype:'textfield',
		                    name: 'departcode',fieldLabel: '用户组编码',
		                    anchor:'95%'
		                },departtypecb,
		                {
		                     xtype:'textarea',
		                     name: 'departdesc',fieldLabel: '用户组描述',id:'departdesc',
		                     anchor:'95%'
		                }
		                ,
		                {
		                    xtype:'hidden',
		                    name: 'id'
		                 },
		                 {
		                    xtype:'hidden',
		                    name: 'parentid',
		                    id:'parentid'
		                 }
		                ]
                   }]
                
                };
	   
	   //////// add window
	   
	 var addwin=new Ext.Window({
                     title:"增加/修改用户组信息",
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         frame: true,
			         id:'addwind',
			         width: 500,
				     height:250,
				     layout:"form",
                     labelWidth:55,
                    items:[addform],
                showlock:false,
                buttons:[
                {
                 text:"确定",
                handler:function()
                {
                	  var basicform=Ext.getCmp('addform').getForm();
                  if( basicform.isValid())
                  {
                  	   basicform.findField('parentid').setValue(clickleafid);
                  	   basicform.submit({
                  						 
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
		                 		 		   	    store.load({params:{start:0, limit:25,clickleafid:clickleafid,reloadflag:'yes'}});
		                 		 		        dpttreeroot.reload();
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
            
        var departnamefield= new Ext.form.TextField({
     	            id:'departname',
                    xtype:'textfield',
                    name:'departname',fieldLabel: '用户组名称'
                 });  
                      ///////////////////
              var dptid;
              var fromuserStore=new Ext.data.JsonStore({
							    	root: 'data',
							    	totalProperty: 'totalCount',
							    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
							  		fields: [ 'userid','username'],
									url:rootPath+"/sendisystem/querySltandUnSltUser.do"
							    });
		  	  var touserStore=new Ext.data.JsonStore({
							    	root: 'data',
							    	totalProperty: 'totalCount',
							    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
							  		fields: [ 'userid','username'],
									url:rootPath+"/sendisystem/querySltandUnSltUser.do"
							    });
		 
					    	    touserStore.on('load',function(_store, _records )
								    {
								    	    conjoinuserwin.show();
								    	     msForm.getForm().findField('dptid').setValue(dptid);
								    })
								    
								    
								    
								    
	 
    
     var msForm= new Ext.FormPanel({
	   	            id:'joinuserform',
                    xtype:'form',
                    url:rootPath+'/sendisystem/addUserToDepartment.do',
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
							                fromuserStore.reload({params:{start:0, limit:1000,querytype:'querynoselectuser',dptid:dptid,username:this.getValue()}});
							        
							              }
							             } 
							             }
							             
							            ]
							        },
							         {
					                    xtype:'hidden',
					                    name: 'dptid',id:'dptid'
					                 }
                ]
                
                });
	   
    
    ////
    
    	   
	 var conjoinuserwin=new Ext.Window({
                     title:"关联用户",
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
					    
					    
            
            /////////////////
   var actionbar=new Ext.Toolbar({
      scope:this,height:25, items:[
					            {
					              xtype:'button',
					              text:'增加',
					                enableToggle: true,
					                 pressed: true,
					              	 handler:function()
									 {
									 	
									    addwin.show();
									    var basicform=Ext.getCmp('addform').getForm();
									    basicform.reset();
									    basicform.url=rootPath+'/sendisystem/addDepartment.do';
									 }
					            	
					            },'-',
					               {
					               		 xtype:'button',
							 	        text:'修改',
							 	      enableToggle: true,
					                  pressed: true,
										 handler:function()
										 {
										 		var _sm=datagrid.selModel;
												if(_sm.getCount()==0)
												{
												    Ext.Msg.alert('信息','请选择需要修改记录，注意只能单选');
												    return;
												}
												if(sm.getCount()>1)
												{
												   Ext.Msg.alert('信息','每次只能修改一条记录,现取第一条选择的记录做修改');
												   return;
												}
												 
												var selec_record=_sm.getSelected();
												var id=selec_record.get("id");
												Ext.Ajax.request({
											    url:rootPath+'/sendisystem/excutModifyQuerydpt.do',
											    success:function(_response,_options){
											   	var obj=Ext.util.JSON.decode(_response.responseText);  //
											   	
											      var basicform=Ext.getCmp('addform').getForm();
											       addwin.show();
											   	   basicform.setValues(obj.datas);  //注意设置form值的语句需要在show函数后，因为此时的form还没有创建or Render
											      basicform.url=rootPath+'/sendisystem/excuteModifydpt.do'
											     },
											   failure: function()
											   {
											    Ext.Msg.alert('信息','查询失败');
											    },
											   params: {id: id }
											});
							  				 
										 }
							 	    },'-',
									   {
							            text: '删除',
							               enableToggle: true,
					                 pressed: true,
							            handler:function()
							            {
							                    var _sm=datagrid.selModel;
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
										 		Ext.Ajax.request({
											    url:rootPath+'/sendisystem/excuteDeletedpt.do',
											    success:function(_response,_options){
											        Ext.Msg.alert('信息','删除成功');
											           store.load({params:{start:0, limit:25,clickleafid:clickleafid,reloadflag:'yes'}});
											         moudeltreeroot.reload();
							 					},
											   failure: function()
											   {
											    Ext.Msg.alert('信息','查询失败');
											   },
											   params: {deleterecord: id }
											});
												
												
							            }
							        },'-', {
						        text: '关联用户',
						        enableToggle: true,
						         toggleHandler: function(){
						       				 var _sm=datagrid.selModel;
											if(_sm.getCount()==0)
											{
											    Ext.Msg.alert('信息','请选择需要关联的机构，注意只能单选');
											    return;
											}
											if(sm.getCount()>1)
											{
											   Ext.Msg.alert('信息','每次选择只能关联一个机构');
											   return ;
											}
											 
											var selec_record=_sm.getSelected();
											dptid=selec_record.get("id");
										 
									       fromuserStore.reload({params:{start:0, limit:1000,querytype:'querynoselectuser',dptid:dptid}});
										   touserStore.reload({params:{start:0, limit:1000,querytype:'queryselectuser',dptid:dptid}});
													    
							    
						        },
						        pressed: true
						     },
     
							        departnamefield,'-',{
									     'text':' 查 询 ',
									       enableToggle: true,
									        cls: 'x-btn-icon',
									       toggleHandler: function()
												 {
												  	Ext.Ajax.request({
														    url:rootPath+'/sendisystem/querydepartment.do',
														    success: function()
											                 		 		   {
											                 		 		   	  
											                 		 		   	   Ext.Msg.alert('信息', '查询成功!');
											                 		 		   	   store.load({params:{start:0, limit:25}});
											                 		 		    
											                 		 	 	   },
														   failure:  function()
																   {
																    Ext.Msg.alert('信息','查询失败');
																   },
														    
														   params: {departname:departnamefield.getValue()}
														});
									 
												 },
									        pressed: true
									    
									    }
					            ]
					            
   })     
    var datagrid=new Ext.grid.GridPanel({
     	renderTo:"grid",
        height:500,
        title:'用户组管理',
        store: store,
        cm:colml,
     	sm:sm,
       region:'center',
        trackMouseOver:false,
        disableSelection:true,
        loadMask: {msg:'正加载数据...'},
        viewConfig: {
            forceFit:true            
        },
        bbar:pagebar,
       tbar:actionbar
     });
    
  
 
					    

 
  
})