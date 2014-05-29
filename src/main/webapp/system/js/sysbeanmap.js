 
Ext.require(['Ext.data.JsonStore',
	'Ext.container.Viewport','Ext.grid.Panel','Ext.selection.CheckboxModel'
]);
  
    var height = document.documentElement.scrollHeight;
    var width = document.documentElement.scrollWidth;
    var store=Ext.create('Ext.data.JsonStore',{
   		fields: [ 'id','beanName','beamBsname','islog','remark'],
    	pageSize:25,
    	proxy:{
			type: 'ajax', 
        	url: fullpath+'/sendisystem/sysLogBeanmapInit.do' ,
			reader: { 
           		root: 'data', 
            	totalProperty  : 'totalCount' 
       		}
		}
    });
    
  var sm=Ext.create("Ext.selection.CheckboxModel",{allowDeselect:true});  
  var rownumberer= {xtype:'rownumberer',text: "",width: 2, sortable: false } ;
  
  	var colml=[
		  //  {id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id'},
            {header: "实体类名称", width: 20, sortable: true,  dataIndex: 'beanName'},
            {header: "对应解析", width: 20, sortable: true, dataIndex: 'beamBsname'},
            {header: "是否监控日志", width: 20, sortable: true, dataIndex: 'islog'} ,
            {header: "备注", width: 20, sortable: true, dataIndex: 'remark'} 
            ];
    
  var beamBsnametfield= {xtype:'textfield',id:'beamBsnamet',name:'beamBsnamet',fieldLabel: '对应解析',labelWidth:60};
  var beanNamefield= {xtype:'textfield',id:'beanNamet',name:'beanNamet',fieldLabel: '实体名称',labelWidth:60};
    
   var isbeansyslog = {
            xtype: 'combo',
            store: Ext.create('Ext.data.ArrayStore', {
                fields: ['islog'],
                data: [ ['on'],['off']]
            }),
            displayField: 'islog',
            valueField: 'islog',
            fieldLabel: '是否监控日志',
            queryMode: 'local',
            selectOnTab: false,
            name: 'islog',
            hiddenName:'islog'
        };
    
    var form =  Ext.widget('form', {
    			id:'addform',
    			frame:true,
                items:[{
		                    xtype:'textfield',
		                    name:'beanName',fieldLabel: '实体名称', id:'beanName',
		                    allowBlank:false,
		                    anchor:'95%'
		                },
		                 {
		                    xtype:'textfield',
		                    name: 'beamBsname',fieldLabel: '对应业务解析', id:'beamBsname', allowBlank:false,
		                    anchor:'95%'
		                },{
		                    xtype:'hidden',
		                    name: 'id'
		                   
		                },isbeansyslog,
		                 
		                {
		                    xtype:'textfield',
		                    name: 'remark',fieldLabel: '备注', id:'remark',
		                    anchor:'95%'
		                }
		                ]
		      
    });
    
  
  	 var addwin =  Ext.widget('window',{
                     title:"增加/修改 实体类与对应业务解析信息",
				     bodyStyle:'padding:5px',
				     closeAction :'hide',
				     layout:"fit",
			         width:400, 
    				 height:230,
              		 items:form,
              		 buttons: [
		          {text: '确定',
                    handler: function() {
                     var basicform=Ext.getCmp('addform').getForm();
                        if (basicform.isValid()) {
                             basicform.submit({
                             	success: function(form, action) {
      								 Ext.Msg.alert('信息', '操作成功!');
      								 store.load({params:{start:0, limit:25}});
  								},
  								failure: function(form, action) {
      								 Ext.Msg.alert('信息', '操作失败，请检查服务器');
  								}
                             });
                      		 addwin.hide();
                        }
                    }
                 },{ text: '取消',
		         		handler: function() {
                        addwin.hide();
                    }
                 }
		        	
		      ]
            });
   
Ext.onReady(function(){
	Ext.QuickTips.init();
	if(Ext.isIE){ Ext.enableGarbageCollector=false; };
  var pagebar=Ext.create('Ext.toolbar.Paging',{
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
        });
        
     var theadbar=Ext.create('Ext.toolbar.Toolbar',{
     scope:this,height:25,items:[ {
 	         text:'增加',
 	          pressed: true,
 	    	 handler:function()
			 {
			    addwin.show();
			    var basicform=Ext.getCmp('addform').getForm();
			    basicform.reset();
			    basicform.url=fullpath+'/sendisystem/addsysLogBeanmap.do';
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
					if(_sm.getCount()>1)
					{
					   Ext.Msg.alert('信息','每次只能修改一条记录,现取第一条选择的记录做修改');
					   return;
					}
					var selec_record=_sm.getSelection();
					addwin.show();
					var basicform=Ext.getCmp('addform').getForm();
				  	basicform.loadRecord(selec_record[0]);
				 	basicform.url=fullpath+'/sendisystem/excuteModifysysLogBeanmap.do'
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
				    url:fullpath+'/sendisystem/excuteDeletesysLogBeanmap.do',
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
        },'-',beanNamefield,'-',beamBsnametfield,'-',
 	    { 	 text:'查询',  
 	         pressed: true,
			 handler:function()
			 {
			 	Ext.Ajax.request({
					    url:fullpath+'/sendisystem/querysysLogBeanmap.do',
					    success: function()
		                 		 		   {
		                 		 		   	   Ext.Msg.alert('信息', '查询成功!');
		                 		 		   	   store.load({params:{start:0, limit:25}});
		                 		 		    
		                 		 	 	   },
					   failure:  function()
							   {
							    Ext.Msg.alert('信息','查询失败');
							   },
					    
					   params: {beamBsname:Ext.getCmp('beamBsnamet').getValue(),beanName:Ext.getCmp('beanNamet').getValue()}
					});
 
			 }}]
    
    	
    });
     

 
    
        ////
    var grid=Ext.create('Ext.grid.Panel',{
    	 region:'center', 
        title:'实体类与对应业务解析管理',
        store: store,
        columns:colml,
     	selModel:sm, 
        loadMask: {msg:'正加载数据...'},
        forceFit:true ,
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
	 
})