Ext.require(['Ext.grid.Panel','Ext.form.field.Text','Ext.form.field.Number','Ext.form.field.Date','Ext.form.field.ComboBox','Ext.form.field.VTypes']);
Ext.onReady(function(){
if(Ext.Updater){Ext.Updater.defaults.indicatorText = '<div class="loading-indicator">加载中...</div>';}
//if(Ext.view.View){Ext.view.View.prototype.emptyText = "";}
if(Ext.grid.Panel){Ext.grid.Panel.prototype.ddText = "选择了 {0} 行";}
if(Ext.TabPanelItem){Ext.TabPanelItem.prototype.closeText = "关闭此标签";}
if(Ext.form.field.Base){Ext.form.field.Base.prototype.invalidText = "输入值非法";}
if(Ext.LoadMask) {Ext.LoadMask.prototype.msg = "读取中...";}
if(Ext.Date){Ext.Date.monthNames = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"];Ext.Date.dayNames = ["日","一","二","三","四","五","六"];Ext.Date.formatCodes.a = "(this.getHours() < 12 ? '上午' : '下午')";Ext.Date.formatCodes.A = "(this.getHours() < 12 ? '上午' : '下午')";}
if(Ext.MessageBox){Ext.MessageBox.buttonText = {ok: "确定",cancel : "取消",yes: "是",no: "否"};}
if(Ext.util.Format){Ext.apply(Ext.util.Format, {thousandSeparator: '.',decimalSeparator: ',',currencySign: '\u00a5', dateFormat: 'y年m月d日'});}
if(Ext.picker.Date){Ext.apply(Ext.picker.Date.prototype, {todayText: "今天",minText           : "日期必须大于最小允许日期",maxText           : "日期必须小于最大允许日期",disabledDaysText:"",disabledDatesText:"",monthNames: Ext.Date.monthNames,dayNames: Ext.Date.dayNames,nextText: '下个月 (Ctrl+Right)',prevText: '上个月 (Ctrl+Left)',monthYearText: '选择一个月 (Control+Up/Down 来改变年份)',todayTip: "{0} (空格键选择)",format:"y年m月d日"});}
if(Ext.picker.Month) {Ext.apply(Ext.picker.Month.prototype, {okText: "确定",cancelText: "取消"});}if(Ext.toolbar.Paging){Ext.apply(Ext.PagingToolbar.prototype, {beforePageText : "第",afterPageText  : "页,共 {0} 页",firstText      : "第一页",prevText       : "上一页",nextText       : "下一页",lastText       : "最后页",refreshText    : "刷新",displayMsg     : "显示 {0} - {1}条，共 {2} 条",emptyMsg       : '没有数据'});}if(Ext.form.field.Text){Ext.apply(Ext.form.field.Text.prototype, {minLengthText : "该输入项的最小长度是 {0} 个字符",maxLengthText : "该输入项的最大长度是 {0} 个字符",blankText     : "该输入项为必输项",regexText     : "",emptyText     : null});}if(Ext.form.field.Number){Ext.apply(Ext.form.field.Number.prototype, {minText : "该输入项的最小值是 {0}",maxText : "该输入项的最大值是 {0}",nanText : "{0} 不是有效数值"});}if(Ext.form.field.Date){Ext.apply(Ext.form.field.Date.prototype, {disabledDaysText  : "禁用",disabledDatesText : "禁用",minText: "该输入项的日期必须在 {0} 之后",maxText: "该输入项的日期必须在 {0} 之前",invalidText       : "{0} 是无效的日期 - 必须符合格式： {1}",format            : "y年m月d日"});}if(Ext.form.field.ComboBox){Ext.apply(Ext.form.field.ComboBox.prototype, {valueNotFoundText : undefined});Ext.apply(Ext.form.field.ComboBox.prototype.defaultListConfig, {loadingText: "加载中..."});}if(Ext.form.field.VTypes){Ext.apply(Ext.form.field.VTypes, {emailText: '该输入项必须是电子邮件地址，格式如： "user@example.com"',urlText: '该输入项必须是URL地址，格式如： "http:/'+'/www.example.com"',alphaText    : '该输入项只能包含半角字母和_',alphanumText : '该输入项只能包含半角字母,数字和_'});}  if(Ext.grid.header.Container){Ext.apply(Ext.grid.header.Container.prototype, {sortAscText  : "正序",sortDescText:"倒序", lockText     : "锁定列", unlockText: "解除锁定", columnsText:"列"});}if(Ext.grid.PropertyColumnModel){Ext.apply(Ext.grid.PropertyColumnModel.prototype, {nameText:"名称",valueText:"值",dateFormat : "y年m月d日"});}if(Ext.layout.BorderLayout && Ext.layout.BorderLayout.SplitRegion){Ext.apply(Ext.layout.BorderLayout.SplitRegion.prototype,{splitTip:"拖动来改变尺寸.",collapsibleSplitTip : "拖动来改变尺寸. 双击隐藏."});}});