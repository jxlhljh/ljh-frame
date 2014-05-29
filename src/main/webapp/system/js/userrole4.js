Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '../ext4/ux');

Ext.require([
    'Ext.ux.form.MultiSelect',
    'Ext.ux.form.ItemSelector'
]);
 

    
 var useroleid;
 var conjoinuserwin;
 var msForm;
  var ds;
 
   var store=new Ext.data.JsonStore({
   		fields: [ 'id','rolename','area','isvalidataip','loginip'],
    	remoteSort:true,
    	proxy:{
			type: 'ajax', 
        	url: fullpath+'/sendisystem/userroleInit.do' ,
			reader: { 
           		root: 'data', 
            	totalProperty  : 'totalCount' 
       		}
		}
    });

   var fromuserStore=new Ext.data.JsonStore({
   		fields: [ 'userid','username'],
    	remoteSort:true,
    	proxy:{
			type: 'ajax', 
        	url:fullpath+"/sendisystem/QuerySelAndUnSelUser.do",
			reader: { 
           		root: 'data', 
            	totalProperty  : 'totalCount' 
       		}
		}
    });

   var touserStore=new Ext.data.JsonStore({
   		fields: [ 'userid','username'],
    	remoteSort:true,
    	proxy:{
			type: 'ajax', 
        	url:fullpath+"/sendisystem/QuerySelAndUnSelUser.do",
			reader: { 
           		root: 'data', 
            	totalProperty  : 'totalCount' 
       		}
		}
    }); 
    

    

    
  
 touserStore.on('load',function(_store, _records ){
		conjoinuserwin.show();
	 	Ext.getCmp('joinuserform').getForm().findField('useroleid').setValue(useroleid);
	})
 				        
 
  var sm=Ext.create("Ext.selection.CheckboxModel",{allowDeselect:true});  
  var rownumberer= {xtype:'rownumberer',text: "",width: 2, sortable: false } ;
  var colml=[
		    {id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden :true},
            {header: "角色名称", width: 20, sortable: true,  dataIndex: 'rolename'},
            {header: "区域", width: 20, sortable: true, dataIndex: 'area'},
            {header: "开始IP登录限制", width: 20, sortable: true, dataIndex: 'isvalidataip'},
            {header: "登录IP", width: 20, sortable: true, dataIndex: 'loginip'}
            ];
    var pagebar=Ext.create('Ext.toolbar.Paging',{
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
       });
                   
