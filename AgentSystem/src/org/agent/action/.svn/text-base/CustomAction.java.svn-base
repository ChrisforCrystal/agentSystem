package org.agent.action;

import java.util.List;

import net.sf.json.JSONArray;

import org.agent.common.Constants;
import org.agent.common.PageSupport;
import org.agent.common.SQLTools;
import org.agent.pojo.Area;
import org.agent.pojo.City;
import org.agent.pojo.Contact;
import org.agent.pojo.Custom;
import org.agent.pojo.Province;
import org.agent.pojo.SystemConfig;
import org.agent.service.contact.ContactService;
import org.agent.service.custom.CustomService;
import org.agent.service.provinceandcity.ProvinceAndCitysService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class CustomAction extends BaseAction{
	
	private static final long serialVersionUID = 8428189143275550607L;
	
	private Logger logger = Logger.getLogger(CustomAction.class);
	private Custom custom;
	private List<Custom> customList;
	@Autowired
	private CustomService customService;
	private String cname;
	private List<SystemConfig> customTypeList = Constants.customTypeConfigList;
	private List<SystemConfig> cardTypeList = Constants.cardTypeConfigList;
	private List<Province> provinceList;
	private List<City> cityList;
	private City city;
	private Province province;
	private Area area;
	private List<Area> areaList;
	@Autowired
	private ProvinceAndCitysService provinceAndCitysService;
	private List<Contact> contactList;
	private Contact contact;
	@Autowired
	private ContactService contactService;
		

	public List<Contact> getContactList() {
		return contactList;
	}

	public void setContactList(List<Contact> contactList) {
		this.contactList = contactList;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public List<Area> getAreaList() {
		City c = new City();
		c.setCityID(custom.getCity());
		if(null != c){
			try {
				areaList = provinceAndCitysService.getAreas(c);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return areaList;
	}

	public void setAreaList(List<Area> areaList) {
		this.areaList = areaList;
	}

	public List<City> getCityList() {
		Province p = new Province();
		p.setProvinceID(custom.getProvince());
		if(null != p){
			try {
				cityList = provinceAndCitysService.getCitys(p);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cityList;
	}

	public void setCityList(List<City> cityList) {
		this.cityList = cityList;
	}

	public List<Province> getProvinceList() {
		try {
			provinceList = provinceAndCitysService.getProvinceList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return provinceList;
	}

	public void setProvinceList(List<Province> provinceList) {
		this.provinceList = provinceList;
	}

	

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public List<SystemConfig> getCardTypeList() {
		return cardTypeList;
	}

	public void setCardTypeList(List<SystemConfig> cardTypeList) {
		this.cardTypeList = cardTypeList;
	}

	public List<SystemConfig> getCustomTypeList() {
		return customTypeList;
	}

	public void setCustomTypeList(List<SystemConfig> customTypeList) {
		this.customTypeList = customTypeList;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Custom getCustom() {
		return custom;
	}

	public void setCustom(Custom custom) {
		this.custom = custom;
	}

	public List<Custom> getCustomList() {
		return customList;
	}

	public void setCustomList(List<Custom> customList) {
		this.customList = customList;
	}
	
	public String customList(){
		logger.error("cname-hanlu-----> " + cname);
		custom = new Custom();
		custom.setAgentId(this.getCurrentUser().getId());
		if(null != cname)
			custom.setCustomName("%"+SQLTools.transfer(cname)+"%");
		if(this.getPage() == null){
			this.setPage(new PageSupport());
			this.setLog(this.getCurrentUser(), "用户进行客户搜索操作：搜索内容为：" + cname);
		}
		try {
			this.getPage().setTotalCount(customService.count(custom));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			this.getPage().setTotalCount(0);
		}
		if(this.getPage().getTotalCount() > 0){
			if(this.getPage().getPage() <= 0 )
				this.getPage().setPage(1);
			if(this.getPage().getPage() > this.getPage().getPageCount())
				this.getPage().setPage(this.getPage().getPageCount());
			custom.setStarNum((this.getPage().getPage() - 1) * this.getPage().getPageSize());
			custom.setPageSize(this.getPage().getPageSize());
			try {
				customList = customService.getList(custom);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				customList = null;
				if(this.getPage() == null){
					this.setPage(new PageSupport());
					this.getPage().setItems(null);
				}
			}
			this.getPage().setItems(customList);
		}else{
			this.getPage().setItems(null);
		}
		return SUCCESS;
	}
	
	
	public String contactList(){
		try {
			contactList = contactService.getContactList(contact);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String addCustom(){
		custom.setAgentCode(this.getCurrentUser().getUserCode());
		custom.setAgentId(this.getCurrentUser().getId());
		custom.setAgentName(this.getCurrentUser().getUserName());
		if(null != custom && custom.getAgentId() != null && !custom.getAgentId().equals("") &&
			custom.getCustomName() != null && !custom.getCustomName().equals("") &&
			custom.getCustomStatus() != null && !custom.getCustomStatus().equals("") &&
			custom.getCustomType() != null && !custom.getCustomType().equals("") 
//			&& custom.getBossName() != null && !custom.getBossName().equals("") &&
//			custom.getCardType() != null && !custom.getCardType().equals("") &&
//			custom.getCardNum() != null && !custom.getCardNum().equals("") &&
//			custom.getCompanyTel() != null && !custom.getCompanyTel().equals("") &&
//			custom.getArea() != null && !custom.getArea().equals("0") &&
//			custom.getCity() != null && !custom.getCity().equals("0") &&
//			custom.getProvince() != null && !custom.getProvince().equals("0") &&
//			custom.getRegDatetime() != null && !custom.getRegDatetime().equals("")
			){
			try {
				customService.hl_addCustomContact(custom,contactList);
				this.setLog(this.getCurrentUser(), "用户进行客户添加操作：添加客户：" + custom.getCustomName());
				return SUCCESS;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		return INPUT;
	}
	
	public void isExitCustomName(){
		String result = "nopeat";
		try {
			if(customService.isExitCustomName(custom) > 0)
				result = "peat";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "error";
		}
		
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}
	
	public String modifyCustom(){
		custom.setAgentCode(this.getCurrentUser().getUserCode());
		custom.setAgentId(this.getCurrentUser().getId());
		custom.setAgentName(this.getCurrentUser().getUserName());
		if(null != custom && custom.getAgentId() != null && !custom.getAgentId().equals("") &&
				custom.getCustomName() != null && !custom.getCustomName().equals("") &&
				custom.getCustomStatus() != null && !custom.getCustomStatus().equals("") &&
				custom.getCustomType() != null && !custom.getCustomType().equals("") 
//				&& custom.getBossName() != null && !custom.getBossName().equals("") &&
//				custom.getCardType() != null && !custom.getCardType().equals("") &&
//				custom.getCardNum() != null && !custom.getCardNum().equals("") &&
//				custom.getCompanyTel() != null && !custom.getCompanyTel().equals("") &&
//				custom.getArea() != null && !custom.getArea().equals("0") &&
//				custom.getCity() != null && !custom.getCity().equals("0") &&
//				custom.getProvince() != null && !custom.getProvince().equals("0") &&
//				custom.getRegDatetime() != null && !custom.getRegDatetime().equals("")
				){
			try {
				customService.hl_modifyCustomContact(custom, contactList);
				this.setLog(this.getCurrentUser(), "用户进行客户修改操作：修改客户<" + custom.getCustomName()+">的信息");
				customList();
				return SUCCESS;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return INPUT;
	}
	
	public String getCustomContactById(){
		try {
			custom = customService.getCustomById(custom);
			Contact ct = new Contact();
			ct.setCustomId(custom.getId());
			contactList = contactService.getContactList(ct);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	public void loadCity(){
		String cjson = "";
		try {
			cityList = provinceAndCitysService.getCitys(province);
			JSONArray jo = JSONArray.fromObject(cityList);
			cjson = jo.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.getOut().write(cjson);
		this.closeOut(this.getOut());
	}
	
	public void loadArea(){
		String ajson = "";
		try {
			areaList = provinceAndCitysService.getAreas(city);
			JSONArray jo = JSONArray.fromObject(areaList);
			ajson = jo.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.getOut().write(ajson);
		this.closeOut(this.getOut());
	}
	
	public void modifyCustomStatus(){
		String flag = "failed";
		String status = "停用";
		if(null != custom && custom.getId() != null && !custom.getId().equals("")){
			try {
				customService.modifyCustomStatus(custom);
				if(custom.getCustomStatus().equals("1"))  status = "启用";
				this.setLog(this.getCurrentUser(), "用户进行客户状态修改：修改客户<" + custom.getCustomName()+">的状态为："+status);
				flag = "success";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		this.getOut().write(flag);
		this.closeOut(this.getOut());
	}

}
