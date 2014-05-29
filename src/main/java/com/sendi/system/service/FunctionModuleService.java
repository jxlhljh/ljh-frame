package com.sendi.system.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.system.bean.ApplicationContextHelper;
import com.sendi.system.constants.Globals;
import com.sendi.system.entity.Functionmoudle;
import com.sendi.system.entity.SystemPower;
import com.sendi.system.util.menu.Menu;
import com.sendi.system.util.menu.MenuItem;
import com.sendi.system.util.menu.ToolBarItem;
import com.sendi.system.util.sort.MoudleSorter;
import com.sendi.system.util.tree.MoudleTreeNode;
import com.sendi.system.util.tree.moudelTreeData;

@Service
@Transactional
public class FunctionModuleService extends CommonService<Functionmoudle>{
	
	//参数名称列表
	private static String USERPOWERFILTER = "userpowerfilter";
	private static String ISUSEDESKTOP = "isusedesktop";
	private static String rootNode = "-1";
	private static String Treeid = "Treeid";
	private static String CLICKLEAFID = "clickleafid";
	
	@Autowired
	private ApplicationContextHelper applicationContextHelper;
	
	
	//新增与修改模块的接收参数方法，
	private Functionmoudle dealWithParameterFromRequest(Functionmoudle functionmoudle ,HttpServletRequest request){
		 if(functionmoudle == null) throw new RuntimeException("functionmoudle object is null!!!");
		 
		 String icon = StringUtils.trimToEmpty(request.getParameter("icon"));
		 String isleaf = StringUtils.isEmpty(request.getParameter("isleaf"))?"off":request.getParameter("isleaf");
		 String moudleid = StringUtils.trimToEmpty(request.getParameter("moudleid"));
		 String moudletitle = StringUtils.trimToEmpty(request.getParameter("moudletitle"));
		 String openurl = StringUtils.trimToEmpty(request.getParameter("openurl"));
		 int parentid = Integer.parseInt(StringUtils.trimToEmpty(request.getParameter("parentid")));
		 int orderid = Integer.parseInt(StringUtils.trimToEmpty(request.getParameter("orderid")));
		 String iconcls = StringUtils.trimToEmpty(request.getParameter("iconcls"));
		 String addshutcut = StringUtils.isEmpty(request.getParameter("addshutcut"))?"off":request.getParameter("addshutcut");
		 String shutcuturl = StringUtils.trimToEmpty(request.getParameter("shutcuturl"));
		 String dependtree = StringUtils.isEmpty(request.getParameter("dependtree"))?"off":request.getParameter("dependtree");
		
		 //1、新增模块数据
		 functionmoudle.setIcon(icon);
		 functionmoudle.setIsleaf(isleaf);
		 functionmoudle.setMoudleid(moudleid);
		 functionmoudle.setMoudletitle(moudletitle);
		 functionmoudle.setOpenurl(openurl);
		 functionmoudle.setParentid(parentid);
		 functionmoudle.setOrderid(orderid);
		 functionmoudle.setIconcls(iconcls);
		 functionmoudle.setAddshutcut(addshutcut);
		 functionmoudle.setShutcuturl(shutcuturl);
		 functionmoudle.setDependTree(dependtree);
		 String moudletype="f";
		
		 if(StringUtils.equals(request.getParameter("isleaf"), "off"))
		 {
			 moudletype="s";
		 }
		 else
		 {
			 moudletype="t";
		 }
		 if(Integer.parseInt(request.getParameter("parentid"))==-1) //根结点下不允许添加二级模块，与三级模块
		 {
			 moudletype="f";
			 functionmoudle.setIsleaf("off");
			 functionmoudle.setOpenurl("");
		 }
		 functionmoudle.setMoudletype(moudletype);
		 
		 return functionmoudle;
		
	}
	
