package com.sendi.system.service;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.system.bean.ApplicationContextHelper;
import com.sendi.system.entity.UserRole;
import com.sendi.system.entity.UserZone;
import com.sendi.system.entity.UserZonePower;
import com.sun.org.apache.bcel.internal.generic.RETURN;

/**
 * 用户管理类
 * 
 * @author liujinghua
 * 
 */
@Service
public class UserZoneService extends CommonService<UserZone> {
	
	@Autowired
	private ApplicationContextHelper applicationContextHelper;
	
	@Autowired
	private UserRoleService userRoleService;
	
	
	/**
	 * 下拉树的子节点查询
	 */
	public String listUserZoneTree(HttpServletRequest request,HttpServletResponse response,Integer zonecode){
		String homeImg = request.getContextPath()+"/icons/home_page_icon/home.gif";
    	String leafImg = request.getContextPath()+"/icons/home_page_icon/leaf.png";
		StringBuffer jsonS = new StringBuffer("[");
		String hql = "from UserZone where parentcode ='"+zonecode+"'";
	    List<UserZone> zones = getSession().createQuery(hql).list();
		for(int i=0;i<zones.size();i++){
			UserZone zone = zones.get(i);
			boolean isLeaf = "2".equals(zone.getLevel());
			String icons = isLeaf?leafImg:homeImg;
			jsonS.append("{id:'"+zone.getId()+"',text:'"+zone.getZonename()+"',leaf:"+isLeaf+",iconcls:'',icon:'"+icons+"'},");
		}
		if(jsonS.toString().endsWith(",")) jsonS.deleteCharAt(jsonS.length()-1);
		jsonS.append("]");
	    return jsonS.toString();
	}
	
	
	/**
	 * Grid_store查询
	 */
	public List<UserZone> queryUserZone(String parentcode,String zonename){
		if(StringUtils.isEmpty(parentcode)) parentcode="-1";
		String hql = "from UserZone where parentcode ='"+parentcode+"'";
		if(zonename!=null&& !("").equals(zonename)) hql += " and zoneName like '%"+zonename+"%'";
		List<UserZone> zones = getSession().createQuery(hql).list();;
		return zones;
	}
		
	
	//新增记录
	@Transactional
	public String addUserZone(UserZone userZone){
		String msg = null;
		if(userZone.getParentcode()!=null) {
			String level="1";
			if(!userZone.getParentcode().equals("-1")) {
				String sql_level = "select level+1 level from user_zone where id='"+userZone.getParentcode()+"'";
				List<Map<String,Object>> result = jdbcTemplate.queryForList(sql_level);
				level = (""+(Double)result.get(0).get("level")).substring(0,1);
			}
			userZone.setLevel(level);
			super.save(userZone);
			msg="";//msg.length()==0:保存成功
		}else{
			msg="信息不完整";
		}
		return msg;
	}

	//修改
	@Transactional
	public String updateUserZone(UserZone userZone){
		String msg = null;
		if(userZone.getParentcode()!=null) {
			String level="1";
			if(!userZone.getParentcode().equals("-1")) {
				String sql_level = "select level+1 level from user_zone where id='"+userZone.getParentcode()+"'";
				List<Map<String,Object>> result = jdbcTemplate.queryForList(sql_level);
				level = (""+(Double)result.get(0).get("level")).substring(0,1);
			}
			userZone.setLevel(level);
			super.updateEntitie(userZone);
			msg="";//msg.length()==0:保存成功
		}else{
			msg="信息不完整";
		}
		return msg;
	}
	
	
	//删除
	@Transactional
	public String deleteUserZone(String id){
		String msg = null;
		if(id!=null ) {
			String sql_uz = "";
			String sql_uzp = "";
			if(id.length()>0){//id数>1
				String sql_getIDs = "select id from user_zone where parentcode in("+id+")";
				List<Map<String,Object>> result = jdbcTemplate.queryForList(sql_getIDs);
				for(Map<String,Object> m:result){
					id += ","+(Integer)m.get("id");
				}
				System.out.println(id);
				sql_uz = "delete from user_zone where id in("+id+")";
				sql_uzp = "delete from user_zone_power where id in("+id+")";
				jdbcTemplate.update(sql_uz);
				jdbcTemplate.update(sql_uzp);
			}
			msg="";//msg.length()==0:操作成功
		}else{
			msg="信息不完整";
		}
		return msg;
	}
	
