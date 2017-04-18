package org.agent.pojo;

import java.util.Date;

public class Premission extends Base {

	/*
	 * CREATE TABLE `as_role_premission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `roleId` bigint(20) NOT NULL COMMENT '��ɫID',
  `functionId` bigint(20) NOT NULL COMMENT '����ID',
  `creationTime` datetime NOT NULL COMMENT '����ʱ��',
  `createdBy` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '������',
  `lastUpdateTime` datetime DEFAULT '2013-01-01 00:00:01' COMMENT '����޸�ʱ��',
  `isStart` int(11) DEFAULT '1' COMMENT '1Ϊ����0Ϊ������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

	 */
	private Integer roleId;
	private Integer functionId;
	private Date creationTime;
	private String createdBy;
	private Date lastUpdateTime;
	private Integer isStart;
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getFunctionId() {
		return functionId;
	}
	public void setFunctionId(Integer functionId) {
		this.functionId = functionId;
	}
	public Date getCreationTime() {
		return creationTime;
	}
	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}
	
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	public Integer getIsStart() {
		return isStart;
	}
	public void setIsStart(Integer isStart) {
		this.isStart = isStart;
	}
	
}
