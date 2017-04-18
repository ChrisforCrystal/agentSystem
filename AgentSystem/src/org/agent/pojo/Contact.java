package org.agent.pojo;

public class Contact extends Base {

	/*
	 * CREATE TABLE `as_contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customId` bigint(20) NOT NULL,
  `contactName` varchar(20) DEFAULT NULL,
  `contactTel` varchar(20) DEFAULT NULL,
  `contactFax` varchar(20) DEFAULT NULL,
  `contactEmail` varchar(20) DEFAULT NULL,
  `contactRole` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	 */
	private Integer customId;
	private String contactName;
	private String contactTel;
	private String contactFax;
	private String contactEmail;
	private String contactRole;
	public Integer getCustomId() {
		return customId;
	}
	public void setCustomId(Integer customId) {
		this.customId = customId;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactTel() {
		return contactTel;
	}
	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}
	public String getContactFax() {
		return contactFax;
	}
	public void setContactFax(String contactFax) {
		this.contactFax = contactFax;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getContactRole() {
		return contactRole;
	}
	public void setContactRole(String contactRole) {
		this.contactRole = contactRole;
	}
	
}
