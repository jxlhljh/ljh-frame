function leave_type(_val,m,record){
    if(_val=='1'){
    	return "公休";
    }else if(_val=='2'){
    	return "病假";
    }else if(_val=='3'){
    	return "婚假";
    }else if(_val=='4'){
    	return "调休";
    }else if(_val=='5'){
    	return "事假";
    }
}

function assignee(_val,m,record){
    if(_val==''){
    	return "<input type='button' value='签收'>";
    }else{
    	return "<input type='button' value='办理'>";
    }
}


var pageSize = 10;//pageSize
var store = new Ext.data.JsonStore({
			pruneModifiedRecords:true,
			fields : ['taskid','id','leave_type', 'user_id','apply_time','start_time','end_time','activityName','version','assignee','reason'],
			pageSize : pageSize,
			proxy : {
				type : 'ajax',
				url : 'TaskAction!taskList.do',
				reader : {
					root : 'data',
					totalProperty : 'totalCount'
				}
			}
	});
	
var column = [
	{header : "taskid",dataIndex : "taskid",flex:1,hidden:true}, 
	{header : "id",dataIndex : "id",flex:1,hidden:true}, 
	{header : "假种",dataIndex : "leave_type",flex:1,renderer:leave_type}, 
	{header : "申请人",dataIndex : "user_id",flex:1},
	{header : "申请时间",dataIndex : "apply_time",flex:1},
	{header : "开始时间",dataIndex : "start_time",flex:1},
	{header : "结束时间",dataIndex : "end_time",flex:1},
	{header : "当前节点",dataIndex : "activityName",flex:1,renderer:readTraceImage},
	{header : "流程状态",dataIndex : "version",flex:1},
	{header : "操作",dataIndex : "assignee",flex:1,renderer:assignee}  
	];

var pagebar = Ext.create('Ext.toolbar.Paging', {
		store : store,
		displayInfo : true,
		displayMsg : '显示第 {0}条到{1}条记录，一共{2}条 ',
		emptyMsg : "没有记录"
	});
	

	


// grid difinition...
var grid = new Ext.grid.GridPanel({
		title : "待办任务列表",
		store : store,
		id : 'grid',
		selModel : Ext.create('Ext.selection.CheckboxModel'),													// false}),
		columns : column,
		bbar : pagebar,
		listeners:{
			'cellclick':function(thiz, td, cellIndex, record, tr, rowIndex, e, eOpts){
				if(cellIndex==10){
					var taskid = record.get("taskid");
					var assignee = record.get("assignee");
					
					var user_id = record.get("user_id");
					var leave_type ;
					var leave_type1= record.get("leave_type");
					if(leave_type1=='1'){
						leave_type='公休';
					}else if(leave_type1=='2'){
						leave_type='病假';
					}else if(leave_type1=='3'){
						leave_type='婚假';
					}else if(leave_type1=='4'){
						leave_type='调休';
					}else if(leave_type1=='5'){
						leave_type='事假';
					}
					var apply_time = record.get("apply_time");
					var start_time = record.get("start_time");
					var end_time = record.get("end_time");
					var reason = record.get("reason");
					if(assignee==''){
						Ext.Ajax.request({
						    url:'TaskAction!qs.do',
						    success:function(_response,_options){
						        Ext.Msg.alert('信息','签收成功');
						        store.load();
							},
						   failure: function(){
						    Ext.Msg.alert('信息','签收失败');
						   },
						   params: {taskid: taskid }
						});
					}else{
						var basicform=Ext.getCmp('addform').getForm();
						addwin.show();
						Ext.getCmp('user_id').setValue(user_id);
						Ext.getCmp('leave_type').setValue(leave_type);
						Ext.getCmp('apply_time').setValue(apply_time);
						Ext.getCmp('start_time').setValue(start_time);
						Ext.getCmp('end_time').setValue(end_time);
						Ext.getCmp('reason').setValue(reason);
						Ext.getCmp('taskid').setValue(taskid);
				   	    basicform.url='TaskAction!bl.do'
					}
				}
			}
		}
});


