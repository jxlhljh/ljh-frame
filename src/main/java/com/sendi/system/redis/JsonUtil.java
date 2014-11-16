package com.sendi.system.redis;

import net.sf.json.JSONObject;

public class JsonUtil {

	public static String toJSONString(Object o){
		return JSONObject.fromObject(o).toString();
	}
	
	public static Object parseObject(String text, Class clazz){
		return JSONObject.toBean(JSONObject.fromObject(text),clazz);
	}
}
