var pageSize = 10;//pageSize
var executionIdTmp

var store = new Ext.data.JsonStore({
		pruneModifiedRecords:true,
		fields : ['id', 'name','processDefinitionId','processInstanceId','startTime','endTime','assignee','deleteReason'],
		pageSize : pageSize,
		proxy : {
			type : 'ajax',
			url : fullpath+'/workflow/WorkFlowCommonAction!readTraceResourceData.do',
			reader : {
				root : 'data',
				totalProperty : 'totalCount'
			}
		}
	});// end of store

store.on('beforeload',function(store,options){
	var query = location.search.substring(1);
	executionIdTmp = query.substring(query.indexOf('=')+1); //流程ID
	var new_params1 = {executionId : executionIdTmp};
	Ext.apply(store.proxy.extraParams, new_params1);
})

var column = [
	{header : "ID", hidden:true, dataIndex : "id",flex:1}, 
	{header : "名称",dataIndex : "name",flex:1},
	{header : "流程定义ID",dataIndex : "processDefinitionId",flex:1},
	{header : "流程实例ID",dataIndex : "processInstanceId",flex:1},
	{header : "开始时间",dataIndex : "startTime",flex:1,renderer:getTime},
	{header : "结束时间",dataIndex : "endTime",flex:1,renderer:getTime},
	{header : "负责人",dataIndex : "assignee",flex:1},
	{header : "处理结果",dataIndex : "deleteReason",flex:1}
];

// grid difinition...
var grid = new Ext.grid.GridPanel({
	store : store,
	id : 'grid',
	selModel : Ext.create('Ext.selection.CheckboxModel'),// {mode:"SIMPLE",singleSelect:														// false}),
	columns : column
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
		layout:'border',  
        border:false,  
        defaults: {
            split: true
        },
		items :[
			{
				region: 'north',
				collapsible: true,
				title: '流程图',
				split: true,
				height: 280,
				minHeight:100,
				html: '<img src="'+fullpath+'/workflow/WorkFlowCommonAction!readTraceResourcePic.do?executionId='+executionIdTmp+'">'
        	},{  
				region:'center', 
				collapsible: true, 
				title: '列表',
				split: true, 
				border:false,  
				items:[grid]
           }
		]
	})
})