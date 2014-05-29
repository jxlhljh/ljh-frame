//*******变量声明************************************************************************
var store,grid; 
var dataNamefield; 


//*******grid 列定义*********************************************************************
var sm=new Ext.grid.CheckboxSelectionModel({
	singleSelect:false
});
var fields = ['id_','rev_','category_','name_','key_','version_','deployment_id_','resource_name_','dgrm_resource_name_','description_','has_start_form_key_','suspension_state_','operate_state_','tenant_id_'];
var colml=new Ext.grid.ColumnModel([
    new Ext.grid.RowNumberer(),
    sm,
    {header: "id", width:110, sortable:true,align:'center',hidden:true, dataIndex:'id_'} ,
    {header: "rev", width:110, sortable:true,align:'left',hidden:true, dataIndex:'rev_'},
    {header: "category", width: 110, sortable:true,align:'left', dataIndex:'category_'},
    {header: "名称", width: 100, sortable:true,align:'left', dataIndex:'name_'},
    {header: "KEY", width: 100, sortable:true,align:'left', dataIndex:'key_'},
    {header: "版本号", width: 100, sortable:true,align:'left', dataIndex:'version_'},
    {header: "DeploymentId", width: 100, sortable:true,align:'left', dataIndex:'deployment_id_'},
    {header: "XML", width: 100, sortable:true,align:'left', dataIndex:'resource_name_',renderer:sourceReadXml},
    {header: "图片", width:140, sortable:true,align:'center', dataIndex:'dgrm_resource_name_',renderer:sourceReadImage},
    {header: "description", width:140, sortable:true,align:'center', dataIndex:'description_'} ,
    {header: "hasStartFromKey", width:90, sortable:true,align:'center',hidden:true ,dataIndex:'has_start_form_key_'} ,
    {header: "是否挂起", width:120, sortable:true,align:'center', dataIndex:'suspension_state_',renderer:isStateSuspension} ,
    {header: "操作", width:120, sortable:true,align:'center', dataIndex:'operate_state_',renderer:isOperateState} ,
    {header: "tenantId", width:100, sortable:true,align:'center',hidden:true,dataIndex:'tenant_id_'} 
    ]
);


//*******报表主grid 查询条件********************************
store=new Ext.data.JsonStore({
	root: 'datas',
	totalProperty: 'totalCount',
	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
	fields: fields,
	url: fullpath+'/workflow/ActProcdefAction!dataQry.do' ,
	remoteSort:true
});

dataNamefield= new Ext.form.TextField({
    id:'dataNamefield',
    xtype:'textfield',
    name:'dataNamefield'
});

var theadbar=new Ext.Toolbar({
	id:'theadbar',
	scope:this,
	height:25,
	items:[
	       '工作流程名称',dataNamefield,'-',
	       {
	    	   text:'查询',
	    	   pressed:true,
	    	   handler:queryDevice
	       },
	       {
	    	   text:'部署',
	    	   pressed:true,
	    	   handler:deployDevice
	       }
	       ]
});

var pagebar= new Ext.PagingToolbar({
	pageSize:20,
	store:store,
	displayInfo:false,
	displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
	emptyMsg:"没有记录"
});


//初始化页面信息和表格
Ext.onReady(function(){
   	Ext.QuickTips.init();
   	
    grid=new Ext.grid.GridPanel({
    	 region:'center', 
    	 title:'工作流程定义列表',
    	 store: store,
    	 cm:colml,
     	 sm:sm,
     	 trackMouseOver:false,
     	 disableSelection:false,
     	 loadMask: {msg:'正加载数据...'},
     	 viewConfig: {
            forceFit:false            
     	 },
     	 bbar:pagebar,
     	 tbar:theadbar
    });
	//store.load({params:{start:0, limit:20}});
    queryDevice();

	var viewport = new Ext.Viewport({
		layout:'border',
		border:false,
		split: true,
		items:[{
		    	   xtype:'panel',
		    	   region:'center',
                   id:'datagrid',
		    	   layout:'fit', 
                   hidden:false, 
		    	   width:document.body.clientWidth*0.78,
		    	   items:[grid]
		       }
		]
	});

})


//---------------------------函数定义-------------------------------------
function queryDevice(){
   	Ext.apply(store.baseParams, { 
   		name:dataNamefield.getValue()
	});
	store.load({params:{start:0, limit:20}});
}

function deployDevice(){
	
}


//读取工作流xml
function sourceReadXml(_val,m,record){
	var processDefinitionId = record.data['id_'];
    return '<a target="_blank" href="'+fullpath+'/workflow/WorkFlowCommonAction!resourceRead.do?resourceType=xml&processDefinitionId='+processDefinitionId+'">'+_val+'</a>';
}


//读取工作流image
function sourceReadImage(_val,m,record){
	var processDefinitionId = record.data['id_'];
	return '<a target="_blank" href="'+fullpath+'/workflow/WorkFlowCommonAction!resourceRead.do?resourceType=image&processDefinitionId='+processDefinitionId+'">'+_val+'</a>';
}

//是否挂起
function isStateSuspension(_val,m,record){
	var processDefinitionId = record.data['id_'];
//	alert(_val);
	if(_val=="true"){
		return "false | "+"<a href='#' onclick='showState(\""+processDefinitionId+"\",\""+_val+"\");''>挂起</a>";
	}else if(_val=="false"){
		return "true | "+"<a href='#' onclick='showState(\""+processDefinitionId+"\",\""+_val+"\")'>激活</a>";
	}
	
}


//操作，删除
function isOperateState(_val,m,record){
	var processDefinitionId = record.data['id_'];
	var deploymentId = record.data['deployment_id_'];
	return "<a href='#' onclick='showDelete(\""+processDefinitionId+"\",\""+deploymentId+"\")'>删除</a>";
//	+"<a href='#'>转换为Model</a>";
}


function showState(_id,_val){
//	alert("showState:"+_val);
	Ext.Ajax.request({
		url:fullpath+'/workflow/WorkFlowCommonAction!updateState.do',
		params:{processDefinitionId:_id,state:_val},
		success: function() {
			store.load({params:{start:0, limit:20}});
		},
		failure: function() {
			Ext.Msg.alert('信息','查询失败');
		}
	});
}


function showDelete(_id,deploymentId){

//	alert(deploymentId);
	Ext.MessageBox.confirm('提示','确认删除所选信息？',goDelete); 
    function goDelete(btn){ 
   	if(btn=="yes"){  
	 		Ext.Ajax.request({
		    	url:fullpath+'/workflow/ActProcdefAction!dataDelete.do',
		    	success:function(){
		    		store.load({params:{start:0, limit:20}});
		    		Ext.Msg.alert('信息','删除成功');
				},
			   	failure: function() {
			    	Ext.Msg.alert('信息','查询失败');
		   		},
		   		params: {deploymentId : deploymentId }
			});
	 	}
	}
}


