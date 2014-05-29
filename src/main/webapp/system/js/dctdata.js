 function getRootPath()
 {
 	 var strFullPath=window.document.location.href;
	 var strPath=window.document.location.pathname;
	 var pos=strFullPath.indexOf(strPath);
	 var prePath=strFullPath.substring(0,pos);
	 var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
	 return postPath;
 }
 var rootPath=getRootPath();
 
 var pageSize = 15;
 
Ext.onReady(function(){
var ismodify=false;
	   Ext.QuickTips.init();
 	   /////////////grid
	var sm=new Ext.grid.CheckboxSelectionModel({
	singleSelect:false
 	});   
	var colml=new Ext.grid.ColumnModel([
	        new Ext.grid.RowNumberer(),
	        sm,
		    {id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden:true},
            {header: "字典类型[中]", width: 20, sortable: true,  dataIndex: 'dcttypenote'},
            {header: "字典类型[英文]", width: 20, sortable: true, dataIndex: 'dcttypeen'},
            {header: "查询类型", width: 20, sortable: true, dataIndex: 'selecttype'},
            {header: "查询sql语句", width: 20, sortable: true, dataIndex: 'selectsql'},
            {header: "显示字段名称", width: 20, sortable: true, dataIndex: 'displayname'},
            {header: "值字段名称", width: 20, sortable: true, dataIndex: 'valuename'},
            {header: "显示值", width: 20, sortable: true, dataIndex: 'displayvalue'},
            {header: "实际值", width: 20, sortable: true, dataIndex: 'valuetext'},
            {header: "其他字段名称", width: 20, sortable: true, dataIndex: 'otherfieldname'},
            {header: "其他字段值", width: 20, sortable: true, dataIndex: 'otherfieldvalue'}
            ]
    );
    var store=new Ext.data.JsonStore({
    	root: 'data',
    	totalProperty: 'totalCount',
    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
  		fields: [ 'id','dcttypenote','dcttypeen','selecttype','selectsql','displayname','valuename','displayvalue','valuetext','otherfieldname','otherfieldvalue'],
		url: rootPath+'/dctDataController.do?queryDctData' ,
		remoteSort:true
    });
    
    //表格数据源控件添加加载前事件处理函数
    store.on('beforeload',function(sto,options){
		options.params['dcttypenote'] = Ext.getCmp('dcttypenotet').getValue();
    });
    
    var pagebar=new Ext.PagingToolbar({
        pageSize:pageSize,
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
        });
     
   var selectstore=new Ext.data.JsonStore({
     	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
  		fields: [ 'id','dcttypenote','dcttypeen','selecttype','selectsql','displayname','valuename','displayvalue','valuetext','otherfieldname','otherfieldvalue'],
		url: fullpath+'/dctDataController.do?queryDctDataAndreturn' ,
		remoteSort:true
    });

   var dcttypenotecb=new Ext.form.ComboBox({
       anchor:'95%',
      triggerAction:'all',
     fieldLabel: '字典类型[中]',
     mode:'remote',
     displayField:'dcttypenote',
     valueField:'dcttypenote',
     store :selectstore,
     name:'dcttypenote_name',
	 id:'dcttypenote_id',
     hiddenName:'dcttypenote',
     queryParam:'dcttypenote',
     minChars:1

   }); 
   
   
      dcttypenotecb.on('select',function(_obj,_record,_index){
   var selectvalue=_obj.getValue();
   var  displayname=_record.get('displayname');
   var valuename=_record.get('valuename');
   var dcttypeen=_record.get('dcttypeen');
   var selecttype=_record.get('selecttype');
   
 	  var bf=Ext.getCmp('addform').getForm();
     	 bf.findField('displayname').setValue(displayname);
     	 bf.findField('valuename').setValue(valuename);
    	 bf.findField('dcttypeen').setValue(dcttypeen);
    	 bf.findField('selecttype').setValue(selecttype);
      
   	  
   })
        //////
     
           var dcttypenotefield= new Ext.form.TextField({
     	            id:'dcttypenotet',
                    xtype:'textfield',
                    name:'dcttypenotet',fieldLabel: '字典类型[中]'
                 });
 
    var theadbar=new Ext.Toolbar({
     scope:this,height:25,items:[ {
 	           text:'增加',
 	             pressed: true,
 	    	 handler:function()
			 {
			 	ismodify=false;
			    addwin.show();
			    var basicform=Ext.getCmp('addform').getForm();
			    basicform.reset();
			    basicform.url=rootPath+'/dctDataController.do?addDctData';
			 }
 	    	
 	    }
 	    ,'-',
 	    {
 	        text:'修改',
 	       
 	        pressed: true,
			 handler:function()
			 {
			 		var _sm=grid.selModel;
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要修改记录，注意只能单选');
					    return;
					}
					if(sm.getCount()>1)
					{
					   Ext.Msg.alert('信息','每次只能修改一条记录,现取第一条选择的记录做修改');
					   return;
					}
					 
					var selec_record=_sm.getSelected();
					var id=selec_record.get("id");
					Ext.Ajax.request({
				    url:rootPath+'/dctDataController.do?excutModifyQueryDctData',
				    success:function(_response,_options){
				   	var obj=Ext.util.JSON.decode(_response.responseText);  //
				   	
				     var basicform=Ext.getCmp('addform').getForm();
				       addwin.show();
				   	   basicform.setValues(obj.datas);  //注意设置form值的语句需要在show函数后，因为此时的form还没有创建or Render
				  	 	ismodify=true;
				  	 
				  	 	var  selectvalue=selecttypestaus.getValue()
				  	 	   var bf=Ext.getCmp('addform').getForm();
						     if(selectvalue=='sql')
						    {
						    	 
						    	 basicform.findField('displayvalue').disable();
						    	 basicform.findField('valuetext').disable();;
						    	 basicform.findField('selectsql').enable();
						    	 basicform.findField('otherfieldvalue').disable();
						    }
						    else
						    {
						         basicform.findField('displayvalue').enable();
						    	 basicform.findField('valuetext').enable();
						    	 basicform.findField('selectsql').disable();
						    	 basicform.findField('otherfieldvalue').enable();
						    }
						  
				   	 
				   	   basicform.url=rootPath+'/dctDataController.do?excuteModifyDctData'
 					},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','修改失败');
				    },
				   params: {id: id }
				});
  				 
			 }
 	    },'-',
			{
            text: '删除',
                 pressed: true,
            handler:function()
            {
                    var _sm=grid.selModel;
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要删除记录');
					    return;
					}
				    var selec_record=_sm.getSelections();
				    var len=selec_record.length;
				    var id="'";
				    for(var leni=0;leni<len;leni++)
				    {
				    	
				    	if(leni==len-1)
				    	{
				    		id+=selec_record[leni].get("id")+"'";
				    	}
				    	else
				    	{
				    	 id+=selec_record[leni].get("id")+"','";
				    	}
				    }
				    
					Ext.Ajax.request({
				    url:rootPath+'/dctDataController.do?excuteDeleteDctData',
				    success:function(_response,_options){
				        Ext.Msg.alert('信息','删除成功');
				       store.load({params:{start:0, limit:pageSize}});
 					},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','删除失败');
				   },
				   params: {deleterecord: id }
				});
					
            }
        },'-','字典类型[中]',dcttypenotefield,'-',
 	    { text:'查询',
 	    	  
 	            pressed: true,
			 handler:function()
			 {
				 store.load({params:{start:0, limit:pageSize}});
			 }}]
    
    	
    });
 
    
        ////
    var grid=new Ext.grid.GridPanel({
    	region:'center',
        title:'字典数据管理',
        store: store,
        cm:colml,
     	sm:sm,
        trackMouseOver:false,
        disableSelection:true,
        loadMask: {msg:'正加载数据...'},
        viewConfig: {
            forceFit:true            
        },
        bbar:pagebar,
        tbar:theadbar
        
    });
	  var viewport = new Ext.Viewport({   //视图
           layout:'border',
           items:[grid]
        });   
	 grid.render();
	 store.load({params:{start:0, limit:pageSize}});
	 
 

   var selecttypestaus=new Ext.form.ComboBox({
      fieldLabel: '数据源类型',
     mode:'local',
     store :[['sql', 'sql'],['text', 'text']],
     name:'selecttype',
     hiddenName:'selecttype',
     id:'selecttypeid',
      anchor:'95%',
      triggerAction:'all'
   }); 
   selecttypestaus.on('select',function(_obj,_record,_index){
   var selectvalue=_obj.getValue();
   var bf=Ext.getCmp('addform').getForm();
   if(!ismodify)
   {
    if(selectvalue=='sql')
    {
    	 
    	 bf.findField('displayvalue').disable();
    	 bf.findField('valuetext').disable();;
    	 bf.findField('selectsql').enable();
    	 bf.findField('otherfieldvalue').disable();
    }
    else
    {
         bf.findField('displayvalue').enable();
    	 bf.findField('valuetext').enable();
    	 bf.findField('selectsql').disable();
    	 bf.findField('otherfieldvalue').enable();
    }
   }
   
   	  
   })
   
	 
	   var addform={
	   	            usepurse:'addform', //用途,默认情况下是添加，也可以是modifyform
                    id:'addform',
                    xtype:'form',
                   url:rootPath+'/dctDataController.do?addDctData',
                   layout:"column",
                   baseCls:"x-plain",
                   style:"padding:5px",
                   items:[{
                      columnWidth:.5,
                      layout:"form",
                      labelWidth:100,
                      baseCls:"x-plain",
                      items:[{
		                    xtype:'textfield',
		                    name:'dcttypeen',fieldLabel: '字典类型[英]', id:'dcttypeen',
		                    allowBlank:false,
		                    anchor:'95%'
		                },selecttypestaus,{
		                    xtype:'textfield',
		                    name: 'displayname',fieldLabel: '显示字段名称', id:'displayname', allowBlank:false,
		                    anchor:'95%'
		                },
		                {
		                    xtype:'textfield',
		                    name: 'valuename',fieldLabel: '值字段名称', id:'valuename', allowBlank:false,
		                    anchor:'95%'
		                },
		                {
		                  xtype:'textfield',
		                  name:'otherfieldname',fieldLabel:'其他字段名称',id:'otherfieldname',anchor:'95%'
		                }
		                ]
                   },{
                     columnWidth:.5,
                     layout:"form",
                     baseCls:"x-plain",
		             items:[
		             dcttypenotecb
		             	  /*{
		                    xtype:'textfield',
		                    name:'dcttypenote',fieldLabel: '字典类型[中]', id:'dcttypenote',
		                    allowBlank:false,
		                    anchor:'95%'
		                }*/,{
		                       xtype:'textfield',
		                       name: 'selectsql',fieldLabel: '查询SQL', id:'selectsql', disabled  :true,
		                       anchor:'95%'
		                }
		                ,{
		                    xtype:'textfield',
		                    name: 'displayvalue',fieldLabel: '显示字段值', id:'displayvalue',  disabled  :true,
		                    anchor:'95%'
		                },
		                {
		                    xtype:'textfield',
		                    name: 'valuetext',fieldLabel: '实际值', id:'valuetext',  disabled  :true,
		                    anchor:'95%'
		                },
		                {
		                  xtype:'textfield',
		                  name:'otherfieldvalue',fieldLabel:'其他值',id:'otherfieldvalue',anchor:'95%',disabled  :true
		                },
		                {
		                    xtype:'hidden',
		                    name: 'id'
		                   
		                }
		                ]
                   }]
                
                };
	   
	   //////// add window
	   
	  var addwin=new Ext.Window({
                     title:"增加/修改字典数据信息",
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         frame: true,
			         id:'addwind',
			         width: 650,
				     height:270,
				     layout:"form",
                     labelWidth:55,
                    items:[addform],
                showlock:false,
                buttons:[
                {
                 text:"确定",
                handler:function()
                {
                  if(  Ext.getCmp('addform').getForm().isValid())
                  {
                  		 var bf=Ext.getCmp('addform').getForm();
                  		 bf.findField('displayvalue').enable();
				    	 bf.findField('valuetext').enable();;
				    	 bf.findField('selectsql').enable();
				    	 bf.findField('otherfieldvalue').enable();
                  	   Ext.getCmp('addform').getForm().submit({
                  						 
		                 		  		   waitTitle:"等待中.....",
		                 		 		   waitMsg:"正在提交数据，请稍.....",
		                 		 		   failure:function()
		                 		 		   {
		                 		 		   		  Ext.Msg.alert('信息', ' 操作失败，请检查服务器!');   
		                 		 		   		    addwin.hide();
		                 		 		   },
		                 		 		   success:function(_form,_action)
		                 		 		   {
		                 		 		   	    Ext.Msg.alert('信息', '操作成功!');
		                 		 		   	      addwin.hide();
		                 		 		   	    store.load({params:{start:0, limit:pageSize}});
		                 		 		     
		                 		 	 	   }
		                 	 	 		 });
                  }
               
                }
                },
                	
                {
                 text:"取消",
                 handler:function()
                 {
                  addwin.hide();
                 }
                
                }
                
                ]
            });
	 
	
})