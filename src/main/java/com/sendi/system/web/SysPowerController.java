package com.sendi.system.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.entity.UserRole;
import com.sendi.system.service.SysPowerService;
import com.sendi.system.service.UserRoleService;

@Controller
@RequestMapping("/sysPowerController")
public class SysPowerController extends BaseController{
	
	@Autowired
	private SysPowerService sysPowerService;
	
	@Autowired
	private UserRoleService userRoleService;

	//关联模块功能，打开页面的数据获取
	@RequestMapping(params = "generateSysPowerTree")
	public void generateSysPowerTree(HttpServletRequest request,
			HttpServletResponse response,
			String Treeid,String useroleid) throws Exception {
		
		if(StringUtils.isEmpty(Treeid)) throw new RuntimeException("Treeid不能为空");
		
		if(StringUtils.isEmpty(useroleid)) throw new RuntimeException("useroleid不能为空");
		
		UserRole userRole = userRoleService.findById(Integer.parseInt(useroleid));
		String parentRoleId = String.valueOf(userRole.getParentid());
		
		String jsons = sysPowerService.generateSysPowerTree(Treeid, useroleid,parentRoleId);
		writeResponseText(jsons,response);
	}
	
	//关联模块权限保存
	@RequestMapping(params = "saveSyspower")
	public void saveSyspower(HttpServletRequest request,
			HttpServletResponse response,Integer useroleid,String powerstring){
		
		try {

			if(useroleid == null) throw new RuntimeException("useroleid不能为空");
			
			if(StringUtils.isEmpty(powerstring)) throw new RuntimeException("powerstring不能为空");
			
			sysPowerService.saveSyspower(useroleid, powerstring);

			this.writeResponseText("{success:true,msg:'操作成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
		
	}
}
