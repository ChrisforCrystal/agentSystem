package org.agent.pojo;

import java.util.Date;

public class Logs extends Base {

	/*
	 * CREATE TABLE `as_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `userName` varchar(60) NOT NULL,
  `operateInfo` varchar(255) NOT NULL,
  `operateDatetime` datetime NOT NULL DEFAULT '2012-01-01 00:01:01',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 */
	private Integer userId;
	private String userName;
	private String operateInfo;
	private Date operateDatetime;
	private String odt;

	
	public String getOdt() {
		return odt;
	}
	public void setOdt(String odt) {
		this.odt = odt;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getOperateInfo() {
		return operateInfo;
	}
	public void setOperateInfo(String operateInfo) {
		this.operateInfo = operateInfo;
	}
	public Date getOperateDatetime() {
		return operateDatetime;
	}
	public void setOperateDatetime(Date operateDatetime) {
		this.operateDatetime = operateDatetime;
	}
	
	
}
