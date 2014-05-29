Ext.define("Ext.ux.comboboxtree", {
	extend : "Ext.form.field.Picker",
	alias: ['widget.comboboxtree'], 
	requires : ["Ext.tree.Panel"], 
	store:{},
	treePanel: {},
	config: { 
        maxPickerWidth: 200, 
        maxPickerHeight: 200, 
        minPickerHeight: 100 
    },
	initComponent : function() {
		var self = this;
		Ext.apply(self, {
			fieldLabel : self.fieldLabel,
			labelWidth : self.labelWidth     
		});
		this.callParent();
		this.treePanel = Ext.create('Ext.tree.Panel',{
			width: self.maxPickerWidth, 
			height:self.maxPickerHeight,
			autoScroll : true,
			floating : true,
			focusOnToFront : false,
			shadow : false,
      		useArrows : true,
			store : this.store,
			rootVisible : false,
			listeners:{
				'itemclick' : function(view,record,item,index,e,eOpts){
					self.setRawValue(record.get('id'));// 真值
		    		self.setValue(record.get('id'));// 显示值
		        	self.collapse();//self.picker.hide();
				}
			}
		});
//		this.treePanel.on('itemclick', function (view, record) {
//        	self.setRawValue(record.get('id'));// 真值
//    		self.setValue(record.get('id'));// 显示值
//        	self.collapse();//self.picker.hide();
//    	});
		this.treePanel.on("beforeload", function(ds, opration, opt) {
        	opration.params.comboTreetext = opration.node.data.text;
       		opration.params.comboTreeid = opration.node.data.id;
    	}); 
	},
	createPicker : function() {
		var self = this;
		this.picker = this.treePanel;
		this.picker.on({
			checkchange : function() {
				var records = self.picker.getView().getChecked(), names = [], values = [];
				Ext.Array.each(records, function(rec) {
					values.push(rec.get('id'));
					names.push(rec.get('id'));//rec.get('text')
				});
				self.setRawValue(values.join(';'));// 真值
				self.setValue(names.join(';'));// 显示值
				self.picker.hide(); 						//[目前单选,该批次代码、treePanel的itemclick事件去掉则多选]
				Ext.Array.each(records, function(record) {	//[目前单选,该批次代码、treePanel的itemclick事件去掉则多选]
					record.set('checked', false);			//[目前单选,该批次代码、treePanel的itemclick事件去掉则多选]
				});											//[目前单选,该批次代码、treePanel的itemclick事件去掉则多选]
			}											
		});
		return self.picker;
	},
	alignPicker : function() {
		var self = this, picker, isAbove, aboveSfx='-above';
		if (this.isExpanded) {
			picker = self.getPicker();
			if (self.matchFieldWidth) {
				picker.setWidth(self.bodyEl.getWidth());
			}
			if (picker.isFloating()) {
				picker.alignTo(self.inputEl, "", self.pickerOffset);// ""->tl
				isAbove = picker.el.getY() < self.inputEl.getY();
				self.bodyEl[isAbove ? 'addCls' : 'removeCls'](self.openCls+ aboveSfx);
				picker.el[isAbove ? 'addCls' : 'removeCls'](picker.baseCls + aboveSfx);
			}
		}
	}
});

//使用示例：
//{  
//    xtype: 'comboboxtree',  
//    name: 'comboboxtree', fieldLabel: '下拉树示例',id:'comboboxtree',anchor:'100%',
//    maxPickerHeight:160,
//    store: Ext.create('Ext.data.TreeStore', {
//        root: {
//            text:'全国',
//			id:'-1',
//			//icon:fullpath+'/icons/home_page_icon/home.gif',
//			expanded : false
//        },
//        proxy: {   
//            type: 'ajax',   
//            url: fullpath+'/systemextend/UserZoneAction!getAllUserZoneTree.do'
//        }  
//	})
//}
//后台json示例：
//[{ text: '全国' ,id:'-1' ,checked: false ,leaf: false ,expanded: true ,children: [{ text: '111' ,id:'EXAMLIB0000111' ,checked: false ,leaf: true},{ text: '222' ,id:'EXAMLIB0000222' ,checked: false ,leaf: true},{ text: '333' ,id:'EXAMLIB0000333' ,checked: false ,leaf: true},{ text: '444' ,id:'EXAMLIB0000444' ,checked: false ,leaf: true},{ text: '555' ,id:'EXAMLIB0000555' ,checked: false ,leaf: true},{ text: '666' ,id:'EXAMLIB0000666' ,checked: false ,leaf: true},{ text: '777' ,id:'EXAMLIB0000777' ,checked: false ,leaf: true},{ text: '888' ,id:'EXAMLIB0000888' ,checked: false ,leaf: true},{ text: '999' ,id:'EXAMLIB0000999' ,checked: false ,leaf: true}]}]