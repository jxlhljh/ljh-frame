var pageSize = 10;//pageSize

var store = new Ext.data.JsonStore({
		pruneModifiedRecords:true,
		fields : ['id', 'processInstanceId','processDefinitionId','processDefinitionName','activityId','activityName','suspended'],
		pageSize : pageSize,
		proxy : {
			type : 'ajax',
			url : 'ProcessInstanceAction!runningList.do',
			reader : {
				root : 'data',
				totalProperty : 'totalCount'
			}
		}
	});// end of store

store.on('beforeload',function(store,options){
	//var new_params1 = {keyword : encodeURIComponent(Ext.getCmp('keyword').getValue())};
	//Ext.apply(store.proxy.extraParams, new_params1);
})

var column = [
	{header : "执行ID",dataIndex : "id",flex:1}, // 新增字段。
	{header : "流程实例ID",dataIndex : "processInstanceId",flex:1},
	{header : "流程定义ID",dataIndex : "processDefinitionId",flex:1},
	{header : "流程名称",dataIndex : "processDefinitionName",flex:1},
	{header : "当前节点",dataIndex : "activityName",flex:1},
	{header : "是否挂起",dataIndex : "suspended",flex:1}, // hidden：true
	{header : "操作",dataIndex : "id",flex:1,renderer:readTraceImage}
	];

var topBar = [
	{
		xtype : 'label',text : '流程实例ID'
	}, 
	{
		xtype : 'textfield',width : 100,id : 'keyword'
	}, '-',
	{
		text : '查询',pressed : true,
		handler : function() {
			store.loadPage(1,{
				params : {
					start : 0,
					limit : pageSize
				}
			});
		}
	}, '-'];

var pagebar = Ext.create('Ext.toolbar.Paging', {
		store : store,
		displayInfo : true,
		displayMsg : '显示第 {0}条到{1}条记录，一共{2}条 ',
		emptyMsg : "没有记录"
	});

// grid difinition...
var grid = new Ext.grid.GridPanel({
		title : "运行中流程列表",
		store : store,
		id : 'grid',
		selModel : Ext.create('Ext.selection.CheckboxModel'),// {mode:"SIMPLE",singleSelect:														// false}),
		columns : column,
		bbar : pagebar
});


//******函数定义********************************************************************

//读取工作流程图
function readTraceImage(_val,m,record){
	var executionId = record.get("processInstanceId");//获取流程实例ID
    return "<a href='javascript:loadRunningImage("+executionId+")'>历史</a>";
}

//查看运行中流程图
function loadRunningImage(executionId){
	var url = fullpath+"/page/workflow/readTraceResource.jsp?executionId="+executionId;
	var tabid = "readTraceResource"+Math.random();//获取随机数作为tempTab的ID
	window.parent.moudleTabInterface.AddTemplateTab(tabid,"运行中流程图",url);
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
	new Ext.Viewport({
			layout : "fit",
			items :[grid]
		})
})