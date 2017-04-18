package org.agent.action;

import java.util.List;

import org.agent.common.Constants;
import org.agent.pojo.SystemConfig;
import org.agent.service.systemconfig.SystemConfigService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class SystemConfigAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Logger logger = Logger.getLogger(SystemConfigAction.class);
	@Autowired
	private SystemConfigService systemConfigService;
	private SystemConfig systemConfig;
	private List<SystemConfig> systemConfigList;
	private List<SystemConfig> systemConfigListIsStart;
	private Integer configType;
	
	
	private void loadConfig(Integer configtype,String info){
		try {
			systemConfig = new SystemConfig();
			systemConfig.setConfigType(configtype);
			systemConfigList = systemConfigService.getSystomConfigs(systemConfig);
			systemConfigListIsStart = systemConfigService.getSystomConfigsIsStart(systemConfig);
			configType = configtype;
			if(systemConfigList != null && systemConfigList.size() == 1){
				systemConfig = systemConfigList.get(0);
			}
			this.setLog(this.getCurrentUser(), info);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String caiwuType(){
		loadConfig(1,"查看财务类型配置信息。");
		return SUCCESS;
	}
	public String serviceType(){
		loadConfig(2,"查看服务类型配置信息。");
		return SUCCESS;
	}
	public String serviceYears(){
		loadConfig(3,"查看服务年限类型配置信息。");
		return SUCCESS;
	}
	public String appUrl(){
		loadConfig(4,"查看APP URL类型配置信息。");
		return SUCCESS;
	}
	public String customType(){
		loadConfig(5,"查看客户类型配置信息。");
		return SUCCESS;
	}
	public String cardType(){
		loadConfig(6,"查看证件配置信息。");
		return SUCCESS;
	}
	public String youhuiType(){
		loadConfig(7,"查看优惠配置信息。");
		return SUCCESS;
	}
	
	public void isPeatConfig(){
		String result = "nopeat";
		if(null != systemConfig){
			logger.error("systemConfig.getConfigType() + systemConfig.getConfigTypeName() ***************************** " + systemConfig.getConfigType() + systemConfig.getConfigTypeName());
			try {
				if(systemConfigService.isPeatConfig(systemConfig) > 0)
					result = "peat";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}
	
	public void modifyConfig(){
		String result = "failed";
		if(null != systemConfig){
			try {
				logger.error("systemConfig.getConfigType() ***************************** " + systemConfig.getConfigType());
				systemConfigService.modifySystemConfig(systemConfig);
				systemConfigList = systemConfigService.getSystomConfigs(new SystemConfig());
				systemConfigListIsStart = systemConfigService.getSystomConfigsIsStart(new SystemConfig());
				Constants.systemConfigList = systemConfigListIsStart;
				Constants.configSystemData();
				result = "success";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		this.setLog(this.getCurrentUser(), "对系统配置信息["+systemConfig.getConfigTypeName()+"]进行修改操作，操作结果为："+result);
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}
	
	public void addConfig(){
		String result = "failed";
		if(null != systemConfig){
			try {
				int max  = 0;
				logger.error("systemConfig.getConfigType() ***************************** " + systemConfig.getConfigType());
				if(systemConfig.getConfigType() != 7){
					max = systemConfigService.maxTypeValueByType(systemConfig.getConfigType());
					systemConfig.setConfigTypeValue(max + 1);
				}
				systemConfigService.addSystemConfig(systemConfig);
				systemConfigList = systemConfigService.getSystomConfigs(new SystemConfig());
				systemConfigListIsStart = systemConfigService.getSystomConfigsIsStart(new SystemConfig());
				Constants.systemConfigList = systemConfigListIsStart;
				Constants.configSystemData();
				result = "success";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		this.setLog(this.getCurrentUser(), "对系统配置信息["+systemConfig.getConfigTypeName()+"]进行添加操作，操作结果为："+result);
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}
	
	public void deleteConfig(){
		String result = "failed";
		if(null != systemConfig){
			try {
				systemConfigService.deleteSystemConfig(systemConfig);
				systemConfigList = systemConfigService.getSystomConfigs(new SystemConfig());
				systemConfigListIsStart = systemConfigService.getSystomConfigsIsStart(new SystemConfig());
				Constants.systemConfigList = systemConfigListIsStart;
				Constants.configSystemData();
				result = "success";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		this.setLog(this.getCurrentUser(), "对系统配置信息["+systemConfig.getConfigTypeName()+"]进行删除操作，操作结果为："+result);
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}
	
	
	
	
	public List<SystemConfig> getSystemConfigListIsStart() {
		return systemConfigListIsStart;
	}

	public void setSystemConfigListIsStart(
			List<SystemConfig> systemConfigListIsStart) {
		this.systemConfigListIsStart = systemConfigListIsStart;
	}

	public List<SystemConfig> getSystemConfigList() {
		return systemConfigList;
	}
	public void setSystemConfigList(List<SystemConfig> systemConfigList) {
		this.systemConfigList = systemConfigList;
	}
	public SystemConfig getSystemConfig() {
		return systemConfig;
	}
	public void setSystemConfig(SystemConfig systemConfig) {
		this.systemConfig = systemConfig;
	}
	public Integer getConfigType() {
		return configType;
	}
	public void setConfigType(Integer configType) {
		this.configType = configType;
	}
	
}
