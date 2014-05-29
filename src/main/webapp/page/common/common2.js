Ext.override(Ext.Button, { 
    listeners:{
		'beforerender':function(o){ 
			
		    if(o.getText() == '增加' || o.getText() == '增加' || o.getText() == '添加' || o.getText() == '新增')
		    {
		    	o.icon=contextRootPath+'/icons/add.png';
		    	o.cls='x-btn-text-icon';
		    	o.pressed=false;
		    }
		    if(o.getText() == '修改')
		    {
		    	o.icon=contextRootPath+'/icons/edit.png';
		    	o.cls='x-btn-text-icon';
		    	o.pressed=false;
		    }
		    if(o.getText() == '查询' || o.getText() == '查找')
		    {
		    	o.icon=contextRootPath+'/icons/search.png';
		    	o.cls='x-btn-text-icon';
		    	o.pressed=false;
		    }
		    if(o.getText() == '取消' || o.getText() == '删除' )
		    {
		    	o.icon=contextRootPath+'/icons/delete.png';
		    	o.cls='x-btn-text-icon';
		    	o.pressed=false;
		    }
		    if(o.getText() == '导出' || o.getText() == '导出Excle' || o.getText() == '导出excle')
		    {
		    	o.cls='x-btn-text-icon';
		    	o.icon=contextRootPath+'/icons/export.png';
		    	o.pressed=false;
		    }
		    if(o.getText() == '导入' || o.getText() == '上传' )
		    {
		    	o.cls='x-btn-text-icon';
		    	o.icon=contextRootPath+'/icons/import.png';
		    	o.pressed=false;
		    }
		    if(o.getText() == '下载' || o.getText() == '下发')
		    {
		    	o.cls='x-btn-text-icon';
		    	o.icon=contextRootPath+'/icons/download.png';
		    	o.pressed=false;
		    }
		    if(o.getText() == '上传')
		    {
		    	o.cls='x-btn-text-icon';
		    	o.icon=contextRootPath+'/icons/upload.png';
		    	o.pressed=false;
		    }
		    if(o.getText() == '申请')
		    {
		    	o.cls='x-btn-text-icon';
		    	o.icon=contextRootPath+'/icons/apply.png';
		    	o.pressed=false;
		    }
		    if(o.getText() == '确认' || o.getText() == '确定' || o.getText() == '保存')
		    {
		    	o.cls='x-btn-text-icon';
		    	o.icon=contextRootPath+'/icons/conform.png';
		    	o.pressed=false;
		    }
		    if(o.getText() == '提交')
		    {
		    	o.cls='x-btn-text-icon';
		    	o.icon=contextRootPath+'/icons/submit.png';
		    	o.pressed=false;
		    }
		    if(o.getText() == '重载' || o.getText() == '重新加载')
		    {
		    	o.cls='x-btn-text-icon';
		    	o.icon=contextRootPath+'/icons/reload.png';
		    	o.pressed=false;
		    }
		    if(o.getText() == '激活')
		    {
		    	o.cls='x-btn-text-icon';
		    	o.icon=contextRootPath+'/icons/active.png';
		    	o.pressed=false;
		    }
		}
	}  
});
