package com.sendi.system.preload;

import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.sendi.system.bean.PreloadI;
import com.sendi.system.bean.SysActionLogConfBean;

public class Preload extends PreloadI
{
	private Log logger=LogFactory.getLog(Preload.class);
	private HashMap<String, SysActionLogConfBean> hash=null;
	
	public void doLoad()	{
		System.out.println("11111 ....... do load.......");

	}
}
