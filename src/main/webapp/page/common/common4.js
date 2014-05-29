Ext.override(Ext.button.Button, { 
    listeners:{
		'beforerender':function(o){  
		    if(o.getText() == '增加' || o.getText() == '增加' || o.getText() == '添加' || o.getText() == '新增')
		    {
		    	o.setIcon(contextRootPath+'/icons/add.png');
		    	o.pressed=false;
		    }
		    if(o.getText() == '修改')
		    {
		    	o.setIcon(contextRootPath+'/icons/edit.png');
		    	o.pressed=false;
		    }
		    if(o.getText() == '查询' || o.getText() == '查找')
		    {
		    	o.setIcon(contextRootPath+'/icons/search.png');
		    	o.pressed=false;
		    }
		    if(o.getText() == '取消' || o.getText() == '删除' )
		    {
		    	o.setIcon(contextRootPath+'/icons/delete.png');
		    	o.pressed=false;
		    }
		    if(o.getText() == '导出' || o.getText() == '导出Excel')
		    {
		    	o.setIcon(contextRootPath+'/icons/export.png');
		    	o.pressed=false;
		    }
		    if(o.getText() == '导入')
		    {
		    	o.setIcon(contextRootPath+'/icons/import.png');
		    	o.pressed=false;
		    }
		    if(o.getText() == '上传')
		    {
		    	o.setIcon(contextRootPath+'/icons/upload.png');
		    	o.pressed=false;
		    }
		    if(o.getText() == '下载' || o.getText() == '下发')
		    {
		    	o.setIcon(contextRootPath+'/icons/download.png');
		    	o.pressed=false;
		    }
		    if(o.getText() == '申请')
		    {
		    	o.setIcon(contextRootPath+'/icons/apply.png');
		    	o.pressed=false;
		    }
		    if(o.getText() == '确认' || o.getText() == '确定' || o.getText() == '保存')
		    {
		    	o.setIcon(contextRootPath+'/icons/conform.png');
		    	o.pressed=false;
		    }
		    if(o.getText() == '提交')
		    {
		    	o.setIcon(contextRootPath+'/icons/submit.png');
		    	o.pressed=false;
		    }
		    if(o.getText() == '重载' || o.getText() == '重新加载')
		    {
		    	o.setIcon(contextRootPath+'/icons/reload.png');
		    	o.pressed=false;
		    }
		    if(o.getText() == '激活')
		    {
		    	o.setIcon(contextRootPath+'/icons/active.png');
		    	o.pressed=false;
		    }
		}
	}  
});