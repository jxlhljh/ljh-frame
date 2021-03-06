    var height = document.documentElement.scrollHeight;
    var width = document.documentElement.scrollWidth;
     var store=new Ext.data.JsonStore({
    	fields: [ 'id','description','interfaceid','interfacecalss'],
    	pageSize:25,
    	proxy:{
			type: 'ajax', 
        	url: fullpath+'/sysSocketInterfaceController.do?queryskInterfaceData' ,
			reader: { 
           		root: 'datas', 
            	totalProperty  : 'totalCount' 
       		}
		}
    }); 
     
     store.on('beforeload',function(store,options){
     	var new_params1 = {description:Ext.getCmp('desct').getValue(),interfaceid:Ext.getCmp('interfaceidt').getValue()};
     	Ext.apply(store.proxy.extraParams, new_params1);
     })
    
    var sm=Ext.create("Ext.selection.CheckboxModel",{allowDeselect:true});  
  var rownumberer= {xtype:'rownumberer',text: "",width: 2, sortable: false } ;
 
 	var colml=[
		    //{id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden:true},
            {header: "功能描述", width: 20, sortable: true,  dataIndex: 'description'},
            {header: "接口 ID", width: 20, sortable: true, dataIndex: 'interfaceid'},
            {header: "接口实现类", width: 20, sortable: true, dataIndex: 'interfacecalss'}
            ];
 
  var pagebar=Ext.create('Ext.toolbar.Paging',{
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
        });
 
Ext.onReady(function(){
	   Ext.QuickTips.init();
     if(Ext.isIE){ Ext.enableGarbageCollector=false; };
           var descfield= {id:'desct',xtype:'textfield',name:'desct',fieldLabel: '功能描述'};
           var interfaceidfield= {id:'interfaceidt',xtype:'textfield',name:'interfaceidt',fieldLabel: '接口 ID'};      
 
    var theadbar=Ext.create('Ext.toolbar.Toolbar',{
     scope:this,height:25,items:[ {
 	           text:'增加',
 	             pressed: true,
 	    	 handler:function()
			 {
			    addwin.show();
			    var basicform=Ext.getCmp('addform').getForm();
			    basicform.reset();
			    basicform.url=fullpath+'/sysSocketInterfaceController.do?addskInterface';
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
					//注意设置form值的语句需要在show函数后，因为此时的form还没有创建or Render
					addwin.show();
					var basicform=Ext.getCmp('addform').getForm();
				  	basicform.loadRecord(selec_record[0]);
				 	basicform.url=fullpath+'/sysSocketInterfaceController.do?excuteModifyskInterface'
  				 
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
				    url:fullpath+'/sysSocketInterfaceController.do?excuteDeleteskconfig',
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
        title:'socket处理接口配置',
        store: store,
        selModel:sm, 
        columns:colml,
        trackMouseOver:false,
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
	 
  	 
	   var addform=Ext.widget('form',{
                    id:'addform',
                   layout:"column",
                   baseCls:"x-plain",
                   style:"padding:5px",
                    frame:true,
                   items:[{
                      columnWidth:.5,
                      labelWidth:100,
                     
                      baseCls:"x-plain",
                      items:[{
		                    xtype:'textfield',
		                    name:'description',fieldLabel: '功能描述', id:'description',
		                    allowBlank:false,
		                    anchor:'95%'
		                },{
		                    xtype:'textfield',
		                    name: 'interfacecalss',fieldLabel: '接口类', id:'interfacecalss', allowBlank:false,
		                    anchor:'95%'
		                 }
		                ]
                   },{
                     columnWidth:.5,
                   
                     baseCls:"x-plain",
		             items:[
		               {
		                       xtype:'textfield',
		                       name: 'interfaceid',fieldLabel: '接口 ID', id:'interfaceid',
		                       anchor:'95%'
		                }
		                ,
		                {
		                    xtype:'hidden',
		                    name: 'id'
		                   
		                }
		                ]
                   }]
                
                });
	   
	   //////// add window
	   
	  var addwin=Ext.widget('window',{
                     title:"增加/修改 socket处理接口配置",
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         id:'addwind',
			         width: 530,
				     height:180,
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