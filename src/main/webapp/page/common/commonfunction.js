var hasButtonPermission = function(operCode,moudleid){
	if(userName=='admin') return true;
	var json  = eval('(' + user_button_operations_json + ')');
	var datas = json.data;
	for(var i=0;i<datas.length;i++){
		var o = datas[i];
		if(o.roleid==role_id && o.operationcode==operCode && o.moudleid == moudleid ) return true;
	}
	return false;
}


//Retrieves the device tree mian frame data
//Support level three iframe
 function getDviceTree(){
	  if(parent.theSelectedDeviceTreeNode != undefined){
		  return parent.theSelectedDeviceTreeNode.getChecked();
	  }else if(parent.parent.theSelectedDeviceTreeNode != undefined){
		  return parent.parent.theSelectedDeviceTreeNode.getChecked();
	  }else if(parent.parent.parent.theSelectedDeviceTreeNode != undefined){
		  return parent.parent.parent.theSelectedDeviceTreeNode.getChecked();
	  }
  }
