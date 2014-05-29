package com.sendi.system.util.sort;

import java.util.Comparator;

import com.sendi.system.entity.Functionmoudle;
/*
 * 针对功能模块的排序
 */
public class MoudleSorter  implements Comparator{

	public int compare(Object o1, Object o2) {
		Functionmoudle f1=(Functionmoudle)o1;
		Functionmoudle f2=(Functionmoudle)o2;
		if(f1!=null&&f2!=null)
		{
			return f1.getOrderid()-f2.getOrderid();
		}
 		return 0;
	}

}
