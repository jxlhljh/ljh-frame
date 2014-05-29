package com.sendi.system.socket;

/*
 * 通过socket 调用后
 * 例子 1
在本例中，我们将在几个字符串上运用 eval()，并看看返回的结果：

<script type="text/javascript">

eval("x=10;y=20;document.write(x*y)")

document.write(eval("2+2"))

var x=10
document.write(eval(x+17))

</script>输出：

200
4
27例子 2
看一下在其他情况中，eval() 返回的结果：

eval("2+3")	// 返回 5
var myeval = eval;	// 可能会抛出 EvalError 异常
myeval("2+3");	// 可能会抛出 EvalError 异常
可以使用下面这段代码来检测 eval() 的参数是否合法：

try  {
     alert("Result:" + eval(prompt("Enter an expression:","")));
     }

catch(exception) {
     alert(exception);
     }

 */
public class SocketReturnPara {
 
	private String callbackfun;
	private String callbackmoudleid;
 	private Object pushmsg;
  
  
	public String getCallbackfun() {
		return callbackfun;
	}
	public void setCallbackfun(String callbackfun) {
		this.callbackfun = callbackfun;
	}
	public String getCallbackmoudleid() {
		return callbackmoudleid;
	}
	public void setCallbackmoudleid(String callbackmoudleid) {
		this.callbackmoudleid = callbackmoudleid;
	}
	public Object getPushmsg() {
		return pushmsg;
	}
	public void setPushmsg(Object pushmsg) {
		this.pushmsg = pushmsg;
	}
 

}
