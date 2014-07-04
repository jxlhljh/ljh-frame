 
 function parsetactive(_val)
 {
    if(_val=='on')
    {
    	 return '激活';
    }
    else
    {
     return '禁用';
    }
 
 }
 
  function f_is_share(_val)
 {
    if(_val=='y')
    {
    	 return '是';
    }
    else
    {
     return '否';
    }
 
 }
   function f_max_connect(_val)
 {
    if(_val=='0')
    {
    	 return '不限';
    }
    else
    {
   	 	return  _val;
    }
 
 }
 
function CharMode(iN){  
   	if (iN>=48 && iN <=57) //数字  
		return 1;   
	if ((iN>=97 && iN <=122)||(iN>=65 && iN <=90)) //字母  
		return 2;  
	else  return 4; //特殊字符  
} 
//bitTotal函数,计算出当前密码当中一共有多少种模式 
function bitTotal(num){ 
	modes=0;  
	for (i=0;i<3;i++){  if (num & 1) modes++;  num>>>=1;  } 
	return modes;  
}  
//checkStrong函数  //返回密码的强度级别  
function checkStrong(sPW){  
	if (sPW.length<=6)  return 0; //密码至少为6位
	Modes=0;  
	for (i=0;i<sPW.length;i++){  
	//测试每一个字符的类别并统计一共有多少种模式. 
		Modes|=CharMode(sPW.charCodeAt(i));  
	}  
		return bitTotal(Modes);  
}	
		
var user;
   
