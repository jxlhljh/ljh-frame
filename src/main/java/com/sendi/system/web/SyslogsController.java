package com.sendi.system.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sendi.system.bean.Page;
import com.sendi.system.service.SyslogsService;

@Controller
@RequestMapping("/syslogsController")
public class SyslogsController extends BaseController {

	@Autowired
	private SyslogsService syslogsService;

	// 日志查询
	@RequestMapping(params = "querySyslog")
	public void querySyslog(HttpServletRequest request,
			HttpServletResponse response, String loguser, String logname,
			String logterminal, String logcontent, Integer start, Integer limit) {
		Page page = syslogsService.querySyslog(loguser, logname, logterminal,
				logcontent, start / limit + 1, limit);
		writeResponseText(page.formToJson(), response);
	}
	
	//日志删除
	@RequestMapping(params = "excuteDeleteSyslogs")
	public void excuteDeleteSyslogs(HttpServletRequest request,
			HttpServletResponse response,String deleterecord){
		try {

			syslogsService.excuteDeleteSyslogs(deleterecord);

			this.writeResponseText("{success:true,msg:'操作成功'}", response);
		} catch (Exception e) {
			this.writeResponseText("{success:false,msg:'操作失败'}", response);
			e.printStackTrace();
		}
	}
}
