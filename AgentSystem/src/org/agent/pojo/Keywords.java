package org.agent.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Keywords extends Base {

	/*
	 * CREATE TABLE `as_keywords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL,
  `agentId` bigint(20) NOT NULL,
  `agentName` varchar(255) NOT NULL,
  `customId` bigint(20) NOT NULL,
  `customName` varchar(255) NOT NULL,
  `preRegFrozenMoney` decimal(10,0) NOT NULL DEFAULT '0',
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `productType` int(11) DEFAULT '0',
  `serviceYears` int(11) DEFAULT '0',
  `openApp` int(11) DEFAULT '0' COMMENT '0δ��ͨ 1 ��ͨ',
  `appUserName` varchar(64) DEFAULT NULL,
  `appPassword` varchar(70) DEFAULT NULL,
  `loginUrl` varchar(255) DEFAULT NULL,
  `iosDownloadUrl` varchar(255) DEFAULT NULL,
  `androidDownloadUrl` varchar(255) DEFAULT NULL,
  `bCodeIosUrl` varchar(255) DEFAULT NULL,
  `bCodeAndroidUrl` varchar(255) DEFAULT NULL,
  `preRegDatetime` datetime DEFAULT '2012-01-01 00:01:01',
  `preRegPassDatetime` datetime DEFAULT '2012-01-01 00:01:01',
  `regDatetime` datetime DEFAULT '2012-01-01 00:01:01',
  `regPassDatetime` datetime DEFAULT '2012-01-01 00:01:01',
  `isPass` int(11) DEFAULT '0' COMMENT '0Ϊ�����ڣ�1ΪԤע����ڣ�2Ϊ��ʽע�����',
  `checkStatus` int(11) DEFAULT '0' COMMENT '0Ϊ������ 1Ϊ����� 2Ϊ��ͨ�� 3δͨ��',
  `isUse` int(11) DEFAULT '0' COMMENT '1Ϊ��ʹ�� 0Ϊδʹ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 */
	
	private String keywords;
	private Integer agentId;
	private String agentName;
	private Integer customId;
	private String customName;
	private BigDecimal preRegFrozenMoney;
	private BigDecimal price;
	private Integer productType;
	private Integer serviceYears;
	private Integer openApp;
	private String appUserName;
	private String appPassword;
	private String loginUrl;
	private String iosDownloadUrl;
	private String androidDownloadUrl;
	private String codeIosUrl;
	private String codeAndroidUrl;
	private Date preRegDatetime;
	private Date preRegPassDatetime;
	private Date regDatetime;
	private Date regPassDatetime;
	private Integer isPass;
	private Integer checkStatus;
	private Integer isUse;
	private String bossName;
	private String customTypeName;
	
	public String getCustomTypeName() {
		return customTypeName;
	}
	public void setCustomTypeName(String customTypeName) {
		this.customTypeName = customTypeName;
	}
	public String getBossName() {
		return bossName;
	}
	public void setBossName(String bossName) {
		this.bossName = bossName;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public Integer getAgentId() {
		return agentId;
	}
	public void setAgentId(Integer agentId) {
		this.agentId = agentId;
	}
	public String getAgentName() {
		return agentName;
	}
	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}
	public Integer getCustomId() {
		return customId;
	}
	public void setCustomId(Integer customId) {
		this.customId = customId;
	}
	public String getCustomName() {
		return customName;
	}
	public void setCustomName(String customName) {
		this.customName = customName;
	}
	public BigDecimal getPreRegFrozenMoney() {
		return preRegFrozenMoney;
	}
	public void setPreRegFrozenMoney(BigDecimal preRegFrozenMoney) {
		this.preRegFrozenMoney = preRegFrozenMoney;
	}
	
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Integer getProductType() {
		return productType;
	}
	public void setProductType(Integer productType) {
		this.productType = productType;
	}
	public Integer getServiceYears() {
		return serviceYears;
	}
	public void setServiceYears(Integer serviceYears) {
		this.serviceYears = serviceYears;
	}
	public Integer getOpenApp() {
		return openApp;
	}
	public void setOpenApp(Integer openApp) {
		this.openApp = openApp;
	}
	public String getAppUserName() {
		return appUserName;
	}
	public void setAppUserName(String appUserName) {
		this.appUserName = appUserName;
	}
	public String getAppPassword() {
		return appPassword;
	}
	public void setAppPassword(String appPassword) {
		this.appPassword = appPassword;
	}
	public String getLoginUrl() {
		return loginUrl;
	}
	public void setLoginUrl(String loginUrl) {
		this.loginUrl = loginUrl;
	}
	public String getIosDownloadUrl() {
		return iosDownloadUrl;
	}
	public void setIosDownloadUrl(String iosDownloadUrl) {
		this.iosDownloadUrl = iosDownloadUrl;
	}
	public String getAndroidDownloadUrl() {
		return androidDownloadUrl;
	}
	public void setAndroidDownloadUrl(String androidDownloadUrl) {
		this.androidDownloadUrl = androidDownloadUrl;
	}
	public Date getPreRegDatetime() {
		return preRegDatetime;
	}
	public void setPreRegDatetime(Date preRegDatetime) {
		this.preRegDatetime = preRegDatetime;
	}
	public Date getPreRegPassDatetime() {
		return preRegPassDatetime;
	}
	public void setPreRegPassDatetime(Date preRegPassDatetime) {
		this.preRegPassDatetime = preRegPassDatetime;
	}
	public Date getRegDatetime() {
		return regDatetime;
	}
	public void setRegDatetime(Date regDatetime) {
		this.regDatetime = regDatetime;
	}
	public Date getRegPassDatetime() {
		return regPassDatetime;
	}
	public void setRegPassDatetime(Date regPassDatetime) {
		this.regPassDatetime = regPassDatetime;
	}
	public Integer getIsPass() {
		return isPass;
	}
	public void setIsPass(Integer isPass) {
		this.isPass = isPass;
	}
	public Integer getCheckStatus() {
		return checkStatus;
	}
	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}
	public Integer getIsUse() {
		return isUse;
	}
	public void setIsUse(Integer isUse) {
		this.isUse = isUse;
	}
	public String getCodeIosUrl() {
		return codeIosUrl;
	}
	public void setCodeIosUrl(String codeIosUrl) {
		this.codeIosUrl = codeIosUrl;
	}
	public String getCodeAndroidUrl() {
		return codeAndroidUrl;
	}
	public void setCodeAndroidUrl(String codeAndroidUrl) {
		this.codeAndroidUrl = codeAndroidUrl;
	}
	
	
}