Ext.onReady(function(){

	   Ext.QuickTips.init();
 	   /////////////grid
	var sm=new Ext.grid.CheckboxSelectionModel({
	singleSelect:false
 	});   
	var colml=new Ext.grid.ColumnModel([
	        new Ext.grid.RowNumberer(),
	        sm,
		   // {id:'id',header: "ID", width: 20, sortable: true, dataIndex: 'id'},
            {header: "用户账号", width: 20, sortable: true,  dataIndex: 'userId'},
            {header: "用户名", width: 20, sortable: true, dataIndex: 'userName'},
            {header: "密码有效期/天", width: 20, sortable: true, dataIndex: 'pwdvalicity'},
            {header: "创建日期", width: 20, sortable: true, dataIndex: 'createdate'},
            {header: "密码修改日期", width: 20, sortable: true, dataIndex: 'pwddate'},
            {header: "是否提示密码过期", width: 20, sortable: true, dataIndex: 'istip'},
            {header: "最大允许登录次数", width: 20, sortable: true, dataIndex: 'maxlogincount'},
            {header: "是否激活", width: 20, sortable: true, dataIndex: 'isactive',renderer:parsetactive},
            {header: "是否共享", width: 20, sortable: true, dataIndex: 'is_share',renderer:f_is_share},
            {header: "源ip", width: 20, sortable: true, dataIndex: 'ip'},
            {header: "最大并发数", width: 20, sortable: true, dataIndex: 'max_connect',renderer:f_max_connect}
            ]
    );
    var store=new Ext.data.JsonStore({
    	root: 'data',
    	totalProperty: 'totalCount',
    	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
  		fields: [ 'id','userId','userName','pwdvalicity','createdate','pwddate','istip','isactive','maxlogincount','is_share','max_connect','ip' ],
		url: fullpath+'/userController.do?queryUser' ,
		remoteSort:true
    });
    
//  表格数据源控件添加加载前事件处理函数
    store.on('beforeload',function(sto,options){
		options.params['userId'] = Ext.getCmp('userIdt').getValue();
		options.params['userName'] = Ext.getCmp('userNamet').getValue();
    });
    
    var pagebar=new Ext.PagingToolbar({
        pageSize:10,
        store:store,
        displayInfo:true,
        displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
        emptyMsg:"没有记录"
        });
        
        //////
     
           var userIdfield= new Ext.form.TextField({
     	            id:'userIdt',
                    xtype:'textfield',
                    name:'userIdt',fieldLabel: '账号名'
                 });
            var userNamefield= new Ext.form.TextField({
     	            id:'userNamet',
                    xtype:'textfield',
                    name:'userNamet',fieldLabel: '用户名'
                 });
    var theadbar=new Ext.Toolbar({
     scope:this,height:25,items:[ {
 	         text:'增加',
 	         
             pressed: true,
 	    	 handler:function()
			 {
			 	
			    addwin.show();
			    var basicform=Ext.getCmp('addform').getForm();
			    basicform.reset();
			    basicform.url=fullpath+'/userController.do?addUser';
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
				    url:fullpath+'/userController.do?excutModifyQueryuser',
				    success:function(_response,_options){
				   	var obj=Ext.util.JSON.decode(_response.responseText);  //
				   	
				    var basicform=Ext.getCmp('addform').getForm();
				       addwin.show();
				   	   basicform.setValues(obj.datas);  //注意设置form值的语句需要在show函数后，因为此时的form还没有创建or Render
				   	   basicform.findField('passwordc').setValue(obj.datas.password);
				   	   //alert( basicform.findField('passwordc').getValue());
				   	   basicform.url=fullpath+'/userController.do?excuteModifyuser'
 					},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','查询失败');
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
				    
				    Ext.MessageBox.confirm("提示","确认删除该用户？",function(btn){  
						if(btn=="yes"){ 
					 		Ext.Ajax.request({
							    url:rootPath+'/userController.do?excuteDeleteuser',
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
					});
				    
					
            }
        },'-',{
            text: '激活',
                 pressed: true,
            handler:function()
            {
                    var _sm=grid.selModel;
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要激活的用户');
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
				    url:fullpath+'/userController.do?excuteChangestatus',
				    success:function(_response,_options){
				        Ext.Msg.alert('信息','激活成功');
				       store.load({params:{start:0, limit:25}});
 					},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','激活失败');
				   },
				   params: {deleterecord: id,activestatus:'on'}
				});
					
            }
        },'-',{
            text: '禁用',
                 pressed: true,
            handler:function()
            {
                    var _sm=grid.selModel;
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要禁用的用户');
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
				    url:fullpath+'/userController.do?excuteChangestatus',
				    success:function(_response,_options){
				        Ext.Msg.alert('信息','禁用成功');
				       store.load({params:{start:0, limit:25}});
 					},
				   failure: function()
				   {
				    Ext.Msg.alert('信息','禁用失败');
				   },
				   params: {deleterecord: id,activestatus:'off'}
				});
					
            }
        } ,'-','账号名',userIdfield,'-','用户名',userNamefield,'-',
 	    { text:'查询',
 	    	  
 	            pressed: true,
			 handler:function()
			 {
				 getDviceTree();
				 store.load({params:{start:0,limit:25}});
 
			 }},'-',
			 {
            text: '导出',
                 pressed: true,
            handler:function()
            {
            	 window.open(fullpath+'/userController.do?exportData');
            }
        }
	 	]
    
    	
    });
 
              
    var grid=new Ext.grid.GridPanel({
     
    	//renderTo:"grid",
        region:'center',
       // height:500,
        title:'用户管理',
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
	 store.load({params:{start:0, limit:25}});
	 
	 var createdateCMP = new Ext.form.TriggerField({
        fieldLabel: '创建日期',
        name: 'createdate',
        id: 'createdate',
        width: 180,
        readOnly: true,
        triggerClass: 'x-form-date-trigger',
        onTriggerClick: function() {
            Ext.get('createdate').focus();
        },
        listeners: {
            'focus': function() {
               new  WdatePicker({
                    skin: 'ext',                            // 应用ext的皮肤样式
                    dateFmt: 'yyyy-MM-dd HH:mm:ss'                   // 格式为：年-月
                 });
            }
        }
    });
    
    
	 
   
    
   ///////////////////
    
      /////addform 添加的form同时还具有修改的功能
    
    Ext.apply(Ext.form.VTypes,{
    password:function(val,field){//val指这里的文本框值，field指这个文本框组件，大家要明白这个意思
      if(field.confirmTo){//confirmTo是我们自定义的配置参数，一般用来保存另外的组件的id值
          var pwd=Ext.get(field.confirmTo);//取得confirmTo的那个id的值
          return (val==pwd.getValue());
      }
      return true;
    }
});

 // 是否共享
var is_shareStore=new Ext.data.SimpleStore({
	fields: ['value', 'key'],
	data : [['y','是'],['n', '否']]
});   
 var is_share=new Ext.form.ComboBox({
	 width: 100,
	 selectOnTab: false,
	 id:'is_sharet',
	 name:'is_sharet',
     fieldLabel: '是否共享',
     mode:'local',
     displayField:'key',
     triggerAction: 'all',
     valueField:'value',
     forceSelection: true,
     hiddenName:'is_share',
    // selectOnFocus:true,
     store :is_shareStore,
     value:'n',
     anchor:'95%'
 }); 
 
 var roleidStore=new Ext.data.JsonStore({
 	root: 'data',
 	totalProperty: 'totalCount',
 	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
		fields: [ 'id','rolename'],
		url:rootPath+"/userRoleController.do?findParentidCombox",
		baseParams:{start:0, limit:5000}
 });	
 
 var parentid=new Ext.form.ComboBox({
		fieldLabel: '所属角色',
		mode:'remote',//'remote'
		allowBlank:false,
		readOnly:true,
		width: 100,
		anchor:'95%',
		store :roleidStore,
		name:'roleidForm',
		id:'roleidForm',
		hiddenName:'roleid',
		valueField : 'id',
		displayField : 'rolename',
		triggerAction:'all'
	}); 
	roleidStore.load();

	   var addform={
         	usepurse:'addform', //用途,默认情况下是添加，也可以是modifyform
            id:'addform',
            xtype:'form',
            url:fullpath+'/userController.do?addUser',
           layout:"column",
           baseCls:"x-plain",
           style:"padding:5px",
           items:[{
	              columnWidth:.5,
	              layout:"form",
	              labelWidth:50,
	              baseCls:"x-plain",
	              items:[{
	              xtype:'textfield',
	              name:'userId',fieldLabel: '账号名', id:'userId',
	              allowBlank:false,
	              anchor:'95%'
	          }, {
	               xtype:'textfield',
	               name: 'password',fieldLabel: '密码',id:'password',  allowBlank:false,
	               inputType:'password',
	              anchor:'95%'
	          },{
	              xtype:'numberfield',
	              id:'pwdvalicity',
	              name: 'pwdvalicity',fieldLabel: '密码有效期(天)',  allowBlank:false,
	              anchor:'95%'
	          },
	          {
	              xtype:'numberfield',
	              name: 'maxlogincount',fieldLabel: '最大允许登录数',  allowBlank:false,id:'maxlogincount',
	              anchor:'95%'
	          }, {
	               xtype:'textfield',
	               name: 'ip',fieldLabel: '连接ip',id:'ip',
	               inputType:'ip',
	              anchor:'95%'
	          }
	          ]
          },{
            columnWidth:.5,
            layout:"form",
            baseCls:"x-plain",
	        items:[
	       	  {
	              xtype:'textfield',
	              name: 'userName',fieldLabel: '用户名',  allowBlank:false,
	              anchor:'95%'
	          },{
	              xtype:'textfield',
	              name: 'passwordc',fieldLabel: '确认密码', id:'passwordc',  allowBlank:false,
	              inputType:'password',
	              vtype:"password",//自定义的验证类型
	              vtypeText:"两次密码不一致！",
	    		  confirmTo:"password",//要比较的另外一个的组件的id
	          	  anchor:'95%'
	          }
	          ,{
	              xtype:'checkbox',
	              name: 'istip',fieldLabel: '是否提示修改密码',
	              anchor:'95%'
	          },
	          {
	              xtype:'hidden',
	              name: 'id'
	             
	          },is_share, {
	              xtype:'numberfield',
	              name: 'max_connect',fieldLabel: '最大并发连接数',  allowBlank:false,id:'max_connect',
	              anchor:'95%'
	          },parentid
	          ]
           }]
        
        };
	   
	   //////// add window
	   
	 var addwin=new Ext.Window({
                     title:"增加/修改用户信息",
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         frame: true,
			         id:'addwind',
			         width: 500,
				     height:240,
				     layout:"form",
                     labelWidth:55,
                    items:[addform],
                showlock:false,
                buttons:[
                {
                 text:"确定",
                handler:function()
                {
                
                  var length =checkStrong(Ext.getCmp('password').getValue());
                  if(length<3)
                  {
                  	Ext.Msg.alert('信息', '密码长度至少6位,必须含有字母、数字和特殊符号!');
                  	Ext.getCmp("password").focus(false,2000);
                  	return;
                  }
                  
                  if(  Ext.getCmp('addform').getForm().isValid())
                  {
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
		                 		 		     //  Ext.getCmp('queryform').getForm().reset();
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