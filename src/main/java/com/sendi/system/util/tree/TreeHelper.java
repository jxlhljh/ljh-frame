package com.sendi.system.util.tree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
/*
 * 生成树型结构
 */
public class TreeHelper {
 
	/*
	 * 生成模块树型结构
	 */
	public static void generateMTree(HashMap<String,MoudleTreeNode> treemap)
	{
		 
		Iterator<String> treeset=treemap.keySet().iterator();
		while(treeset.hasNext())
		{
			String key=treeset.next();
			MoudleTreeNode node=treemap.get(key);
		 	if(!node.isroot)
		 	{
		 		String pid=String.valueOf(node.getParentId());
		 		MoudleTreeNode parentnode=treemap.get(pid);
			 	node.setParentNode(parentnode);
			 	parentnode.AddChildNode(node);
			 	parentnode.AddMChildNode(node);
		 	}
		 
	 	}
	}
	/*
	 * 生成普通的树型结构
	 */
	public static void generateCTree(HashMap<String,TreeNode> treemap)
	{
		 
		Iterator<String> treeset=treemap.keySet().iterator();
		while(treeset.hasNext())
		{
			String key=treeset.next();
		 	TreeNode node=treemap.get(key);
		 	if(!node.isroot)
		 	{
		 		String pid=String.valueOf(node.getParentId());
			 	TreeNode parentnode=treemap.get(pid);
			 	node.setParentNode(parentnode);
			 	parentnode.AddChildNode(node);
		 	}
		 
	 	}
	}
	
}
