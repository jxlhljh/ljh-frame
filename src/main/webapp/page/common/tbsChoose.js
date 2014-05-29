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

var fromuserStore=new Ext.data.JsonStore({
		pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
		fields: [ 'equip_name',"china_name"],
		url:"loadUserTbs!queryTbs.do"
 });
 var touserStore=new Ext.data.JsonStore({
		pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
		fields: ['equip_name',"china_name"],
		url:"loadUserTbs!queryMoudleTbs.do"
 });
 
 var tbsmudleStore=new Ext.data.JsonStore({
		pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false. 
		fields: ['id','equip_name',"china_name"],
		url:"loadUserTbs!queryMoudle.do"
 });
							    
 var ItemSelector = new Ext.ux.ItemSelector({
        name:"itemselector",
		fieldLabel:"ItemSelector",
		hideLabel:false,
		dataFields:["equip_name","china_name"],
		toData:[],
		msWidth:380,
		msHeight:320,
		valueField:"equip_name",
		displayField:"china_name",
		imagePath:rootPath+"/page/common/MultiSelect/images/",
		toLegend:"已选基站",
		fromLegend:"未选基站",
		fromStore:fromuserStore,
		toStore:touserStore,
		toTBar:[{
		    id:'clearse',
		    text:"清除所选",
		    handler:function(){
				  var i=msForm.getForm().findField("itemselector");
				      i.reset.call(i);
		    }
		},'-','模版名称',
		{
		    xtype:'textfield',
		    width:70,
		    name:'china_name',
		    id:'china_name'
		},'-','模版',
		{
			xtype:'combo',
			width:80,
			id:'type',
			hiddenName:'moudlename',
			store:tbsmudleStore,
			mode:'local',lazyRender:true,readOnly : false,editable: true,triggerAction: 'all',
			emptyText:'-请选择-',
			valueField:'equip_name',
			displayField:'china_name',
			listeners :{
				'select':function()
					{
					    var id_equipname = this.getValue().split("!");
					    Ext.getCmp('china_name').setValue(this. getRawValue());
						touserStore.reload({params:{equip_name:id_equipname[1]}});
						touserStore.on("load",function(_store  ,  _records, _options){
						      var equip_name = "";
                              for(var i=0;i<_store.getCount();i++){                                 
                                  var equip_name_location = _store.getAt(i).get("equip_name").split("!");
                                  if(i!=_store.getCount()-1)
                                      equip_name += equip_name_location[0]+",";
                                  else
                                      equip_name += equip_name_location[0];
                              }
                              var china_name = Ext.getCmp("bsname3").getValue();
                              fromuserStore.reload({params:{china_name:china_name,equip_name:equip_name}});
                        });
					}
				}
		},'-',{ 
         text:'保存',
	    	pressed: true,
		    handler:function()
		     {		  
		         var mark = true;       
		         var china_name = Ext.getCmp('china_name').getValue();
		         var id_equipname = Ext.getCmp('type').getValue().split("!");
		         if(china_name!=Ext.getCmp('type').getRawValue()){	             
			         for(var i=0;i<tbsmudleStore.getCount();i++){                                 
	                        var have_china_name = tbsmudleStore.getAt(i).get("china_name");                       
	                        if(china_name == have_china_name){
	                            Ext.Msg.alert('警告','模版名称重复');
	                            mark = false;
	                            break;
	                        } 
	                 }
                 }
                 if(mark){			         
			         var equip_name_location=msForm.getForm().findField("itemselector").getValue().split(",");
	                 var equip_name=[];
	                 for(var i=0;i<equip_name_location.length;i++){ 
	                        var values = equip_name_location[i].split("!");
	                        equip_name.push(values[0]);
	                 }
	                 equip_name = equip_name.toString();//.replace(new RegExp("&","gm"),",");
			         if(china_name!=''){
			            Ext.Ajax.request({
			              url:'loadUserTbs!saveOrUpMoudle.do' ,
					      success:function(_response,_options){				           
					    	   var obj=Ext.util.JSON.decode(_response.responseText);
					           if(obj.success){
					                Ext.Msg.alert('信息','保存成功');
					                tbsmudleStore.load();		
					                tbsmudleStore.on('load', function(_store  ,  _records, _options){
					                      for(var i=0;i<_store.getCount();i++){
					                            if(china_name==_store.getAt(i).get("china_name")){
	                                                  Ext.getCmp('type').setValue(_store.getAt(i).get("equip_name"));
					                                  //Ext.getCmp('type').setRawValue(china_name);
					                            }
					                      }
	                                });		                					                
					           }else
					                Ext.Msg.alert('信息','保存失败');
					 	  },
					      failure: function(){
					      },
					      params: {id:id_equipname[0],equip_name:equip_name,china_name:china_name}
			           });
			        }else{
			           Ext.Msg.alert('信息','请输入模块名称');
			        }
		        }
		     }
		},'-',{ 
         text:'删除',
	    	pressed: true,
		    handler:function()
		     {	
		      	var id_equipname = Ext.getCmp('type').getValue().split("!");
		      	if(id_equipname[0]!=null&&id_equipname[0]!=""){
		      	       Ext.Ajax.request({
			              url:'loadUserTbs!deleteMoudle.do' ,
					      success:function(_response,_options){				           
					    	   var obj=Ext.util.JSON.decode(_response.responseText);
					           if(obj.success){
					                Ext.Msg.alert('信息','删除成功');
					                Ext.getCmp('type').reset();
					                tbsmudleStore.reload();
					           }else
					                Ext.Msg.alert('信息','删除失败');
					 	  },
					      failure: function(){
					      },
					      params: {id:id_equipname[0]}
			           });
		      	}  
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
                        for(var i=0;i<touserStore.getCount();i++){                                 
                            var equip_name_location = touserStore.getAt(i).get("equip_name").split("!");
                            if(i!=touserStore.getCount()-1)
                                  equip_name += equip_name_location[0]+",";
                            else
                                  equip_name += equip_name_location[0];
                        }
						fromuserStore.reload({params:{china_name:this.getValue(),equip_name:equip_name}});
					}
				}
		}]
 });
 
 var msForm= new Ext.FormPanel({
	    id:'joinuserform',
        region:'center',
        layout:"column",
        baseCls:"x-plain",
        style:"padding:10px",
        items:[ItemSelector]
 });
 
 var conjoinuserwin= new Ext.Window({
        title:"选择基站",
		bodyStyle:'padding:5px',
		layout : 'border',
		closeAction :'hide',
		plain: true,
		frame: true,
		id:'conjoinuserwin',
		width: 820,
		height:430,
		layout:"form",
        labelWidth:55,
        items:[msForm],
        showlock:false,
        buttons:[{
                id: 'buttom',
                text:"确定",
                handler:function()
                {
                    var china_name=msForm.getForm().findField("itemselector").getRawValue();
                    var equip_name_location=msForm.getForm().findField("itemselector").getValue().split(",");
                    var equip_name=[];
                    var location=[];
                    for(var i=0;i<equip_name_location.length;i++){ 
                        var values = equip_name_location[i].split("!");
                        equip_name.push(values[0]);
                        location.push(values[1]);
                    }
                    equip_name = equip_name.toString().replace(new RegExp("&","gm"),",");
                    location   = location.toString().replace(new RegExp("\\(","gm"),",");
                    location   = location.replace(new RegExp("\\)","gm"),"");
                    Ext.getCmp("tbs_equip_name").setValue(equip_name);
					Ext.getCmp("tbs_china_name").setValue(china_name);
                    Ext.getCmp("tbs_location").setValue(location);
                    conjoinuserwin.hide();
                }
        },{
                text:"取消",
                handler:function()
                 {
                  //fromuserStore.removeAll();
                  //touserStore.removeAll();
                  //tbsmudleStore.removeAll();
                  //Ext.getCmp('china_name').reset();
                  //Ext.getCmp('type').reset();
                  //msForm.getForm().findField("itemselector").reset();
                  conjoinuserwin.hide();
                 }
        }]
 });
 
 Ext.ux.equip_name = Ext.extend(Ext.form.TextField,  {  
    initComponent: function(){
        Ext.ux.equip_name.superclass.initComponent.call(this);
        
        this.addEvents({
            'click' : true
        });  
        
        /*this.on(this, 'click', function(){
	          fromuserStore.load();    
	          tbsmudleStore.load();
	          conjoinuserwin.show(); 
	    });*/
     },
     
     getEquipNameValue : function() {
        if(Ext.getCmp("tbs_equip_name").getValue()==null)
           return "";
        return Ext.getCmp("tbs_equip_name").getValue();
     },
     
     getLocationValue : function() {
        if(Ext.getCmp("tbs_location").getValue()==null)
           return "";
        return Ext.getCmp("tbs_location").getValue();
     },
     
     loadData : function() {
        if(fromuserStore.getCount()==0&&tbsmudleStore.getCount()==0){
           fromuserStore.load();
           tbsmudleStore.load();
        }
        Ext.getCmp("conjoinuserwin").show();
     }
     
 });
 
 
  var tbs_equipname = new Ext.form.TextField({
     name:"tbs_equip_name", 
     id: 'tbs_equip_name',               
     anchor:'95%',
     readOnly: true,
     hidden: true 
 });
 
 var tbs_location = new Ext.form.TextField({
     name:"tbs_location", 
     id: 'tbs_location',               
     anchor:'95%',
     readOnly: true,
     hidden: true 
 });
 
 Ext.reg("equip_name", Ext.ux.equip_name);