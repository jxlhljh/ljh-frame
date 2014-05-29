 function parseflag(_val){
    if(_val=='1'){
    	 return '启用';
    }else if(_val=='0'){
    	 return '禁用';
    }else{
     return _val;
    }
 }
 
 
   
Ext.onReady(function(){

	   Ext.QuickTips.init();
 	   /////////////grid
	var sm=new Ext.grid.CheckboxSelectionModel({
	singleSelect:false
 	});   
	var colml=new Ext.grid.ColumnModel([
	        new Ext.grid.RowNumberer(),
	        sm,
		   {header: "actionId", width: 20, sortable: true, dataIndex: 'actionId'},
            {header: "action名称", width: 20, sortable: true,  dataIndex: 'actionName'},
            {header: "methodId", width: 20, sortable: true, dataIndex: 'methodId'},
            {header: "method名称", width: 20, sortable: true, dataIndex: 'methodName'},
            {header: "action描述", width: 20, sortable: true, dataIndex: 'actionDesc'},
            {header: "是否启用", width: 20, sortable: true, dataIndex: 'flag',renderer:parseflag}
            ]
    );
    var store=new Ext.data.JsonStore({
    	root: 'data',
    	totalProperty: 'totalCount',
    	pruneModifiedRecords:true, 
  		fields: [ 'actionId','actionName','methodId','methodName','actionDesc','flag' ],
		url: fullpath+'/sysActionlogConfController.do?query' ,
		remoteSort:true
    });
    var pagebar=new Ext.PagingToolbar({
        pageSize:10,
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
        });
        
        //////
    var actionName= {xtype:'textfield',id:'actionName',name:'actionName',fieldLabel: 'action名称',allowBlank:false};
    var actionId= {xtype:'textfield',id:'actionId',name:'actionId',fieldLabel: 'actionId',allowBlank:false};
    var methodId= {xtype:'textfield',id:'methodId',name:'methodId',fieldLabel: 'methodId',allowBlank:false};
    var methodName= {xtype:'textfield',id:'methodName',name:'methodName',fieldLabel: 'method名称',allowBlank:false};
    var actionDesc= {xtype:'textfield',id:'actionDesc',name:'actionDesc',fieldLabel: 'action描述',allowBlank:false};
     // 是否共享
var flagStore=new Ext.data.SimpleStore({
	fields: ['value', 'key'],
	data : [['1','启用'],['0', '禁用']]
});   
 var flag=new Ext.form.ComboBox({
	 width: 100,
	 selectOnTab: false,
	 id:'flagt',
	 name:'flagt',
     fieldLabel: '是否启用',
     mode:'local',
     displayField:'key',
     triggerAction: 'all',
     valueField:'value',
     forceSelection: true,
     hiddenName:'flag',
    // selectOnFocus:true,
     store :flagStore,
     value:'1',
     anchor:'88%'
 }); 
          
  var theadbar=new Ext.Toolbar({
     scope:this,height:25,items:[ {
 	         text:'增加',
 	         
 	            pressed: true,
 	    	 handler:function()
			 {
			 	 
			    addwin.show();
			    var basicform=Ext.getCmp('addform').getForm();
			    Ext.getCmp('actionId').readOnly=false;
			    Ext.getCmp('methodId').readOnly=false;
			    basicform.reset();
			    basicform.url=fullpath+'/sysActionlogConfController.do?add';
			 }
 	    	
 	    }
 	    ,'-',
 	    {
 	        text:'修改',
 	       
 	        pressed: true,
			 handler:function()
			 {
			 		 Ext.getCmp('actionId').readOnly=true;
			    	Ext.getCmp('methodId').readOnly=true;
			 		var _sm=grid.selModel;
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要修改记录，注意只能单选');
					    return;
					}
					if(_sm.getCount()>1)
					{
					   Ext.Msg.alert('信息','每次只能修改一条记录,现取第一条选择的记录做修改');
					}
					var selec_record=_sm.getSelections();
					addwin.show();
					var basicform=Ext.getCmp('addform').getForm();
					 
				  	basicform.loadRecord(selec_record[0]);
				 	basicform.url=fullpath+'/sysActionlogConfController.do?update'
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
				    var actionId="";
				    var methodId="";
				    for(var leni=0;leni<len;leni++)
				    {
				    	
				    	if(leni==len-1)
				    	{
				    		actionId+=selec_record[leni].get("actionId");
				    		methodId+=selec_record[leni].get("methodId");
				    	}
				    	else
				    	{
				    	 	actionId+=selec_record[leni].get("actionId")+",";
				    		methodId+=selec_record[leni].get("methodId")+",";
				    	}
				    }
			  
					Ext.Ajax.request({
			    			url: fullpath+'/sysActionlogConfController.do?delete',
			    			success: function(_response, _options){
			        		var obj=Ext.util.JSON.decode(_response.responseText);
				           if(obj.success){
				                	Ext.Msg.alert('信息',obj.msg);
				                	store.load({params:{start:0, limit:30}});
				          		 }else
				               Ext.Msg.alert('信息',obj.msg);
							},
			   				failure: function()
			   				{
			    				Ext.Msg.alert('信息','删除失败');
			   				},
			   				 params: {actionId:actionId,methodId:methodId}
						})
					
            }
        } ,'-',{
            text: '重载',
            pressed: true,
            handler:function()
            { 
					Ext.Ajax.request({
			    			url: fullpath+'/sysActionlogConfController.do?reload',
			    			success: function(_response, _options){
			        		var obj=Ext.util.JSON.decode(_response.responseText);
				           if(obj.success){
				                	Ext.Msg.alert('信息',obj.msg);
				                	store.load({params:{start:0, limit:30}});
				          		 }else
				               Ext.Msg.alert('信息',obj.msg);
							},
			   				failure: function()
			   				{
			    				Ext.Msg.alert('信息',obj.msg);
			   				},
			   				 params: {actionId:actionId,methodId:methodId}
						})
					
            }
        }
	 	]
    
    	
    });
 
        ////
    var grid=new Ext.grid.GridPanel({
     
    	//renderTo:"grid",
        region:'center',
       // height:500,
        //title:'action配置',
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
                    url:fullpath+'/sysActionlogConfController.do?add',
                   layout:"column",
                   baseCls:"x-plain",
                   style:"padding:5px",
                   items:[{
                      columnWidth:.5,
                      layout:"form",
                      labelWidth:80,
                      baseCls:"x-plain",
                      items:[actionId,actionName,actionDesc]
                   },{
                     columnWidth:.5,
                     labelWidth:80,
                     layout:"form",
                     baseCls:"x-plain",
		             items:[methodId,methodName,flag]
                   }]
                
                };
	   
	   //////// add window
	   
	 var addwin=new Ext.Window({
                     title:"增加/修改用户信息",
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         frame: true,
			         id:'addwind',
			         width: 550,
				     height:200,
				     layout:"form",
                     labelWidth:55,
                    items:[addform],
                showlock:false,
                buttons:[
                {
                 text:"确定",
                handler:function(){
                var baseForm = Ext.getCmp('addform').getForm();
				if(baseForm.isValid()){
					baseForm.submit({
						waitTitle:"等待中.....",
						waitMsg:"正在提交数据，请稍.....",
						success:function(_response,action){
							var obj=action.result;
							if(obj.success){
				                Ext.Msg.alert('信息',obj.msg);
				                store.load({params:{start:0, limit:100}});
				                addwin.hide();
				                 
				           }else
				                Ext.Msg.alert('信息',obj.msg);
						},
						failure:function(form,action){
							var obj=action.result;
							 Ext.Msg.alert('信息',obj.msg);
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