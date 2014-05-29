       var height = document.documentElement.scrollHeight;
    var width = document.documentElement.scrollWidth;
   var addwin;
     var store=new Ext.data.JsonStore({
   		fields: ['id','description','interfaceid','interfacecalss','jobtype','cronexpression','jobstartTime','jobRepeatInterval','jobRepeatcount','isactive'],
    	pageSize:25,
    	proxy:{
			type: 'ajax', 
        	url: fullpath+'/sysJobInterfaceController.do?querysysJobInterfaceData' ,
			reader: { 
           		root: 'data', 
            	totalProperty  : 'totalCount' 
       		}
		}
    });
     
     //  表格数据源控件添加加载前事件处理函数
     store.on('beforeload',function(sto,options){
 		options.params['description'] = Ext.getCmp('desct').getValue();
 		options.params['interfaceid'] = Ext.getCmp('interfaceidt').getValue();
     });
    
  var sm=Ext.create("Ext.selection.CheckboxModel",{allowDeselect:true});  
  var rownumberer= {xtype:'rownumberer',text: "",width: 2, sortable: false } ;
  
  	var colml=[
		    //{id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden:true},
            {header: "任务描述", width: 20, sortable: true,  dataIndex: 'description'},
            {header: "任务 ID", width: 20, sortable: true, dataIndex: 'interfaceid'},
            {header: "任务实现类", width: 20, sortable: true, dataIndex: 'interfacecalss'},
            {header: "任务类型", width: 20, sortable: true, dataIndex: 'jobtype'},
            {header: "是否激活", width: 20, sortable: true, dataIndex: 'isactive'}
            ];
 
     var pagebar=Ext.create('Ext.toolbar.Paging',{
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
        });
 
