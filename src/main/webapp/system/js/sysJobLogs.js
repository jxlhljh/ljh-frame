      var store=new Ext.data.JsonStore({
    	fields: [ 'id','jobdesc','jobName','jobGroupname','jobstartTime','jobendTime'],
    	remoteSort:true,
    	proxy:{
			type: 'ajax', 
        	url: fullpath+'/sendisystem/sysJobLogInit.do' ,
			reader: { 
           		root: 'data', 
            	totalProperty  : 'totalCount' 
       		}, 
		}
    });
 
  var sm=Ext.create("Ext.selection.CheckboxModel",{allowDeselect:true});  
  var rownumberer= {xtype:'rownumberer',text: "",width: 2, sortable: false } ;
 
 	var colml=[
		    {id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden:true},
            {header: "任务描述", width: 20, sortable: true,  dataIndex: 'jobdesc'},
            {header: "任务ID", width: 20, sortable: true,  dataIndex: 'jobName'},
            {header: "任务组名", width: 20, sortable: true,  dataIndex: 'jobGroupname'},
            {header: "任务开始时间", width: 20, sortable: true, dataIndex: 'jobstartTime'},
            {header: "任务结束时间", width: 20, sortable: true, dataIndex: 'jobendTime'}
          
            ];
 
      var pagebar=Ext.create('Ext.toolbar.Paging',{
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
        });
 
Ext.onReady(function(){
	   Ext.QuickTips.init();
     
       var jobdesctfield= {id:'jobdesct',xtype:'textfield',name:'jobdesct',fieldLabel: '任务描述'};
       var jobNametfield= {id:'jobNamet',xtype:'textfield',name:'jobNamet',fieldLabel: '任务 ID'};      
 
    var theadbar=Ext.create('Ext.toolbar.Toolbar',{
     scope:this,height:25,items:[
			jobdesctfield,'-',jobNametfield,'-',
 	    { text:'查询',
 	    	  
 	            pressed: true,
			 handler:function()
			 {
			 	Ext.Ajax.request({
					    url:fullpath+'/sendisystem/querysysJobLogData.do',
					    success: function()
		                 		 		   {
		                 		 		  	   Ext.Msg.alert('信息', '查询成功!');
		                 		 		   	   store.load({params:{start:0, limit:25}});
		                 		 		    
		                 		 	 	   },
					 	 failure:  function()
							   {
							    Ext.Msg.alert('信息','查询失败');
							   },
					    
					   params: {jobdesc:Ext.getCmp('jobdesct').getValue(),jobName:Ext.getCmp('jobNamet').getValue()}
					});
 
			 }},'-',{
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
				    url:fullpath+'/sendisystem/excuteDeletesysJobLog.do',
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
        }]
    
    	
    });
 
      var grid=Ext.create('Ext.grid.Panel',{
         region:'center',
        height:500,
        title:'任务日志管理',
        store: store,
         columns:colml,
     	selModel:sm,
        trackMouseOver:false,
        disableSelection:true,
        loadMask: {msg:'正加载数据...'},
        forceFit:true,     
        bbar:pagebar,
        tbar:theadbar
        
    });
	  var viewport = Ext.create('Ext.container.Viewport',{   //视图
           layout:'fit',
           items:[grid]
        });   
	 store.load({params:{start:0, limit:25}});
	 
 
	 
	
})