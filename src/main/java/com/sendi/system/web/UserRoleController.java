package com.sendi.system.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.entity.TreeRole;
import com.sendi.system.entity.UserRole;
import com.sendi.system.service.UserRoleService;

@Controller
@RequestMapping("/userRoleController")
public class UserRoleController extends BaseController{
	
	@Autowired
	private UserRoleService userRoleService;
	
	@RequestMapping(params = "treeQuery")
	public void treeQuery(HttpServletRequest request,
					  HttpServletResponse response,
					  Integer parentid) throws Exception {
		
		if(parentid == null){
			parentid = 0;
		}
		String userid = getCurrentUserId(request.getSession());
		List<TreeRole> datas = userRoleService.treeQuery(parentid, userid);
		
		writeResponseText(JSONArray.fromObject(datas).toString(), response);
	}
	
	@RequestMapping(params = "queryUserrole")
	public void queryUserrole(HttpServletRequest request,
					  HttpServletResponse response,
					  Integer parentid) throws Exception {
		
		List<UserRole> datas = userRoleService.queryUserrole(parentid);
		writeJSONArray(datas, request, response);
	}
	
	/**
	 * 查询单条记录，用于修改
	 * 
	 */
	@RequestMapping(params = "excutModifyQueryuserrole")
	public void excutModifyQueryuserrole(Integer id,HttpServletResponse response){
		try {
			
			if(id == null) throw new RuntimeException("id不能为空");
			
			UserRole role = userRoleService.findById(id);
			
			writeResponseText("{success:true,datas:"+JSONObject.fromObject(role).toString()+"}",response);
	   	} catch (Exception e) {
			e.printStackTrace();
	   		writeResponseText("{success:false,msg:'faild',errors:{"+e.getMessage()+"}}",response);
		}
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(params = "addUserrole")
	public void addUserrole(HttpServletRequest request,
					  HttpServletResponse response,
					  UserRole userRole) throws Exception {
		try {
			
			if(userRole.getParentid() == 0) throw new RuntimeException("父角色未成功设置");
			
			userRoleService.save(userRole);
			
			this.writeResponseText("{success:true,msg:'新增成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'新增失败'}", response);
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(params = "excuteModifyuserrole")
	public void excuteModifyuserrole(HttpServletRequest request,
					  HttpServletResponse response,
					  Integer id,String rolename,String roledesc,String loginip,String area,String isvalidataip,Integer parentid) throws Exception {
		
		try {
			
			if(id == null) throw new RuntimeException("没有找到的记录");

			UserRole userRole = userRoleService.get(UserRole.class, id);
		 	userRole.setArea(area);
		 	userRole.setIsvalidataip(isvalidataip);
		 	userRole.setLoginip(loginip);
		 	userRole.setRolename(rolename);
		 	userRole.setRoledesc(roledesc);
		 	userRole.setParentid(parentid);
		 	
		 	userRoleService.excuteModifyuserrole(userRole);
			
			this.writeResponseText("{success:true,msg:'修改成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'修改失败'}", response);
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(params = "excuteDeleteuserrole")
	public void excuteDeleteuserrole(HttpServletRequest request,
					  HttpServletResponse response,
					  String deleterecord) throws Exception {
		try {
			
			if(StringUtils.isEmpty(deleterecord)) throw new RuntimeException("没有找到要删除的记录");

			userRoleService.excuteDeleteuserrole(deleterecord);
			
			this.writeResponseText("{success:true,msg:'删除成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'删除失败'}", response);
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询新增或修改页面中父角色的下拉选择框数据
	 */
	@RequestMapping(params = "findParentidCombox")
	public void findParentidCombox(HttpServletRequest request,HttpServletResponse response){
		
		String roleId = getCurrentRoleId(request.getSession());
		if(StringUtils.isEmpty(roleId)) throw new RuntimeException("未找到role,当前session已失效？");
		
		writeJSONArray(userRoleService.findParentidCombox(roleId), request, response);
	}
	
	/**
	 * 新增用户或修改用户时选择所属角色时所用的下拉选择框数据
	 */
	@RequestMapping(params = "findSubRoleidCombox")
	public void findSubRoleidCombox(HttpServletRequest request,HttpServletResponse response){
		
		String roleId = getCurrentRoleId(request.getSession());
		if(StringUtils.isEmpty(roleId)) throw new RuntimeException("未找到role,当前session已失效？");
		
		writeJSONArray(userRoleService.findSubRoleidCombox(roleId), request, response);
	}
	
}