	/**
	 * “父级代码”区域下拉树—-获取选项的内容
	 */
	public String listUserZoneTree4combo(String comboTreeid){ 
		//String jsons = ("[{ text:'全国',id:'-1',checked: false ,leaf: false ,expanded: true ,children: [{ text:'111',id:'EXAMLIB0000111',checked: false ,leaf:false},{ text:'222',id:'EXAMLIB0000222',checked: false ,leaf:true},{ text:'333',id:'EXAMLIB0000333',checked: false ,leaf:true},{ text:'444',id:'EXAMLIB0000444',checked: false ,leaf:true},{ text:'555',id:'EXAMLIB0000555',checked: false ,leaf:true},{ text:'666',id:'EXAMLIB0000666',checked: false ,leaf:true}]}]");
		StringBuffer jsons = new StringBuffer("");
		if(comboTreeid==null || ("null").equals(comboTreeid.toString())) 
			comboTreeid="-1";
		String hql = "from UserZone where parentcode ='"+comboTreeid+"'";
	    List<UserZone> zones = getSession().createQuery(hql).list();
	    jsons.append("[");
		if(comboTreeid.equals("-1")){
			jsons.append("{ text:'全国',id:'-1',checked: false ,leaf: false ,expanded: true ,children:[");
			for(int i=0;i<zones.size();i++){
				UserZone zone = zones.get(i);
				boolean isLeaf = "3".equals(zone.getLevel());
				jsons.append("{id:'"+zone.getId()+"',text:'"+zone.getZonename()+"',checked:false,leaf:"+isLeaf+"},");
			}
			if(jsons.toString().endsWith(",")) jsons.deleteCharAt(jsons.length()-1);
			jsons.append("]}");
		}else{
			for(int i=0;i<zones.size();i++){
				UserZone zone = zones.get(i);
				boolean isLeaf = "3".equals(zone.getLevel());
				jsons.append("{id:'"+zone.getId()+"',text:'"+zone.getZonename()+"',checked:false,leaf:"+isLeaf+"},");
			}
			if(jsons.toString().endsWith(",")) jsons.deleteCharAt(jsons.length()-1);
		}
		jsons.append("]");
		System.out.println(jsons);
		return (jsons.toString());
	}

	
	
	/**
	 *  生成区域权限树
	 */
	public String generateRoleZonePowerTree(String zonelevel,String useroleid, String zonecode) {
		if(zonelevel.equals("true")){
			return "";	//注意:末尾节点不展开查询!!!
		}
		String hql = "from UserRole where id = "+useroleid;
		UserRole thisUserole = (UserRole) getSession().createQuery(hql).list().get(0);
		String sql_getParentZone="select uz.id,uz.zonecode,uz.zonename,uz.parentcode,uz.level,uzp.powerstate,uzp.roleid " +
			"from user_zone uz right join user_zone_power uzp on uzp.zoneid=uz.id " +
			"where uzp.roleid='"+thisUserole.getParentid()+"' and parentcode='"+zonecode+"' ";
		String sql_thisZone = "select zoneid,powerstate from user_zone_power where roleid='"+useroleid+"'";
		System.out.println(sql_getParentZone);
		System.out.println(sql_thisZone);
		List<Map<String,Object>> zoneLlist_thisZone  = jdbcTemplate.queryForList(sql_getParentZone);//以父角色具有权限的区域作为本角色的权限区域
		List<Map<String,Object>> zoneLlist_thisZonePower  = jdbcTemplate.queryForList(sql_thisZone);//本角色具有权限的区域
		StringBuffer jsons = new StringBuffer("[");
		for(Map<String,Object> zoneMap :zoneLlist_thisZone){
			boolean isLeaf = ((String)zoneMap.get("level")).equals("2");
			jsons.append("{'" );
			jsons.append("checked':'"+checkZonePower((Integer)zoneMap.get("id"),zoneLlist_thisZonePower)
					+ "','id':'"+zoneMap.get("id")+"','leaf':"+isLeaf+",'text':'"
					+ zoneMap.get("zonename")+"','uiProvider':'Ext.ux.TreeCheckNodeUI'");
			jsons.append("},");
		}
		if(jsons.toString().endsWith(",")) jsons.deleteCharAt(jsons.length()-1);
		jsons.append("]");
	    return (jsons.toString());
	}
	
	private String checkZonePower(int id,List<Map<String,Object>> zoneLlist_thisZonePower){
		for(Map<String,Object> zonePowerMap :zoneLlist_thisZonePower){
			if((Integer)zonePowerMap.get("zoneid")==id) return (String)zonePowerMap.get("powerstate");
		}
		return "none";
	}
	
	/**
	 * 保存角色的区域权限
	 */
	@Transactional
	public String saveUserZonePower(String powerstring,final String useroleid){
		String msg = "";
		if(powerstring!=null && useroleid!=null) {
			final String[] powerArray = powerstring.split(",");
			String sql_del = "delete from user_zone_power where roleid='"+useroleid+"'";
			jdbcTemplate.update(sql_del);
			if(powerArray[0].split("-").length>1){
				String sql = "insert into user_zone_power (zoneid,powerstate,roleid) values (?,?,?)";
				jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
					public void setValues(PreparedStatement psd, int i)throws SQLException {
						psd.setString(1,powerArray[i].split("-")[0]);
				 		psd.setString(2,powerArray[i].split("-")[1]);
				 		psd.setString(3,useroleid);
						//psd.addBatch();//不去的的话sql将被执行两次
					}
					public int getBatchSize() {
						return powerArray.length;
					}
				});
			}
			msg = "{success:true,msg:'success'}";
		}else{
			msg = "{success:false,msg:'faild',errors:{'信息不完整'}}";
		}
		return msg;
	}
	
}