	/**
	 * 模块管理，新增功能模块
	 */
	public void addMoudlefunction(HttpServletRequest request,HttpServletResponse response){
		
		Functionmoudle functionmoudle = new Functionmoudle();
		functionmoudle = dealWithParameterFromRequest(functionmoudle, request);//进行参数收集，设值
		 
		 save(functionmoudle);//保存实体
		 
		 //2、保存实体后，将serveletContext内存同步更新
		 Object mt=applicationContextHelper.servletContext.getAttribute(Globals.sendi_sys_module_tree);
		 	HashMap<String,MoudleTreeNode> moudletreemap=null;
		 	if(mt!=null)
		 	{
		 		moudletreemap=(HashMap<String,MoudleTreeNode>)mt;
		 		MoudleTreeNode pmt=moudletreemap.get(functionmoudle.getParentid()+"");
		 		
		 		MoudleTreeNode tn=new MoudleTreeNode();
		 		tn.setTreeId(functionmoudle.getId());
		 		tn.setText(functionmoudle.getMoudletitle());
		 		tn.setIsleaf(functionmoudle.getIsleaf().equalsIgnoreCase("off")?false:true);
		 		tn.setParentId(functionmoudle.getParentid());
		 		tn.setParentNode(pmt);
		 		tn.fn=functionmoudle;
		 	    pmt.AddChildNode(tn);
		 	    pmt.AddMChildNode(tn);
		 	    moudletreemap.put(tn.getTreeId()+"", tn);
		   }
	}
	
	/**
	 * 模块管理，修改
	 */
	public void excuteModifymoudle(HttpServletRequest request,HttpServletResponse response){
		 //1、修改数据
		 String id = request.getParameter("id");
		 if(StringUtils.isEmpty(id)) throw new RuntimeException("修改模块信息出错 ！,修改的id 不能为空");
		 
		 String hql="from Functionmoudle where 1=1 and id="+id; 
		
		 List<Functionmoudle> datas= findByQueryString(hql);
 	 	 Functionmoudle functionmoudle = datas.get(0);
 	 	 functionmoudle = dealWithParameterFromRequest(functionmoudle, request);//进行参数收集，设值

		 updateEntitie(functionmoudle);

		///更新内存中的模型树
	  	Object mt=applicationContextHelper.servletContext.getAttribute(Globals.sendi_sys_module_tree);
	 	HashMap<String,MoudleTreeNode> moudletreemap=null;
	 	if(mt!=null)
	 	{
	 		moudletreemap=(HashMap<String,MoudleTreeNode>)mt;
	 		MoudleTreeNode moudleTreeNode=moudletreemap.get(functionmoudle.getId()+"");
	 		BeanUtils.copyProperties(functionmoudle, moudleTreeNode.fn);
	 	 	moudleTreeNode.setIsleaf(functionmoudle.getIsleaf().equalsIgnoreCase("off")?false:true);
	 		moudleTreeNode.setText(functionmoudle.getMoudletitle());
	 		moudleTreeNode.setParentId(functionmoudle.getParentid());
	   }
	}
	
	/**
	 * 模块管理，删除
	 */
	public void excuteDeletemoudle(HttpServletRequest request,HttpServletResponse response){
		  String deleterecord = request.getParameter("deleterecord");
		  if(StringUtils.isEmpty(deleterecord)) throw new RuntimeException("删除模块信息出错 ！,删除信息为空");
		  
		  //todo 这里还差一个递归算法进行删除，目前只删除到下一级的节点，再下一级的节点不能删除了
		  String hql="delete from  functionmoudle where id in ("+deleterecord+") or  parentid in ("+deleterecord+")";
		  String hql2="delete from  system_power where   moudleid in ("+deleterecord+")";
		    String sql[]=new String[2];
		     sql[0]=hql;
		     sql[1]=hql2;
		     
		   jdbcTemplate.batchUpdate(sql);//直接调用jdbcTemplate的batchUpdate功能
		  
		  //2、更新内存中的树结构
		    Object mt=applicationContextHelper.servletContext.getAttribute(Globals.sendi_sys_module_tree);
		 	HashMap<String,MoudleTreeNode> moudletreemap=null;
		 	if(mt!=null)
		 	{
		 		moudletreemap=(HashMap<String,MoudleTreeNode>)mt;
		    }
		 	
	 	   String c[]=deleterecord.replaceAll("'", "").split(",");
	 	   for(String b:c)
	 	   {
	 			MoudleTreeNode moudleTreeNode=moudletreemap.get(b);
	 			MoudleTreeNode pnode=(MoudleTreeNode)moudleTreeNode.parentNode;
	 			pnode.removeChild(moudleTreeNode);
	 			pnode.removeMChildNode(moudleTreeNode.fn);		 
	 	  }

	 	    String hql7="from SystemPower";
	 	    HashMap<String,SystemPower> systemPower=(HashMap<String,SystemPower>)applicationContextHelper.servletContext.getAttribute(Globals.sendi_sys_moudlePower_info);
	 	    systemPower.clear();
	 	    List datas7 = this.findByQueryString(hql7);
			 for(Object o7:datas7)
			 {
				 SystemPower slb=(SystemPower)o7;
				 systemPower.put(slb.getId()+"",slb);
			 }
	}
	
