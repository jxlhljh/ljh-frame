package com.sendi.system.util.tree;

import java.util.ArrayList;

import com.sendi.system.entity.Functionmoudle;

public class MoudleTreeNode extends TreeNode{
	public Functionmoudle fn;
	public ArrayList<Functionmoudle> mchild;
	public Functionmoudle getFn() {
		return fn;
	}
	public void setFn(Functionmoudle fn) {
		this.fn = fn;
	}
	public ArrayList<Functionmoudle> getMchild() {
		return mchild;
	}
	public void setMchild(ArrayList<Functionmoudle> mchild) {
		this.mchild = mchild;
	}
	public void AddMChildNode(MoudleTreeNode tn)
	{
	 	 if(mchild==null)
	 	 {
	 		mchild=new ArrayList<Functionmoudle>();
	 	 }
	 	 if(!mchild.contains(tn.fn))
	 	 {
	 		mchild.add(tn.fn);
	 	 }
	}
	public void removeMChildNode(Functionmoudle n)
	{
		if(mchild!=null)
		{
			mchild.remove(n);
		}
	}
  
}
