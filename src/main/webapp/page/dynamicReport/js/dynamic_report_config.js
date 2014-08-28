var tempData = {};
function deleteJformHead(ids){
	Ext.Msg.confirm("确认","您确定删除吗？",function(btn){
		if(btn=='yes'){
		    Ext.Ajax.request({
				url : fullpath	+ '/dynamicReportConfigController.do?deleteJformHead',
				success : function(_response, _options) {
					var result = Ext.util.JSON.decode(_response.responseText);
					Ext.StoreMgr.get('head_store').load({
						params : {
							start : 0,
							limit : 50
						}
					});
				},
				params : {
					ids : ids
				},
				failure : function() {
					Ext.Msg.alert('信息', '操作失败');
				}
			});
		}
	});
}
function configReportUrl(coding){
	Ext.getCmp('configurl_win').show();
	document.getElementById('configIdSpan').innerHTML = "/dynamicReportController.do?list&configId="+coding;
}
function changeTriggerImg(img,number){
	img.src = "../../icons/checkz"+number+".png"; 	
}
function copyToClipboard(txt) {
    if (window.clipboardData) {
        window.clipboardData.clearData();
        clipboardData.setData("Text", txt);
        alert("复制成功！");

    } else if (navigator.userAgent.indexOf("Opera") != -1) {
        window.location = txt;
    } else if (window.netscape) {
        try {
            netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
        } catch (e) {
            alert("被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将 'signed.applets.codebase_principal_support'设置为'true'");
        }
        var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
        if (!clip)
            return;
        var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
        if (!trans)
            return;
        trans.addDataFlavor("text/unicode");
        var str = new Object();
        var len = new Object();
        var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
        var copytext = txt;
        str.data = copytext;
        trans.setTransferData("text/unicode", str, copytext.length * 2);
        var clipid = Components.interfaces.nsIClipboard;
        if (!clip)
            return false;
        clip.setData(trans, null, clipid.kGlobalClipboard);
        alert("复制成功！");
    }
}
Ext.onReady(function(){

//configURL window
var configurl_win = new Ext.Window({
	id : 'configurl_win',
	closeAction : 'hide',
	width : 430,
	height : 100,
	title : '配置地址',
	layout : 'fit',
	items : [{
		layout : 'fit',
		xtype : 'panel',
		html : '<div class="configurl-div" id="configIdSpan"></div>'
	}],
	buttonAlign : 'right',
	buttons : [
		{
			text : '复制',
			handler : function(){
				 var clipContent = document.getElementById('configIdSpan').innerText;
				 copyToClipboard(clipContent);
			}
		},{
			text : '关闭',
			handler : function(){
				configurl_win.hide();
			}
		}
	]
});
	
//item window
		var zs_trigger = Ext.extend(Ext.form.TriggerField,{
			    onRender : function(ct, position){
			        Ext.form.TriggerField.superclass.onRender.call(this, ct, position);
			        this.wrap = this.el.wrap({cls: "x-form-field-wrap"});
			        this.trigger = this.wrap.createChild(this.triggerConfig ||
			                {tag: "img", src: Ext.BLANK_IMAGE_URL, cls: "x-form-trigger " +this.triggerClass});
			        if(this.hideTrigger){
			            this.trigger.setDisplayed(false);
			        }
			        this.trigger.setWidth(45)
			        this.initTrigger();
			        if(!this.width){
			            this.wrap.setWidth(this.el.getWidth()+this.trigger.getWidth());
			        }
			    },
			    initTrigger : function(){
			        this.trigger.on("click", this.onTriggerClick, this, {preventDefault:true});
			    }
		});
		var item_form = new Ext.FormPanel({
		height : 140,
		id : 'oprForm_win_device',
		layout : "column",
		style : "padding:5px;",
		frame : true,
		items : [{
					columnWidth : .5,
					layout : "form",
					labelWidth : 70,
					baseCls : "x-plain",
					items : [new zs_trigger({
								xtype : 'trigger',
//								triggerClass : 'codingTrigger',
								name : 'coding',
								fieldLabel : '编码',
								allowBlank : false,
								id : 'item_coding',
								triggerConfig : {
										 tag: "img", id: 'checkImgId', 
										 src: '../../icons/checkz0.png', 
										 cls: "x-form-trigger " + this.triggerClass,
										 onmouseover : 'changeTriggerImg(this,1)',
										 onmouseout  : 'changeTriggerImg(this,0)'
									 },
								onTriggerClick : function(){
									var coding = this.getValue();
									if(coding==null || coding==""){
										Ext.Msg.alert("信息","不可用");
										return;
									}
									var currentCoding = "";
									var records = grid.getSelectionModel().getSelections();
									if(records && records.length>0){
										currentCoding = records[0].get('coding');
									}
									Ext.Ajax.request({
										url : fullpath	+ '/dynamicReportConfigController.do?checkHeadCodeUsed',
										success : function(_response, _options) {
											var result = Ext.util.JSON.decode(_response.responseText);
											if(result.message == '可用'){
												tempData.codingAvaliable = true;
											}else{
												tempData.codingAvaliable = false;
											}
											Ext.Msg.alert("信息",result.message);
										},
										params : {
											coding : coding,
											currentCoding : currentCoding
										},
										failure : function() {
											Ext.Msg.alert('信息', '操作失败');
										}
									});
								},
								anchor : '95%'
							}),{
								xtype : 'textarea',
								name : 'sql',
								fieldLabel : '查询数据SQL',
								allowBlank : false,
								id : 'item_sql',
								anchor : '95%'
							}]
				}, {
					columnWidth : .1,
					layout : "form",
					labelWidth : 0,
					style : 'maing-left:-20px;',
					baseCls : "x-plain",
					items : [{
						xtype : 'button',
						text : 'sql解析',
						id : 'sql_analyz_button',
						style : 'margin-top:50px;margin-left:0;',
						handler : function(){
							Ext.Ajax.request({
								url : fullpath	+ '/dynamicReportConfigController.do?analyzSql',
								success : function(_response, _options) {
									var result = Ext.util.JSON.decode(_response.responseText);
									if(result.message){
										Ext.Msg.alert("信息",result.message);
									}else{
										var datas = result.data;
										tempData.sortNumber = 0;
										Ext.each(datas,function(_data,_index){
											if(_data.sort>tempData.sortNumber){
												tempData.sortNumber = _data.sort;
											}
										});
										item_store.loadData(result);
									}
								},
								params : {
									crgSql : Ext.getCmp('item_sql').getValue(),
									start : 0,
									limit : 100
								},
								failure : function() {
									Ext.Msg.alert('信息', '查询失败');
								}
							});
						}
					}]
				}, {
					columnWidth : .4,
					layout : "form",
					labelWidth : 70,
					baseCls : "x-plain",
					items : [{
								xtype : 'textfield',
								name : 'name',
								fieldLabel : '名称',
								id : 'item_name',
								allowBlank : false,
								anchor : '95%'
							},{
								xtype : 'textarea',
								name : 'description',
								fieldLabel : '描述',
								allowBlank : false,
								id : 'item_description',
								anchor : '95%'
							}]
				}]
	})
	var item_store = new Ext.data.JsonStore({
	    fields:['fieldName','sort','fieldText','fieldType','fieldWidth','isShow','showHref','queryModel','expression','dctCode','isQuery'],
	    pruneModifiedRecords : true,
	    sortInfo : {
	    	field : 'sort',
	    	direction: 'ASC'
	    },
	    root : 'data',
	    proxy: new Ext.data.HttpProxy({
			url : fullpath+'/dynamicReportConfigController.do?queryConfigedItem',
			timeout : 300000
		}),
	    listeners : {
	    	'beforeload' : function(_store,_options){
		    }
	    }
	});
	var item_sm = new Ext.grid.CheckboxSelectionModel({
			singleSelect : false
		});
	var item_colml = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), item_sm, 
		{header:'字段名',width : 210,sortable:false,dataIndex:'fieldName',editor : new Ext.form.TextField()},
		{header:'排序',width : 210,sortable:true,dataIndex:'sort',editor : new Ext.form.TextField()},
		{header:'字段文本',width : 210,sortable:false,dataIndex:'fieldText',editor : new Ext.form.TextField()},
		{header:'字段类型',width : 210,sortable:false,dataIndex:'fieldType',editor : new Ext.form.ComboBox({
			store:new Ext.data.SimpleStore({  
                fields:["value","text"],  
                data:[['Integer','Integer'],['String','String'],['Date','Date'],['ComboBox','ComboBox'],['Long','Long']]  
            }),  
            displayField:"text",  
            valueField:"value",  
            mode:"local",  
            triggerAction:"all",  
            readOnly:true, 
            value : 'String'
		})},
		{header:'字段宽度',width : 210,sortable:false,dataIndex:'fieldWidth',editor : new Ext.form.TextField()},
		{header:'是否显示',width : 210,sortable:false,dataIndex:'isShow',editor : new Ext.form.ComboBox({
			store:new Ext.data.SimpleStore({  
                fields:["value","text"],  
                data:[['显示','显示'],['隐藏','隐藏']]  
            }),  
            displayField:"text",  
            valueField:"value",  
            mode:"local",  
            triggerAction:"all",  
            readOnly:true, 
            value : 'Y'
		})},
		{header:'字段显示href',width : 210,sortable:false,dataIndex:'showHref',editor : new Ext.form.TextField()},
		{header:'查询模式',width : 210,sortable:false,dataIndex:'queryModel',editor : new Ext.form.ComboBox({
			store:new Ext.data.SimpleStore({  
                fields:["value","text"],  
                data:[['单条件查询','单条件查询'],['范围查询','范围查询']]  
            }),  
            displayField:"text",  
            valueField:"value",  
            mode:"local",  
            triggerAction:"all",  
            readOnly:true, 
            value : 'single'
		})},
		{header:'取值表达式',width : 210,sortable:false,dataIndex:'expression',editor : new Ext.form.TextField()},
		{header:'字典Code',width : 210,sortable:false,dataIndex:'dctCode',editor : new Ext.form.TextField()},
		{header:'是否查询',width : 210,sortable:false,dataIndex:'isQuery',editor : new Ext.form.ComboBox({
			store:new Ext.data.SimpleStore({  
                fields:["value","text"],  
                data:[['是','是'],['否','否']]  
            }),  
            displayField:"text",  
            valueField:"value",  
            mode:"local",  
            triggerAction:"all",  
            readOnly:true, 
            value : 'Y'
		})}
	]);
