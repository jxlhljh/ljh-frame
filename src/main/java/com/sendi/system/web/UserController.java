package com.sendi.system.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.entity.SysPushConfig;
import com.sendi.system.entity.User;
import com.sendi.system.service.UserService;

@Controller
@RequestMapping("/userController")
public class UserController extends BaseController {

	@Autowired
	private UserService userService;

	/**
	 * 查询
	 */
	@RequestMapping(params = "queryUser")
	public void queryUser(HttpServletRequest request,
			HttpServletResponse response, String userId, String userName) {

		String currentUserId_TableKey = getCurrentUserId_TableKey(request
				.getSession());
		String currentRoleId = getCurrentRoleId(request.getSession());
		List<User> datas = userService.queryUser(userId, userName,
				currentUserId_TableKey, currentRoleId);
		writeJSONArray(datas, request, response);
	}

	/**
	 * 新增
	 */
	@RequestMapping(params = "addUser")
	public void addUser(HttpServletRequest request,
			HttpServletResponse response, User user) {

		try {
			// 先进行特殊处理一下，将部分参数值设置默认值
			user.setUsertype("1");// usertype写死成1

			if (StringUtils.isEmpty(user.getIstip())) {
				user.setIstip("off");
			}

			String currentTime = DateFormatUtils.format(new Date(),
					"yyyy-MM-dd HH:mm");
			user.setCreatedate(currentTime);
			user.setPwddate(currentTime);
			user.setIsactive("on");

			// 执行插入操作
			userService.addUser(user);

			this.writeResponseText("{success:true,msg:'新增成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'新增失败'}", response);
			e.printStackTrace();
		}

	}
	
	/**
	 * 查询单条记录，用于修改
	 * 
	 */
	@RequestMapping(params = "excutModifyQueryuser")
	public void excutModifyQueryuser(Integer id,HttpServletResponse response){
		try {
			
			User user = userService.findById(id);
			
			writeResponseText("{success:true,datas:"+JSONObject.fromObject(user).toString()+"}",response);
	   	} catch (Exception e) {
			e.printStackTrace();
	   		writeResponseText("{success:false,msg:'faild',errors:{"+e.getMessage()+"}}",response);
		}
	}

	/**
	 * 修改
	 */
	@RequestMapping(params = "excuteModifyuser")
	public void excuteModifyuser(HttpServletRequest request,
			HttpServletResponse response, Integer id, String istip,
			String userId, Integer pwdvalicity, String userName, String ip,
			String is_share, Integer max_connect,String password,Integer maxlogincount) {

		try {

			User user = userService.findById(id);
			if (user == null)
				throw new RuntimeException("用户未找到，修改失败");

			user.setIstip(istip == null ? "off" : istip);
			user.setUserId(userId);
			user.setPwdvalicity(pwdvalicity);
			user.setUserName(userName);
			user.setIp(ip);
			user.setIs_share(is_share);
			user.setMax_connect(max_connect);
			if (!user.getPassword().equals(password)) // 如果原密码跟现有的密码一样，则不修改日期
			{
				user.setPassword(password);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String current = sdf.format(new Date());
				user.setPwddate(current);
			}
			user.setMaxlogincount(maxlogincount);

			userService.excuteModifyuser(user);

			this.writeResponseText("{success:true,msg:'修改成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'修改失败'}", response);
			e.printStackTrace();
		}
	}

	/**
	 * 删除
	 */
	@RequestMapping(params = "excuteDeleteuser")
	public void excuteDeleteuser(HttpServletRequest request,
			HttpServletResponse response,String deleterecord) {
		try {

			userService.excuteDeleteuser(deleterecord);
			
			this.writeResponseText("{success:true,msg:'删除成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'删除失败'}", response);
			e.printStackTrace();
		}
	}

	/**
	 * 激活或禁用
	 */
	@RequestMapping(params = "excuteChangestatus")
	public void excuteChangestatus(HttpServletRequest request,
			HttpServletResponse response, String activestatus,String deleterecord) {
		try {

			userService.excuteChangestatus(activestatus, deleterecord);
			
			this.writeResponseText("{success:true,msg:'操作成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}

	/**
	 * 修改密码
	 * 
	 * @param request
	 * @param response
	 * @param description
	 * @param password
	 * @param pwdvalicity
	 */
	@RequestMapping(params = "excuteModifyUserPassword")
	public void excuteModifyUserPassword(HttpServletRequest request,
			HttpServletResponse response, String description, String userName,// 这里的userName表示旧密码
			String password, Integer pwdvalicity) {
		try {
			String userId = getCurrentUserId(request.getSession());
			userService.excuteModifyUserPassword(userId, userName, password,
					pwdvalicity);
			this.writeResponseText("{success:true,msg:'修改密码成功!'}", response);
		} catch (Exception e) {
			this.writeResponseText(
					"{success:false,msg:'修改密码失败！" + e.getMessage() + "'}",
					response);
			e.printStackTrace();
		}

	}

}
