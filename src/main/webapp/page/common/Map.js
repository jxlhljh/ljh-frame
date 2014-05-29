/*
 * 
 * 提供类似java Map  的数据结构
 */
   function Map() {    
 var struct = function(key, value) {
  this.key = key;    
  this.value = value;    
 }    
     
 var put = function(key, value){    
  for (var i = 0; i < this.arr.length; i++) {    
   if ( this.arr[i].key === key ) {    
    this.arr[i].value = value;    
    return;    
   }    
  }    
   this.arr[this.arr.length] = new struct(key, value);    
 }    
     
 var get = function(key) {    
  for (var i = 0; i < this.arr.length; i++) {    
   if ( this.arr[i].key === key ) {    
     return this.arr[i].value;    
   }    
  }    
  return null;    
 }    
     
 var remove = function(key) {  
 var deleteindex=-1;  
  var v;    
  for (var i = 0; i < this.arr.length; i++) {    
   v = this.arr[i];    
   if ( v.key === key ) {
   deleteindex=i;    
    break;    
   }    
  }
  if(deleteindex!=-1)
  {
  	this.arr.splice(deleteindex,1);
  }    
 }
 this.removeAll=function()
 {
 	try
 	{
 		  this.arr.slice(0,this.arr.length-1); 
 	}catch(e)
 	{
 		
 	}
 
 }
     
 var size = function() {    
  return this.arr.length;    
 }    
     
 var isEmpty = function() {    
  return this.arr.length <= 0;    
 }    
   
 this.arr = new Array();    
 this.get = get;    
 this.put = put;    
 this.remove = remove;    
 this.size = size;    
 this.isEmpty = isEmpty;    
}    