//	var item_pagebar = new Ext.PagingToolbar({
//			pageSize : 50,
//			store : item_store,
//			displayInfo : true,
//			displayMsg : '显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
//			emptyMsg : "没有记录"
//		});
	var item_toolbar = new Ext.Toolbar({
		height : 25,
	    items: [{
	    	text : '添加',
	    	handler : function(){
	    		item_store.loadData({
	    			data : [{
	    				fieldName : '',
	    				sort : ++tempData.sortNumber,
	    				fieldText : '',
	    				fieldType : 'String',
	    				fieldWidth : 100,
	    				isShow : '显示',
	    				showHref : '',
	    				queryModel : '单条件查询',
	    				expression : '',
	    				dctCode : '',
	    				isQuery : '是'
	    			}]
	    		},true);
	    	}
	    },{
	    	text : '删除',
	    	handler : function(){
	    		var recordArray = item_grid.getSelectionModel().getSelections();
	    		Ext.each(recordArray,function(_record,_index){
		    		item_store.remove(_record);
	    		});
	    	}
	    }]
	});
	var item_grid = new Ext.grid.EditorGridPanel({
		store: item_store,
    	cm:item_colml,
     	sm:item_sm,
     	clicksToEdit : 1,
     	trackMouseOver:false,
     	disableSelection:false,
     	border : false,
     	loadMask: {msg:'正加载数据...'},
     	viewConfig: {
           forceFit:true            
     	},
		tbar : item_toolbar
	});
	var item_window = new Ext.Window({
		title : '录入',
		bodyStyle : 'padding:5px',
		layout : 'form',
		closeAction : 'hide',
		plain : true,
		frame : true,
		modal : true,
		width : 1000,
		height : 430,
		labelWidth : 55,
		showlock : true,
		buttonAlign : "right",
        items:[item_form,{
        		region : 'south',
        		height : 200,
        		xtype : 'tabpanel',
				activeTab : 0,// 页面进入时浏览那个tab，默认是不浏览，0是第一个tab
				frame : true,
				items : [{
					xtype : 'panel',
					layout : 'fit',
					title : '动态报表明细配置',
					items : [item_grid]
				}]
        }],
        buttons : [{
        	text : '确定',
        	id : 'item_window_confirm',
        	handler : function(){
				if(item_store.getCount()<=0){
					Ext.Msg.alert("信息","item is null");
					return;					
				}
				//check coding avaliable
				var coding = Ext.getCmp("item_coding").getValue();
				var currentCoding = "";
				var records = grid.getSelectionModel().getSelections();
				if(records && records.length>0){
					currentCoding = records[0].get('coding');
				}
				Ext.Ajax.request({
					url : fullpath	+ '/dynamicReportConfigController.do?checkHeadCodeUsed',
					success : function(_response, _options) {
						var result = Ext.util.JSON.decode(_response.responseText);
						if(result.message == '可用'){
							add_config_report_function();
						}else{
							Ext.Msg.alert("信息","CODE已经存在");
						}
					},
					params : {
						coding : coding,
						currentCoding : currentCoding
					},
					failure : function() {
						Ext.Msg.alert('信息', '操作失败');
					}
				});
        	}
        },{
        	text : '取消',
        	handler : function(){
        		item_window.hide();
        	}
        }],
        listeners : {
        	'show' : function(_this){
        		tempData.codingAvaliable = true;
        	}
        }
	});
	
	var add_config_report_function = function(){
		var item_array = new Array();
		item_store.each(function(_record){
			item_array.push(_record.data);
		});
        var basicform = item_form.getForm();
        if(basicform.isValid()){
        		var records = grid.getSelectionModel().getSelections();
        		Ext.Ajax.request({
						url : tempData.currentAction=='add'
							?fullpath	+ '/dynamicReportConfigController.do?saveItems'
							:fullpath	+ '/dynamicReportConfigController.do?updateReportConfig',
						success : function(_response, _options) {
							var result = Ext.util.JSON.decode(_response.responseText);
							item_window.hide();
							store.load({
								params : {
									start : 0,
									limit : 50
								}
							});
						},
						params : {
							head_id : records.length==0?'':records[0].get('id'),
							item_coding : Ext.getCmp('item_coding').getValue(),
							item_description : Ext.getCmp('item_description').getValue(),
							item_sql : Ext.getCmp('item_sql').getValue(),
							item_name : Ext.getCmp('item_name').getValue(),
							item_array : Ext.encode(item_array)
						},
						failure : function() {
							Ext.Msg.alert('信息', '操作失败');
						}
					});
        }else{
        	Ext.Msg.alert("信息","请填写正确的数据");	
        }
	}
	
	// head grid
	var store = new Ext.data.JsonStore({
		storeId : 'head_store',
	    fields:['id','coding','name','sql','description'],
	    pruneModifiedRecords : true,
	    totalProperty  : 'totalCount',
	    root : 'data',
	    proxy: new Ext.data.HttpProxy({
			url : fullpath+'/dynamicReportConfigController.do?queryConfigedReport',
			timeout : 300000
		}),
	    listeners : {
	    	'beforeload' : function(_store,_options){
		     	Ext.apply(_store.baseParams, {
		     		coding: Ext.getCmp('coding_search').getValue(),
		     		name: Ext.getCmp('name_search').getValue(),
		     		sql: Ext.getCmp('sql_search').getValue(),
		     		description: Ext.getCmp('description_search').getValue()
		     	});
		    }
	    }
	});
	var sm = new Ext.grid.CheckboxSelectionModel({
			singleSelect : false
		});
	var colml = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm, {header:'ID',
			width : 10,
			sortable:true,
			dataIndex:'id',
			hidden:true
		},{
			header:'编码',
			width : 10,
			sortable:true,
			dataIndex:'coding'
		},{header:'名称',
			width : 10,
			sortable:true,
			dataIndex:'name'
		},{
			header:'查询数据SQL',
			width : 50,
			sortable:true,
			dataIndex:'sql'
		},{
			header:'描述',
			width : 30,
			sortable:true,
			dataIndex:'description'
		},{
			header:'操作',
			width : 10,
			sortable:true,
			dataIndex:'description',
			renderer : function(_v,_m,_record){
				var id = _record.get('id');
				var coding = _record.get('coding');
				return '[<a href="#" onclick="deleteJformHead(\''+id+'\')">删除</a>][<a href="#" onclick="configReportUrl(\''+coding+'\')">配置地址]';
			}
		}
	]);
	var pagebar = new Ext.PagingToolbar({
			pageSize : 50,
			store : store,
			displayInfo : true,
			displayMsg : '显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
			emptyMsg : "没有记录"
		});
	var toolbar = new Ext.Toolbar({
		scope : this,
		height : 25,
	    items: [  '编码:',{
	    			id : 'coding_search',
			        xtype    : 'textfield',
			       	name     : 'coding'
			    },'-','名称:',{
	    			id : 'name_search',
			        xtype    : 'textfield',
			        name     : 'name'
			    },'-','查询数据SQL:',{
	    			id : 'sql_search',
			        xtype    : 'textfield',
			        name     : 'sql-'
			    },'-','描述:',{
	    			id : 'description_search',
			        xtype    : 'textfield',
			        name     : 'description'
			    }]
	});
	var toolbar2 = new Ext.Toolbar({
		scope : this,
		height : 25,
	    items: [	
	        {
	            text: '录入',
	            pressed : true,
	            handler : function(){
					item_window.show();
					item_form.getForm().reset();
					item_store.loadData({
						totalCount : 0,
						data : []
					});
					tempData.sortNumber = 0;
					tempData.currentAction = 'add';
					Ext.getCmp('item_coding').enable();
					Ext.getCmp('item_name').enable();;
					Ext.getCmp('item_sql').enable();;
					Ext.getCmp('item_description').enable();
					Ext.getCmp('item_window_confirm').enable();
					Ext.getCmp('sql_analyz_button').enable();
	            }
	        },'-',{
	            text: '编辑',
	            pressed : true,
	            handler : function(){
					var selections = grid.getSelectionModel().getSelections();
	            	if(selections.length==0){
	            		Ext.Msg.alert("信息","请选择要编辑的记录");
	            		return;
	            	}
	            	if(selections.length>1){
	            		Ext.Msg.alert("信息","只能选择一条记录");
	            		return;
	            	}
	            	var head_id = selections[0].get('id');
					Ext.Ajax.request({
						url : fullpath	+ '/dynamicReportConfigController.do?showItemsByHeadId',
						success : function(_response, _options) {
							item_window.show();
							Ext.getCmp('item_coding').setValue(selections[0].get('coding'));
							Ext.getCmp('item_name').setValue(selections[0].get('name'));
							Ext.getCmp('item_sql').setValue(selections[0].get('sql'));
							Ext.getCmp('item_description').setValue(selections[0].get('description'));
							Ext.getCmp('item_coding').enable();
							Ext.getCmp('item_name').enable();;
							Ext.getCmp('item_sql').enable();;
							Ext.getCmp('item_description').enable();
							Ext.getCmp('item_window_confirm').enable();
							Ext.getCmp('sql_analyz_button').enable();
							delete tempData['sortNumber'];
							tempData.currentAction = 'update';
							var result = Ext.util.JSON.decode(_response.responseText);
							item_store.loadData(result);
						},
						params : {
							head_id : head_id,
							start : 0,
							limit : 50
						},
						failure : function() {
							Ext.Msg.alert('信息', '操作失败');
						}
					});	            
	            }
	        },'-',{
	            text: '批量删除',
	            pressed : true,
	            handler : function(){
					var records = grid.getSelectionModel().getSelections();
					if(records.length==0){
	            		Ext.Msg.alert("信息","请选择要删除的记录");
	            		return;
	            	}
	            	var ids = "";
	            	Ext.each(records,function(_record){
	            		ids += _record.get("id")+",";
	            	});
	            	if(ids.indexOf(",")!=-1){
	            		ids = ids.substring(0,ids.lastIndexOf(","));
	            	}
	            	deleteJformHead(ids);
	            }
	        },'-',{
	            text: '查看',
	            pressed : true,
	            handler : function(){
	            	var selections = grid.getSelectionModel().getSelections();
	            	if(selections.length==0){
	            		Ext.Msg.alert("信息","请选择要查看的记录");
	            		return;
	            	}
	            	if(selections.length>1){
	            		Ext.Msg.alert("信息","只能选择一条记录");
	            		return;
	            	}
	            	var head_id = selections[0].get('id');
					Ext.Ajax.request({
						url : fullpath	+ '/dynamicReportConfigController.do?showItemsByHeadId',
						success : function(_response, _options) {
							item_window.show();
							Ext.getCmp('item_coding').setValue(selections[0].get('coding'));
							Ext.getCmp('item_name').setValue(selections[0].get('name'));
							Ext.getCmp('item_sql').setValue(selections[0].get('sql'));
							Ext.getCmp('item_description').setValue(selections[0].get('description'));
							Ext.getCmp('item_coding').disable();
							Ext.getCmp('item_name').disable();;
							Ext.getCmp('item_sql').disable();;
							Ext.getCmp('item_description').disable();
							Ext.getCmp('item_window_confirm').disable();
							Ext.getCmp('sql_analyz_button').disable();
							var result = Ext.util.JSON.decode(_response.responseText);
							item_store.loadData(result);
						},
						params : {
							head_id : head_id,
							start : 0,
							limit : 50
						},
						failure : function() {
							Ext.Msg.alert('信息', '操作失败');
						}
					});
	            }
	        },'->',{
	            text: '查询',
	            pressed : true,
	            handler : function(){
					grid.store.load({params:{start:0, limit:20}});       
	            }
	        },'-',{
	            text: '重置',
	            pressed : true,
	            handler : function(){
						            
	            }
	        }
	    ]
	});
	var grid = new Ext.grid.GridPanel({
		title : '动态报表配置',
		store: store,
    	cm:colml,
     	sm:sm,
     	trackMouseOver:false,
     	disableSelection:false,
     	loadMask: {msg:'正加载数据...'},
     	viewConfig : {
			forceFit : true
		},
		listeners : {
			'render' : function() {
				toolbar2.render(this.tbar); // add one tbar
			}
		},
		tbar : toolbar,
		bbar : pagebar
	});
	var view_port = new Ext.Viewport({
	    layout: 'fit',
	    items: [grid]
	});
});