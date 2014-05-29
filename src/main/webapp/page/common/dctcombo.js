/*
 * 字典数据的下拉框
 */
 
					
Ext.ux.DctCombo={
//Ext.define('Ext.ux.DctCombo',{
	      extend:'Ext.form.field.ComboBox',
	      constructor:function(_conf)
		  { 
		   	    this.dcttypeen =_conf.dcttype;
		   	    this.listdatas = new Ext.data.JsonStore({
   							fields: [ 'id','dcttypenote','dcttypeen','selecttype','selectsql','displayname','valuename','displayvalue','valuetext','otherfieldname','otherfieldvalue'],
    						proxy:{
									type: 'ajax', 
        							url: fullpath+'/sendisystem/queryDctDatawidthen.do', 
									reader: { 
           								root: 'data', 
            							totalProperty  : 'totalCount' 
       								}
							}
  				  });
		  	    this.listdatas.load({params:{dcttypeen:this.dcttypeen}});  
		  	   
		     	if(_conf==null)
					_conf={};
					Ext.apply(this,_conf);
				 	this.superclass.constructor.call(this,{
				 		  mode:'local',
				 		 triggerAction :'all',
				 	   displayField:'displayvalue',
    				   valueField:'valuetext',
    				   store :this.listdatas
				  	})
		  }

};

//Ext.reg('dctcombo', Ext.ux.DctCombo);