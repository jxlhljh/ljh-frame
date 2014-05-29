Ext.onReady(function(){
		   Ext.QuickTips.init();
 Ext.apply(Ext.form.VTypes,{
    password:function(val,field){//val指这里的文本框值，field指这个文本框组件，大家要明白这个意思
      if(field.confirmTo){//confirmTo是我们自定义的配置参数，一般用来保存另外的组件的id值
          var pwd=Ext.get(field.confirmTo);//取得confirmTo的那个id的值
          return (val==pwd.getValue());
      }
      return true;
    }
});
 

 
	   var addform=new Ext.FormPanel({
	   				width:700,
	   	            id:'addform',
                    xtype:'form',
                   url:fullpath+'/userController.do?excuteModifyUserPassword',
                   layout:"column",
                  renderTo:'searchform',
                  frame:true,
		         title: '用户密码修改',
		         bodyStyle:'padding:5px 5px 0',
                   items:[{
                      columnWidth:1,
                      layout:"form",
                      labelWidth:100,
                      baseCls:"x-plain",
                      items:[
                      //{
		              //      xtype:'textfield',
		              //      name:'userId',fieldLabel: '登录账号', id:'userId',hidden:true,
		              //      allowBlank:true,
		              //      anchor:'95%'
		               // },
		                
		                {
		                     xtype:'textfield',
		                     name: 'userName',fieldLabel: '原密码',id:'userName',  allowBlank:false,
		                     inputType:'password',
		                    anchor:'95%'
		                },
		                 {
		                     xtype:'textfield',
		                     name: 'password',fieldLabel: '新密码',id:'password',  allowBlank:false,
		                     inputType:'password',
		                     anchor:'95%'
		                     
		                   
		                     
		                },
		               
		                {
		                       xtype:'textfield',
		                       name: 'passwordc',fieldLabel: '确认密码', id:'passwordc',  allowBlank:false,
		                       inputType:'password',
		                        vtype:"password",//自定义的验证类型
		                        vtypeText:"两次密码不一致！",
            		           confirmTo:"password",//要比较的另外一个的组件的id
 							    anchor:'95%'
		                },
		                {
		                    xtype:'numberfield',
		                    id:'pwdvalicity',
		                    name: 'pwdvalicity',fieldLabel: '密码有效期(天)',  allowBlank:true,value:30,
		                    readOnly:true,
		                    anchor:'95%'
		                }
		               
		               ]
                   }],
                   buttonAlign:'center',
                   buttons:[
                   {
                  text:"确定",
               	   handler:function()
	                {
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
	                
	                
	              //alert(Ext.getCmp('password').getValue())
	             var length =checkStrong(Ext.getCmp('password').getValue());
	              
	              
	              if(length<3){
	              	  Ext.Msg.alert('密码过于简单', '密码长度至少6位,必须含有字母、数字和特殊符号');
	              	  Ext.getCmp('password').reset();
	              	  Ext.getCmp('passwordc').reset();
	              	  
	              }else{
	              	
	                
	                  if( addform.getForm().isValid())
	                  {
	                  	   addform.getForm().submit({
	                  						 
			                 		  		   waitTitle:"等待中.....",
			                 		 		   waitMsg:"正在提交数据，请稍.....",
			                 		 		   failure:function()
			                 		 		   {
			                 		 		   		  Ext.Msg.alert('信息', ' 用户名密码不匹配');   
			                 		 		   		  addform.getForm().reset();
			                 		 		   		 
			                 		 		   },
			                 		 		   success:function(_form,_action)
			                 		 		   {
			                 		 		   	    Ext.Msg.alert('信息', '操作成功!');
			                 		 		   	   addform.getForm().reset();
			                 		 		   	 
			                 		 	 	   }
			                 	 	 		 });
	                  }
	               }
	                }
                }
                   
                   ]
                
                });
	
	//Ext.getCmp('passwordc').on('change',function(t,v,o){alert(o);});
})