	/**
	 * 模块管理，中间的列表数据读取
	 */
	public List<Functionmoudle> moudleInit(HttpServletRequest request){
		String clickleafid = request.getParameter(this.CLICKLEAFID);
		
		List<Functionmoudle> datas=null;
		String hql="from  Functionmoudle where parentid="+clickleafid;
		datas = findByQueryString(hql);
		System.out.println(datas.size());
		return datas;
	}
	
	/**
	 * 列出所有模块树结构
	 */
	public String listmoudletree(HttpServletRequest request)
	{
		String Treeid = request.getParameter(this.Treeid);
		String userpowerfilter = request.getParameter(this.USERPOWERFILTER);
	   
 		String hql="from Functionmoudle where  parentid="+Treeid+" and moudletype in('f','s','t') order by orderid asc";
		List datas=null;
	 	datas = findByQueryString(hql);
	    ArrayList<moudelTreeData> children=new ArrayList<moudelTreeData>();
	    HashMap<String,String> powerMap=( HashMap<String,String>) request.getSession().getAttribute(Globals.userSystemPower);
	    
		for(Object o:datas)
		{
			moudelTreeData ct=new moudelTreeData();
			Functionmoudle f=(Functionmoudle)o;
		 	ct.setId(f.getId());
			ct.setLeaf(f.getIsleaf().equals("on")?true:false);
			ct.setText(f.getMoudletitle());
			ct.setIcon(f.getIcon());
			ct.setMoudleid(f.getMoudleid());
			ct.setMoudletype(f.getMoudletype());
			ct.setOpenurl(f.getOpenurl());
			ct.setIconcls(f.getIconcls());
			if(userpowerfilter!=null&&userpowerfilter.equals("userpowerfilter"))
			{
				
				if(powerMap!=null&&powerMap.get(ct.getId()+"")!=null)
				{
					children.add(ct);
				}
				
			}
			else
			{
				children.add(ct);
			}
		 
			 
	 	}
		   String jsons = JSONArray.fromObject(children).toString();
		   logger.info(jsons);
	   return jsons;
	}
	

	public String listallMoudletoMenu(HttpServletRequest request)
	{
		String userpowerfilter = request.getParameter(this.USERPOWERFILTER);
		HttpSession session = request.getSession();
		
	 	List datas=null;
	  	Object mt= session.getServletContext().getAttribute(Globals.sendi_sys_module_tree);
	 	HashMap<String,MoudleTreeNode> moudletreemap=null;
	 	if(mt!=null)
	 	{
	 		moudletreemap=(HashMap<String,MoudleTreeNode>)mt;
	 		datas=moudletreemap.get(rootNode).getMchild();
	 	}
	 
	 	MoudleSorter ms=new MoudleSorter();
	 	if(datas.size()>0)
	 	{
	 		Collections.sort(datas, ms);
	 	}
	 	
	    ArrayList<ToolBarItem> children=new ArrayList<ToolBarItem>();
	    HashMap<String,String> powerMap=( HashMap<String,String>) session.getAttribute(Globals.userSystemPower);
		for(Object o:datas)
		{
			
			ToolBarItem ct=new ToolBarItem();
			try
			{
	 			Functionmoudle f=(Functionmoudle)o;
	 			ct.id=f.getId();
			  	ct.setText(f.getMoudletitle());
				ct.setIcon(f.getIcon());
				ct.setIconcls(f.getIconcls());
			 
			}
			catch (Exception e) {
				e.printStackTrace();			 
			}
			if(userpowerfilter!=null&&userpowerfilter.equals(this.USERPOWERFILTER))
			{
					if(powerMap!=null&&powerMap.get(ct.id+"")!=null)
					{
						children.add(ct);
					}
				
			}
			else
			{
				children.add(ct);
			}
	 	 	
			 
	 	}
	
		for(ToolBarItem tbi:children)
		{
		 	IteratorChildMenue(tbi,powerMap,ms,moudletreemap,request); //迭代出所有菜单
		}
	 
		String json=JSONArray.fromObject(children).toString();
		return json;
 	}
	
