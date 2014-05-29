 function thisMovie(movieName) {
         if (navigator.appName.indexOf("Microsoft") != -1) {
             return window[movieName];
         } else {
             return document[movieName];
         }
     }
GraphWindow=Ext.extend(Ext.Window,{
  id:'GraphWindow_wanglang',
  yunittxtField:new Ext.form.TextField({
     id:'yunittxtField',
     width:30
    }),   //y轴单位输入框
   is3dchoice:new Ext.form.ComboBox({
      width: 50,
     fieldLabel: '',
     mode:'local',
     store :[['yes','是'],['no','否']],
      triggerAction:'all'
    }),
    
   chartypechoice:new Ext.form.ComboBox({
     width: 50,
     fieldLabel: '',
     mode:'local',
     store :[['column','柱状图'],['line','拆线图'],['pie','饼图'],['smoothedLine','平滑线']],
      triggerAction:'all',
      value:'column',
      id:'chartypechoice'
    }),
   constructor:function(_conf)
		  { 
		  	    this.aixcombx=new Ext.form.ComboBox({
						     width: 100,
						     fieldLabel: '',
						     mode:'local',
						     store :_conf.axisx_store,
						     triggerAction:'all',
						     id:'aixcombx'
						     });
				this.aixcomby=new Ext.form.ComboBox({
				     width: 100,
				     fieldLabel: '',
				     mode:'local',
				     store :_conf.axisy_store,
			 	     triggerAction:'all',
			 	       id:'aixcomby'
				    });	     
		     	if(_conf==null)
					_conf={};
					Ext.apply(this,_conf);
				 	GraphWindow.superclass.constructor.call(this,{
				     title:_conf.title,
				     bodyStyle:'padding:5px',
				     layout : 'fit',
				     closeAction :'hide',
				 	 plain: true,
			         frame: true,
			         width: _conf.width,
				     height:_conf.heigth,
				     layout:"form",
                     labelWidth:55,
                     html:'<div id=graphdiv></div>',
                     dataurl:_conf.dataurl,
                     tbar:['选择X轴',this.aixcombx,'选择Y轴',this.aixcomby,'单位:',this.yunittxtField,'是否为3D',this.is3dchoice,this.chartypechoice,{text:'构图->',press:true,handler:function(){
                      graphwin=Ext.getCmp('GraphWindow_wanglang');
                      depth3D=0;
                      angle=0;
                     if(graphwin.is3dchoice.getValue()=='yes')
                     {
                      depth3D=10;
                      angle=35;
                      if(graphwin.chartypechoice.getValue()=='pie')
                      {
                         depth3D=25;
                     	 angle=35;
                      }
                     }
                      var flashvars = {
							   	    categoryField:graphwin.aixcombx.getValue(),
						 	 	    valueField:graphwin.aixcomby.getValue(),
						 	  	   balloonText:graphwin.aixcombx.getRawValue()+":[["+graphwin.aixcombx.getValue()+"]], "+graphwin.aixcomby.getRawValue()+" 为 [["+graphwin.aixcomby.getValue()+"]]",
						 	 	   valueunit:graphwin.yunittxtField.getValue(),
						 	 	   depth3D:depth3D,
						 	 	   angle:angle,
						 	 	   startDuration:"3",
						 	 	   marginTop:10,
						 	 	   marginBottom:35,
								   sessionName:graphwin.sessionName
						        };
                          var params = {allowFullScreen:true};
			            var attributes = {};
			         //  thisMovie('graphdiv').reConstructGraph(flashvars);
			         var file=  fullpath+"/system/sendi_graph_tool_"+graphwin.chartypechoice.getValue()+".swf";
			         swfobject.embedSWF(file, "graphdiv", "100%", "100%", "9.0.0", false, flashvars, params, attributes); 
	                 }},{text:'加载数据',press:true,handler:function(){
	                 	graphwin=Ext.getCmp('GraphWindow_wanglang');
                        Ext.Ajax.request({
						    url:graphwin.dataurl,
						    success:function(_response,_options){
						    	var obj=Ext.util.JSON.decode(_response.responseText);  //
					    	    thisMovie('graphdiv').LoadGraphData(obj);
						 	},
						   failure: function()
						   {
						    Ext.Msg.alert('信息','查询失败');
						    },
						 params: {datasessionname: graphwin.datasessionname }
					 	});
                     	
                     }},'-',{text:'关闭',press:true,handler:function(){
                     	   graphwin=Ext.getCmp('GraphWindow_wanglang');
                     	   graphwin.hide();
                     }}],
                     showlock:false
                    
           	 	  	/////////////
				 	})
		  } 
})