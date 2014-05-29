Ext.BLANK_IMAGE_URL="/myframe/ext2/resources/images/default/s.gif";
Ext.DEFAULT_PAGE_COUNT = 25;

Ext.ux.ReportGridPanel = Ext.extend(Ext.grid.GridPanel,{
	url:'',
	fields:[],
	baseParams:[],
	trackMouseOver:false,
//    disableSelection:true,
    loadMask: {msg:'正加载数据...'},
    pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false.
    viewConfig: {
        forceFit:true            
    },
    initComponent: function(){
    	Ext.ux.ReportGridPanel.superclass.initComponent.call(this);
        this.store = new Ext.data.JsonStore({
        	//url:this.url,
        	
        	proxy: new Ext.data.HttpProxy({url: this.url,timeout:300000}),
        	
            root: 'data',
        	totalProperty: 'totalCount',
        	pruneModifiedRecords:true,//设置为true,则每次当store装载或有record被移除时,清空所有修改了的record信息. 默认为false.
        	remoteSort:true,
            fields:this.fields,
            baseParams:this.baseParams
        });
       var sub_url = this.url;
       this.store.on("load",function(){
        	  Ext.Ajax.request({
                     url:contextRootPath + '/logCompleteTime.do' ,
				     success:function(_response,_options){
				        
				 	 },
				     failure: function()
				     {
				        
				     },
				   params: {href:sub_url}
                 }); 
        
        });
       
        this.elements += ',bbar';
        this.bottomToolbar = new Ext.PagingToolbar({
		      pageSize:Ext.DEFAULT_PAGE_COUNT,
		      store:this.store,
		      displayInfo:true,
		      displayMsg:'显示第 {0}  条 到 {1} 条记录，一共{2}条 ',
		      emptyMsg:"没有记录"
		 });
    }
});

function rateRenderer(value,metadata,record,rowIndex,colIndex,store){
	if(value == undefined || value == '')
		return '0.00';
	else if(value.indexOf('.') != -1){
		var index = value.indexOf('.');
		return value.substring(0,index+3);
	}else{
		return value + '.00';
	}
}

function integerRenderer(value,metadata,record,rowIndex,colIndex,store){
	if(value == undefined || value == '')
		return '0';
	return value;
}
function showMsg(title,msg){
	if(Ext.Msg.alert)
		Ext.Msg.alert(title,msg);
	else
		alert(msg);
}
//获取页面响应的结束时间
function getLogCompleteTime(href){
  		Ext.Ajax.request({
             url:contextRootPath + '/logCompleteTime.do' ,
			 success:function(_response,_options){},
			 failure: function(){},
			 params: {href:href}
            });   
  	}