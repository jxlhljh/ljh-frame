      var height = document.documentElement.scrollHeight;
    var width = document.documentElement.scrollWidth;
    
    var store=new Ext.data.JsonStore({
   		fields: [ 'id','paraName','paraValue','paraDesc'],
    	pageSize:25,
    	proxy:{
			type: 'ajax', 
        	url: fullpath+'/sendisystem/sysConfigParaController.do?sysConfigParaQuery' ,
			reader: { 
           		root: 'data', 
            	totalProperty  : 'totalCount' 
       		} 
		}
    });
    
    store.on('beforeload',function(store,options){
    	var new_params1 = {paraDesc:Ext.getCmp('paraDesct').getValue(),paraName:Ext.getCmp('paraNamet').getValue()};
    	Ext.apply(store.proxy.extraParams, new_params1);
    })
    
  var sm=Ext.create("Ext.selection.CheckboxModel",{allowDeselect:true});  
  var rownumberer= {xtype:'rownumberer',text: "",width: 2, sortable: false } ;
  
  var colml=[
		   // {id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden:true},
            {header: "参数名称", width: 20, sortable: true,  dataIndex: 'paraName'},
            {header: "参数值", width: 20, sortable: true, dataIndex: 'paraValue'},
            {header: "参数描述", width: 20, sortable: true, dataIndex: 'paraDesc'} 
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
         //////
  var descfield= {id:'paraDesct',xtype:'textfield',name:'paraDesct',fieldLabel: '参数描述'};
  var paraNamefield= {id:'paraNamet',xtype:'textfield',name:'paraNamet',fieldLabel: '参数名称'};      
 
    var theadbar=Ext.create('Ext.toolbar.Toolbar',{
     scope:this,height:25,items:[ {
 	           text:'增加',
 	             pressed: true,
 	    	 handler:function()
			 {
			    addwin.show();
			    var basicform=Ext.getCmp('addform').getForm();
			    basicform.reset();
			    basicform.url=fullpath+'/sendisystem/sysConfigParaController.do?addSysConfigPara';
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
				 	basicform.url=fullpath+'/sendisystem/sysConfigParaController.do?excuteModifySysConfigPara'
  				 
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
				    url:fullpath+'/sendisystem/sysConfigParaController.do?excuteDeleteSysConfigPara',
				    success:function(_response,_options){
				        Ext.Msg.alert('信息','删除成功');
				       store.load({params:{start:0, limit:25}});
 					},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','删除失败');
				   },
				   params: {deleterecord: id }
				});
					
            }
        },'-',
			{
            text: '重载',
            pressed: true,
            handler:function(){
				Ext.Ajax.request({
				    url:fullpath+'/sendisystem/sysConfigParaController.do?reloadConfig',
				    success:function(_response,_options){
				        Ext.Msg.alert('信息','重载成功');
					},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','重载失败');
				   },
				   params: {}
				});
            }
        },'-',descfield,'-',paraNamefield,'-',
 	    { text:'查询',
 	    	  
 	            pressed: true,
			 handler:function()
			 {
				 store.load({params:{start:0, limit:25}});
			 }}]
    });
    

     var grid=Ext.create('Ext.grid.Panel',{
    	  region:'center',
        height:500,
        title:'系统参数配置管理',
        store: store,
        columns:colml,
     	selModel:sm,
        trackMouseOver:false,
      //  disableSelection:true,
        loadMask: {msg:'正加载数据'},
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
	 store.load();
	 
   var addform=Ext.widget('form',{
                    id:'addform',
                   layout:"column",
                   frame:true,
                   baseCls:"x-plain",
                   style:"padding:5px",
                   items:[{
                      columnWidth:1,
                      labelWidth:100,
                      baseCls:"x-plain",
                      items:[{xtype:'textfield',name:'paraDesc',fieldLabel: '参数描述', id:'paraDesc',allowBlank:false,anchor:'95%'},
                      		{xtype:'textfield',name: 'paraName',fieldLabel: '参数名称', id:'paraName', allowBlank:false,anchor:'95%'},
                      		{xtype:'textfield',name: 'paraValue',fieldLabel: '参数值', id:'paraValue', allowBlank:false,anchor:'95%'},
                      		{xtype:'hidden', name: 'id',id:'id'}
		                ]
                   }]
                
                });
	   
	   //////// add window
	   
	  var addwin=new Ext.Window({
                     title:"增加/修改 系统参数配置",
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         id:'addwind',
			         width: 450,
				     height:200,
                     labelWidth:55,
                    items:[addform],
                showlock:false,
                buttons:[
                {
                 text:"确定",
                handler:function()
                {
                var basicform=Ext.getCmp('addform').getForm();
                  if( basicform.isValid())
                  {
                  		 
                  	 
                  	   basicform.submit({
                  						 
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