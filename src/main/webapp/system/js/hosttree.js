 
function  renderyn(_value)
{
	if(_value=='y')
	{
		return '是';
	}
	else
	{
		return '否';
	}
}

Ext.onReady(function(){
     var clickleafid=-1;	 
      var hosttreeLoder=new Ext.tree.TreeLoader({
             dataUrl:fullpath+'/sendisystem/listhostttree.do'
        });
    var  hosttreeroot=new Ext.tree.AsyncTreeNode({
         text:'设备区',
		 id:-1
         });
   
   var  hosttreePanel=new Ext.tree.TreePanel({
      	id: 'tree-panel',
    	title: '设备树信息',
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
        loader:hosttreeLoder,
        root: hosttreeroot
         }); 
         
     
    hosttreePanel.on("beforeload", function(node) {
          hosttreeLoder.baseParams.Treetext = node.text;
          hosttreeLoder.baseParams.Treeid=node.id;
    }); 
    
    
   hosttreePanel.on("click",function(Node,checked ){
   	     clickleafid=Node.id;
   	     store.reload({params:{start:0, limit:25,clickleafid:Node.id,reloadflag:'yes'}})
   },hosttreePanel);
   
   //////////
   
   	var sm=new Ext.grid.CheckboxSelectionModel({
	singleSelect:false
 	});   
	var colml=new Ext.grid.ColumnModel([
	        new Ext.grid.RowNumberer(),
	        sm,
		    {id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden :true},
            {header: "节点名称", width: 20, sortable: true,  dataIndex: 'nodeName'},
            {header: "设备名称", width: 20, sortable: true, dataIndex: 'hostname'},
            {header: "设备类型", width: 20, sortable: true, dataIndex: 'hosttype'},
            {header: "是否为设备", width: 20, sortable: true, dataIndex: 'ishost',renderer :renderyn}
             ]
    );
    var store=new Ext.data.JsonStore({
    	root: 'data',
    	totalProperty: 'totalCount',
    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
  		fields: [ 'id','nodeName','hostname','ishost','hostId','parentid','hosttype'],
		url: fullpath+'/sendisystem/hosttreeInit.do' ,
		remoteSort:true
    });
     var pagebar=new Ext.PagingToolbar({
        pageSize:10,
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
        });
    
     
    var yesnostore=new Ext.data.SimpleStore({
             fields: ['ishost', 'ishosttxt'],
             data :  [['y', '是'],['n', '否']]
        });
   var yesnocb=new Ext.form.ComboBox({
     anchor:'95%',
     fieldLabel: '是否为设备',
     mode:'local',
     displayField:'ishosttxt',
     valueField:'ishost',
     store :yesnostore,
     name:'ishost',
     hiddenName:'ishost',
     triggerAction:'all', allowBlank:false
   }); 
 
   var hostchoice=new Ext.ux.DctCombo({
     fieldLabel: '设备选择',
     dcttype:'hostchoice',
     name:'hostname',
     hiddenName:'hostId',
     anchor:'95%'
   }); 
   hostchoice.on('select',function(combo,record,index ){
     var basicform=Ext.getCmp('addform').getForm();
   	 basicform.findField('nodeName').setValue(combo.getRawValue());
    
     });
    var hosttypechoice=new Ext.ux.DctCombo({
     fieldLabel: '设备类型',
     dcttype:'hosttypechoice',
     name:'hosttype',
     hiddenName:'hosttype',
     anchor:'95%'
   }); 
          	   var addform={
	   	            usepurse:'addform', //用途,默认情况下是添加，也可以是modifyform
                    id:'addform',
                    xtype:'form',
                    url:fullpath+'/sendisystem/addHostTreedata.do',
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
		                    name:'nodeName',fieldLabel: '节点名称', id:'nodeName',
		                    allowBlank:false,
		                    anchor:'95%'
		                }, yesnocb]
                   },{
                     columnWidth:.5,
                     layout:"form",
                      labelWidth:90,
                     baseCls:"x-plain",
		             items:[
		             	  hostchoice,
		                hosttypechoice
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
                     title:"增加/修改设备树信息",
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         frame: true,
			         id:'addwind',
			         width: 500,
				     height:150,
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
		                 		 		        hosttreeroot.reload();
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
 
                var nodeNamefield= new Ext.form.TextField({
     	            id:'nodeNamet',
                    xtype:'textfield',
                    name:'nodeNamet',fieldLabel: '节点名称'
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
									    basicform.url=fullpath+'/sendisystem/addHostTreedata.do';
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
											    url:fullpath+'/sendisystem/excutModifyQueryhosttree.do',
											    success:function(_response,_options){
											   	var obj=Ext.util.JSON.decode(_response.responseText);  //
											   	
											      var basicform=Ext.getCmp('addform').getForm();
											       addwin.show();
											   	   basicform.setValues(obj.datas);  //注意设置form值的语句需要在show函数后，因为此时的form还没有创建or Render
											      basicform.url=fullpath+'/sendisystem/excuteModifyhosttree.do'
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
											    url:fullpath+'/sendisystem/excuteDeletehosttree.do',
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
							        },'-',  
     
							        nodeNamefield,'-',{
									     'text':' 查 询 ',
									       enableToggle: true,
									        toggleHandler: function()
												 {
												  	Ext.Ajax.request({
														    url:fullpath+'/sendisystem/queryhosttreedata.do',
														    success: function()
											                 		 		   {
											                 		 		   	  
											                 		 		   	   Ext.Msg.alert('信息', '查询成功!');
											                 		 		   	   store.load({params:{start:0, limit:25}});
											                 		 		    
											                 		 	 	   },
														   failure:  function()
																   {
																    Ext.Msg.alert('信息','查询失败');
																   },
														    
														   params: {nodeName:nodeNamefield.getValue()}
														});
									 
												 },
									        pressed: true
									    
									    }
					            ]
					            
   })     
    var datagrid=new Ext.grid.GridPanel({
    	renderTo:"grid",
        title:'设备树管理',
        store: store,
        height:500,
        cm:colml,
     	sm:sm,
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