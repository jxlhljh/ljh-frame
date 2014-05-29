function getRootPath()
 { 
 	 var strFullPath=window.document.location.href;
	 var strPath=window.document.location.pathname;
	 var pos=strFullPath.indexOf(strPath);
	 var prePath=strFullPath.substring(0,pos);
	 var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
	 return postPath;
 }
var rootPath=getRootPath();							 
 
 Ext.ux.indexwin = Ext.extend(Ext.Window,  {  
        title:"选择指标",
		bodyStyle:'padding:5px',
		layout : 'border',
		closeAction :'hide',
		plain: true,
		frame: true,
		id:'conjoinuserwinsct',
		width: 820,
		height:470,
		layout:"form",
        labelWidth:55,
        fromuserStore: null,
        touserStore: null,
        tbsmudleStore: null,
        showlock:false,
        object:"tbs",
        index_value:"",
        index_name:"",
        index:0,
        buttons:[{
                id:'mybutton',
                text:"确定"
        },{
                text:"取消",
                handler:function()
                 {
                  Ext.getCmp("conjoinuserwinsct").hide();
                 }
        }],
        
        constructor: function(){
        
            var object = new Ext.form.ComboBox({
					 width: 70,
					 id:'object',
					 mode:'local',
					 displayField:'object_name',
					 valueField:'object_value',
					 store :new Ext.data.SimpleStore({
		                        fields: ['object_value', 'object_name'],
		                        data : [['tbs','基站'],['dxt', '交换机'],['all', '全网']]
		                    }),
					 editable: false,
					 triggerAction: 'all',
					 value:'tbs'
	         });
            
            var tbs_statistics = new Ext.form.ComboBox({
					 width: 70,
					 id:'tbs_statistics',
					 mode:'local',
					 displayField:'statistics_name',
					 valueField:'statistics_value',
					 store :new Ext.data.SimpleStore({
		                        fields: ['statistics_value', 'statistics_name'],
		                        data : [['discrete','离散'],['group', '聚合']]
		                    }),
					 editable: false,
					 triggerAction: 'all',
					 value:'discrete'   
	         });
	         
            Ext.ux.indexwin.superclass.constructor.call(this,{
					 tbar:['指标对象:',object,'-','统计方式:',tbs_statistics]
	         })
        },
        
        initComponent: function(){
            Ext.ux.indexwin.superclass.initComponent.call(this);                         
             
			 this.fromuserStore=new Ext.data.JsonStore({
					pruneModifiedRecords:true,
					fields: [ 'indicator_name','indicator'],
					url:"getIndex!getIndexDatashow.do"
			 });
			
			 
			 this.tbsmudleStore=new Ext.data.JsonStore({
					pruneModifiedRecords:true,
					fields: ['id','sct_name',"china_name"],
					url:"getIndex!queryMoudle.do"
			 });
			 
			 this.touserStore=new Ext.data.JsonStore({
					pruneModifiedRecords:true,
					fields: ['indicator_name',"indicator"],
					url:"getIndex!queryMoudleSct.do"
			 });
	         /*this.tbar = new Ext.form.ComboBox({
					 width: 70,
					 id:'object',
					 mode:'local',
					 displayField:'object_name',
					 valueField:'object_value',
					 store :new Ext.data.SimpleStore({
		                        fields: ['object_value', 'object_name'],
		                        data : [['tbs','基站'],['dxt', '交换机'],['all', '全网']]
		                    }),
					 editable: false,
					 triggerAction: 'all'
	         });*/
	         
             var ItemSelectorsct = new Ext.ux.ItemSelector({
				    id:"itemselectorsct",
					fieldLabel:"ItemSelectorsct",
					hideLabel:false,
					dataFields:["indicator_name","indicator"],
					toData:[],
					msWidth:380,
					msHeight:320,
					valueField:"indicator",
					displayField:"indicator_name",
					imagePath:rootPath+"/page/common/MultiSelect/images/",
					toLegend:"已选指标",
					fromLegend:"未选指标",
					fromStore:this.fromuserStore,
					toStore:this.touserStore,
					toTBar:[{
					    id:'clearse',
					    text:"清除所选",
					    handler:function(){
							  var i=msFormsct.getForm().findField("itemselectorsct");
							      i.reset.call(i);
					    }},'-','模版名称',
					    {
					    xtype:'textfield',
					    width:70,
					    name:'china_name',
					    id:'china_name'
						},'-','模版',
						{
						xtype:'combo',
						width:80,
						id:'type1',
						hiddenName:'moudlename',
						store:this.tbsmudleStore,
						mode:'local',lazyRender:true,readOnly : false,editable: true,triggerAction: 'all',
						emptyText:'-请选择-',
						valueField:'sct_name',
						displayField:'china_name',
						listeners :{
							'select':function()
								{
								    var id_equipname = this.getValue().split("!");
								    var object = Ext.getCmp("conjoinuserwinsct").object;
								    Ext.getCmp('china_name').setValue(this.getRawValue());
									ItemSelectorsct.toStore.reload({params:{object:object,sct_name:id_equipname[1]}});
									ItemSelectorsct.fromStore.reload({params:{object:object,indicator:id_equipname[1]}});
								}
							}
					},{ 
				        text:'保存',
				    	pressed: true,
					    handler:function()
					     {		  
					         var mark = true;       
					         var china_name = Ext.getCmp('china_name').getValue();
					        
					         var id_equipname = Ext.getCmp('type1').getValue().split("!");
					        
					         if(china_name!=Ext.getCmp('type1').getRawValue()){
					                     
						         for(var i=0;i<Ext.getCmp("conjoinuserwinsct").tbsmudleStore.getCount();i++){
						                                      
				                        var have_china_name = Ext.getCmp("conjoinuserwinsct").tbsmudleStore.getAt(i).get("china_name");  
				                                       
				                        if(china_name == have_china_name){
				                            Ext.Msg.alert('警告','模版名称重复');
				                            mark = false;
				                            break;
				                        } 
				                 }
				                }
				                if(mark){			         
						         var sct_name_location=msFormsct.getForm().findField("itemselectorsct").getValue().split(",");
				                 var sct_name=[];
				                 for(var i=0;i<sct_name_location.length;i++){ 
				                        var values = sct_name_location[i].split("!");
				                        sct_name.push(values[0]);
				                 }
				                 sct_name = sct_name.toString();//.replace(new RegExp("&","gm"),",");
						         if(china_name!=''){
						            Ext.Ajax.request({
						              url:'getIndex!saveOrUpMoudle.do' ,
								      success:function(_response,_options){				           
								    	   var obj=Ext.util.JSON.decode(_response.responseText);
								           if(obj.success){
								                Ext.Msg.alert('信息','保存成功');
								                Ext.getCmp("conjoinuserwinsct").tbsmudleStore.load({params:{object:Ext.getCmp("conjoinuserwinsct").object}});		
								                Ext.getCmp("conjoinuserwinsct").tbsmudleStore.on('load', function(_store  ,  _records, _options){
								                      for(var i=0;i<_store.getCount();i++){
								                            if(china_name==_store.getAt(i).get("china_name")){
				                                                  Ext.getCmp('type1').setValue(_store.getAt(i).get("sct_name"));
								                                  //Ext.getCmp('type1').setRawValue(china_name);
								                            }
								                      }
				                                });		                					                
								           }else
								                Ext.Msg.alert('信息','保存失败');
								 	  },
								      failure: function(){
								      },
								      params: {id:id_equipname[0],sct_name:sct_name,china_name:china_name,object:Ext.getCmp("conjoinuserwinsct").object}
						           });
						        }else{
						           Ext.Msg.alert('信息','请输入模块名称');
						        }
					        }
					     }
					},{ 
				        text:'删除',
				    	pressed: true,
					    handler:function()
					     {	
					      	var id_equipname = Ext.getCmp('type1').getValue().split("!");
					      	if(id_equipname[0]!=null&&id_equipname[0]!=""){
					      	       Ext.Ajax.request({
						              url:'getIndex!deleteMoudle.do' ,
								      success:function(_response,_options){				           
								    	   var obj=Ext.util.JSON.decode(_response.responseText);
								           if(obj.success){
								                Ext.Msg.alert('信息','删除成功');
								                Ext.getCmp('type1').reset();
								                Ext.getCmp('conjoinuserwinsct').tbsmudleStore.reload({params:{object:Ext.getCmp("conjoinuserwinsct").object}});
								           }else
								                Ext.Msg.alert('信息','删除失败');
								 	  },
								      failure: function(){
								      },
								      params: {id:id_equipname[0]}
						           });
					      	}  
					     }
					}
					],
					
					fromTBar:['指标名称','-',
					{ 
							xtype:'textfield',width:'120',
							name:'sctname3',id:'sctname3',
							enableKeyEvents:true, 
							listeners :{
							'keyup':function()
								{
								    
				                      var sct_name = "";
				                       for(var i=0;i<ItemSelectorsct.toStore.getCount();i++){                                 
				                           var sct_name_location = ItemSelectorsct.toStore.getAt(i).get("indicator").split("!");
				                          
				                           if(i!=ItemSelectorsct.toStore.getCount()-1)
				                                 sct_name += sct_name_location[0]+",";
				                           else
				                                 sct_name += sct_name_location[0];
				                       }
									ItemSelectorsct.fromStore.reload({params:{indicator_name:this.getValue(),indicator:sct_name,object:Ext.getCmp('conjoinuserwinsct').object}});
								}
							}
					}]
				});
 
				 var msFormsct= new Ext.FormPanel({
					    id:'joinuserformsct',
				        region:'center',
				        layout:"column",
				        baseCls:"x-plain",
				        style:"padding:10px",
				        items:[ItemSelectorsct]
				 });
				 
				 this.add(msFormsct);
				 
				 Ext.getCmp('object').on("select",function(_this, _record, _index){
				         
				         Ext.getCmp('conjoinuserwinsct').index=_index;
				         
				         var sct_name=Ext.getCmp('itemselectorsct').getValue();
                 
                         Ext.getCmp('itemselectorsct').fromStore.load({params:{object:_this.getValue(),indicator:sct_name}});   
                         Ext.getCmp('itemselectorsct').toStore.load({params:{object:_this.getValue(),sct_name:sct_name}});                     
                         Ext.getCmp('conjoinuserwinsct').tbsmudleStore.load({params:{object:_this.getValue()}});
			             this.index_value="";
			             this.index_name="";
			             if(Ext.getCmp('china_name')!=null)
			                 Ext.getCmp('china_name').reset();
			             if(Ext.getCmp('type1')!=null)
			                 Ext.getCmp('type1').reset();
			                 
			             Ext.getCmp('tbs_statistics').setDisabled('dxt,all'.indexOf(_this.getValue())!=-1)
			            
                 });
         },
        
         getButton : function() {
            return Ext.getCmp("mybutton");
         },
     
	     getIndexValue : function() {
	        return this.index_value;
	     },
	     
	     getIndexName : function() {	        
	        return this.index_name;
	     },
	     
	     getObject : function() {	        
	        return Ext.getCmp('object').getValue();
	     },
	     
	     getTbsStatistics : function() {	        
	        return Ext.getCmp('tbs_statistics').getValue();
	     },
	     
	     buttonClick : function() {
                 var china_name=this.getComponent("joinuserformsct").getForm().findField("itemselectorsct").getRawValue();
                 var sct_name=this.getComponent("joinuserformsct").getForm().findField("itemselectorsct").getValue();

                 this.index_value = sct_name; 
		         this.index_name = china_name; 
		         
                 this.hide();
	     },
	     
	     reset : function() {
             var i = this.getComponent("joinuserformsct").getForm().findField("itemselectorsct");
             if(i!=null)i.reset.call(i);
             this.index_value="";
             this.index_name="";
             if(Ext.getCmp('china_name')!=null)
                 Ext.getCmp('china_name').reset();
             if(Ext.getCmp('type1')!=null)
                 Ext.getCmp('type1').reset();
         },
         
         shows : function() {
            if(this.fromuserStore.getCount()==0&&this.tbsmudleStore.getCount()==0&&this.touserStore.getCount()==0){
              this.fromuserStore.load({params:{object:this.object}});
              this.tbsmudleStore.load({params:{object:this.object}});             
            }           
            this.show();
         },
         
         /*setObject : function(object) {
           this.object = object;
           this.fromuserStore.load({params:{object:this.object}});
           this.tbsmudleStore.load({params:{object:this.object}});          
         },*/
     
         iniData : function(object,sct_name) {
           this.show();
           this.hide();
           this.fromuserStore.reload({params:{object:object,sct_name:sct_name}});   
           this.touserStore.reload({params:{object:object,sct_name:sct_name}});     
         }
 });
 