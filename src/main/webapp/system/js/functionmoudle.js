//*******公共函数************************************************************************
var functionid,store,datagrid,storeOper,opergrid;//（全局变量）模块ID
function showButton(value){		//"操作"列字段的显示按钮
	if(value=='on') return "<a href='#' onclick='showEast();'>设置按钮</a>";
}

function hideEast(){
	Ext.getCmp("operationSet").hide();
	Ext.getCmp("operationSet").ownerCt.doLayout();//刷新
}
function showEast(){
	var record = datagrid.getSelectionModel().getSelection()[0]; //Get the Record 
	functionid = record.get("id");
	var moudletitle = record.get("moudletitle");
	Ext.Ajax.request({
		url:fullpath+'/sendisystem/sysOperationController.do?operationQuery',
		success:function(_response,_options){
			storeOper.load({params: {functionid: functionid}}) 
 		},
		failure: function() {
			Ext.Msg.alert('信息','查询失败');
		},
	   	params: {functionid: functionid }
	});
	opergrid.setTitle(moudletitle+'按钮权限设置');
	Ext.getCmp("operationSet").show();
	Ext.getCmp("operationSet").ownerCt.doLayout();//刷新
}


var store=new Ext.data.JsonStore({
	fields: [ 'id','moudletitle','moudleid','openurl','icon','orderid','iconcls','addshutcut','shutcuturl','isleaf'],
	pageSize:15,
	proxy:{
		type: 'ajax', 
		url: fullpath+'/functionModuleController.do?moudleInit' ,
		reader: { 
    	root: 'data', 
        	totalProperty  : 'totalCount' 
    	}
	}
});
var sm=Ext.create("Ext.selection.CheckboxModel",{allowDeselect:true});  
var rownumberer= {xtype:'rownumberer',text: "",width: 2, sortable: false } ;


