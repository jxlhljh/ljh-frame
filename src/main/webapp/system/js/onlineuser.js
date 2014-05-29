   var height = document.documentElement.scrollHeight;
   var width = document.documentElement.scrollWidth;
 var sm=Ext.create("Ext.selection.CheckboxModel",{allowDeselect:true});  
 //var rownumberer= Ext.create("Ext.grid.RowNumberer", {text: "", width: 2,sortable: false});
 var rownumberer= {xtype:'rownumberer',text: "",width: 2, sortable: false } ;	
 
  
  var colml=[
	        rownumberer,
		   // {id:'id',header: "ID", width: 40, sortable: true, dataIndex: 'id',hidden:true},
		    {header: "SessionId", width: 20, sortable: true,  dataIndex: 'sessionid'},
            {header: "登录账号", width: 20, sortable: true,  dataIndex: 'userId'},
            {header: "用户名", width: 20, sortable: true, dataIndex: 'userName'},
            {header: "登录终端IP", width: 20, sortable: true, dataIndex: 'loginhost'},
            {header: "登录时间", width: 20, sortable: true, dataIndex: 'logintime'} 
            ];
  
  Ext.onReady(function(){
  	 //Ext.QuickTips.init();
  	 //if(Ext.isIE){ Ext.enableGarbageCollector=false; };
  	  var store=new Ext.data.JsonStore({
  		fields: [ 'sessionid','userId','userName','loginhost','logintime'],
		pageSize:25,
		proxy:{
			type: 'ajax', 
        	url: fullpath+'/sendisystem/onlineUserController.do?onlineUserinit' ,
			reader: { 
           		root: 'data', 
            	totalProperty  : 'totalCount' 
       		}
		}
    });
    
     
    var theadbar=Ext.create('Ext.toolbar.Toolbar',{
     scope:this,height:25,items:[
		'-',{
            text: '踢除用户',
                 pressed: true,
            handler:function()
            {
                    var _sm=grid.getSelectionModel();
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要踢除的用户');
					    return;
					}
				    var selec_record=_sm.getSelection();
				    var len=selec_record.length;
				    var id="";
				    for(var leni=0;leni<len;leni++)
				    {
				    	
				    	if(leni==len-1)
				    	{
				    		id+=selec_record[leni].get("sessionid");
				    	}
				    	else
				    	{
				    	 id+=selec_record[leni].get("sessionid")+",";
				    	}
				    }
			  
					Ext.Ajax.request({
				    url:fullpath+'/sendisystem/onlineUserController.do?forcelogout',
				    success:function(_response,_options){
				        Ext.Msg.alert('信息','成功');
				        store.load({params:{start:0, limit:25}});
 					},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','失败');
				   },
				   params: {forceuid: id }
				});
					
            }
        },'-',{
         text:'刷新',
           pressed: true,
            handler:function()
            {
                store.load({params:{start:0, limit:1000}});
            }
        	
        }] 
    });
    
         ////
    var grid=Ext.create('Ext.grid.Panel',{
        title:'在线用户管理',
        forceFit:true,
        selModel:sm, 
        store: store,
        columns:colml,
        tbar:theadbar,
        width: width,
        height: height,  
        viewConfig: {
            stripeRows: false
        }
    });
    
    
	  var viewport = Ext.create('Ext.container.Viewport',{   //视图
           layout:'fit',
           items:[grid]
        });   
	 store.load({params:{start:0, limit:1000}});
	 
	 function refreshusers()
	 {
	 	 store.load({params:{start:0, limit:1000}});
	 }
    
     //window.setInterval(refreshusers,5000);
  });