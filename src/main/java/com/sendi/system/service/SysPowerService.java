package com.sendi.system.service;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.system.bean.ApplicationContextHelper;
import com.sendi.system.constants.Globals;
import com.sendi.system.entity.Functionmoudle;
import com.sendi.system.entity.SystemPower;
import com.sendi.system.util.tree.MoudleTreeCheckData;

@Service
public class SysPowerService extends CommonService<SystemPower>{
	
	@Autowired
	private ApplicationContextHelper applicationContextHelper; 
	
	/*
	 * 生成 系统权限树，这里要改造，只能读取当前role有的权限 ，没有的不能显示出来
	 */
     public String generateSysPowerTree(String Treeid,String useroleid,String parentRoleId)
      {
    	
    	Session session = getSession();
    	 
    	String hql="from Functionmoudle where  parentid="+Treeid;
 	    List datas=null;
	 	datas = session.createQuery(hql).list();
	 	
	    ArrayList<MoudleTreeCheckData> children=new ArrayList<MoudleTreeCheckData>();
 	 
	  	hql="from SystemPower where roleid in("+useroleid+")";
	 
		HashMap<String,String> powerMap=new HashMap<String, String>();
	 
		List result3 = session.createQuery(hql).list();
	 
	    for(Object o:result3)
	    {
	    	SystemPower sp=(SystemPower)o;
	    	powerMap.put(sp.getMoudleid()+"", sp.getPowerstate());
	    }
		for(Object o:datas)
		{
			Functionmoudle f=(Functionmoudle)o;
			//先试试吧，根据权限过滤 
			HashMap<String, HashSet<String>> moudleid2roleid = (HashMap<String, HashSet<String>>)applicationContextHelper.servletContext.getAttribute(Globals.Syssendi_sys_moudleid2roleid_info);
			HashSet<String> roleids = moudleid2roleid.get(""+f.getId());
			if((roleids == null || !roleids.contains(""+parentRoleId)) && !StringUtils.equals(Globals.SuperRoleID, parentRoleId)) continue ;//超级管理员直接有权限
			
			MoudleTreeCheckData ct=new MoudleTreeCheckData();
			
		 	ct.setId(f.getId());
		   
			ct.setLeaf(f.getIsleaf().equals("on")?true:false);
			if(f.getMoudletype().equals("t")) //如果是3级模块，有可能存在按钮这个功能节点
			{
				ct.setLeaf(false);
			}
			ct.setText(f.getMoudletitle());
		    if(powerMap!=null&&powerMap.get(f.getId()+"")!=null)
		    {
		    	ct.setChecked(powerMap.get(f.getId()+""));
		    }
			children.add(ct);
			 
	 	}
		   String jsons = JSONArray.fromObject(children).toString();
	      
	       return jsons;
			
	 }
     
     /*
      * 保存权限
      */
     @Transactional
     public void saveSyspower(final Integer useroleid,String powerstring)
     {
    	 String sql="delete from system_power WHERE system_power.roleid ="+useroleid;
     	 jdbcTemplate.update(sql);
     	 
     	String sql2="insert into system_power (roleid,moudleid,powerstate) values (?,?,?)";
		 
		 final List<Object[]> list = new ArrayList<Object[]>();
		 String a[]=powerstring.split(",");
		 for(int i=0;i<a.length;i++){
			 Object[] o = a[i].split("-");
			 list.add(o);
		 }
		 
		 jdbcTemplate.batchUpdate(sql2, new BatchPreparedStatementSetter() {
			
			public void setValues(PreparedStatement psd, int i)
					throws SQLException {
				Object[] o = list.get(i);
				psd.setInt(1,useroleid);
		 		psd.setInt(2,Integer.parseInt((String)o[0]));
		 		psd.setString(3,(String)o[1]);
			}
			
			public int getBatchSize() {
				return list.size();
			}
		 });
		 
		 
		 //3、保存了所选角色的授权后，还需要同步更新当所授权角色的子角色的功能同步，
		 //场景如，用户管理功能，某个角色开始具备这个功能，并给子角色授权了，对这个角色去掉这项功能后，逻辑上，子角色也应该不具备该功能了
		 //因此需要同步删除，
		 //不过这里先不实现了，用户如果提出来再说
		 
		 reloadSysPower();
     }
     
     public void reloadSysPower()
 	{
 	     ///重新加载内存中的权限信息
 		HashMap<String,SystemPower> systemPower=(HashMap<String,SystemPower>)applicationContextHelper.servletContext.getAttribute(Globals.sendi_sys_moudlePower_info);
		HashMap<String, HashSet<String>> moudleid2roleid = (HashMap<String, HashSet<String>>)applicationContextHelper.servletContext.getAttribute(Globals.Syssendi_sys_moudleid2roleid_info);
 		 
 		String hql7 = "from SystemPower";
		List datas7 = getSession().createQuery(hql7).list();
		for (Object o7 : datas7) {
			SystemPower slb = (SystemPower) o7;
			systemPower.put(slb.getId() + "", slb);
			HashSet<String> tt = moudleid2roleid.get(String.valueOf(slb.getMoudleid().toString()));
			if (tt == null) {
				tt = new HashSet<String>();
				moudleid2roleid.put(String.valueOf(slb.getMoudleid().toString()), tt);
			}
			tt.add(String.valueOf(slb.getRoleid()));
		}
		applicationContextHelper.servletContext.setAttribute("sendi_sys_moudlePower_info", systemPower);
		// 模块ID对应的所有角色id
		applicationContextHelper.servletContext.setAttribute("sendi_sys_moudleid2roleid_info", moudleid2roleid);
 	  
 	}
}
