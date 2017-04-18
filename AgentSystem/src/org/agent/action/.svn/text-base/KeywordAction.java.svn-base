package org.agent.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;

import org.agent.common.AccountsUtil;
import org.agent.common.Constants;
import org.agent.common.PageSupport;
import org.agent.common.SQLTools;
import org.agent.pojo.Account;
import org.agent.pojo.Custom;
import org.agent.pojo.Keywords;
import org.agent.pojo.SystemConfig;
import org.agent.service.account.AccountService;
import org.agent.service.keywords.KeywordsService;
import org.agent.service.systemconfig.SystemConfigService;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class KeywordAction extends BaseAction {
	private static final long serialVersionUID = 5750449836942329002L;
	private Logger logger = Logger.getLogger(KeywordAction.class);
	
	@Autowired
	private KeywordsService keywordsService;
	@Autowired
	private SystemConfigService systemConfigService;
	@Autowired
	private AccountService accountService;
	private Custom custom;
	private List<Custom> customList;
	private List<SystemConfig> serviceType;
	private List<SystemConfig> youhuiType;
	private SystemConfig systemConfig;
	private Keywords keywords;
	private List<Keywords> keywordsList;
	private Account account;
	private String p; // ji suan price 需要接受的参数
	private String type;
	
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String init(){
		serviceType = Constants.serviceConfigList;
		systemConfig = Constants.maxServiceYearsConfig;
		youhuiType = Constants.youhuiTypeConfigList;
		account = new Account();
		account.setUserId(this.getCurrentUser().getId());
		try {
			account = accountService.getAccount(account);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public void searchCustom(){
		try {
			//user.userCode=han
			custom.setCustomName("%"+SQLTools.transfer(custom.getCustomName())+"%");
			customList = this.searchCustom(customList, custom);
			if(null == customList){
				customList = new ArrayList<Custom>();
			}
			logger.error("--->" + customList.size());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			customList = new ArrayList<Custom>();
		}
		this.getOut().write((JSONArray.fromObject(customList)).toString());
		this.closeOut(this.getOut());
	}

	public void valiKeyword(){
		String result = "failed";
		try {
			Keywords kw = keywordsService.getKeywordsByKeyword(keywords);
			if(kw ==null){
				result ="success";
				kw = null;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}
	public void jisuanPrice(){
		String result = "exception";
		result = price();
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}
	
	
	public void updateKeyword(){
		String result = "exception";
		if(keywords != null)
		try{
			if((null != keywords.getCheckStatus() && keywords.getCheckStatus() == 1) ||
					(null != keywords.getIsUse() && keywords.getIsUse() == 1)  ||
					(null != keywords.getIsUse() && keywords.getIsUse() == 0)
					){
				keywordsService.modifyKeywords(keywords);
				this.setLog(this.getCurrentUser(), "用户进行关键词状态修改，状态修改为审核中");
			}else if(keywords.getCheckStatus() == 2){//审核通过
				keywordsService.hl_changeStatusToOK(keywords,this.getCurrentUser(),new Date());
			}else if(keywords.getCheckStatus() == 3){//审核未通过
				keywordsService.hl_changeStatusToNo(keywords,this.getCurrentUser(),new Date());
			}
			result = "success";
		}catch(Exception e){e.printStackTrace();}
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}
	
	
	public void keywordsXuFei(){
		String result = "exception";
		account = new Account();
		account.setUserId(this.getCurrentUser().getId());
		try {
			account = accountService.getAccount(account);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			account = new Account();
		}
		if(null != keywords && p != null){
			String price = price();
			if(account.getMoney() != null && account.getMoney().doubleValue() >= new BigDecimal(price).doubleValue()){
				logger.error("ccount.getMoney().doubleValue():"+ account.getMoney().doubleValue());
				logger.error("new BigDecimal(price).doubleValue():"+ new BigDecimal(price).doubleValue());
				logger.error(">>>>>>>>>>>>>>>>>:"+ (account.getMoney().doubleValue() >= new BigDecimal(price).doubleValue()));
			
				String[] pa = StringUtils.split(p,'-');
				if(pa != null && pa.length == 2){
					try {
						keywordsService.hl_keywordsXuFei(keywords,pa[0],pa[1],new BigDecimal(price),new Date());
						logger.error("account.getMoney ---------- "+account.getMoney());
//						result = "success";
						account = accountService.getAccount(account);
						result = account.getMoney().toString();
						logger.error("account.getMoney result---------- "+result);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			
			}else{
				result = "nomoney";
			}
		}
		
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}
	
	public void submitKeyword(){
		String result = "exception";
		
		account = new Account();
		account.setUserId(this.getCurrentUser().getId());
		try {
			account = accountService.getAccount(account);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			account = new Account();
		}
		
		if(null != keywords && p != null){
			String price = price();
			if(account.getMoney() != null && account.getMoney().doubleValue() >= new BigDecimal(price).doubleValue()){
				logger.error("ccount.getMoney().doubleValue():"+ account.getMoney().doubleValue());
				logger.error("new BigDecimal(price).doubleValue():"+ new BigDecimal(price).doubleValue());
				logger.error(">>>>>>>>>>>>>>>>>:"+ (account.getMoney().doubleValue() >= new BigDecimal(price).doubleValue()));
				logger.error("+++++---------------+++" + price + " keyword : " + keywords.getKeywords() + "CustomId:"+keywords.getCustomId()+ "CustomName:"+keywords.getCustomName());
				//keyword customid customName
				//agentID
				keywords.setAgentId(this.getCurrentUser().getId());
				keywords.setAgentName(this.getCurrentUser().getUserName());
				//preRegFrozenMoney
				String[] prames = StringUtils.split(p,"-");
				Integer serviceTypeId = Integer.valueOf(prames[0]);
				Integer serviceYear = 0;
				SystemConfig serviceTypeConfig = new SystemConfig();
				SystemConfig serviceYearConfig = new SystemConfig();
				serviceTypeConfig.setId(serviceTypeId);
				List<SystemConfig> serviceTypeConfigList = null;;
				try {
					serviceTypeConfigList = systemConfigService.getSystomConfigs(serviceTypeConfig);
					if(serviceTypeConfigList != null && serviceTypeConfigList.size() == 1){
						serviceTypeConfig = serviceTypeConfigList.get(0);
						//preRegFrozenMoney
						keywords.setPreRegFrozenMoney(new BigDecimal(serviceTypeConfig.getConfigValue()));
						//price
						keywords.setPrice(new BigDecimal(price));
						//productType
						keywords.setProductType(serviceTypeConfig.getId());
						//serviceYear
						if(p.contains("id_")){
							String[] youhuiId = StringUtils.split(prames[1],"_");
							serviceYear = Integer.valueOf(youhuiId[1]);
							serviceYearConfig.setId(serviceYear);
							List<SystemConfig> serviceYearConfigList = systemConfigService.getSystomConfigs(serviceYearConfig);
							if(null != serviceYearConfigList){
								serviceYearConfig = serviceYearConfigList.get(0);
								keywords.setServiceYears(serviceYearConfig.getConfigTypeValue());
							}
						}else{
							keywords.setServiceYears(Integer.valueOf(prames[1]));
						}
						if(keywords.getServiceYears() > 0){
							//preRegDatetime
							Date date = new Date();
							keywords.setPreRegDatetime(date);
							keywords.setPreRegPassDatetime(new Date(date.getTime() + Constants.DAYS_5));
							//regDatetime and regPassDatetime
							keywords.setRegDatetime(date);
							Date passDate = new Date(date.getTime());
							passDate.setYear(passDate.getYear() + keywords.getServiceYears());
							keywords.setRegPassDatetime(passDate);
							//isPass
							keywords.setIsPass(0);
							//isUse
							keywords.setIsUse(1);
							//checkstatus
							keywords.setCheckStatus(0);
							keywords.setIsUse(1);
							keywords.setPageSize(0);
							
							
							//keywords set over ,cave now
							keywordsService.hl_SaveKeywords(keywords,this.getCurrentUser(),date);
							
							
							result = "success";
						}
					}
				} catch (Exception e) {e.printStackTrace();}
			}else{
				result = "nomoney";
			}
		}
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}
	
	private String price(){
		String result = "exception";
		Integer serviceTypeId = 0;
		Integer serviceYears = 0;
		SystemConfig serviceTypeConfig = new SystemConfig();
		SystemConfig serviceYearConfig = new SystemConfig();
		if(null != p){
			try{
				String[] prames = StringUtils.split(p,"-");
				serviceTypeId = Integer.valueOf(prames[0]);
				serviceTypeConfig.setId(serviceTypeId);
				List<SystemConfig> serviceTypeConfigList = systemConfigService.getSystomConfigs(serviceTypeConfig);
				logger.error("-------->" + p);
				if(prames[1].contains("id_")){
					String[] youhuiId = StringUtils.split(prames[1],"_");
					serviceYears = Integer.valueOf(youhuiId[1]);
					serviceYearConfig.setId(serviceYears);
					List<SystemConfig> serviceYearConfigList = systemConfigService.getSystomConfigs(serviceYearConfig);
					if(null != serviceTypeConfigList && null != serviceYearConfigList &&
							serviceTypeConfigList.size() == 1 && serviceYearConfigList.size() == 1
							){
						serviceTypeConfig = serviceTypeConfigList.get(0);
						serviceYearConfig = serviceYearConfigList.get(0);
						logger.error("++++++++++++>" + serviceTypeConfig.getConfigValue() +"*" + serviceYearConfig.getConfigValue());
						result = AccountsUtil.multiply(serviceTypeConfig.getConfigValue(), serviceYearConfig.getConfigValue());
					}
				}else{
					serviceYears = Integer.valueOf(prames[1]);
					if(null != serviceTypeConfigList && serviceTypeConfigList.size() == 1){
						serviceTypeConfig = serviceTypeConfigList.get(0);
						logger.error("++++++++++++>" + serviceTypeConfig.getConfigValue() +"*" + prames[1]);
						result = AccountsUtil.multiply(serviceTypeConfig.getConfigValue(), prames[1]);
					}
				}
				
				
				
			}catch(Exception e){
				result = "exception";
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public String checkKeyword(){
		if(null == keywords){
			keywords = new Keywords();
		}
		//keywords.setAgentId(this.getCurrentUser().getId());
		if(keywords.getKeywords() != null)
			keywords.setSearchStr("%"+SQLTools.transfer(keywords.getKeywords())+"%");
		if(this.getPage() == null){
			this.setPage(new PageSupport());
			this.setLog(this.getCurrentUser(), "用户进行关键词管理功能的搜索操作");
		}
		try {
			this.getPage().setTotalCount(keywordsService.count(keywords));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			this.getPage().setTotalCount(0);
		}
		
		logger.error("xxxxxxxxxxxxxxxxxxxxx"+this.getPage().getTotalCount());
		logger.error("xxxxxxxxxxxxxxxxxxxxx"+keywords.getKeywords());
		logger.error("xxxxxxxxxxxxxxxxxxxxx"+keywords.getSearchStr());
		
		if(this.getPage().getTotalCount() > 0){
			if(this.getPage().getPage() <= 0 )
				this.getPage().setPage(1);
			if(this.getPage().getPage() > this.getPage().getPageCount())
				this.getPage().setPage(this.getPage().getPageCount());
			keywords.setStarNum((this.getPage().getPage() - 1) * this.getPage().getPageSize());
			keywords.setPageSize(this.getPage().getPageSize());
			try {
				keywordsList = keywordsService.getKeywordsBySearch(keywords);
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
	
	public String keywordManage(){
		if(null == keywords){
			keywords = new Keywords();
		}
		keywords.setAgentId(this.getCurrentUser().getId());
		if(keywords.getKeywords() != null)
			keywords.setSearchStr("%"+SQLTools.transfer(keywords.getKeywords())+"%");
		if(this.getPage() == null){
			this.setPage(new PageSupport());
			this.setLog(this.getCurrentUser(), "用户进行关键词管理功能的搜索操作");
		}
		try {
			this.getPage().setTotalCount(keywordsService.count(keywords));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			this.getPage().setTotalCount(0);
		}
		
		logger.error("xxxxxxxxxxxxxxxxxxxxx"+this.getPage().getTotalCount());
		logger.error("xxxxxxxxxxxxxxxxxxxxx"+keywords.getKeywords());
		logger.error("xxxxxxxxxxxxxxxxxxxxx"+keywords.getSearchStr());
		
		if(this.getPage().getTotalCount() > 0){
			if(this.getPage().getPage() <= 0 )
				this.getPage().setPage(1);
			if(this.getPage().getPage() > this.getPage().getPageCount())
				this.getPage().setPage(this.getPage().getPageCount());
			keywords.setStarNum((this.getPage().getPage() - 1) * this.getPage().getPageSize());
			keywords.setPageSize(this.getPage().getPageSize());
			try {
				keywordsList = keywordsService.getKeywordsBySearch(keywords);
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
	
	public void deleteKeyword(){
		String result = "exception";
		if(keywords != null){
			try {
				keywordsService.deleteKeywords(keywords);
				result = "success";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}
	
	public String openApp(){
		if(null != keywords){
			try {
				keywords = keywordsService.getKeywordsById(keywords);
				systemConfig = new SystemConfig();
				systemConfig.setId(keywords.getProductType());
				serviceType = systemConfigService.getSystomConfigs(systemConfig);
				if(serviceType != null)
					systemConfig = serviceType.get(0);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}
	public String xuFei(){
		if(null != keywords){
			try {
				keywords = keywordsService.getKeywordsById(keywords);
				/*
				 * 
				 * `regPassDatetime` datetime DEFAULT '2012-01-01 00:01:01',
  `isPass` int(11) DEFAULT '0' COMMENT '0为不过期，1为预注册过期，2为正式注册过期',
  `checkStatus` int(11) DEFAULT '0' COMMENT '0为已申请 1为审核中 2为已通过 3未通过',
  `isUse` int(11) DEFAULT '0' COMMENT '1为已使用 0为未使用'
				 */
				if(keywords.getIsPass() == 0 && keywords.getCheckStatus() == 2
						&& keywords.getIsUse() == 1
						){
					logger.error("可以进行正常的续费操作");
					init();
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}
	public String modifyApp(){
		if(null != keywords && null != keywords.getAppUserName() && 
			!keywords.getAppUserName().equals("") && null != keywords.getAppPassword() &&
			!keywords.getAppPassword().equals("")){
			try {
				keywords.setLoginUrl(Constants.appMakeUrlConfig.getConfigValue());
				keywordsService.modifyKeywords(keywords);
				systemConfig = new SystemConfig();
				systemConfig.setId(keywords.getProductType());
				serviceType = systemConfigService.getSystomConfigs(systemConfig);
				if(serviceType != null)
					systemConfig = serviceType.get(0);
				this.addActionMessage("恭喜您，开通APP成功。");
				keywordManage();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				this.addActionError("对不起，开通APP失败，请重试。");
			}
		}else{
			this.addActionMessage("登陆账号和登录密码不能为空。");
		}
		return SUCCESS;
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

	public List<SystemConfig> getServiceType() {
		return serviceType;
	}

	public void setServiceType(List<SystemConfig> serviceType) {
		this.serviceType = serviceType;
	}

	public SystemConfig getSystemConfig() {
		return systemConfig;
	}

	public void setSystemConfig(SystemConfig systemConfig) {
		this.systemConfig = systemConfig;
	}

	public List<SystemConfig> getYouhuiType() {
		return youhuiType;
	}

	public void setYouhuiType(List<SystemConfig> youhuiType) {
		this.youhuiType = youhuiType;
	}

	public Keywords getKeywords() {
		return keywords;
	}

	public void setKeywords(Keywords keywords) {
		this.keywords = keywords;
	}

	public String getP() {
		return p;
	}

	public void setP(String p) {
		this.p = p;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public List<Keywords> getKeywordsList() {
		return keywordsList;
	}

	public void setKeywordsList(List<Keywords> keywordsList) {
		this.keywordsList = keywordsList;
	}
	
	
	
}
