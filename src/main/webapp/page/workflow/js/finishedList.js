var pageSize = 10;//pageSize

var store = new Ext.data.JsonStore({
			pruneModifiedRecords:true,
			fields : ['id', 'processDefinitionId','startTime','endTime','deleteReason'],
			pageSize : pageSize,
			proxy : {
				type : 'ajax',
				url : 'ProcessInstanceAction!finishedList.do',
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
	{header : "流程ID",dataIndex : "id",flex:1}, // 新增字段。
	{header : "流程定义ID",dataIndex : "processDefinitionId",flex:1},
	{header : "流程启动时间",dataIndex : "startTime",flex:1,renderer:getTime},
	{header : "流程结束时间",dataIndex : "endTime",flex:1,renderer:getTime},
	{header : "结束原因",dataIndex : "deleteReason",flex:1},
	{header : "操作",dataIndex : "id",flex:1,renderer:readTraceImage}
];


var pagebar = Ext.create('Ext.toolbar.Paging', {
		store : store,
		displayInfo : true,
		displayMsg : '显示第 {0}条到{1}条记录，一共{2}条 ',
		emptyMsg : "没有记录"
	});

// grid difinition...
var grid = new Ext.grid.GridPanel({
		title : "已结束流程列表",
		store : store,
		id : 'grid',
		selModel : Ext.create('Ext.selection.CheckboxModel'),// {mode:"SIMPLE",singleSelect:														// false}),
		columns : column,
		bbar : pagebar
});


//******函数定义********************************************************************
//扩展Date的format方法 
Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1,
	    "d+": this.getDate(),
	    "h+": this.getHours(),
	    "m+": this.getMinutes(),
	    "s+": this.getSeconds(),
	    "q+": Math.floor((this.getMonth() + 3) / 3),
	    "S": this.getMilliseconds()
    }
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}
function getTime(_val){
	if(_val!=null){
		var time =  parseFloat(_val.time);
		var dateFormat = "yyyy-MM-dd hh:mm:ss"; 
		return (new Date(time).format(dateFormat));
	}else{
		return "";
	}
}

//读取工作流程图
function readTraceImage(_val,m,record){
	var executionId = record.get("processInstanceId");//获取流程实例ID
    return "<a href='javascript:loadRunningImage("+executionId+")'>历史</a>";
}
function loadRunningImage(executionId){
//	var url = fullpath+"/page/workflow/readTraceResource.jsp?executionId="+executionId;
//	var tabid = "readTraceResource"+Math.random();//获取随机数作为tempTab的ID
//	window.parent.moudleTabInterface.AddTemplateTab(tabid,"运行中流程图",url);
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