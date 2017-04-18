package org.agent.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.agent.pojo.RoleFunctions;
import org.agent.pojo.SystemConfig;
import org.springframework.context.ApplicationContext;

public class Constants {
	public static ApplicationContext cxt;
	public static final String SESSION_USER="userSession";
	
	public static final Long DAYS_5 = 5*24*60*60*1000L;
	
	
	
	/***************用户操作信息-开始*****************/
	public static String OPERATE_INFO_USER_LOGIN_SUCCESS = "用户进行登录操作成功";
	public static String OPERATE_INFO_USER_LOGIN_FAILD = "用户进行登录操作失败";
	public static String OPERATE_INFO_USER_LOGOUT_SUCCESS = "用户注销账号操作成功";
	public static String OPERATE_INFO_USER_MODIFY_PASSWORD = "用户进行修改密码操作";
	public static String OPERATE_INFO_USER_ACCESS_ACCOUNTDETAIL = "用户进行账户明细查询";
	public static String OPERATE_INFO_USER_lIST_SEARCH = "用户进行代理商用户查询";
	public static String OPERATE_INFO_USER_LOGLIST_SEARCH = "用户进行操作日志查询";
	
	
	/***************用户操作信息-结束*****************/
	
	public static HashMap<Integer, ArrayList<RoleFunctions>> MENU = new HashMap<Integer, ArrayList<RoleFunctions>>();
	
	
	public static List<SystemConfig> systemConfigList;
	//账务类型列表 1
	public static List<SystemConfig> accountConfigList = new ArrayList<SystemConfig>();
	//服务类型  2 上传苹果商店
	public static List<SystemConfig> serviceConfigList = new ArrayList<SystemConfig>();
	//服务年限 3 最大的服务年限
	public static SystemConfig maxServiceYearsConfig;
	//app 制作URL  4
	public static SystemConfig appMakeUrlConfig;
	//客户类型 5
	public static List<SystemConfig> customTypeConfigList = new ArrayList<SystemConfig>();
	//证件类型 6
	public static List<SystemConfig> cardTypeConfigList = new ArrayList<SystemConfig>();
	//优惠类型 7
	public static List<SystemConfig> youhuiTypeConfigList = new ArrayList<SystemConfig>();
	//
	public static void configSystemData(){
		
		accountConfigList.clear();
		accountConfigList = null;
		accountConfigList = new ArrayList<SystemConfig>();
		
		serviceConfigList.clear();
		serviceConfigList = null;
		serviceConfigList = new ArrayList<SystemConfig>();
		
		maxServiceYearsConfig = null;
		maxServiceYearsConfig = new SystemConfig();
		
		appMakeUrlConfig = null;
		appMakeUrlConfig = new SystemConfig();
		
		customTypeConfigList.clear();
		customTypeConfigList = null;
		customTypeConfigList = new ArrayList<SystemConfig>();
		
		cardTypeConfigList.clear();
		cardTypeConfigList = null;
		cardTypeConfigList = new ArrayList<SystemConfig>();
		
		youhuiTypeConfigList.clear();
		youhuiTypeConfigList = null;
		youhuiTypeConfigList = new ArrayList<SystemConfig>();
		
		for(SystemConfig sc : systemConfigList){
			switch(sc.getConfigType()){
			case 1:
				accountConfigList.add(sc);
				break;
			case 2:
				serviceConfigList.add(sc);
				break;
			case 3:
				maxServiceYearsConfig = sc;
				break;
			case 4:
				appMakeUrlConfig = sc;
				break;
			case 5:
				customTypeConfigList.add(sc);
				break;
			case 6:
				cardTypeConfigList.add(sc);
				break;
			case 7:
				youhuiTypeConfigList.add(sc);
				break;
			
			}
		}
	}
}
