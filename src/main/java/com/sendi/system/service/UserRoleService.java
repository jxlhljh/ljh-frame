package com.sendi.system.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Session;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.system.entity.TreeRole;
import com.sendi.system.entity.UserRole;
import com.sendi.system.entity.UserRoleRelation;

/*
 * 用户角色的运行类
 * 缓存到内存中，做为单例运行
 */

/**
 * 用户角类Service类
 * @author liujinghua
 *
 */
@Service
@Transactional(readOnly = true)
public class UserRoleService extends CommonService<UserRole>{
	/*
	 * 角色ID,对应角色名称
	 */
	public HashMap<String, String> userroleidtoname = new HashMap<String, String>();
	public HashMap<String, UserRole> userroleidtouserole = new HashMap<String, UserRole>();
	/*
	 * 用户ID，对应的角色ID ,角色ID使用逗号分隔
	 */
	public HashMap<String, String> userid2roleid = new HashMap<String, String>();

	/*
	 * 角色ID 对应的 用户ID 用户ID使用逗号分隔
	 */
	public HashMap<String, String> roleid2userid = new HashMap<String, String>();

	private HashMap<String, HashSet<String>> moudleid2roleid = new HashMap<String, HashSet<String>>();

	public HashMap<String, String> getUserroleidtoname() {
		return userroleidtoname;
	}

	public void setUserroleidtoname(HashMap<String, String> userroleidtoname) {
		this.userroleidtoname = userroleidtoname;
	}

	/*
	 * 初始化方法,在bean初始化后会被执行这个方法
	 */
	@PostConstruct
	public void init() {
		Session session = sessionFactory.openSession();
		String hql = "from UserRole";
		List datas = session.createQuery(hql).list();
		for (Object o : datas) {
			UserRole ur = (UserRole) o;
			userroleidtoname.put(ur.getId() + "", ur.getRolename());
			userroleidtouserole.put(ur.getId() + "", ur);

		}

		hql = "from UserRoleRelation";
		datas = session.createQuery(hql).list();
		for (Object o : datas) {
			UserRoleRelation ur = (UserRoleRelation) o;
			if (userid2roleid.get(ur.getUserid() + "") == null) {
				userid2roleid.put(ur.getUserid() + "", ur.getRoleid() + "");
			} else {
				String roleid = userid2roleid.get(ur.getUserid() + "");
				userid2roleid.put(ur.getUserid() + "", ur.getRoleid() + ","
						+ roleid);
			}

			if (roleid2userid.get(ur.getRoleid() + "") == null) {
				roleid2userid.put(ur.getRoleid() + "", ur.getUserid() + "");
			} else {
				String userids = roleid2userid.get(ur.getRoleid() + "");
				roleid2userid.put(ur.getRoleid() + "", ur.getUserid() + ","
						+ userids);
			}

		}
		String hql7 = "select o.roleid,k.moudleid from SystemPower o,Functionmoudle k  where o.moudleid =k.id";
		List datas7 = session.createQuery(hql7).list();
		for (Object o7 : datas7) {
			Object kk[] = (Object[]) o7;
			HashSet<String> tt = moudleid2roleid.get(kk[1]);
			if (tt == null) {
				tt = new HashSet<String>();
				tt.add(String.valueOf((Integer) kk[0]));
				moudleid2roleid.put(kk[1] + "", tt);

			}
			tt.add(String.valueOf(kk[0]));
		}
		session.close();
	}
	
	//重新加载，清除map后，重新执行一下init方法即可
	public void reload(){
		userroleidtoname.clear();
		userroleidtouserole.clear();
		userid2roleid.clear();
		roleid2userid.clear();
		moudleid2roleid.clear();
		this.init();
	}
	
	//临时方法，递归查询角色下的所有子角色，返回list ,map中以id为key
	public List<Map<String,Object>> findAllSubRoles(String parentRoleId){
		String sql = "select id from user_role where parentid='"+parentRoleId+"'";
		List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
		List<Map<String,Object>> subList = new ArrayList<Map<String,Object>>();

		if(list.size() == 0) return subList;
		
		subList.addAll(list);
		for(Map<String,Object> map : list){//递归查询
			String tempParentRoleId = ""+map.get("id");
			List<Map<String,Object>> tempList = findAllSubRoles(tempParentRoleId);
			subList.addAll(tempList);
		}
		
		return subList;
	}
	
