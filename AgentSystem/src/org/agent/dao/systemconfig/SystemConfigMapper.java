package org.agent.dao.systemconfig;

import java.util.List;

import org.agent.pojo.SystemConfig;
import org.apache.ibatis.annotations.Param;


public interface SystemConfigMapper {

	/**
	 * getSystomConfigs
	 * @return SystemConfig
	 */
	public List<SystemConfig> getSystomConfigs(SystemConfig systemConfig) throws Exception;
	/**
	 * getSystomConfigsIsStart
	 * @return SystemConfig
	 */
	public List<SystemConfig> getSystomConfigsIsStart(SystemConfig systemConfig) throws Exception;
	/**
	 * addSystemConfig
	 * @param systemConfig
	 * @return int
	 */
	public int addSystemConfig(SystemConfig systemConfig) throws Exception;
	/**
	 * modifySystemConfig
	 * @param systemConfig
	 * @return int
	 */
	public int modifySystemConfig(SystemConfig systemConfig) throws Exception;
	/**
	 * isPeatConfig
	 * @param systemConfig
	 * @return int
	 */
	public int isPeatConfig(SystemConfig systemConfig) throws Exception;
	/**
	 * deleteSystemConfig
	 * @param systemConfig
	 * @return
	 */
	public int deleteSystemConfig(SystemConfig systemConfig) throws Exception;
	/**
	 * maxTypeValueByType
	 * @param type
	 * @return
	 */
	public int maxTypeValueByType(@Param("type") int type) throws Exception;
}
