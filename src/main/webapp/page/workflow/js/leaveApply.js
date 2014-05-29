Ext.onReady(function(){
	   Ext.QuickTips.init();
	   
	   var leaveTypeStore=new Ext.data.SimpleStore({
			fields: ['value', 'key'],
			data : [['1','公休'],['2', '病假'],['3', '婚假'],['4', '调休'],['5', '事假']]
		});  
		 
	   var leaveType=new Ext.form.ComboBox({
			 selectOnTab: false,
			 id:'leaveTypet',
			 name:'leaveTypet',
		     fieldLabel: '请假类型',
		     mode:'local',
		     displayField:'key',
		     triggerAction: 'all',
		     valueField:'value',
		     forceSelection: true,
		     hiddenName:'leaveType',
		     store :leaveTypeStore,
		     value:'1',
		     anchor:'98%'
		 });
		 
	Date.prototype.pattern=function(fmt) {           
	    var o = {           
	    "M+" : this.getMonth()+1, //月份           
	    "d+" : this.getDate(), //日           
	    "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时           
	    "H+" : this.getHours(), //小时           
	    "m+" : this.getMinutes(), //分           
	    "s+" : this.getSeconds(), //秒           
	    "q+" : Math.floor((this.getMonth()+3)/3), //季度           
	    "S" : this.getMilliseconds() //毫秒           
	    };           
	    var week = {           
	    "0" : "/u65e5",           
	    "1" : "/u4e00",           
	    "2" : "/u4e8c",           
	    "3" : "/u4e09",           
	    "4" : "/u56db",           
	    "5" : "/u4e94",           
	    "6" : "/u516d"          
	    };           
	    if(/(y+)/.test(fmt)){           
	        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));           
	    }           
	    if(/(E+)/.test(fmt)){           
	        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);           
	    }           
	    for(var k in o){           
	        if(new RegExp("("+ k +")").test(fmt)){           
	            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));           
	        }           
	    }           
	    return fmt;           
	} 	 
	
	var c_time = new Date();
	var startTime = new Ext.form.TextField({
			id:'startTime',
			name:'startTime',
			hiddenName:'startTime',
			fieldLabel: '请假开始时间',
			anchor:'98%',
			width:120,
			value:c_time.pattern("yyyy-MM-dd 00:00"),
			listeners:{
				'render':function(){
		          Ext.EventManager.on("startTime", 'click', function(){
		              new WdatePicker({
		                   skin: 'ext', // 应用ext的皮肤样式
		                   dateFmt: 'yyyy-MM-dd HH:mm' // 格式为：年-月-日 时 ：分
		               });
		          })
		 		}
			}
		});
	
	var endTime = new Ext.form.TextField({
			id:'endTime',
			name:'endTime',
			hiddenName:'endTime',
			fieldLabel: '请假结束时间',
			anchor:'98%',
			width:120,
			value:c_time.pattern("yyyy-MM-dd 00:00"),
			listeners:{
				'render':function(){
		          Ext.EventManager.on("endTime", 'click', function(){
		              new WdatePicker({
		                   skin: 'ext', // 应用ext的皮肤样式
		                   dateFmt: 'yyyy-MM-dd HH:mm' // 格式为：年-月-日 时 ：分
		               });
		          })
		 		}
			}
		});
		
		var applyTime = new Ext.form.TextField({
		    readOnly:true,
			id:'applyTime',
			name:'applyTime',
			hiddenName:'applyTime',
			fieldLabel: '申请时间',
			anchor:'98%',
			width:120,
			value:c_time.pattern("yyyy-MM-dd hh:mm")
		});
	   
	   var addform=new Ext.FormPanel({
	   				width:700,
	   	            id:'addform',
                    xtype:'form',
                   url:fullpath+'/workflow/LeaveAction!apply.do',
                   layout:"column",
                  renderTo:'searchform',
                  frame:true,
		         title: '请假申请',
		         bodyStyle:'padding:5px 5px 0',
                   items:[{
                      columnWidth:1,
                      layout:"form",
                      labelWidth:100,
                      baseCls:"x-plain",
                      items:[applyTime,leaveType,startTime,endTime,{
                          height: 100,
		                  xtype:'textarea',
		                  name: 'reason',fieldLabel: '请假原因',id:'reason',
		                  anchor:'98%'
		                }
		               ]
                   }],
                   buttonAlign:'center',
                   buttons:[{
	                  text:"申请",
	               	   handler:function(){
	               	     	if(  Ext.getCmp('addform').getForm().isValid()){
		                  	   var bf=Ext.getCmp('addform').getForm();
		                  	   Ext.getCmp('addform').getForm().submit({
                 		  		   waitTitle:"等待中.....",
                 		 		   waitMsg:"正在提交数据，请稍.....",
                 		 		   failure:function(_form,_action){
                 		 		   		  Ext.Msg.alert('信息', '操作失败，请检查服务器!');   
                 		 		   },
                 		 		   success:function(_form,_action)
                 		 		   {
                 		 		   	    Ext.Msg.alert('信息', '申请成功!');
                 		 		   	    Ext.getCmp('reason').setValue("");
                 		 	 	   }
                 	 	 		 });
		                  }
		                }
	              }
                   
                   ]
                
                });
	
})