	//查询当前用户的角色及子角色id
	public List<Map<String,Object>> findAllMyRoles(String userRoleId){
		if(StringUtils.isEmpty(userRoleId)) return new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map  = new HashMap<String,Object>();
		map.put("id", userRoleId);
		list.add(map);
		list.addAll(findAllSubRoles(userRoleId));
		return list;
	}
	
	public List<Map<String,Object>> findParentidCombox(String userRoleId){
		List<Map<String,Object>> mapList = findAllMyRoles(userRoleId);
		
		String roleids = "";
		
		for(Map<String,Object> tmp : mapList){
			roleids += tmp.get("id")+",";
		}
		
		roleids = StringUtils.substringBeforeLast(roleids, ",");
		
		String sql = "select id,rolename from user_role where id in("+roleids+")";
		
		return jdbcTemplate.queryForList(sql);
	}
	
	//角色管理页面，左边树查询
	public List<TreeRole> treeQuery(Integer parentid,String userid){
		String sql = "select * from user_role where parentid = "+parentid;
		if(parentid==0){//非点击子节点（因为初次加载时参数parentid==0）
			sql = "select su.userName,urr.roleid,ur.id id,ur.rolename rolename,ur.parentid parentid " +
					"from sys_user su ,user_role_relation urr,user_role ur " +
					"where su.id=urr.userid and urr.roleid=ur.id and su.userid='"+userid+"'";
		}

		final List list = new ArrayList();
		jdbcTemplate.query(sql, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				TreeRole tree = new TreeRole();
			    tree.setId(rs.getString("id"));
			    tree.setText(rs.getString("rolename"));
			    list.add(tree);
			}
		});
		return list;
	}
	
	//角色管理页面，中间表列查询
	public List<UserRole> queryUserrole(Integer parentid){
		String sql = "select t1.id,t1.rolename,t1.roledesc,t1.loginip,t1.area,t1.isvalidataip,t1.parentid,"+
				"t1.username,t2.rolename as parentname from user_role t1,user_role t2 where t1.parentid=t2.id and t1.parentid="+parentid;
		System.out.println(sql);
		final List<UserRole> list = new ArrayList<UserRole>();
		jdbcTemplate.query(sql, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				UserRole role = new UserRole();
				role.setId(rs.getInt("id"));
				role.setRolename(rs.getString("rolename"));
				role.setRoledesc(rs.getString("roledesc"));
				role.setLoginip(rs.getString("loginip"));
				role.setArea(rs.getString("area"));
				role.setIsvalidataip(rs.getString("isvalidataip"));
				role.setParentid(rs.getInt("parentid"));
				role.setUsername(rs.getString("username"));
				role.setParentname(rs.getString("parentname"));
				list.add(role);
			}
		});
		return list;
	}
	
	/**
	 * 添加角色
	 * @return
	 */
	@Transactional(readOnly = false)
	public void addUserrole(UserRole userRole){
		this.save(userRole);
	}
	
	/**
	 * 修改角色
	 * @return
	 */
	@Transactional(readOnly = false)
	public void excuteModifyuserrole(UserRole userRole){
		this.updateEntitie(userRole);
	}
	
	/**
	 * 删除角色
	 * @param deleterecord
	 */
	@Transactional(readOnly = false)
	public void excuteDeleteuserrole(String deleterecord){
		String sql="delete from user_role where id in ("+deleterecord+")";
		String sql2="delete from user_role_relation where  roleid in  ("+deleterecord+")";
		String sql3="delete from system_power where  roleid in  ("+deleterecord+")";
		String[] sqls = new String[]{sql,sql2,sql3};
		jdbcTemplate.batchUpdate(sqls);
		
	}
	
	/**
	 * 查詢單個角色
	 * @return
	 */
	public UserRole findById(Integer id){
		return this.get(UserRole.class, id);
	}
	
	public HashMap<String, UserRole> getUserroleidtouserole() {
		return userroleidtouserole;
	}

	public void setUserroleidtouserole(
			HashMap<String, UserRole> userroleidtouserole) {
		this.userroleidtouserole = userroleidtouserole;
	}

	public HashMap<String, String> getUserid2roleid() {
		return userid2roleid;
	}

	public void setUserid2roleid(HashMap<String, String> userid2roleid) {
		this.userid2roleid = userid2roleid;
	}

	public HashMap<String, String> getRoleid2userid() {
		return roleid2userid;
	}

	public void setRoleid2userid(HashMap<String, String> roleid2userid) {
		this.roleid2userid = roleid2userid;
	}

	public HashMap<String, HashSet<String>> getMoudleid2roleid() {
		return moudleid2roleid;
	}
	
}
