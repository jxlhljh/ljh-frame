    var height = document.documentElement.scrollHeight;
    var width = document.documentElement.scrollWidth;
    var store=new Ext.data.JsonStore({
   		fields: [ 'id','logname','loguser','logterminal','logresult','logtime','logcontent' ],
    	pageSize:25,
    	proxy:{
			type: 'ajax', 
        	url: fullpath+'/syslogsController.do?querySyslog' ,
			reader: { 
           		root: 'data', 
            	totalProperty  : 'totalCount' 
       		}
		}
    });
    
    //表格数据源控件添加加载前事件处理函数
    //EXT4.0的加参数的写法
    store.on('beforeload',function(store,options){
    	var new_params1 = {logname:Ext.getCmp('islog').getValue(),loguser:Ext.getCmp('logusert').getValue(),logterminal:Ext.getCmp('logterminalt').getValue(),logcontent:Ext.getCmp('logcontentt').getValue()};
    	Ext.apply(store.proxy.extraParams, new_params1);
    })
    
 var sm=Ext.create("Ext.selection.CheckboxModel",{allowDeselect:true});  
  var rownumberer= {xtype:'rownumberer',text: "",width: 2, sortable: false } ;
  
  	var colml=[
		  //  {id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden:true},
            {header: "操作名", width: 10, sortable: true,  dataIndex: 'logname'},
            {header: "操作用户", width: 10, sortable: true, dataIndex: 'loguser'},
            {header: "操作终端", width: 10, sortable: true, dataIndex: 'logterminal'},
            {header: "结果", width: 10, sortable: true, dataIndex: 'logresult'},
            {header: "操作时间", width: 20, sortable: true, dataIndex: 'logtime'},
            {header: "操作信息", width: 40, sortable: true, dataIndex: 'logcontent'}
            ];
 
     var pagebar=Ext.create('Ext.toolbar.Paging',{
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
        });
     
Ext.onReady(function(){
	if(Ext.isIE){ Ext.enableGarbageCollector=false; };
	   Ext.QuickTips.init();
   
      var operatercb = {
         xtype: 'combo',
         store: Ext.create('Ext.data.ArrayStore', {
             fields: ['islog'],
             data: [ ['login'],['logout'],['modify'],['save']]
         }),
         displayField: 'islog',
         valueField: 'islog',
         fieldLabel: '操作名',
         queryMode: 'local',
         selectOnTab: false,
         id: 'islog',
         name: 'islog',
         hiddenName:'logname'
     };
     
     var loguserfield=  {id:'logusert',xtype:'textfield',name:'logusert'};
     var logterminalfield= {id:'logterminalt',xtype:'textfield',name:'logterminalt'};
     var logcontentfield= {id:'logcontentt',xtype:'textfield',name:'logcontentt'};
     
 var theadbar=Ext.create('Ext.toolbar.Toolbar',{
  scope:this,height:25,items:[  
	   operatercb,'-','操作用户',loguserfield,'-','操作终端',logterminalfield,'-','操作信息',logcontentfield,
	   '-', { text:'查询',
	    	   pressed: true,
			 handler:function()
			 {
		            store.load({params:{start:0, limit:25}});

			 }},'-',
			 {
         text: '删除',
              pressed: true,
         handler:function()
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
				    url:fullpath+'/syslogsController.do?excuteDeleteSyslogs',
				    success:function(_response,_options){
				        Ext.Msg.alert('信息','删除成功');
				       store.load({params:{start:0, limit:25}});
					},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','删除失败');
				   },
				   params: {deleterecord: id }
				});
					
         }
     }
			 ]
 
 	
 });

     ////
 var grid=Ext.create('Ext.grid.Panel',{
 	 region:'center',
     title:'系统日志管理',
     store: store,
     columns:colml,
  	selModel:sm, 
		forceFit:true,    
     bbar:pagebar,
     tbar:theadbar,
     width: width,
     height:500
 });
 
 store.load({params:{start:0, limit:25}});
	  var viewport = Ext.create('Ext.container.Viewport',{   //视图
        layout:'fit',
        items:[grid]
     });   
	 
})