package com.sendi.system.constants;

import com.sendi.system.util.ResourceUtils;

/**
 * 系统中全局常量名称
 * @author liujinghua
 * @DATE 2014-05-15 早上11:30
 */
public class Globals {

	public static final String sendi_sys_module_tree = "sendi_sys_module_tree";//模块树信息
	public static final String sendi_sys_moudlePower_info = "sendi_sys_moudlePower_info";//系统级别的用户权限信息session名称，其实就是sysPower表的内存数据
	public static final String SysActionLogConf="PreLoadActionLogConf";
	public static final String Syssendi_system_title="sendi_system_title";
	public static final String Syssendi_sys_config_para="sendi_sys_config_para";
	public static final String Syssendi_sys_module_tree="sendi_sys_module_tree";
	public static final String Syssendi_sys_user_info="sendi_sys_user_info";
	public static final String Syssendi_sys_userRoleRelation_info="sendi_sys_userRoleRelation_info";
	public static final String Syssendi_sys_moudlePower_info="sendi_sys_moudlePower_info";
	public static final String Syssendi_sys_moudleid2roleid_info="sendi_sys_moudleid2roleid_info";
	public static final String Syssendi_sys_hostPower_info="sendi_sys_hostPower_info";
	public static final String Syssendi_sys_hosttree_info="sendi_sys_hosttree_info";
	public static final String Syssendi_sys_host_tree="sendi_sys_host_tree";
	public static final String Syssendi_sys_dpttree_info="sendi_sys_dpttree_info";
	public static final String Syssendi_sys_deptment_tree="sendi_sys_deptment_tree";
	public static final String Syssendi_sys_proload_info="sendi_sys_proload_info";
	public static final String Syssendi_sys_host_address_ip="sendi_sys_host_address_ip";
	public static final String Syssendi_sys_host_name_hostname="sendi_sys_host_name_hostname";
	public static final String SysRoleOperations = "sys_role_operations";
	public static final String UserZonePowerInfos = "user_zone_power_infos";
	public static final String Scheduler = "scheduler";
	
	public static final String EhCacheName = "dictCache";//缓存的名称
	public static final String SuperAdmin = "admin";//超级管理员登录ID
	public static final String SuperRoleID = "1";//超级管理员角色ID
	public static final String TreeRootName = "广东省";//设备树根结点名称
	public static final String userSystemPower = "userSystemPower";//登录用户权限信息session名称
	public static final String UserZonePowerSessionName = "userZonePower";//用户区域权限名称
	public static final String TreeRootId = "-1";//设备树根结点ID
	public static final String LeafLevel = "2";//区域管理中哪一层为叶子结点
	public static final String Port = ResourceUtils.getConfigByName("tomcat_port");//全局应用端口变量
	
	//保存session中
	public static final String SesloginInfo="loginInfo";
	public static final String Sesusername="username";
	public static final String Sesuserid="userid";
	
}
