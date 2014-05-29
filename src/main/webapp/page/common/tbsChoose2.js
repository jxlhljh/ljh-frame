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
 
 
   unlikeStore=new Ext.data.JsonStore({
		     pruneModifiedRecords:true,
		     fields: ['equip_name',"china_name"],
		     url:"inputTbs!unlikeTbs.do"
        });
   likeStore=new Ext.data.JsonStore({
		     pruneModifiedRecords:true,
		     fields: ['equip_name',"china_name"],
		     url:"inputTbs!likeTbs.do"
       });
 
 Ext.ux.win = Ext.extend(Ext.Window,  {  
        title:"选择基站",
		bodyStyle:'padding:5px',
		closeAction :'hide',
		plain: true,
		frame: true,
		id:'conjoinuserwin',
		width: 930,
		height:510,
		layout:"column",
        labelWidth:55,
        //items:[msForm],
        fromuserStore: null,
        touserStore: null,
        tbsmudleStore: null,
        showlock:false,
        tbs_equip_name:"",
        tbs_china_name:"",
        tbs_location:"",
        tbs_equip_names:"",
        buttons:[{
                id: 'buttom',
                text:"确定"
        },{
                text:"取消",
                handler:function()
                 {
                  Ext.getCmp("conjoinuserwin").hide();
                 }
        }],
     
     initComponent: function(){
        Ext.ux.win.superclass.initComponent.call(this);
        
        this.fromuserStore=new Ext.data.JsonStore({
		     pruneModifiedRecords:true,
		     fields: [ 'equip_name',"china_name"],
		     url:"loadUserTbs!queryTbs.do"
        });
        this.touserStore=new Ext.data.JsonStore({
		     pruneModifiedRecords:true,
		     fields: ['equip_name',"china_name"],
		     url:"loadUserTbs!queryMoudleTbs.do"
        });
 
        this.tbsmudleStore=new Ext.data.JsonStore({
		     pruneModifiedRecords:true,
		     fields: ['id','equip_name',"china_name"],
		     url:"loadUserTbs!queryMoudle.do"
        });
 
      ItemSelector = new Ext.ux.ItemSelector({
        id:"itemselector",
        name:"itemselector",
		fieldLabel:"ItemSelector",
		hideLabel:false,
		dataFields:["equip_name","china_name"],
		toData:[],
		msWidth:200,
		msHeight:400,
		valueField:"equip_name",
		displayField:"china_name",
		imagePath:rootPath+"/page/common/MultiSelect/images/",
		toLegend:"已选基站",
		fromLegend:"未选基站",
		fromStore:this.fromuserStore,
		toStore:this.touserStore,
		toTBar:[{
		    id:'clearse',
		    text:"清除所选",
		    handler:function(){
				  var i=msForm.getForm().findField("itemselector");
				      i.reset.call(i);
		    }
		}],				                					               	
		
		fromTBar:['基站名称','-',
		{ 
				xtype:'textfield',width:'120',
				name:'bsname3',id:'bsname3',
				enableKeyEvents:true, 
				listeners :{
				'keyup':function()
					{
					    var equip_name = "";
                        for(var i=0;i<ItemSelector.toStore.getCount();i++){                                 
                            var equip_name_location = ItemSelector.toStore.getAt(i).get("equip_name").split("!");
                            if(i!=ItemSelector.toStore.getCount()-1)
                                  equip_name += equip_name_location[0]+",";
                            else
                                  equip_name += equip_name_location[0];
                        }
						ItemSelector.fromStore.reload({params:{china_name:this.getValue(),equip_name:equip_name}});
					}
				}
		}]
     });
     ///////////////////////////
       var commit_button = new Ext.Button({
          text: "添加",
          //layout:"column",
         // menuAlign:'right',
          handler:function(){
                var input_str = inputTextArea.getValue().replace(new RegExp("\n","gm"),",");
                if(input_str==null||input_str==""){
                	Ext.Msg.alert('警告', '请输入基站');
                	return; 
                }
                
                //判断是否含有中文js，含有汉字为true
               function funcChina(obj){ 
				 if(/.*[\u4e00-\u9fa5]+.*$/.test(obj)) 
				 { 
					return true; 
				 } 
					return false; 
			  } 

             if(funcChina(input_str)){
               for(var i=0;i<ItemSelector.toStore.getCount();i++){
          		  input_str=input_str+","+ItemSelector.toStore.getAt(i).get("china_name"); 
          	  }	
            }else{
              for(var i=0;i<ItemSelector.toStore.getCount();i++){
                var equip_name = ItemSelector.toStore.getAt(i).get("equip_name");
             		 
          		   input_str=input_str+","+equip_name.substr(equip_name.indexOf('!')+1);
          	  }	
            	
            }
                
                ItemSelector.fromStore.reload({params:{tbsname:input_str}}); 
                ItemSelector.toStore.reload({params:{tbsname:input_str}}); 
                unlikeStore.reload({params:{tbsname:input_str}});
                unlikeStore.on("load",function(_store  ,  _records, _options){		     
             		  var unliketbs =_records[0].get("china_name");
             		  unlikeTextArea.setValue(unliketbs);
        	    }); 
                likeStore.reload({params:{tbsname:input_str}});
                   
          }
    });
            
 	var inputTextArea=new Ext.form.TextArea({
	    hideLabel: true,
	    height:87, 
        width: 220
 	}); 
 	var likeTextArea=new Ext.ux.Multiselect({
	    hideLabel: true,
	    height:87, 
        width: 220,
        copy: false,
        legend: null,
        delimiter: ',',
         appendOnly: true,
        allowDup: false,
        sortDir: 'ASC',
        displayField: 'china_name',
        valueField: 'equip_name',
        store: likeStore
 	});
 	
 	likeTextArea.on('dblclick', function(vw, index, node, e) {
 	        
            var equip_name = likeTextArea.store.getAt(index).get("equip_name");
            var china_name = likeTextArea.store.getAt(index).get("china_name");
            likeTextArea.store.removeAt(index);
            var ab = new Ext.data.Record(
               {
               	'equip_name':equip_name,'china_name':china_name
               }
           );
          ItemSelector.toStore.add(ab);
          
         
           for(var i=0;i<ItemSelector.fromStore.getCount();i++){
          	if(ItemSelector.fromStore.getAt(i).get("equip_name")==equip_name){
          		 ItemSelector.fromStore.remove(ItemSelector.fromStore.getAt(i)); 
          	}	
          }  
     });
 	
 	
 	var unlikeTextArea=new Ext.form.TextArea({
	    hideLabel: true,
	    height:87, 
        width: 220
 	});  
     var input_fieldSet = new Ext.form.FieldSet({
          title: '批量输入基站',
          //labelWidth : 20,
         // layout:"column",
          autoHeight:true,
        
          items :[commit_button,inputTextArea]
    });
    
     var like_fieldSet = new Ext.form.FieldSet({
          title: '多匹配基站',
          labelWidth : 50,
         // layout:"column",
          autoHeight:true,
          items :[likeTextArea]
    });  
     
      var unlike_fieldSet = new Ext.form.FieldSet({
          title: '不匹配基站',
          labelWidth : 50,
         // layout:"column",
          autoHeight:true,
          items :[unlikeTextArea]
    });  
      
      var msForm= new Ext.FormPanel({
	    id:'joinuserform',
      //  region:'center',
        layout:"column",
        baseCls:"x-plain",
        style:"padding:10px"
      });
      
       var inputForm= new Ext.FormPanel({
	    id:'inputForm',
      //  region:'center',
      //  layout:"column",
        baseCls:"x-plain",
        style:"padding:0px",
        items :[input_fieldSet,like_fieldSet,unlike_fieldSet]
      });
      
    ///////////////////
    
    	var addMoudleWin_1 = new Ext.Window({
              id:"addMoudleWin_1",
              title:"增加/修改基站模版",
		      plain:true,
              bodyStyle:'padding:5px 5px 0',
			  width: 300,
			  height: 150,
			  layout:"fit",
			  closeAction :'hide',        
			  frame: true,
              modal:true, 
              items:[{
                 id:'addMoudleForm_1',
                 xtype:'form',
                 bodyStyle:'padding:2px 2px 0',
                 frame:true, 
                 autoScroll: true,
                 url:'loadUserTbs!saveOrUpMoudle.do' ,
                 labelWidth :70,   
                 items:[{
                        xtype:'textfield',
                        id:'stencil_name_1',
                        name:'stencil_name_1',
                        fieldLabel :'模版名称'
                       
                 }]
              }],
              buttons:[
              {
               text:"确定",
              handler:function()
              {
              var mb_name = Ext.getCmp("stencil_name_1").getValue();
               
              if(mb_name==null||mb_name==""){
              	 	Ext.Msg.alert('警告', '请输入模版名称');
              	 	Ext.getCmp("stencil_name_1").getValue()
              	 	return; 
              }
              var en_name_location=Ext.getCmp("joinuserform").getForm().findField("itemselector").getValue().split(",");
              var equip_name=[];
              for(var i=0;i<en_name_location.length;i++){ 
                        var values = en_name_location[i].split("!");
                        equip_name.push(values[0]);
                    }
             this.tbs_equip_names = equip_name.toString();//replace(new RegExp("&","gm"),",");
               if(this.tbs_equip_names!=null&&this.tbs_equip_names!=""){
                 if(  Ext.getCmp('addMoudleForm_1').getForm().isValid())
                   {
                  	   Ext.getCmp('addMoudleForm_1').getForm().submit({
                  						 
            		  		   waitTitle:"等待中.....",
            		 		   waitMsg:"正在提交数据，请稍.....",
            		 		   success:function(_form,_action)
            		 		   {
            		 		   	    Ext.Msg.alert('信息', '添加基站模版成功');
            		 		   	    ds1_1.load({params:{start:0, limit:10000}});
            		 		   	     
            		 		   	    addMoudleWin_1.hide();
            		 		   	    
            		 	 	   },
            		 		   failure:function(_form,_action)
            		 		   {
            		 		   		  Ext.Msg.alert('信息', ' 操作失败，请检查服务器!');   
            		 		   		  addMoudleWin_1.hide();
            		 		   },
            		 		   
            		 	 	   params: {id:id==""?null:id,china_name:mb_name,equip_name:this.tbs_equip_names}
                       });
                   }
                 }else{
		           Ext.Msg.alert('警告', '请选取基站'); 
		         } 
		    }
          },{
               text:"取消",             
               handler:function()
               {
                addMoudleWin_1.hide();
               }
          }]
   }); 
    
      ds1_1 = new Ext.data.JsonStore({
       //  root: 'data',
    	// totalProperty: 'totalCount',
    	 pruneModifiedRecords:true,
         url:"loadUserTbs!queryMoudle.do", 
         fields: ['id','equip_name',"china_name"],
         remoteSort:false     
    });
    ds1_1.load({params:{start:0, limit:10000}});
    
    var cm1_1 = new Ext.grid.ColumnModel([
        // new Ext.grid.RowNumberer(),
         new Ext.grid.CheckboxSelectionModel({singleSelect:false}),
         {header:'模版名称',dataIndex:'china_name',width:160}
    ]);
      var moudlegrid_1 = new Ext.grid.GridPanel({
		   cm:cm1_1,
		   stripeRows:true,
		    height:400,
		   sm:new Ext.grid.CheckboxSelectionModel({
		        singleSelect:false
	 	   }),
		   store:ds1_1
    });
     moudlegrid_1.on("rowdblclick",function(_grid ,  _rowIndex, e){      
	 	var _sm=moudlegrid_1.selModel;
	 	var selec_record=_sm.getSelected();
	 	var equip_name=selec_record.get("equip_name");
	 	 var id_equipname = equip_name.split("!");
	 	 
	 	  ItemSelector.toStore.reload({params:{equip_name:id_equipname[1]}});
	 	  ItemSelector.fromStore.reload({params:{equip_name:id_equipname[1]}});
	 	  
	 	  unlikeTextArea.setValue('');
	 	 likeStore.removeAll();
	 	//new Ext.ux.win().iniData1(id_equipname[1]);
                    
	 });
    
        var moudlepanelview_1 = new Ext.Panel({
          region: 'east',
          title:'模版',
          collapsible: true,
          split:true,
          width: 190,
          height:435,
          layout:'column',
          items:[moudlegrid_1],
          tbar:new Ext.Toolbar({
			items:['模版名称','-',{
			    xtype:'textfield',width:'155',
				name:'moudle',id:'moudle',
				enableKeyEvents:true, 
				listeners :{
				'keyup':function(_this,_e)
					{
					 
					 ds1_1.load({params:{start:0, limit:10000,mb_name:_this.getValue()}});
					}
				}
			}]
		  }),
		  bbar:new Ext.Toolbar({
			items:[{
                text:"添加",
                pressed: true,
                handler:function()
                 {
                  id="";
                  addMoudleWin_1.show();
                 }
          },'-',{
                text:"修改",
                pressed: true,
                handler:function()
                 {
                    var _sm=moudlegrid_1.selModel;
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要修改记录，注意只能单选');
					    return;
					}
					if(_sm.getCount()>1)
					{
					   Ext.Msg.alert('信息','每次只能修改一条记录');
					   return;
					}
					var selec_record=_sm.getSelected();
					id=selec_record.get("id");
				
					Ext.getCmp("stencil_name_1").setValue(selec_record.get("china_name"));
                  addMoudleWin_1.show();
                 }
          },'-',{
                text:"删除",
                pressed: true,
                handler:function()
                 {
                    var _sm=moudlegrid_1.selModel;
					if(_sm.getCount()==0)
					{
					    Ext.Msg.alert('信息','请选择需要删除记录');
					    return;
					}
				    var selec_record=_sm.getSelections();
				    var len=selec_record.length;
				    
				    var ids="'";
				    for(var leni=0;leni<len;leni++)
				    {
				    	if(leni==len-1)
				    	{
				    		ids+=selec_record[leni].get("id")+"'";
				    	}
				    	else
				    	{
				    		ids+=selec_record[leni].get("id")+"','";
				    	}
				    }
				    
				     
				    
				    Ext.Ajax.request({
		              url:'loadUserTbs!deleteMoudle.do' ,
				      success:function(_response,_options){				           
				    	   var obj=Ext.util.JSON.decode(_response.responseText);
				           if(obj.success){
				                Ext.Msg.alert('信息','删除成功');
				                ds1_1.reload({params:{start:0, limit:10000}});
				           }else
				                Ext.Msg.alert('信息','删除失败');
				 	  },
				      failure: function(){
				      },
				      params: {id:ids}
		           });
                 }
          }]
		 })
    });
    //////////////////
    
      msForm.add(ItemSelector);
      
      //var totalFome =
      
      
      this.add({ 
      					columnWidth:.28,
                        items:[inputForm]
         			 },
         			 {
           			  columnWidth:.5,
             		  items:[msForm]
          			 },{
            			 columnWidth:.22,
             			items:[moudlepanelview_1]
          });
     // this.add(inputForm);
     // this.add(msForm);
   	 // this.add(moudlepanelview_1);
     },
           
     getEquipName : function() {
        return this.tbs_equip_name;
     },
     
     getEquipNames : function() {
        return this.tbs_equip_names;
     },
     
     getButton : function() {
        return Ext.getCmp("buttom");
     },
     
     getLocation : function() {
        return this.tbs_location;
     },
     
     getChinaName : function() {
        return this.tbs_china_name;
     },
     
     buttonClick : function() {
      
         var china_name=Ext.getCmp("joinuserform").getForm().findField("itemselector").getRawValue();
        
         var equip_name_location=Ext.getCmp("joinuserform").getForm().findField("itemselector").getValue().split(",");
                    var equip_name=[];
                    var location=[];
                    for(var i=0;i<equip_name_location.length;i++){ 
                        var values = equip_name_location[i].split("!");
                        equip_name.push(values[0]);
                        location.push(values[1]);
                    }
                    equip_name = equip_name.toString();
                    location   = location.toString().replace(new RegExp("\\(","gm"),",");
                    location   = location.replace(new RegExp("\\)","gm"),"");
                   
                    this.tbs_equip_names=equip_name;
                    this.tbs_equip_name=equip_name.replace(new RegExp("&","gm"),",");
					this.tbs_china_name=china_name;
                    this.tbs_location=location;
                   
                    this.hide();
     },
     
     reset : function() {
         var i = Ext.getCmp("joinuserform").getForm().findField("itemselector");
         i.reset.call(i);
         this.tbs_equip_name="";
         this.tbs_location="";
         this.tbs_china_name="";
     },
     
     shows : function() {
        if(this.fromuserStore.getCount()==0&&this.tbsmudleStore.getCount()==0&&this.touserStore.getCount()==0){
           this.fromuserStore.load();
           this.tbsmudleStore.load();
        }else if(this.tbsmudleStore.getCount()==0)
           this.tbsmudleStore.load();
           
        this.show();
     },
     
     iniData : function(equip_name) {
        this.show();
        this.hide();
        this.fromuserStore.reload({params:{equip_name:equip_name}});   
        this.touserStore.reload({params:{equip_name:equip_name}});     
     },
      iniData1 : function(equip_name1) {
        /*new Ext.ux.win().touserStore.reload({params:{equip_name:equip_name1}});
		 new Ext.ux.win().touserStore.on("load",function(_store  ,  _records, _options){
			 var equip_name = "";
              for(var i=0;i<_store.getCount();i++){                                 
              var equip_name_location = _store.getAt(i).get("equip_name").split("!");
                if(i!=_store.getCount()-1)
                    equip_name += equip_name_location[0]+",";
                else
                     equip_name += equip_name_location[0];
               }
                            
              new Ext.ux.win().fromuserStore.reload({params:{equip_name:equip_name}});
          });   */
     }
 });
 