var addform={
       id:'addform',
       xtype:'form',
       items:[{
         xtype:'textfield',
         name:'user_id',fieldLabel: '申请人', id:'user_id',
         allowBlank:false,
         anchor:'95%'
     	},{
         xtype:'textfield',
         name: 'leave_type',fieldLabel: '假种', id:'leave_type',
         anchor:'95%'
     },{
         xtype:'textfield',
         name: 'apply_time',fieldLabel: '申请时间', id:'apply_time',
         anchor:'95%'
     },{
         xtype:'textfield',
         name: 'start_time',fieldLabel: '开始时间', id:'start_time',
         anchor:'95%'
     },{
         xtype:'textfield',
         name: 'end_time',fieldLabel: '结束时间', id:'end_time',
         anchor:'95%'
     },{
         xtype:'textarea',
         name: 'reason',fieldLabel: '申请事由', id:'reason',
         anchor:'95%'
     },{
         xtype:'textarea',
         name: 'suggest',fieldLabel: '意见', id:'suggest',
         anchor:'95%'
     },{
         xtype:'textarea',
         name: 'taskid',id:'taskid',hidden:true,
         anchor:'95%'
     }]
   
};



var addwin=new Ext.Window({
	 title:"流程办理",
     closeAction :'hide',
     id:'addwind',
     width: 500,
     height:400,
     items:[addform],
     buttons:[
                {
                text:"同意",
                handler:function(){
                  Ext.getCmp('addform').getForm().submit({
           		  		   waitTitle:"等待中.....",
           		 		   waitMsg:"正在提交数据，请稍.....",
           		 		   failure:function(){
           		 		   		  Ext.Msg.alert('信息', ' 操作失败，请检查服务器!');   
           		 		   		  addwin.hide();
           		 		   },
           		 		   success:function(_form,_action){
           		 		   	    Ext.Msg.alert('信息', '办理成功!');
           		 		   	    addwin.hide();
           		 		   	    store.load();
           		 	 	   },
           		 	 	   params: {flag: "1" }
           	 	 		 });
                }
                },{
                text:"驳回",
                handler:function(){
                  Ext.getCmp('addform').getForm().submit({
           		  		   waitTitle:"等待中.....",
           		 		   waitMsg:"正在提交数据，请稍.....",
           		 		   failure:function(){
           		 		   		  Ext.Msg.alert('信息', ' 操作失败，请检查服务器!');   
           		 		   		  addwin.hide();
           		 		   },
           		 		   success:function(_form,_action){
           		 		   	    Ext.Msg.alert('信息', '办理成功!');
           		 		   	    addwin.hide();
           		 		   	    store.load();
           		 	 	   },
           		 	 	   params: {flag: "0" }
           	 	 		 });
                }
                },{
                 text:"取消",
                 handler:function(){
                  addwin.hide();
                 }
                
                }
                
                ]
})



//******函数定义********************************************************************

//读取工作流程图
function readTraceImage(_val,m,record){
	var executionId = '501';
    return '<a title="点击查看流程图" href="javascript:loadRunningImage()">'+_val+'</a>';
}

//查看运行中流程图
function loadRunningImage(){
	var url = fullpath+'/workflow/WorkFlowCommonAction!readTraceResource.do?executionId=501';
	var tabid = Math.random();//获取随机数作为tempTab的ID
	window.parent.moudleTabInterface.AddTemplateTab(tabid,"查看运行中流程图",url);
}


//初始化页面
Ext.onReady(function() {
			Ext.QuickTips.init();
			store.load({
						params : {
							start : 0,
							limit : pageSize
						}
					});
			// 窗口布局
			new Ext.Viewport({
						layout : "fit",
						items :[grid]
					})
})