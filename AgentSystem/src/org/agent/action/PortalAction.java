package org.agent.action;

import java.util.List;

import org.agent.common.PageSupport;
import org.agent.common.SQLTools;
import org.agent.pojo.Contact;
import org.agent.pojo.Custom;
import org.agent.pojo.Keywords;
import org.agent.service.contact.ContactService;
import org.agent.service.custom.CustomService;
import org.agent.service.keywords.KeywordsService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;


public class PortalAction extends BaseAction{
	
	private static final long serialVersionUID = -1923591558534741137L;
	private Logger logger = Logger.getLogger(PortalAction.class);
	private Keywords keywords;
	private List<Keywords> keywordsList;
	@Autowired
	private KeywordsService keywordsService;
	private Custom custom;
	private Contact contact;
	@Autowired
	private CustomService customService;
	@Autowired
	private ContactService contactService;
	private List<Contact> contactList;
	private String kword;
	private String cname;
	
	
	public String getKword() {
		return kword;
	}

	public void setKword(String kword) {
		this.kword = kword;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public List<Contact> getContactList() {
		return contactList;
	}

	public void setContactList(List<Contact> contactList) {
		this.contactList = contactList;
	}

	public Custom getCustom() {
		return custom;
	}

	public void setCustom(Custom custom) {
		this.custom = custom;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public Keywords getKeywords() {
		return keywords;
	}

	public void setKeywords(Keywords keywords) {
		this.keywords = keywords;
	}

	public List<Keywords> getKeywordsList() {
		return keywordsList;
	}

	public void setKeywordsList(List<Keywords> keywordsList) {
		this.keywordsList = keywordsList;
	}

	public String myPortalManage(){
		logger.error("cname-hanlu-----> " + cname);
		logger.error("kword-hanlu-----> " + kword);
		if(null == keywords){
			keywords = new Keywords();
		}
		keywords.setAgentId(this.getCurrentUser().getId());
		if(null != cname)
			keywords.setCustomName("%"+SQLTools.transfer(cname)+"%");
		if(null != kword)
			keywords.setKeywords("%"+SQLTools.transfer(kword)+"%");
		if(this.getPage() == null){
			this.setPage(new PageSupport());
			this.setLog(this.getCurrentUser(), "用户进行门户管理功能的搜索操作");
		}
		try {
			this.getPage().setTotalCount(keywordsService.portalcount(keywords));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			this.getPage().setTotalCount(0);
		}
		
		logger.error("myPortalManage ********* "+this.getPage().getTotalCount());
		
		if(this.getPage().getTotalCount() > 0){
			if(this.getPage().getPage() <= 0 )
				this.getPage().setPage(1);
			if(this.getPage().getPage() > this.getPage().getPageCount())
				this.getPage().setPage(this.getPage().getPageCount());
			keywords.setStarNum((this.getPage().getPage() - 1) * this.getPage().getPageSize());
			keywords.setPageSize(this.getPage().getPageSize());
			try {
				keywordsList = keywordsService.getPortalBySearch(keywords);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				keywordsList = null;
				if(this.getPage() == null){
					this.setPage(new PageSupport());
					this.getPage().setItems(null);
				}
			}
			this.getPage().setItems(keywordsList);
		}else{
			this.getPage().setItems(null);
		}
		return SUCCESS;
	}
	
	public String getPortalInfoById(){
		if(custom == null) custom = new Custom();
		custom.setId(keywords.getCustomId());
		if(contact == null) contact = new Contact();
		try {
			keywords = keywordsService.getKeywordsById(keywords);
			logger.error("--------------------------->"+keywords.getCodeAndroidUrl());
			logger.error("--------------------------->"+keywords.getCodeIosUrl());
			custom = customService.getCustomById(custom);
			contact.setCustomId(custom.getId());
			contactList = contactService.getContactList(contact);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String modifyPortal(){
		try {
			keywordsService.modifyKeywords(keywords);
			this.setLog(this.getCurrentUser(), "用户进行关键词为："+keywords.getKeywords()+"的门户信息修改");
			myPortalManage();
			return SUCCESS;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return INPUT;
	}
}