		// ////迭代出所有子菜单项目
		public void IteratorMenueItem(MenuItem ctb, HashMap<String,String> powerMap,MoudleSorter ms,HashMap<String,MoudleTreeNode> moudletreemap,HttpServletRequest request)
		   {
		    	String isusedesktop = StringUtils.isEmpty(request.getParameter(ISUSEDESKTOP))?"no":request.getParameter(ISUSEDESKTOP); 
				String userpowerfilter = request.getParameter(this.USERPOWERFILTER);
			
				List datas=null;
			  	datas=moudletreemap.get(ctb.id+"").getMchild();
			  	if(datas!=null&&datas.size()>0)
			    {
			    	 Collections.sort(datas, ms);
			    	 ctb.menu=new Menu();
			    }
			    else
			    {
			    	return;
			    }
			   
				for(Object o:datas)
				{
					
					MenuItem ct=new MenuItem();
					try
					{
			 			Functionmoudle f=(Functionmoudle)o;
					 	ct.id=f.getId();
						ct.setLeaf(f.getIsleaf().equals("on")?true:false);
						ct.setText(f.getMoudletitle());
						ct.setIcon(f.getIcon());
						ct.setMoudleid(f.getMoudleid());
						ct.setOpenurl(f.getOpenurl());
						ct.setIconcls(f.getIconcls());
						 
						if(isusedesktop.equals("yes"))
						{
					 		ct.setHandler("function(src){createWin(src)}");
						}
					 
					}
					catch (Exception e) {
					 
					}
					if(userpowerfilter!=null&&userpowerfilter.equals(this.USERPOWERFILTER))
					{
							if(powerMap!=null&&powerMap.get(ct.id+"")!=null)
							{
								ctb.menu.items.add(ct);
							}
					
			 		}
					else
					{
						ctb.menu.items.add(ct);
					}
			 	 	
				
					
			 	}
				
				for(MenuItem tbi:ctb.menu.items)
				{
				 	IteratorMenueItem(tbi,powerMap,ms,moudletreemap,request);
				}
				
				
		   }
		//迭代出所有菜单 
	   public void IteratorChildMenue(ToolBarItem ctb, HashMap<String,String> powerMap,MoudleSorter ms,HashMap<String,MoudleTreeNode> moudletreemap,HttpServletRequest request)
	   {
		    String isusedesktop = request.getParameter(ISUSEDESKTOP); 
			String userpowerfilter = request.getParameter(this.USERPOWERFILTER);
		   
		  	List datas=null;
		  	datas=moudletreemap.get(ctb.id+"").getMchild();
		     if(datas!=null&&datas.size()>0)
		    {
		    	 Collections.sort(datas, ms);
		    	 ctb.menu=new Menu();
		    }
		    else
		    {
		    	return;
		    }
		   
			for(Object o:datas)
			{
				
				MenuItem ct=new MenuItem();
				try
				{
		 			Functionmoudle f=(Functionmoudle)o;
		 			ct.id=f.getId();
					ct.setLeaf(f.getIsleaf().equals("on")?true:false);
					ct.setText(f.getMoudletitle());
					ct.setIcon(f.getIcon());
					ct.setMoudleid(f.getMoudleid());
					ct.setOpenurl(f.getOpenurl());
					ct.setIconcls(f.getIconcls());
					ct.setDependtree(f.getDependTree());
				 	if(isusedesktop.equals("yes"))
					{
						ct.setHandler("function(src){createWin(src)}");
					}
				}
				catch (Exception e) {
				 
				}
				if(userpowerfilter!=null&&userpowerfilter.equals("userpowerfilter"))
				{
						if(powerMap!=null&&powerMap.get(ct.id+"")!=null)
						{
							ctb.menu.items.add(ct);
						}
				
		 		}
				else
				{
					ctb.menu.items.add(ct);
				}
		 	 	
			
				
		 	}
		
			for(MenuItem tbi:ctb.menu.items)
			{
			 	IteratorMenueItem(tbi,powerMap,ms,moudletreemap,request); ////迭代出所有子菜单项目
			}
			
			
	   }
	   
	   
	   /*
		 * 列出模块树结构，采用 servlet context中的
		 */
		public String listmoudletreenode(HttpServletRequest request)
		{
			String userpowerfilter = request.getParameter(this.USERPOWERFILTER);
			String Treeid = request.getParameter(this.Treeid);
			
			List datas=null;
		  	Object mt= applicationContextHelper.servletContext.getAttribute(Globals.Syssendi_sys_module_tree);
		 	HashMap<String,MoudleTreeNode> moudletreemap=null;
		 	if(mt!=null)
		 	{
		 		moudletreemap=(HashMap<String,MoudleTreeNode>)mt;
		 		datas=moudletreemap.get(Treeid+"").getMchild();
		 	}
		 	MoudleSorter ms=new MoudleSorter();
			if(datas.size()>0)
		 	{
		 		Collections.sort(datas, ms);
		 	}
			
			
		    ArrayList<moudelTreeData> children=new ArrayList<moudelTreeData>();
		    HashMap<String,String> powerMap=( HashMap<String,String>) request.getSession().getAttribute(Globals.userSystemPower);
		    
			for(Object o:datas)
			{
				moudelTreeData ct=new moudelTreeData();
				Functionmoudle f=(Functionmoudle)o;
			 	ct.setId(f.getId());
				ct.setLeaf(f.getIsleaf().equals("on")?true:false);
				ct.setText(f.getMoudletitle());
				ct.setIcon(f.getIcon());
				ct.setMoudleid(f.getMoudleid());
				ct.setMoudletype(f.getMoudletype());
				ct.setOpenurl(f.getOpenurl());
				ct.setIconcls(f.getIconcls());
				if(userpowerfilter!=null&&userpowerfilter.equals(USERPOWERFILTER))
				{
					
					if(powerMap!=null&&powerMap.get(ct.getId()+"")!=null)
					{
						children.add(ct);
					}
					
				}
				else
				{
					children.add(ct);
				}
			 
				 
		 	}
			   String jsons = JSONArray.fromObject(children).toString();
		      return jsons;
		}
	   