Ext.onReady(function(){
 
	Ext.QuickTips.init();
        
    var rolenamefile= {id:'rolename',xtype:'textfield',name:'rolename',fieldLabel: '角色名'};
    var theadbar=Ext.create('Ext.toolbar.Toolbar',{
     scope:this,height:25,items:[ {
         text: ' 增 加 ',
         enableToggle: true,
         toggleHandler: function()
						 {
						    addwin.show();
						    var basicform=Ext.getCmp('addform').getForm();
						    basicform.reset();
						    basicform.url=fullpath+'/sendisystem/addUserrole.do';
						 },
        pressed: true
    },'-',{
         text: ' 修 改 ',
        enableToggle: true,
      
        toggleHandler: function()
			 {
			 		var _sm=grid.getSelectionModel();
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要修改记录，注意只能单选');
					    return;
					}
					if(sm.getCount()>1)
					{
					   Ext.Msg.alert('信息','每次只能修改一条记录');
					   return;
					}
					 
					var selec_record=_sm.getSelection();
					addwin.show();
					var basicform=Ext.getCmp('addform').getForm();
				  	basicform.loadRecord(selec_record[0]);
				 	basicform.url=fullpath+'/sendisystem/excuteModifyuserrole.do'
			 },
        pressed: true
     },'-',{
     
        text: ' 删 除 ',
        enableToggle: true,
       
        toggleHandler: function()
            {
                    var _sm=grid.getSelectionModel();
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要删除记录');
					    return;
					}
				    var selec_record=_sm.getSelection();
				    var len=selec_record.length;
				    var id="";
				    for(var leni=0;leni<len;leni++)
				    {
				    	
				    	if(leni==len-1)
				    	{
				    		id+=selec_record[leni].get("id");
				    	}
				    	else
				    	{
				    	 id+=selec_record[leni].get("id")+",";
				    	}
				    }
			 		Ext.Ajax.request({
				    url:fullpath+'/sendisystem/excuteDeleteuserrole.do',
				    success:function(_response,_options){
				        Ext.Msg.alert('信息','删除成功');
				       store.load({params:{start:0, limit:25}});
 					},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','查询失败');
				   },
				   params: {deleterecord: id }
				});
					
					
            },
        pressed: true
     }
     ,'-',{
        text: '关联用户',
        enableToggle: true,
   
        toggleHandler: function(){
       				 var _sm=grid.getSelectionModel();
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要关联的角色，注意只能单选');
					    return;
					}
					if(_sm.getCount()>1)
					{
					   Ext.Msg.alert('信息','每次只能关联一个角色');
					   return ;
					}
					 
					var selec_record=_sm.getSelection();
					
					useroleid=selec_record[0].get("id");
				 
			       fromuserStore.load({params:{start:0, limit:1000,querytype:'querynoselectuser',useroleid:useroleid}});
				   touserStore.load({params:{start:0, limit:1000,querytype:'queryselectuser',useroleid:useroleid}});
				 		    
							    
					
        
        },
        pressed: true
     },'-','-',{
        text: '关联模块权限',
        enableToggle: true,
        toggleHandler: function(){
       			/*	 var _sm=grid.selModel;
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
					powertreeLoder.dataUrl=fullpath+'/sendisystem/generateSysPowerTree.do';
					powertreeroot.setText('模块信息');
					powertreewin.setTitle('模块权限关联树');
					hostormodule='m';
					powertreeroot.reload();
				    powertreewin.show();			    
							    
				*/	
        
        },
        pressed: true
     },'-',{
        text: '关联设备权限',
        enableToggle: true,
        toggleHandler: function(){
       				/* var _sm=grid.selModel;
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
					powertreeLoder.dataUrl=fullpath+'/sendisystem/generateSysHostPowerTree.do';
					powertreeroot.setText('设备信息');
					powertreewin.setTitle('设备权限关联树');
					hostormodule='h';
					powertreeroot.reload();
				    powertreewin.show();			    
							    
					*/
        
        },
        pressed: true
     },'-',rolenamefile,{
     'text':' 查 询 ',
       enableToggle: true,
        toggleHandler: function()
			 {
			  	Ext.Ajax.request({
					    url:fullpath+'/sendisystem/queryUserrole.do',
					    success: function()
		                 		 		   {
		                 		 		   	  
		                 		 		   	   Ext.Msg.alert('信息', '查询成功!');
		                 		 		   	   store.load({params:{start:0, limit:25}});
		                 		 		    
		                 		 	 	   },
					   failure:  function()
							   {
							    Ext.Msg.alert('信息','查询失败');
							   },
					    
					   params: {rolename:Ext.getCmp('rolename').getValue()}
					});
 
			 },
        pressed: true
    
    }]
    
    	
    });
 
    
    
    
    
    var grid=Ext.create('Ext.grid.Panel',{
    	region:'center', 
        title:'角色管理',
        store: store,
        columns:colml,
     	selModel:sm, 
        forceFit:true  ,
        loadMask: {msg:'正加载数据...'},
        bbar:pagebar,
        tbar:theadbar
    });
	  var viewport = Ext.create('Ext.container.Viewport',{   //视图
           layout:'fit',
           items:[grid]
        }); 
	 store.load({params:{start:0, limit:25}});

	var addform =  Ext.widget('form', {
                    id:'addform',
                   layout:"column",
                   baseCls:"x-plain",
                   style:"padding:5px",
                   items:[{
                      columnWidth:.5,
                      labelWidth:50,
                      baseCls:"x-plain",
                      items:[{
		                    xtype:'textfield',
		                    name:'rolename',fieldLabel: '角色名', id:'rolename',
		                    allowBlank:false,
		                    anchor:'95%'
		                }, {
		                    xtype:'checkbox',
		                    name: 'isvalidataip',fieldLabel: '是否IP登录限制',
		                    anchor:'95%'
		                },{
		                    xtype:'textfield',
		                    name: 'area',fieldLabel: '地区', 
		                    anchor:'95%'
		                }]
                   },{
                     columnWidth:.5,
                     baseCls:"x-plain",
		             items:[
		             	  {
		                    xtype:'textfield',
		                    name: 'roledesc',fieldLabel: '角色描述', id:'roledesc',
		                    anchor:'95%'
		                },{
		                       xtype:'textfield',
		                       name: 'loginip',fieldLabel: '登录IP', id:'loginip', 
		                       anchor:'95%'
		                }
		                 ,
		                {
		                    xtype:'hidden',
		                    name: 'id'
		                 }
		                ]
                   }]
                
                });
	   
	   //////// add window
	   
	var addwin =  Ext.widget('window',{
                     title:"增加/修改角色信息",
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         frame: true,
			         id:'addwind',
			         width: 500,
				     height:200,
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
      ds = Ext.create('Ext.data.ArrayStore', {
        data: [['123','One Hundred Twenty Three'],
            ['1', 'One'], ['2', 'Two'], ['3', 'Three'], ['4', 'Four'], ['5', 'Five'],
            ['6', 'Six'], ['7', 'Seven'], ['8', 'Eight'], ['9', 'Nine']],
        fields: ['value','text']
    });

           msForm =  Ext.widget('form', {
	   	            id:'joinuserform',
                   layout:"column",
                 //  baseCls:"x-plain",
                  // style:"padding:5px",
                   items:[{ xtype: 'itemselector',
            				name: 'itemselector',
            				id: 'itemselector-field',
             				store: ds,
            				displayField: 'text',
            				valueField: 'value'
						}, {xtype:'hidden',name: 'useroleid',id:'useroleid'}
					]
                
                });

   
   	  conjoinuserwin =  Ext.widget('window',{
                     title:"角色关联用户",
				     bodyStyle:'padding:5px',
				    layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         frame: true,
			         id:'conjoinuserwin',
			         width: 550,
				     height:340,
                     items:msForm,
               //   showlock:false,
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




	   


            
        /*    /////////////权限树
       var powerstring;   
       var hostormodule='m';
       var saveurl=fullpath+'/sendisystem/saveSyspower.do';
       var powertreeLoder=	new Ext.tree.TreeLoader({
             dataUrl:fullpath+'/sendisystem/generateSysPowerTree.do',
             uiProviders:{'col':Ext.ux.TreeCheckNodeUI}
        });
        
       var 	powertreeroot=new Ext.tree.AsyncTreeNode({
         text:'模块信息',
		 id:-1
         });
         powertreeLoder.on("beforeload", function(treeLoader, node) {
         powertreeLoder.baseParams.Treeid=node.id;
        powertreeLoder.baseParams.useroleid=useroleid;
    },powertreeLoder);   
 
       

      var  powertreePanel=new Ext.tree.TreePanel({
      	id: 'tree-panel',
    	title: '',
        height: 250,
        width:300,
        minSize: 150,
        autoScroll: true,
        rootVisible:true,
        lines: true,
        singleExpand: false,
        useArrows: true,
        loader:powertreeLoder,
        root: powertreeroot
         });
 
   
         
         
          var powertreewin=new Ext.Window({
                     title:"模块权限关联树",
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         frame: true,
			         id:'powertreewin',
			         width: 550,
				     height:340,
				     items:[powertreePanel],
                  showlock:false,
                buttons:[
                {
                 text:"确定",
                handler:function()
                {
                    powerstring="";
                    if(hostormodule=='m')
                    {
                    	saveurl=fullpath+'/sendisystem/saveSyspower.do';
                    }
                    else
                    {
                    	saveurl=fullpath+'/sendisystem/saveSysHostpower.do';
                    	
                    }
                  IteratorTreeNodes(powertreeroot);
               		Ext.Ajax.request({
				    url:saveurl,
				    success:function(_response,_options){
				     Ext.Msg.alert('信息','操作成功');
 					},
				   failure: function()
				   {
				     Ext.Msg.alert('信息','操作失败');
				    },
				   params: {powerstring: powerstring,useroleid:useroleid}
				});
                }
                },
                	
                {
                 text:"取消",
                 handler:function()
                 {
                  powertreewin.hide();
                 }
                
                }
                
                ]
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