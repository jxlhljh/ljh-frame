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
import com.sendi.system.entity.UserZone;
import com.sendi.system.service.UserRoleService;
import com.sendi.system.service.UserZoneService;

@Controller
@RequestMapping("/userZoneController")
public class UserZoneController extends BaseController{
	
	@Autowired
	private UserZoneService userZoneService;
	
	/**
	 * 下拉树的子节点查询
	 */
	@RequestMapping(params = "listUserZoneTree")
	public void listUserZoneTree(HttpServletRequest request,
					  HttpServletResponse response,
					  Integer zonecode) throws Exception {
		if(zonecode == null){//zonecode即为点击展开的区域父节点
			zonecode = -1;
		}
		String jsonString = userZoneService.listUserZoneTree(request,response,zonecode);
		writeResponseText(jsonString, response);
	}

	/**
	 * Grid_store查询
	 */
	@RequestMapping(params = "queryUserZone")
	public void queryUserZone(HttpServletRequest request,
						HttpServletResponse response,
						String parentcode,
						String zonename) throws Exception {
		if(parentcode == null){
			parentcode = "-1";
		}
		List<UserZone> datas = userZoneService.queryUserZone(parentcode,zonename);
		writeJSONArray(datas, request, response);
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(params = "addUserZone")
	public void addUserrole(HttpServletRequest request,HttpServletResponse response,UserZone userZone) throws Exception {
		try {
			String msg = userZoneService.addUserZone(userZone);
			if(StringUtils.isEmpty(msg))
				this.writeResponseText("{success:true,msg:'新增成功'}", response);
			else
				this.writeResponseText("{success:false,msg:'"+ msg +"'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'程序错误'}", response);
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(params = "updateUserZone")
	public void updateUserZone(HttpServletRequest request,HttpServletResponse response,UserZone userZone) throws Exception {
		try {
			if(userZone.getId() == null) 
				throw new RuntimeException("没有找到的记录");
			String msg = userZoneService.updateUserZone(userZone);
			if(msg.length()==0)
				this.writeResponseText("{success:true,msg:'新增成功'}", response);
			else
				this.writeResponseText("{success:false,msg:'"+ msg +"'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(params = "deleteUserZone")
	public void deleteUserZone(HttpServletRequest request,HttpServletResponse response,String id) throws Exception {
		try {
			if(StringUtils.isEmpty(id)) 
				throw new RuntimeException("没有找到要删除的记录");
			String msg = userZoneService.deleteUserZone(id);
			if(StringUtils.isEmpty(msg))
				super.writeResponseText("{success:true,msg:'新增成功'}", response);
			else
				super.writeResponseText("{success:false,msg:'"+ msg +"'}", response);
		} catch (Exception e) {
			super.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询新增或修改页面中父角色的下拉选择框数据
	 */
	@RequestMapping(params = "listUserZoneTree4combo")
	public void listUserZoneTree4combo(HttpServletRequest request,HttpServletResponse response,String comboTreeid){
		String jsonString = userZoneService.listUserZoneTree4combo(comboTreeid);
		super.writeResponseText(jsonString, response);
	}
	
	/**
	 * 查询角色的区域权限框数据
	 */
	@RequestMapping(params = "generateRoleZonePowerTree")
	public void generateRoleZonePowerTree(HttpServletRequest request,HttpServletResponse response,
			String zonelevel,String useroleid, String zonecode){
		try {
			String jsonString = userZoneService.generateRoleZonePowerTree(zonelevel,useroleid,zonecode);
			super.writeResponseText(jsonString, response);
		}catch (Exception e) {
			super.writeResponseText("{success:false,msg:'程序错误'}", response);
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改角色的区域权限框数据
	 */
	@RequestMapping(params = "saveUserZonePower")
	public void saveUserZonePower(HttpServletRequest request,HttpServletResponse response,
			String powerstring,final String useroleid){
		try {
			String jsonString = userZoneService.saveUserZonePower(powerstring,useroleid);
			super.writeResponseText(jsonString, response);
		}catch (Exception e) {
			super.writeResponseText("{success:false,msg:'程序错误'}", response);
			e.printStackTrace();
		}
	}
	
}