	   public String listallMoudletoMenuBar(HttpServletRequest request)
	    {
		   String userpowerfilter = request.getParameter(this.USERPOWERFILTER);
	        List datas = null;
	        Object mt = applicationContextHelper.servletContext.getAttribute(Globals.Syssendi_sys_module_tree);
	    	HashMap<String,MoudleTreeNode> moudletreemap=null;
	        if(mt != null)
	        {
	        	moudletreemap=(HashMap<String,MoudleTreeNode>)mt;
	        	datas=moudletreemap.get("-1").getMchild();
	        }
	    	
	        MoudleSorter ms = new MoudleSorter();
	        if(datas.size() > 0)
	            Collections.sort(datas, ms);
	        ArrayList<ToolBarItem> children = new ArrayList<ToolBarItem>();
	        HashMap<String,String> powerMap=( HashMap<String,String>) request.getSession().getAttribute(Globals.userSystemPower);
	        for(Object o:datas)
	        {
	             ToolBarItem ct = new ToolBarItem();
	            try
	            {
	                Functionmoudle f = (Functionmoudle)o;
	                ct.id = f.getId().intValue();
	                ct.setText(f.getMoudletitle());
	                ct.setIcon(f.getIcon());
	                ct.setIconcls(f.getIconcls());
	                ct.menuid = f.getId().intValue();
	            }
	            catch(Exception e)
	            {
	                e.printStackTrace();
	            }
	            if(userpowerfilter != null && userpowerfilter.equals(USERPOWERFILTER))
	            {
	                if(powerMap != null && powerMap.get((new StringBuilder(String.valueOf(ct.id))).toString()) != null)
	                    children.add(ct);
	            } else
	            {
	                children.add(ct);
	            }
	        }

	        String json = JSONArray.fromObject(children).toString();
	        return json;
	    }
}
