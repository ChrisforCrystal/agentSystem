package org.agent.pojo;

public class SystemConfig extends Base {

	/*
	 * CREATE TABLE `as_systemconfig` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `configType` int(11) NOT NULL,
  `configTypeName` varchar(20) NOT NULL,
  `configTypeValue` int(11) NOT NULL,
  `configValue` varchar(20) DEFAULT NULL,
  `isStart` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
	 */
	
	private Integer configType;
	private String configTypeName;
	private Integer configTypeValue;
	private String configValue;
	private Integer isStart;
	public Integer getConfigType() {
		return configType;
	}
	public void setConfigType(Integer configType) {
		this.configType = configType;
	}
	public String getConfigTypeName() {
		return configTypeName;
	}
	public void setConfigTypeName(String configTypeName) {
		this.configTypeName = configTypeName;
	}
	public Integer getConfigTypeValue() {
		return configTypeValue;
	}
	public void setConfigTypeValue(Integer configTypeValue) {
		this.configTypeValue = configTypeValue;
	}
	public String getConfigValue() {
		return configValue;
	}
	public void setConfigValue(String configValue) {
		this.configValue = configValue;
	}
	public Integer getIsStart() {
		return isStart;
	}
	public void setIsStart(Integer isStart) {
		this.isStart = isStart;
	}
	
	
	
	
}
