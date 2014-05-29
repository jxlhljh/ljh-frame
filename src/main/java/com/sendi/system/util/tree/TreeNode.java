package com.sendi.system.util.tree;

import java.util.ArrayList;

public class TreeNode {
 public  boolean isroot=false;	
 public String text;	
 public int treeId;
 public int parentId;
 public boolean isleaf;
 public TreeNode parentNode;
 public ArrayList<TreeNode> child;

 
 
public void AddChildNode(TreeNode tn)
{
 	 if(child==null)
 	 {
 		child=new ArrayList<TreeNode>();
 	 }
 	 if(!child.contains(tn))
 	 {
 		child.add(tn);
 	 }
}
public void removeChild(TreeNode tn)
{
   	 if(tn!=null)
   	 {
     	 boolean isremove=child.remove(tn);
     	 if(isremove)
     	 {
     		 tn.parentNode=null;
     	 }
    }
}
public int getTreeId() {
	return treeId;
}
public void setTreeId(int treeId) {
	this.treeId = treeId;
}
public int getParentId() {
	return parentId;
}
public void setParentId(int parentId) {
	this.parentId = parentId;
}
public ArrayList<TreeNode> getChild() {
	return child;
}
public void setChild(ArrayList<TreeNode> child) {
	this.child = child;
}

public TreeNode getParentNode() {
	return parentNode;
}
public void setParentNode(TreeNode parentNode) {
	this.parentNode = parentNode;
}
public boolean isIsleaf() {
	return isleaf;
}
public void setIsleaf(boolean isleaf) {
	this.isleaf = isleaf;
}
public String getText() {
	return text;
}
public void setText(String text) {
	this.text = text;
}
public boolean isIsroot() {
	return isroot;
}
public void setIsroot(boolean isroot) {
	this.isroot = isroot;
}
 
}
