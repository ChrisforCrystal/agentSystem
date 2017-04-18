package org.agent.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;

import org.agent.common.Constants;
import org.agent.common.PageSupport;
import org.agent.common.SQLTools;
import org.agent.pojo.Account;
import org.agent.pojo.AccountDetail;
import org.agent.pojo.Logs;
import org.agent.pojo.SystemConfig;
import org.agent.pojo.User;
import org.agent.service.account.AccountService;
import org.agent.service.accountdetail.AccountDetailService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class AccountAction extends BaseAction {
	private static final long serialVersionUID = 1233435286650997451L;
	private Logger logger = Logger.getLogger(AccountAction.class);
	private List<User> userList;
	private User user;
	private Account account;
	private List<SystemConfig> accountConfigList;
	private AccountDetail accountDetail;
	private List<AccountDetail> accountDetailList;
	@Autowired
	AccountService accountService;
	@Autowired
	AccountDetailService accountDetailService;
	private String userCode;
	private String userId;
	
	
	
	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void searchUser(){
		try {
			//user.userCode=han
			user.setUserCode("%"+SQLTools.transfer(user.getUserCode())+"%");
			user.setIsStart(1);
			userList = this.searchUser(userList, user);
			if(null == userList){
				userList = new ArrayList<User>();
			}
			logger.error("--->" + userList.size());
			this.getOut().write((JSONArray.fromObject(userList)).toString());
			this.closeOut(this.getOut());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public String caiwu(){
		accountConfigList = Constants.accountConfigList;
		return SUCCESS;
	}
	
	public void opeaccount(){
		logger.error("userid : " + account.getUserId());
		logger.error("money :" + account.getMoney());
		try{
			Account dbAccount = accountService.getAccount(account);
			if(null != dbAccount){
				//init accountDetail
				/*
					DetailType //流水类型
					DetailTypeName //流水类型名称
					Money //l流水金额
					accountMoney //账户余额
					Memo //备注
					DetailDatetime  //流水产生时间
				 */
				Date date = new Date();
				accountDetail.setAccountMoney(dbAccount.getMoney().add(account.getMoney()));
				accountDetail.setMoney(account.getMoney());
				accountDetail.setUserId(dbAccount.getUserId());
				accountDetail.setDetailDateTime(date);
				if(accountDetail.getMemo() == null)
					accountDetail.setMemo("");
				
				logger.error("------>" + accountDetail.getDetailTypeName());
				logger.error("------>" + accountDetail.getMemo());
				logger.error("------>" + accountDetail.getDetailType());
				logger.error("------>" + accountDetail.getUserId());
				logger.error("------>" + accountDetail.getAccountMoney());
				logger.error("------>" + accountDetail.getDetailDateTime());
				logger.error("------>" + accountDetail.getMoney());
				//init logs
				/*
				 * userId : 用户ID
					userName：用户名称
					operateInfo ： 用户操作信息记录
					operateDatetime ： 操作时间
				 */
				Logs logs = new Logs();
				logs.setUserId(this.getCurrentUser().getId());
				logs.setUserName(this.getCurrentUser().getUserName());
				logs.setOperateInfo(logs.getUserName() + "对" + account.getUserName() + "进行" + accountDetail.getDetailTypeName() + "的操作");
				logs.setOperateDatetime(date);
				accountService.hl_operationAccount(dbAccount, account, accountDetail, logs);
				this.getOut().write("success");
			}
		}catch(Exception e){
			e.printStackTrace();
			this.getOut().write("failed");
		}
		this.closeOut(this.getOut());
	}
	
	public String yfk(){
		
		if(null != accountDetail){
			if(user != null && user.getId() != null){
				accountDetail.setUserId(user.getId());
			}else{
				if(userId != null && !userId.equals("")){
					accountDetail.setUserId(Integer.valueOf(userId));
					user = new User();
					user.setId(Integer.valueOf(userId));
					user.setUserCode(userCode);
				}else{
					accountDetail.setUserId(this.getCurrentUser().getId());
				}
				
				
			}
		}
		
//		if(null != accountDetail){
//			if(user != null && user.getId() != null){
//				accountDetail.setUserId(user.getId());
//			}else{
//				accountDetail.setUserId(this.getCurrentUser().getId());
//			}
//			
//		}
		
		caiwu();
		accountDetailByUserId();
		return SUCCESS;
	}
	
	public String accountDetailByUserId(){
		if(null == accountDetail){
			accountDetail = new AccountDetail();
		}
		if(user != null && user.getId() != null){
			accountDetail.setUserId(user.getId());
		}else{
			accountDetail.setUserId(this.getCurrentUser().getId());
		}
		if(null != accountDetail.getEndTime()){
			DateFormat df = DateFormat.getDateInstance();
			String dfString  = df.format(accountDetail.getEndTime())+" 23:59:59";
			SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				accountDetail.setEndTime(sdf.parse(dfString));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(this.getPage() == null){
			this.setPage(new PageSupport());
			///写log，改字符
			this.setLog(this.getCurrentUser(), Constants.OPERATE_INFO_USER_ACCESS_ACCOUNTDETAIL);
		}
		try {
			//要添加count方法，查询总条数
			this.getPage().setTotalCount(accountDetailService.count(accountDetail));
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
			accountDetail.setStarNum((this.getPage().getPage() - 1) * this.getPage().getPageSize());
			accountDetail.setPageSize(this.getPage().getPageSize());
			try {
				accountDetailList = accountDetailService.getAccountDetailList(accountDetail);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				accountDetailList = null;
				if(this.getPage() == null){
					this.setPage(new PageSupport());
					this.getPage().setItems(null);
				}
			}
			this.getPage().setItems(accountDetailList);
		}else{
			this.getPage().setItems(null);
		}
		return SUCCESS;
	}
	
	public void getCurrentAccount(){
		String result = "failed";
		account = new Account();
		account.setUserId(this.getCurrentUser().getId());
		try {
			account = accountService.getAccount(account);
			if(account != null){
				result = account.getMoney().toString();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}
	
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public List<SystemConfig> getAccountConfigList() {
		return accountConfigList;
	}

	public void setAccountConfigList(List<SystemConfig> accountConfigList) {
		this.accountConfigList = accountConfigList;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public AccountDetail getAccountDetail() {
		return accountDetail;
	}

	public void setAccountDetail(AccountDetail accountDetail) {
		this.accountDetail = accountDetail;
	}

	public List<AccountDetail> getAccountDetailList() {
		return accountDetailList;
	}

	public void setAccountDetailList(List<AccountDetail> accountDetailList) {
		this.accountDetailList = accountDetailList;
	}
	
}
