 
 
Ext.onReady(function(){
var ismodify=false;
	   Ext.QuickTips.init();
 	   /////////////grid
	var sm=new Ext.grid.CheckboxSelectionModel({
	singleSelect:false
 	});   
	var colml=new Ext.grid.ColumnModel([
	        new Ext.grid.RowNumberer(),
	        sm,
		    {id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden:true},
            {header: "功能描述", width: 20, sortable: true,  dataIndex: 'description'},
            {header: "push ID", width: 20, sortable: true, dataIndex: 'pushid'},
            {header: "回调模块", width: 20, sortable: true, dataIndex: 'callbackmoudleid'},
            {header: "回调函数", width: 20, sortable: true, dataIndex: 'callbackfun'} 
            ]
    );
    var store=new Ext.data.JsonStore({
    	root: 'data',
    	totalProperty: 'totalCount',
    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
  		fields: [ 'id','description','pushid','callbackmoudleid','callbackfun'],
		url: fullpath+'/sysPushConfigController.do?queryPushConfigData' ,
		remoteSort:true
    });
    
    //  表格数据源控件添加加载前事件处理函数
    store.on('beforeload',function(sto,options){
		options.params['description'] = Ext.getCmp('desct').getValue();
		options.params['pushid'] = Ext.getCmp('pushidt').getValue();
    });
    
    var pagebar=new Ext.PagingToolbar({
        pageSize:10,
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
        });
     
 
        //////
     
           var descfield= new Ext.form.TextField({
     	            id:'desct',
                    xtype:'textfield',
                    name:'desct',fieldLabel: '功能描述'
                 });
           var pushidfield= new Ext.form.TextField({
     	            id:'pushidt',
                    xtype:'textfield',
                    name:'pushidt',fieldLabel: 'Push ID'
                 });      
 
    var theadbar=new Ext.Toolbar({
     scope:this,height:25,items:[ {
 	           text:'增加',
 	             pressed: true,
 	    	 handler:function()
			 {
			 	ismodify=false;
			    addwin.show();
			    var basicform=Ext.getCmp('addform').getForm();
			    basicform.reset();
			    basicform.url=fullpath+'/sysPushConfigController.do?addPushConfig';
			 }
 	    	
 	    }
 	    ,'-',
 	    {
 	        text:'修改',
 	       
 	        pressed: true,
			 handler:function()
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
					   return;
					}
					 
					var selec_record=_sm.getSelected();
					var id=selec_record.get("id");
					Ext.Ajax.request({
				    url:fullpath+'/sysPushConfigController.do?excutModifyQueryPushConfig',
				    success:function(_response,_options){
				   	var obj=Ext.util.JSON.decode(_response.responseText);  //
				   	
				     var basicform=Ext.getCmp('addform').getForm();
				       addwin.show();
				   	   basicform.setValues(obj.datas);  //注意设置form值的语句需要在show函数后，因为此时的form还没有创建or Render
				    	 
				   	   basicform.url=fullpath+'/sysPushConfigController.do?excuteModifyPushConfig'
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
                 pressed: true,
            handler:function()
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
			  
					Ext.Ajax.request({
				    url:fullpath+'/sysPushConfigController.do?excuteDeletePushConfig',
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
					
            }
        },'-','功能描述',descfield,'-','Push ID',pushidfield,'-',
 	    { text:'查询',
 	    	  
 	            pressed: true,
			 handler:function()
			 {
				store.load({params:{start:0, limit:25}});
			 }
        }]
    
    	
    });
 
    
        ////
    var grid=new Ext.grid.GridPanel({
    	region:'center',
       // height:500,
        title:'Push 消息配置管理',
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
	 var viewport = new Ext.Viewport({   //视图
           layout:'border',
           items:[grid]
        });   
	 grid.render();
	 store.load({params:{start:0, limit:25}});
	 
 
 
	 
	   var addform={
	   	            usepurse:'addform', //用途,默认情况下是添加，也可以是modifyform
                    id:'addform',
                    xtype:'form',
                   url:fullpath+'/sysPushConfigController.do?addPushConfig',
                   layout:"column",
                   baseCls:"x-plain",
                   style:"padding:5px",
                   items:[{
                      columnWidth:.5,
                      layout:"form",
                      labelWidth:100,
                      baseCls:"x-plain",
                      items:[{
		                    xtype:'textfield',
		                    name:'description',fieldLabel: '功能描述', id:'description',
		                    allowBlank:false,
		                    anchor:'95%'
		                },{
		                    xtype:'textfield',
		                    name: 'callbackmoudleid',fieldLabel: '回调模块ID', id:'callbackmoudleid', allowBlank:false,
		                    anchor:'95%'
		                 }
		                ]
                   },{
                     columnWidth:.5,
                     layout:"form",
                     baseCls:"x-plain",
		             items:[
		               {
		                       xtype:'textfield',
		                       name: 'pushid',fieldLabel: 'Push ID', id:'pushid',
		                       anchor:'95%'
		                }
		                ,{
		                    xtype:'textfield',
		                    name: 'callbackfun',fieldLabel: '回调函数', id:'callbackfun', allowBlank:false,
		                    anchor:'95%'
		                },
		                {
		                    xtype:'hidden',
		                    name: 'id'
		                   
		                }
		                ]
                   }]
                
                };
	   
	   //////// add window
	   
	  var addwin=new Ext.Window({
                     title:"增加/修改push 消息配置",
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         frame: true,
			         id:'addwind',
			         width: 530,
				     height:180,
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
                  		 var bf=Ext.getCmp('addform').getForm();
                  	 
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
	 
	
})