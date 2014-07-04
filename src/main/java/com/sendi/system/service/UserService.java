package com.sendi.system.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sendi.system.bean.ApplicationContextHelper;
import com.sendi.system.bean.Page;
import com.sendi.system.constants.Globals;
import com.sendi.system.entity.User;

/**
 * 用户管理类
 * 
 * @author liujinghua
 * 
 */
@Service
public class UserService extends CommonService<User> {
	
	@Autowired
	private ApplicationContextHelper applicationContextHelper;
	
	@Autowired
	private UserRoleService userRoleService;
	
	
	/**
	 * 查询用户，用于用户列表显示，只能显示当用用户，以及子角色下包括用户的信息，平级角色的查不出，
	 * 如admin和amin2都是超级管理员，admin只能查询出admin及子角色的用户admin2暂时不能查询出
	 * userid,username都是页面上的查询条件
	 */
	public List<User> queryUser(String userid,String username,String currentUserid,String currentRoleid){
		if(StringUtils.isEmpty(currentRoleid)) throw new RuntimeException("查询用户列表时角色id不允许为空");
		
		//1、获取当前角色下的所有子角色ID
		List<Map<String,Object>> subRoleIdsMap = userRoleService.findAllSubRoles(currentRoleid);
		StringBuffer subRoleids = new StringBuffer();
		for(Map<String,Object> map :subRoleIdsMap){
			subRoleids.append(map.get("id")+",");
		}
		String roleIds = currentRoleid+","+subRoleids.toString();
		roleIds = StringUtils.substringBeforeLast(roleIds, ",");
		
		//2、查询用户角色关系表，找出所有子角色所关联的用户userids
		List<Map<String,Object>> subUseridsMap = jdbcTemplate.queryForList("select userid from user_role_relation where roleid in("+roleIds+")");
		StringBuffer subUserids = new StringBuffer();
		for(Map<String,Object> map :subUseridsMap){
			subUserids.append(map.get("userid")+",");
		}
		
		//3、根据当用用户id，以及子角色下所有的用户id，去查询出所有的用户信息
		String userids = currentUserid+","+subUserids.toString();
		userids = StringUtils.substringBeforeLast(userids, ",");
		String hql = "from User where id in("+userids+")";
		
		if(StringUtils.isNotEmpty(userid)){
			hql += " and userid like '%"+userid+"%'";
		}
		if(StringUtils.isNotEmpty(username)){
			hql += " and username like '%"+username+"%'";
		}
		
		return this.findByQueryString(hql);
	}
	
	
	/**
	 * 新增用户
	 */
	@Transactional
	public void addUser(User user,int roleid){
		 
		Integer userid = (Integer)this.save(user);
		 userRoleService.updateUserRoleId(roleid, userid);
		 
		 //更新内存
		 Object mtuser=applicationContextHelper.servletContext.getAttribute(Globals.Syssendi_sys_user_info);
		 if(mtuser!=null)
		 {
			HashMap<String,User> usermap = (HashMap<String,User>)mtuser;
			usermap.put(user.getUserId(), user);
		 }
		 
		 userRoleService.reloadUserRoleRelation();//重载用户角色关系信息
	}
	
	/**
	 * 修改用户
	 */
	@Transactional
	public void excuteModifyuser(User user,Integer roleid){
		this.updateEntitie(user);
		userRoleService.updateUserRoleId(roleid, user.getId());
		
		 //更新内存
		Object mtuser=applicationContextHelper.servletContext.getAttribute(Globals.Syssendi_sys_user_info);
		if(mtuser!=null)
		{
			HashMap<String,User> usermap=(HashMap<String,User>)mtuser;
			usermap.put(user.getUserId(), user);
		}
		
		userRoleService.reloadUserRoleRelation();//重载用户角色关系信息
	}
	
	/**
	 * 根据Id查询用户
	 * @param id
	 * @return
	 */
	public User findById(Integer id){
		return this.get(User.class, id);
	}
	
	/**
	 * 删除用户
	 */
	@Transactional
	public void excuteDeleteuser(String deleterecord){
		String hql="delete User where id in ("+deleterecord+")";
		String hql2="delete UserRoleRelation where userid in ("+deleterecord+")";
		
		this.executeHql(hql);
		this.executeHql(hql2);
		
		Object mtuser=applicationContextHelper.servletContext.getAttribute(Globals.Syssendi_sys_user_info);
		if(mtuser!=null)
		{
			HashMap<String,User> usermap=(HashMap<String,User>)mtuser;
			String uids[]=deleterecord.replaceAll("'","").split(",");
		 	Iterator<String> it=usermap.keySet().iterator();
			while(it.hasNext())
			{
				String uid=it.next();
				User u=usermap.get(uid);
				for(String b:uids)
				{
					if(u.getId().intValue()==Integer.parseInt(b))
					{
						it.remove();
					}
				}
			}
		}
		
		userRoleService.reloadUserRoleRelation();//重载用户角色关系信息
		
	}
	
	//激活或禁用用的方法
	@Transactional
	public void excuteChangestatus(String activestatus,String deleterecord)
	{
		String sql="update sys_user set isactive='"+activestatus+"' where id in("+deleterecord+")";
		
		int r = jdbcTemplate.update(sql);
	 
		if(r!=0)//不等于0表示有更新过记录
		{
			Object mtuser=applicationContextHelper.servletContext.getAttribute(Globals.Syssendi_sys_user_info);
				if(mtuser!=null)
				{
					HashMap<String,User> usermap=(HashMap<String,User>)mtuser;
					String uids[] = deleterecord.replaceAll("'","").split(",");
				 	Iterator<String> it=usermap.keySet().iterator();
					while(it.hasNext())
					{
						String uid=it.next();
						User u=usermap.get(uid);
						for(String b:uids)
						{
							if(u.getId().intValue()==Integer.parseInt(b))
							{
								 u.setIsactive(activestatus);
							}
						}
					}
				}
		}
		
	}
	

	/**
	 * 修改密码
	 */
	@Transactional
	public void excuteModifyUserPassword(String userId, String userName,String password,
			Integer pwdvalicity) {
		if (userId == null || userId.equals("") || userId.equals("null")) {
			throw new RuntimeException("userId is null!账号不能为空");
		}

		String hql = "from User where  userId='" + userId + "' and password='"	+ userName + "' ";

		User user = singleResult(hql);
		
		if(user == null) throw new RuntimeException("原始密码输入不正确");
		
		user.setPwdvalicity(pwdvalicity);
		if (!user.getPassword().equals(password)) // 如果原密码跟现有的密码一样，则不修改日期
		{
			user.setPassword(password);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String current = sdf.format(new Date());
			user.setPwddate(current);
		}

		updateEntitie(user);
		
		Object mtuser = applicationContextHelper.servletContext.getAttribute(Globals.Syssendi_sys_user_info);
		if (mtuser != null) {
			HashMap<String, User> usermap = (HashMap<String, User>) mtuser;
			usermap.put(user.getUserId(), user);
		}

	}
}