Ext.onReady(function() {
	
	if(Ext.isIE){ Ext.enableGarbageCollector=false; }
	Ext.QuickTips.init();
	
	//**********右边-按钮设置（grid）******
	storeOper = new Ext.data.JsonStore({
		fields: [ 'id','operationcode','operationname','functionid'],
		pageSize:15,
		proxy:{
			type: 'ajax', 
			url: fullpath+'/sendisystem/sysOperationController.do?operationQuery' ,
			reader: { 
	    	root: 'datas', 
	        	totalProperty  : 'totalCount' 
	    	}
		}
	});
	var smOper = Ext.create("Ext.selection.CheckboxModel",{allowDeselect:true});  
	var rownumbererOper = {xtype:'rownumberer',text: "",width: 2, sortable: false } ;
	var colmlOper=[
	    {header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden :true},
        {header: "模块ID", width: 120, sortable: true, dataIndex: 'functionid',hidden :true},
        {header: "按钮名称", width: 110, sortable: true,align:'center', dataIndex: 'operationname'},
        {header: "模块编码", width: 110, sortable: true,align:'center', dataIndex: 'operationcode'}
    ];
	var bbarOper = Ext.create('Ext.toolbar.Toolbar',{
	});
	var toolbarOper = Ext.create('Ext.toolbar.Toolbar',{
      	scope:this,height:25, items:[{
			xtype:'button',
			text:'增加',
			handler:function(){
			    addOperwin.show();
			    var basicform=Ext.getCmp('addOperform').getForm();
			    basicform.reset();
			    Ext.getCmp('functionid').setValue(functionid);
			    basicform.url=fullpath+'/sendisystem/sysOperationController.do?operationAdd';
			}
		},'-',{
				xtype:'button',
				text:'修改',
				handler:function(){
					var _sm = opergrid.getSelectionModel();
					if(_sm.getCount()==0){
						Ext.Msg.alert('信息','请选择需要修改记录，注意只能单选');return;
					}
					if(_sm.getCount()>1){
					   	Ext.Msg.alert('信息','每次只能修改一条记录,现取第一条选择的记录做修改');
					}
					var selec_record=_sm.getSelection();
					addOperwin.show();
					var basicform=Ext.getCmp('addOperform').getForm();
  					basicform.loadRecord(selec_record[0]);
 					basicform.url=fullpath+'/sendisystem/sysOperationController.do?operationChange';
				}
		},'-',{
				xtype:'button',
				text: '删除',
				handler:function(){
					var _sm = opergrid.getSelectionModel();
					if(_sm.getCount()==0){
						Ext.Msg.alert('信息','请选择需要删除记录');
					    return;
					}
				    var selec_record=_sm.getSelection();
				    var len=selec_record.length;
				    var id="";
				    for(var leni=0;leni<len;leni++){
				    	if(leni==len-1){
				    		id+=selec_record[leni].get("id");
				    	}else{
				    	 	id+=selec_record[leni].get("id")+",";
				    	}
				    }
				    Ext.MessageBox.confirm('提示','确认删除所选信息？',goDelete); 
				    function goDelete(btn){ 
				    	if(btn=="yes"){  
					 		Ext.Ajax.request({
						    	url:fullpath+'/sendisystem/sysOperationController.do?operationDelete',
						    	success:function(_response,_options){
						        	Ext.Msg.alert('信息','删除成功');
						           	storeOper.load({params:{functionid:functionid}});
			 					},
							   	failure: function() {
							    	Ext.Msg.alert('信息','删除失败');
						   		},
						   		params: {id : id }
							});
					 	}
				 	}
			}
		},'-',{
				xtype:'button',
				text: '关闭窗口',
				handler:function(){
					hideEast();
				}
		}]
   	});
	
	var addOperform =  Ext.widget('form', {
		id:'addOperform',
		frame: true,
		xtype:'form',
		baseCls:"x-plain",
		style:"padding:5px",
		url:fullpath+'/sendisystem/sysOperationController.do?operationAdd',
		items:[{
				xtype:'hiddenfield',
				name:'id',fieldLabel: 'ID', id:'id',
				allowBlank:false,
				anchor:'95%',readOnly:true,style:'background:#E6E6F1;'
			},{
				xtype:'hiddenfield',
				name:'functionid',fieldLabel: '模块ID', id:'functionid',
				allowBlank:false,
				anchor:'95%',readOnly:true,style:'background:#E6E6F1;'
			},{
				xtype:'textfield',
				name:'operationname',fieldLabel: '按钮名称', id:'operationname',
				allowBlank:false,emptyText:'请输入中文',
				anchor:'95%'
			},{
				xtype:'textfield',
				name:'operationcode',fieldLabel: '按钮编码', id:'operationcode',
				allowBlank:false,emptyText:'请输入英文',
				anchor:'95%'
   		}]
   	});
	var addOperwin =  Ext.widget('window',{
		title:"设置模块按钮",
	    bodyStyle:'padding:5px',
	    layout : 'fit',
	    closeAction :'hide',
	 	plain: true,
        id:'addOperwin',
        width: 360,
	    height:230,
        labelWidth:55,
        items:[addOperform],
        showlock:false,
        buttons:[{
			text:"确定",
			handler:function(){
             	if( addOperform.getForm().isValid()){
            		addOperform.getForm().submit({
                  		waitTitle:"等待中.....",
						waitMsg:"正在提交数据，请稍.....",
		        		failure:function(){
		                 	Ext.Msg.alert('信息', ' 操作失败，请检查服务器!');   
		       				addOperwin.hide();
		                },
		         		success:function(_form,_action){
     		 		   	    Ext.Msg.alert('信息', '操作成功!');
     		 		   	    addOperwin.hide();
     		 		   	    storeOper.load({params:{functionid:functionid}});
		                }
		         	});
          	 	}
            }
       	},{
         	text:"取消",
          	handler:function() {
       			addOperwin.hide();
       		}
  		}]
	});
	opergrid = Ext.create('Ext.grid.Panel',{
        region: 'center',
        frame: true,
        layout : 'fit',
        title:'按钮设置',
        store: storeOper,
        columns:colmlOper,
     	selModel:smOper, 
        trackMouseOver:false,
        autoScroll: true,
        loadMask: {msg:'正加载数据...'},
        forceFit:false ,
        bbar:bbarOper,
       	tbar:toolbarOper
	});
    
    
    
    
	//****左边-模块信息（树）********
	var clickleafid=-1;	 
	var tree_store = Ext.create('Ext.data.TreeStore', {
        proxy: {
            type: 'ajax',
            url:fullpath+'/functionModuleController.do?listmoudletree'
        },
        root: {
            text: '根模块',
            id: '-1',
            expanded: false
        } 
	});
	var  moudletreePanel = Ext.create('Ext.tree.Panel',{
      	id: 'tree-panel',
        region: 'west',
        height: 500,
        minSize: 150,
        autoScroll: true,
        rootVisible:true,
        lines: true,
        singleExpand: false,
        useArrows: true,
        store:tree_store,  
    	listeners : {  
        	'itemclick':function(view,record,item,index,e,eOpts){
	    		if(index>0){ clickleafid = record.raw.id; }
	    		else{
	    			clickleafid = -1;
	    		}
	     		store.load({ params:{start:0, limit:15,clickleafid:clickleafid,reloadflag:'yes'}}) 
	 		}  
    	}  
  	}); 
    moudletreePanel.on("beforeload", function(ds, opration, opt) {
          opration.params.Treetext = opration.node.data.text;
          opration.params.Treeid=opration.node.data.id;
    }); 
    
    
    
    //****中间-模块管理（grid）********
    var colml=[
	    {id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden :true},
        {header: "模块标题", width: 110, sortable: true,  dataIndex: 'moudletitle'},
        {header: "模块自身的ID", width: 110, sortable: true, dataIndex: 'moudleid'},
        {header: "模块链接", width: 140, sortable: true, dataIndex: 'openurl'},
        {header: "图片路径", width: 110, sortable: true, dataIndex: 'icon'},
        {header: "图片样式", width: 110, sortable: true, dataIndex: 'iconcls'},
        {header: "排序", width: 80, sortable: true, dataIndex: 'orderid'},        
        {header: "操作", width: 80, sortable: true,align:'center', dataIndex: 'isleaf',renderer:showButton}        
    ];
  	var pagebar=Ext.create('Ext.toolbar.Paging',{
        store:store,
        displayInfo:true,
        pageSize:15,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
	});
  	//模块管理-增改（widow+form）
  	var addform =  Ext.widget('form', {
		id:'addform',
		frame: true,
		layout:"column",
		baseCls:"x-plain",
		style:"padding:5px",
		items:[{
			columnWidth:.5,
			labelWidth:70,
			baseCls:"x-plain",
			items:[{
				xtype:'textfield',
				name:'moudletitle',fieldLabel: '模块名', id:'moudletitle',
				allowBlank:false,
				anchor:'95%'
			}, {
			     xtype:'textfield',
			     name: 'openurl',fieldLabel: '模块URL',id:'openurl',
			     anchor:'95%'
			},{
			    xtype:'textfield',
			    name: 'icon',fieldLabel: '图片路径',id:'icon',
			    anchor:'95%'
			},{
			 	xtype:'textfield',
			 	name:'iconcls',fieldLabel:'图片样式名',id:'iconcls',  anchor:'95%'
			},{
			    xtype:'textfield',
			    name: 'shutcuturl',fieldLabel: '桌面图标',id:'shutcuturl',
			    anchor:'95%'
			}]
   		},{
			columnWidth:.5,
			labelWidth:90,
			baseCls:"x-plain",
			items:[{
				xtype:'textfield',
                name: 'moudleid',fieldLabel: '模块ID',  allowBlank:false,
                anchor:'95%'
            },{
                   xtype:'numberfield',
                   name: 'orderid',fieldLabel: '排序', id:'orderid', allowBlank:false,
                  anchor:'95%'
            }
            ,{
                xtype:'checkbox',
                name: 'isleaf',fieldLabel: '功能模块',
                anchor:'95%'
            }
             ,{
                xtype:'checkbox',
                name: 'addshutcut',fieldLabel: '桌面快捷方式',
                anchor:'95%'
            },{
                xtype:'checkbox',
                name: 'dependtree',fieldLabel: '是否依赖右树设备树',
                anchor:'95%'
            },
            {
                xtype:'hidden',
                name: 'id'
             },
             {
                xtype:'hidden',
                name: 'parentid',
                id:'parentid'
             }]
       	}]
	 });
	 var addwin =  Ext.widget('window',{
		title:"增加/修改模块信息",
	    bodyStyle:'padding:5px',
	    layout : 'fit',
	    closeAction :'hide',
	 	plain: true,
        id:'addwind',
        width: 500,
	    height:250,
        labelWidth:55,
        items:[addform],
        showlock:false,
        buttons:[{
			text:"确定",
			handler:function(){
            	var basicform=Ext.getCmp('addform').getForm();
             	if( basicform.isValid()){
                	basicform.findField('parentid').setValue(clickleafid);
            		basicform.submit({
                  		waitTitle:"等待中.....",
						waitMsg:"正在提交数据，请稍.....",
		        		failure:function(){
		                 	Ext.Msg.alert('信息', ' 操作失败，请检查服务器!');   
		       				addwin.hide();
		                },
		         		success:function(_form,_action){
     		 		   	    Ext.Msg.alert('信息', '操作成功!');
     		 		   	    addwin.hide();
     		 		   	    store.load({params:{start:0, limit:15,clickleafid:clickleafid,reloadflag:'yes'}});
		                }
		         	});
          	 	}
            }
       	},{
         	text:"取消",
          	handler:function() {
       			addwin.hide();
       		}
  		}]
   	});
	
	var actionbar=Ext.create('Ext.toolbar.Toolbar',{
      	scope:this,height:25, items:[{
			xtype:'button',
			text:'增加',
			handler:function(){
			    addwin.show();
			    var basicform=Ext.getCmp('addform').getForm();
			    basicform.reset();
			    basicform.url=fullpath+'/functionModuleController.do?addMoudlefunction';
			}
		},'-',{
				xtype:'button',
				text:'修改',
				handler:function(){
					var _sm=datagrid.getSelectionModel();
					if(_sm.getCount()==0){
						Ext.Msg.alert('信息','请选择需要修改记录，注意只能单选');return;
					}
					if(sm.getCount()>1){
					   	Ext.Msg.alert('信息','每次只能修改一条记录,现取第一条选择的记录做修改');
					}
					var selec_record=_sm.getSelection();
					addwin.show();
					var basicform=Ext.getCmp('addform').getForm();
  					basicform.loadRecord(selec_record[0]);
 					basicform.url=fullpath+'/functionModuleController.do?excuteModifymoudle';
				}
		},'-',{
				xtype:'button',
				text: '删除',
				handler:function(){
					var _sm=datagrid.getSelectionModel();
					if(_sm.getCount()==0){
						Ext.Msg.alert('信息','请选择需要删除记录');
					    return;
					}
				    var selec_record=_sm.getSelection();
				    var len=selec_record.length;
				    var id="";
				    for(var leni=0;leni<len;leni++){
				    	if(leni==len-1){
				    		id+=selec_record[leni].get("id");
				    	}else{
				    	 id+=selec_record[leni].get("id")+",";
				    	}
				    }
				    
				    Ext.MessageBox.confirm("提示","确认删除模块信息？",function(btn){  
						if(btn=="yes"){ 
							Ext.Ajax.request({
							    	url:fullpath+'/functionModuleController.do?excuteDeletemoudle',
							    	success:function(_response,_options){
							        	Ext.Msg.alert('信息','删除成功');
							           	store.load({params:{start:0, limit:15,clickleafid:clickleafid,reloadflag:'yes'}});
				 					},
								   	failure: function() {
								    	Ext.Msg.alert('信息','删除失败');
							   		},
							   	params: {deleterecord: id }
							});
				 		}
					});
			}
		}]
   });
        
   datagrid = Ext.create('Ext.grid.Panel',{
        region: 'center',
        minSize: 150,
        frame: true,
        title:'模块管理',
        store: store,
        columns:colml,
     	selModel:sm, 
        trackMouseOver:false,
        autoScroll: true,
        loadMask: {msg:'正加载数据...'},
        forceFit:false ,
        autoScroll:true,
        bbar:pagebar,
       	tbar:actionbar
	});

   //////////////整体页面布局////////////////////
	var viewport = new Ext.Viewport({
		layout:'border',
		border:false,
		split: true,
		items:[{
		    	   xtype:'panel',
		    	   region:'west',
		    	   layout:'fit',
		    	   width:document.body.clientWidth*0.15,
	    	  	   items:[moudletreePanel]
		       },{
		    	   xtype:'panel',
		    	   region:'center',
		    	   layout:'fit',
		    	   width:document.body.clientWidth*0.65,
		    	   items:[datagrid]
		       },{
		    	   xtype:'panel',
		    	   region:'east',
		    	   id:'operationSet',
		    	   layout:'fit',
		    	   hidden:true,
		    	   width:document.body.clientWidth*0.2,
		    	   items:[opergrid]
		       }
		]
	});

});