Ext.onReady(function(){
	  if(Ext.isIE){ Ext.enableGarbageCollector=false; };
	   Ext.QuickTips.init();
 
    var descfield= {id:'desct',xtype:'textfield',name:'desct',fieldLabel: '功能描述'};
    var interfaceidfield= {id:'interfaceidt',xtype:'textfield',name:'interfaceidt',fieldLabel: '接口 ID'};      
 
    var theadbar=new Ext.Toolbar({
     scope:this,height:25,items:[ {
 	           text:'增加',
 	             pressed: true,
 	    	 handler:function()
			 {
			    addwin.show();
			    var basicform=Ext.getCmp('addform').getForm();
			    basicform.reset();
			    basicform.url=fullpath+'/sysJobInterfaceController.do?addsysJobInterface';
			 }
 	    	
 	    }
 	    ,'-',
 	    {
 	        text:'修改',
 	        pressed: true,
			 handler:function()
			 {
			 		var _sm=grid.getSelectionModel();
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
					 
					var selec_record=_sm.getSelection();
					
					addwin.show();
					var basicform=Ext.getCmp('addform').getForm();
				  	basicform.loadRecord(selec_record[0]);
				 	basicform.url=fullpath+'/sysJobInterfaceController.do?excuteModifysysJobInterface'
					
  				 
			 }
 	    },'-',
			{
            text: '删除',
                 pressed: true,
            handler:function()
            {
                    var _sm=grid.getSelectionModel();
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要删除记录');
					    return;
					}
				    var selec_record=_sm.getSelection();
				    var len=selec_record.length;
				    var id="";
				    for(var leni=0;leni<len;leni++)
				    {
				    	
				    	if(leni==len-1)
				    	{
				    		id+=selec_record[leni].get("id");
				    	}
				    	else
				    	{
				    	 id+=selec_record[leni].get("id")+",";
				    	}
				    }
			  
					Ext.Ajax.request({
				    url:fullpath+'/sysJobInterfaceController.do?excuteDeletesysJobInterface',
				    success:function(_response,_options){
				        Ext.Msg.alert('信息','删除成功');
				       store.load({params:{start:0, limit:25}});
 					},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','查询失败');
				   },
				   params: {deleterecord: id }
				});
					
            }
        },'-',descfield,'-',interfaceidfield,'-',
 	    { text:'查询',
 	    	  
 	            pressed: true,
			 handler:function()
			 {
				 store.load({params:{start:0, limit:25}});
			 }}]
    
    	
    });
  
        ////
   var grid=Ext.create('Ext.grid.Panel',{
    	 region:'center',
        title:'定时任务配置',
        store: store,
        columns:colml,
     	selModel:sm, 
        trackMouseOver:false,
        loadMask: {msg:'正加载数据...'},
        forceFit:true,
        bbar:pagebar,
        tbar:theadbar,
        width: width,
        height: height  
        
    });
	 var viewport = Ext.create('Ext.container.Viewport',{   //视图
           layout:'fit',
           items:[grid]
        });   
	 store.load({params:{start:0, limit:25}});
	 
 
	 ///
	    var selecttypestaus = Ext.create('Ext.form.field.ComboBox', {
            store: Ext.create('Ext.data.ArrayStore', {
                fields: ['value','key'],
                data: [['s', '简单任务'],['c', '复杂任务']]
            }),
            displayField: 'key',
            valueField: 'value',
            fieldLabel: '任务类型',
            queryMode: 'local',
            selectOnTab: false,
            id:'jobtype',
            name: 'jobtype',
            hiddenName:'jobtype'
        });
	 
   selecttypestaus.on('select',function(_obj,_record,_index){
   var selectvalue=_obj.getValue();
   var bf=Ext.getCmp('addform').getForm();
    if(selectvalue=='s'){
     	 bf.findField('cronexpression').disable();
  		 bf.findField('jobstartTime').enable();
  		 bf.findField('jobRepeatInterval').enable();
  		 bf.findField('jobRepeatcount').enable();
    }else{
     	 bf.findField('cronexpression').enable();
  		 bf.findField('jobstartTime').disable();
  		 bf.findField('jobRepeatInterval').disable();
  		 bf.findField('jobRepeatcount').disable();
    }
    });
   ////
 
   var createdateCMP2 = new Ext.form.field.Text({
        fieldLabel: '任务开始时间',
        name: 'jobstartTime',
        id: 'jobstartTime',
 
        readOnly: true,
        listeners:{
      'render':function()
      {
           Ext.EventManager.on("jobstartTime", 'click', function(){
               new  WdatePicker({
                    skin: 'ext',                            // 应用ext的皮肤样式
                    dateFmt: 'yyyy-MM-dd HH:mm:ss'                   // 格式为：年-月
                 });
          })
      }
     }
    });
    
   var activestaus=Ext.create('Ext.form.ComboBox',{
      fieldLabel: '是否激活',
     mode:'local',
     store :[['off', 'off'],['on', 'on']],
     name:'isactive',
     hiddenName:'isactive',
     id:'isactive',
     anchor:'95%',
     triggerAction:'all'
   }); 
  
	   var addform =  Ext.widget('form', {
                    id:'addform',
                   layout:"column",
                   frame:true,
                   baseCls:"x-plain",
                   style:"padding:5px",
                   items:[{
                      columnWidth:.5,
                      labelWidth:100,
                      baseCls:"x-plain",
                      items:[ {
		                       xtype:'textfield',
		                       name: 'interfaceid',fieldLabel: '任务 ID', id:'interfaceid',
		                       anchor:'95%'
		                },{
		                    xtype:'textfield',
		                    name: 'interfacecalss',fieldLabel: '任务实现类', id:'interfacecalss', allowBlank:false,
		                    anchor:'95%'
		                 },
		                 createdateCMP2,
		                 {
		                    xtype:'numberfield',
		                    name:'jobRepeatcount',fieldLabel: '任务重复次数', id:'jobRepeatcount',
		                    allowBlank:false,
		                    anchor:'95%'
		                },
		                {
		                    xtype:'textfield',
		                    name: 'cronexpression',fieldLabel: 'Cron表达式', id:'cronexpression', allowBlank:false,
		                    anchor:'95%'
		                 }
		                ]
                   },{
                     columnWidth:.5,
                     baseCls:"x-plain",
		             items:[
		              {
		                    xtype:'textfield',
		                    name:'description',fieldLabel: '任务描述', id:'description',
		                    allowBlank:false,
		                    anchor:'95%'
		                },selecttypestaus,
		                 {
		                    xtype:'numberfield',
		                    name:'jobRepeatInterval',fieldLabel: '任务间隔时间', id:'jobRepeatInterval',
		                    allowBlank:false,
		                    anchor:'95%'
		                },activestaus
		                , 
		                {
		                    xtype:'hidden',
		                    name: 'id'
		                   
		                }
		                ]
                   }]
                
                });
	   
 
	     addwin =  Ext.widget('window',{
                     title:"增加/修改 定时任务配置",
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         id:'addwind',
			         width: 530,
				     height:230,
                     labelWidth:55,
                    items:addform,
                showlock:false,
                buttons:[
                {
                 text:"确定",
                handler:function()
                {
                  if(  Ext.getCmp('addform').getForm().isValid())
                  {
                  		 var bf=Ext.getCmp('addform').getForm();
                  	 
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
		                 		 		   	    store.load({params:{start:0, limit:25}});
		                 		 		     
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