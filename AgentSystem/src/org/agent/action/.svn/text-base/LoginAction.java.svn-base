package org.agent.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.agent.common.Constants;
import org.agent.common.MD5;
import org.agent.pojo.Account;
import org.agent.pojo.Function;
import org.agent.pojo.Premission;
import org.agent.pojo.User;
import org.agent.service.account.AccountService;
import org.agent.service.function.FunctionService;
import org.agent.service.premission.PremissionService;
import org.agent.service.user.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class LoginAction extends BaseAction{
	
	private static final long serialVersionUID = 7555195897107023585L;
	
	private Logger logger = Logger.getLogger(LoginAction.class);
	
	@Resource UserService userService;
	@Resource AccountService accountService;
	private User user;
	private Account account;
	private List<Function> funcList;
	private List<Premission> premissionList;
	@Autowired
	private PremissionService premissionService;
	private Premission premission;
	@Autowired
	private FunctionService functionService;
	private Function function;
	
	public Function getFunction() {
		return function;
	}

	public void setFunction(Function function) {
		this.function = function;
	}

	public Premission getPremission() {
		return premission;
	}

	public void setPremission(Premission premission) {
		this.premission = premission;
	}

	public List<Function> getFuncList() {
		return funcList;
	}

	public void setFuncList(List<Function> funcList) {
		this.funcList = funcList;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public String login(){
		if(user != null &&
			!user.getUserCode().isEmpty() &&
			!user.getUserPassword().isEmpty()){
			try {
				user.setUserPassword(MD5.MD5Encode(user.getUserPassword()));
				User _user = userService.getLoginUser(user) ;
				if(_user != null){
					this.getRequest().getSession().setAttribute(Constants.SESSION_USER, _user);
					User updateLoginTimeUser = new User();
					updateLoginTimeUser.setId(_user.getId());
					updateLoginTimeUser.setLastLoginTime(new Date());
					userService.modifyUser(updateLoginTimeUser);
					updateLoginTimeUser = null;
					setLog(_user,Constants.OPERATE_INFO_USER_LOGIN_SUCCESS);
					logger.error("User login : " + _user.getUserCode() + " - " + _user.getUserName());
					//this.setFuncList(getFuncByCurrentUser(_user.getRoleId()));
					//logger.error("====================>"+ funcList.size());
					return SUCCESS;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				setLog(user,Constants.OPERATE_INFO_USER_LOGIN_FAILD);
				logger.error("User login : " + user.getUserCode());
				e.printStackTrace();
			}
		}
		return INPUT;
	}
	
	public void validateLoginUser(){
		
		String flag = "failed";
		if(null != user && !"".equals(user.getUserCode())){
			try {
				
				user.setUserPassword(MD5.MD5Encode(user.getUserPassword()));
				
				if(userService.isExitLoginUser(user) == 0){
					flag = "noexitusercode";
				}else if(userService.getLoginUser(user) == null){
					flag = "errorpwd";
				}else{
					flag = "success";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		this.getOut().write(flag);
		this.closeOut(this.getOut());
	}
	/**
	 * 
	 * @return
	 */
	public String exit(){
		try{
			User user = (User)getRequest().getSession().getAttribute(Constants.SESSION_USER);
			if(user != null && user.getId() > 0){
				setLog(user,Constants.OPERATE_INFO_USER_LOGOUT_SUCCESS);
				getRequest().getSession().invalidate();
				getRequest().getSession().removeAttribute(Constants.SESSION_USER);
				logger.error("User logout : " + user.getUserCode() + " - " + user.getUserName());
				user = null;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String main(){
		//查询当前账户的信息，User信息从session中取
		//查询当前的账户的余额信息
		account = new Account();
		account.setUserId(this.getCurrentUser().getId());
		try {
			account = accountService.getAccount(account);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			account = null;
		}
		return SUCCESS;
	}
	
	/**
	 * 根据当前用户的角色id的到功能列表（对应菜单）
	 */
	private List<Function> getFuncByCurrentUser(int roleId){
		logger.error("getFuncByCurrentUser ========================================================== "+ roleId);
		List<Function> fList = new ArrayList<Function>();
		if(premission == null) premission = new Premission();
		premission.setRoleId(roleId);
		premission.setIsStart(1);
		try {
			premissionList = premissionService.getList(premission);
			logger.error("premissionList ========================================================== "+ premissionList.size());
			if(premissionList != null){
				
				for(int j = 0; j < premissionList.size(); j++){
					if(function == null) function = new Function();
					function.setId(premissionList.get(j).getFunctionId());
					function = functionService.getFunctionById(function);
					logger.error("function getFuncUrl ========================================================== "+ function.getFuncUrl());
					fList.add(function);
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.error("fList ========================================================== "+ fList.size());
		return fList;
	}
	
}
