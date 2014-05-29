package com.sendi.system.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.bean.Page;
import com.sendi.system.bean.Userlog;
import com.sendi.system.service.UserLogService;

/**
 * 用户日志管理控制器
 * @author liujinghua
 * 日期:2014-05-18 中午 12：02 
 *
 */
@Controller
@RequestMapping("/userLogController")
public class UserLogController extends BaseController {
	
	@Autowired
	private UserLogService userLogService;
	
	@RequestMapping(params = "query")
	public void query(HttpServletRequest request,
					  HttpServletResponse response,
					  String loguser,
					  String check_time,
					  String check_end,
					  Integer start,
					  Integer limit) throws Exception {
		
		Page<Userlog> page = userLogService.query(loguser, check_time, check_end,start,limit);
		
		writeResponseText(page.formToJson(), response);
	}

}
