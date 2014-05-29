var store = new Ext.data.JsonStore({
			pruneModifiedRecords:true,
			fields : ['id', 'serviceProvider','serviceCharge','serviceLinkman','service_linktel'],
			pageSize : 40,
			proxy : {
				type : 'ajax',
				url : 'esbServiceProvider!query.do',
				reader : {
					root : 'data',
					totalProperty : 'totalCount'
				}
			}
	});// end of store
store.on('beforeload',function(store,options){
	var new_params1 = {keyword : encodeURIComponent(Ext.getCmp('keyword2').getValue())};
	Ext.apply(store.proxy.extraParams, new_params1);
})
var column = [
	{header : "ID",dataIndex : "id",flex:0.8}, // hidden：true
	{header : "服务商名称",dataIndex : "serviceProvider",flex:1}, // 新增字段。
	{header : "负责人",dataIndex : "serviceCharge",flex:1},
	{header : "联系人",dataIndex : "serviceLinkman",flex:1},
	{header : "联系电话",dataIndex : "service_linktel",flex:1}
	];

var topBar = [
	{
		text : "添加记录",handler : addRecord,pressed : true
	}, '-',
	{
		text : "修改记录",handler : editRecord,pressed : true
	}, '-',
	{
		text : "删除记录",handler : removeRecord,pressed : true
	}, '-',
	{
		xtype : 'label',text : '服务商名称:'
	}, 
	{
		xtype : 'textfield',width : 100,id : 'keyword2'
	}, '-',
	{
		text : '查询',pressed : true,
		handler : function() {
			
			store.loadPage(1,{
						params : {
							start : 0,
							limit : 40
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

var addform = Ext.widget('form', {
			// title : "填写数据列表",
			id : "addform",
			frame : true,
			xtype : "form",	
			layout:"column",
			baseCls:"x-plain",
    		style:"padding:5px",
			items:[{
	             columnWidth:0.5,
	             //layout:"form",
	             //labelWidth:50,
	             baseCls:"x-plain",
		
				 items : [
					{xtype : "hidden",name : "id",id:'id'}, 
					{xtype : "textfield",id:'serviceProvider',height:21,fieldLabel : "服务商名称",labelWidth : 75,inputType : "serviceProvider",name : "serviceProvider"},
					
					{xtype : "textfield",id:'serviceLinkman',height:21,fieldLabel : "联系人",labelWidth : 75,inputType : "serviceLinkman",name : "serviceLinkman",allowBlank:false}					
					 ]
				 },{
				 		columnWidth:0.5,
	                    //layout:"form",
	                    baseCls:"x-plain",
	                    items:[
		                    
							{xtype: "textfield",id:'serviceCharge',height:21,fieldLabel : "负责人",labelWidth : 75,inputType : "serviceCharge",name : "serviceCharge"},
					        {xtype: "textfield",id:'service_linktel',height:21,fieldLabel : "联系电话 ",labelWidth : 75,inputType : "service_linktel",name : "service_linktel"}
					        
	                    ]
				 }
			 ]					
			
			
	});

var addwin = Ext.widget('window', {
	title : "增加/修改",
	// bodyStyle:'padding:1px',
	closeAction : 'hide',
	width : 550,
	layout : 'fit',
	height : 140,
	items : [addform],
	buttons : [{
				text : '确定',
				handler : function() {
					var basicform = Ext.getCmp('addform').getForm();
					if (basicform.isValid()) {
						basicform.submit({
									success : function(form, action) {
										Ext.Msg.alert('信息', action.result.info);
										store.load({
													params : {
														start : 0,
														limit : 40
													}
												});
									},
									failure : function(form, action) {
										Ext.Msg.alert('信息', action.result.info);
									}
								});

						addwin.hide();
					}
				}
			}, {
				text : "重置",
				handler : function() {
					Ext.getCmp('addform').getForm().reset();
				}
			}, {
				text : '取消',
				handler : function() {
					addwin.hide();
				}
			}]
});

// grid difinition...
var grid = new Ext.grid.GridPanel({
		title : "服务商管理",
		store : store,
		id : 'grid',
		selModel : Ext.create('Ext.selection.CheckboxModel'),// {mode:"SIMPLE",singleSelect:														// false}),
		columns : column,
		tbar : topBar,
		bbar : pagebar
});

function addRecord() {
	var basicform = Ext.getCmp('addform').getForm();
	basicform.reset();
	addwin.show();
	basicform.url = 'esbServiceProvider!insert.do';
}

function editRecord() {
	var _sm = grid.getSelectionModel();
	var selec_record = _sm.getSelection();
	
	if (_sm.getCount() == 0) {
		Ext.Msg.alert('信息', '请选择一条需要修改记录');
		return;
	}
	if (_sm.getCount() > 1) {
		Ext.Msg.alert('信息', '每次只能修改一条记录,现取第一条选择的记录做修改');
	}

	addwin.show();
	var basicform = Ext.getCmp('addform').getForm();
	basicform.loadRecord(selec_record[0]);

	basicform.url = 'esbServiceProvider!update.do';
}

function removeRecord() {
	var sm = grid.getSelectionModel();
	if (sm.getCount() == 0) {
		Ext.Msg.alert('信息', '请选择需要删除记录');
		return;
	}
	var selec_record = sm.getSelection();
	var len = selec_record.length;
	var id = "";
	for (var leni = 0; leni < len; leni++) {
		if (leni == len - 1) {
			id += selec_record[leni].get("id");
		} else {
			id += selec_record[leni].get("id") + ",";
		}
	}
	Ext.MessageBox.confirm('提示', '你真的要删除这' + len + '条记录吗！', function(btn) {
		if (btn == 'yes') {
			Ext.Ajax.request({
						url : 'esbServiceProvider!delete.do',
						success : function(response, options) {
							// alert(response);
							Ext.Msg.alert('信息',Ext.JSON.decode(response.responseText).info);
							store.load({
										params : {
											start : 0,
											limit : 40
										}
									});
						},
						failure : function(response) {
							Ext.Msg.alert('信息', Ext.JSON
											.decode(response.respeseText).info);
						},
						params : {
							id : id
						}
					});
		}
	})
}

Ext.onReady(function() {
			Ext.QuickTips.init();
			store.load({
						params : {
							start : 0,
							limit : 40
						}
					});
			// 窗口布局
			new Ext.Viewport({
						layout : "fit",
						items :[grid]
					})
})