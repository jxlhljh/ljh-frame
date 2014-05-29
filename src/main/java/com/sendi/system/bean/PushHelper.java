package com.sendi.system.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sendi.system.socket.SocketSever;

/*
 * push 消息的工具类
 */
@Component
public class PushHelper {
	
@Autowired
public SocketSever socketSever;

//push 消息到客户端 pushid是 sys_push_config 表中pushid
public void PushMsg(Object msg,String pushid)
{
  this.socketSever.push(msg, pushid);
}
/*push 消息到客户端 pushid是 sys_push_config 表中pushid
 sessionid 本次会话的id
 user_id用户的主键
 */
public void PushMsg(Object msg,String pushid,String sessionid,String user_id)
{
  this.socketSever.push(msg, pushid,sessionid,user_id);
}
 
}
