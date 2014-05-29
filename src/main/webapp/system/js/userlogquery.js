Ext.onReady(function(){
	Ext.QuickTips.init();
	Ext.Ajax.timeout = 600000;
	
	var col=new Ext.grid.ColumnModel([
        new Ext.grid.RowNumberer(),
        new Ext.grid.CheckboxSelectionModel({
			singleSelect:false
 		}),
 		{id:'id',header: "ID", width: 10, sortable: true, dataIndex: 'id',hidden:true},
            {header: "actionId", width: 150, sortable: true,  dataIndex: 'actionId',hidden:true},
            {header: "actionName", width: 150, sortable: true,  dataIndex: 'actionName',hidden:true},
            {header: "methodId", width: 150, sortable: true,  dataIndex: 'methodId',hidden:true},
            {header: "methodName", width: 150, sortable: true,  dataIndex: 'methodName',hidden:true},
            {header: "登陆用户名", width: 200, sortable: true, dataIndex: 'loguser'},
            {header: "操作客户端IP", width: 200, sortable: true, dataIndex: 'clientIp'},
            {header: "操作说明", width: 200, sortable: true, dataIndex: 'actionDesc'},
            {header: "结果", width: 200, sortable: true, dataIndex: 'logResult'},
            {header: "操作时间", width: 200, sortable: true, dataIndex: 'logStarttime'},
            {header: "操作结束时间", width: 200, sortable: true, dataIndex: 'logEndtime'}
   ]); 	
	//  表格数据源控件
    var store=new Ext.data.JsonStore({
    	root: 'data',
    	totalProperty: 'totalCount',
    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
  		fields: ['id','actionId','actionName','methodId','methodName','loguser','clientIp','logResult','logStarttime','logEndtime','actionDesc' ],
		url: fullpath+'/userLogController.do?query' ,
		remoteSort:false
    });
    //store.setDefaultSort('sum','ASC');
    
    //  表格数据源控件添加加载前事件处理函数
    store.on('beforeload',function(sto,options){
		options.params['check_time'] = Ext.getCmp('check_time').getValue();
		options.params['check_end'] = Ext.getCmp('check_end').getValue();
		options.params['loguser'] = Ext.getCmp('loguser').getValue();
    });
    
    //  表格分页控件
	var pagebar=new Ext.PagingToolbar({
        pageSize:50,
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
    });
    
	//  查询条件控件
	var loguser= new Ext.form.TextField({
     	            id:'loguser',
                    xtype:'textfield',
                    name:'loguser'
                 });
	
	var check_time = new Ext.form.TextField({
		id:'check_time',
		name:'check_time',
		fieldLabel: '开始时间',
		value:c_time,
		listeners:{
			'render':function(){
	          Ext.EventManager.on("check_time", 'click', function(){
	              new WdatePicker({
	                   skin: 'ext', // 应用ext的皮肤样式
	                   dateFmt: 'yyyy-MM-dd HH:mm:ss' // 格式为：年-月-日 时 ：分
	                });
	          })
	 		}
		}
	});
	
	var check_end = new Ext.form.TextField({
		id:'check_end',
		name:'check_end',
		fieldLabel: '结束时间',
		value:c_end,
		listeners:{
			'render':function(){
	          Ext.EventManager.on("check_end", 'click', function(){
	              new WdatePicker({
	                   skin: 'ext', // 应用ext的皮肤样式
	                   dateFmt: 'yyyy-MM-dd HH:mm:ss' // 格式为：年-月-日 时 ：分
	                });
	          })
	 		}
		}
	});
	
	
	//  表格工具栏，包含查询控件和操作按钮
    var tbar=new Ext.Toolbar({
    	scope:this,height:25,items:[
			'开始时间',check_time,'-','结束时间',check_end,'-','操作用户',loguser,'-',
		 {
			text:'查询',
			pressed: true,
			handler:function(){
				store.load({params:{start:0, limit:50}});
			}
		}
	]
    });
    
    // 表格初始化
    var grid=new Ext.grid.GridPanel({
     	id:'grid',
    	region:'center',
        title:'用户操作日志',
        //renderTo:'',
        store: store,
       	cm:col,
     	sm:new Ext.grid.CheckboxSelectionModel({
		singleSelect:false
 	}),
        trackMouseOver:false,
        disableSelection:true,
        loadMask: {msg:'正加载数据...'},
        viewConfig: {
            forceFit:false            
        },
        bbar:pagebar,
        tbar:tbar
    });
	
	var viewport = new Ext.Viewport( { // 视图
		layout : 'border',
		items : [grid]
	});
	grid.render();
	//store.load({params:{start:0, limit:50}}); 
});