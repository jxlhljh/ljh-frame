/***获取按钮权限*****************************************/
var moudleId = "userZone";
var hasAddButton = hasButtonPermission("add",moudleId);
var hasUpdateButton = hasButtonPermission("update",moudleId);
var hasDeleteButton = hasButtonPermission("delete",moudleId);
var hasQueryButton = hasButtonPermission("query",moudleId);

//alert(hasButtonPermission(add,moudleId));

/***显示布局*********************************/
Ext.onReady(function(){
	
	if(Ext.isIE){ Ext.enableGarbageCollector=false; }
	Ext.QuickTips.init();
	
	/*全局变量********/
	var rootCode = "-1";
	var clickUserZoneCode=rootCode;
	var pageSize = 15;
	
	/*区域信息设备树treePanel******************************************/
	var tree_store = Ext.create('Ext.data.TreeStore', {
        proxy: {
            type: 'ajax',
            url:fullpath+'/userZoneController.do?listUserZoneTree'
        },
        root: {
            text:'全国',
			id:'-1',
			icon:fullpath+'/icons/home_page_icon/home.gif',
			expanded : false
        } 
     });
 
    var  userZoneTreePanel=Ext.create('Ext.tree.Panel',{
		      	id: 'userZoneTreePanel',
		        containerScroll:true,
				animate:true,
				border:false,
				rootVisible:true,
				enableDrag:false,
				enableDD:false,
				autoScroll : true,
		        store  :tree_store,  
		    	listeners : {  
			        	'itemclick' : function(view,record,item,index,e,eOpts){
			    		 	if(index>0){
			    		 		clickUserZoneCode = record.raw.id;
			    		 	}else{
			    		 		clickUserZoneCode = rootCode;
			    		 	}
			    			queryDataGrid();//加载右边的数据
			       	 }
			    }  
    }); 

    userZoneTreePanel.on("beforeload", function(ds, opration, opt) {
          opration.params.zonecode=opration.node.data.id;
          curentCode = opration.node;
    }); 
    
	/*区域管理gridPanel******************************************/
    var grid_store = new Ext.data.JsonStore({
			pruneModifiedRecords:true,
			fields : ['id', 'zonecode','zonename','parentcode','level'],
			pageSize : pageSize,
			proxy : {
				type : 'ajax',
				url : fullpath+'/userZoneController.do?queryUserZone',
				reader : {
					root : 'data',
					totalProperty : 'totalCount'
				}
			}
	});
	
	grid_store.on('beforeload',function(store,options){
		var new_params1 = {parentcode:clickUserZoneCode,zonename:Ext.getCmp("keyword2").getValue()};
		Ext.apply(grid_store.proxy.extraParams, new_params1);
	})
	
	var column = [
		{header : "ID",dataIndex : "id",hidden :true,flex:0.8}, // hidden：true
		{header : "区域代码",dataIndex : "zonecode",flex:1}, // 新增字段。
		{header : "区域名称",dataIndex : "zonename",flex:1},
		{header : "父级代码",dataIndex : "parentcode",flex:1}
	];
	

	//模块管理-增改（widow+form）
  	var addform =  Ext.widget('form', {
		id:'addform',
		xtype:'form',
		baseCls:"x-plain",
		style:"padding:5px",
		items:[
			{
				xtype:'hidden',
				name:'id',fieldLabel: 'ID', id:'id',anchor:'95%',
				allowBlank:false
			},{
				xtype:'textfield',
				name:'zonecode',fieldLabel: '区域代码', id:'zonecode',anchor:'95%',
				allowBlank:false
			},{
			     xtype:'textfield',
			     name: 'zonename',fieldLabel: '区域名称',id:'zonename',anchor:'95%',
			     allowBlank:false
			},{  
                xtype: 'comboboxtree',  
                name: 'parentcode', fieldLabel: '父级代码',id:'parentcode',anchor:'95%',
			    maxPickerHeight:180,
                store: Ext.create('Ext.data.TreeStore', {
                	id:'parentcode_store',
			        root: {
			            text:'全国',
						id:'-1',
						expanded:true
			        },
			        proxy: {   
			            type: 'ajax',   
			            url: fullpath+'/userZoneController.do?listUserZoneTree4combo'
			        }
	    		})
            }
   		]
	 });
	var addwin =  Ext.widget('window',{
		title:"增加/修改区域信息",
	    bodyStyle:'padding:5px',
	    layout : 'fit',
	    closeAction :'hide',
	 	plain: true,
        id:'addwind',
        width: 350,
	    height:260,
        items:[addform],
        showlock:false,
        buttons:[{
			text:"确定",
			handler:function(){
        		addform.getForm().submit({
              		waitTitle:"等待中.....",
					waitMsg:"正在提交数据，请稍.....",
	        		failure:function(form,action){
                        Ext.Msg.alert('服务器出错', action.result.msg);  
	       				addwin.hide();
	                },
	         		success:function(form,action){
                        Ext.Msg.alert('信息', "操作成功");  
 		 		   	    addwin.hide();
 		 		   	    grid_store.loadPage(1,{params : {start : 0,limit : pageSize}});
// 		 		   	    var parentcode_ = addform.getForm().findField('parentcode').getValue();
// 		 		   	    var parentNode = tree_store.getNodeById(parentcode_);
// 		 		   	    tree_store.getNodeById(action.result.treeId).remove();
//						parentNode.appendChild( {
//	                        text: addform.getForm().findField('zonename').getValue(),
//		 					id: action.result.treeId,
//	                        icon:fullpath+'/icons/home_page_icon/home.gif',
//	                        leaf:action.result.leaf
//	                    }) ;
						tree_store.load({params : {zonecode : -1}});
						Ext.getCmp("parentcode").store.load({params:{zonecode:-1}});
	                }
	         	});
            }
       	},{
         	text:"取消",
          	handler:function() {
       			addwin.hide();
       		}
  		}]
   	});
   	
   	var topBar = Ext.create('Ext.toolbar.Toolbar', {
	});
	if(hasAddButton){
		topBar.add(Ext.create('Ext.Button', {
			text : "增加",handler : function() {
				var basicform=Ext.getCmp('addform').getForm();
				basicform.reset();
				addwin.setTitle("增加区域信息");
				addwin.show();
				basicform.url= fullpath+'/userZoneController.do?addUserZone';
			}
		}));
		topBar.add({xtype:'tbseparator'});
	}
	if(hasUpdateButton){
		topBar.add(Ext.create('Ext.Button', {
			text : "修改",handler : function() {
				var _sm = datagrid.getSelectionModel();
				if(_sm.getCount()==0){
				    Ext.Msg.alert('信息','请选择需要修改记录，注意只能单选');
				    return;
				}
				if(_sm.getCount()>1){
				   Ext.Msg.alert('信息','每次只能修改一条记录');
				   return ;
				}
				var selec_record=_sm.getSelection();
				addwin.setTitle("修改区域信息");
				addwin.show();
				var basicform = Ext.getCmp('addform').getForm();
			  	basicform.loadRecord(selec_record[0]);
			 	basicform.url = fullpath+'/userZoneController.do?updateUserZone';
			}
		}));
		topBar.add({xtype:'tbseparator'});
	}
	
	if(hasDeleteButton){
		topBar.add(Ext.create('Ext.Button', {
		    text: '删除',
		    handler: function() {
				var _sm = datagrid.getSelectionModel();
				if(_sm.getCount()==0){
				    Ext.Msg.alert('信息','请选择需要删除的记录');
				    return;
				}
				Ext.MessageBox.confirm("确认删除","将删除所勾选的节点及其子节点，请点击按钮作出选择",function(btn){  
					alert(1);
					if(btn=="yes"){ 
					    alert(12);
						var selec_record=_sm.getSelection();
					    var len=selec_record.length;
					    var id="";
					    for(var leni=0;leni<len;leni++){
					    	var tmpNode = tree_store.getNodeById(selec_record[leni].get("id"));//左边主树获取节点
					    	if(tmpNode!=null) tmpNode.remove();												   //左边主树移除节点
					    	if(leni==len-1){
					    		id+=selec_record[leni].get("id");
					    	}else{
					    	 	id+=selec_record[leni].get("id")+",";
					    	}
					    }
					    alert(123);
					    Ext.Ajax.request({
					    	url:fullpath+'/userZoneController.do?deleteUserZone',
					    	success:function(_response,_options){
					        	Ext.Msg.alert('信息','删除成功');
					           	grid_store.loadPage(1,{params : {start : 0,limit : pageSize}});//grid刷新
								Ext.getCmp("parentcode").store.load({params:{zonecode:-1}});//下拉树刷新
					           	//tree_store.load();
		 					},
						   	failure: function() {
						    	Ext.Msg.alert('信息','删除失败');
					   		},
						   	params: {id: id }
						});
					}
				});
		    }
		}));
		topBar.add({xtype:'tbseparator'});
	}
	
	topBar.add({
		xtype : 'label',text : '区域名称:',width : 60
	});
	topBar.add({
		xtype : 'textfield',width : 100,id : 'keyword2'
	});
	topBar.add({xtype:'tbseparator'});
	
	//查询权限默认全打开
	topBar.add(Ext.create('Ext.Button', {
	    text: '查询',
	    handler : function() {
			grid_store.loadPage(1,{
				params : {
					start : 0,
					limit : pageSize,
					zonename:Ext.getCmp("keyword2").getValue()
				}
			});
		}
	}));
    
    var pagebar = Ext.create('Ext.toolbar.Paging', {
	    store:grid_store,
		displayInfo : true,
		displayMsg : '显示第 {0}条到{1}条记录，一共{2}条 ',
		emptyMsg : "没有记录"
	});
    
    var datagrid = new Ext.grid.GridPanel({
			title : "区域管理",
			store : grid_store,
			id:'userZoneGrid',
			selModel : Ext.create('Ext.selection.CheckboxModel'),// {mode:"SIMPLE",singleSelect:														// false}),
			columns : column,
			tbar : topBar,
			bbar : pagebar
	});
	
	/*页面JS函数定义******************************************/
	var queryDataGrid = function (){
		grid_store.loadPage(1,{
						params : {
							start : 0,
							limit : pageSize
						}
					});
	}
	
	/*初始化数据***************/
	queryDataGrid();//加载右边的数据
	
	/**viewPort对像*****************************/
	var viewport = new Ext.Viewport({
						layout:'border',
						border:false,
						items:[{
						    	   xtype:'panel',
						    	   region:'west',
						    	   layout:'fit',
						    	   title:'区域信息',
						    	   collapsible: true,
						    	   split:true,
						    	   width:document.body.clientWidth*0.2,
						    	   items:userZoneTreePanel
						       },{
						    	   xtype:'panel',
						    	   region:'center',
						    	   layout:'fit',
						    	   border:false,
						    	   width:document.body.clientWidth*0.8,
						    	   items:datagrid
						       }]
						});
});