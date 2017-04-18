package org.agent.action.index;

import org.agent.action.BaseAction;
import org.agent.common.Constants;
import org.agent.common.MD5;
import org.agent.pojo.User;
import org.agent.service.user.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;


public class IndexAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Logger logger = Logger.getLogger(IndexAction.class);
	
	@Autowired
	private UserService userService;
	private User u;
	
	
	
	public void modifyPwd(){
		String oldpwd = u.getUserPassword();
		String newpwd1 = u.getUserCode();
		String newpwd2 = u.getUserName();
		logger.error("oldpwd =======>" + oldpwd);
		logger.error("newpwd1 =======>" + newpwd1);
		logger.error("newpwd2 =======>" + newpwd2);
		
		setLog(this.getCurrentUser(),Constants.OPERATE_INFO_USER_MODIFY_PASSWORD);
		
		oldpwd = MD5.MD5Encode(oldpwd);
		
		u.setId(this.getCurrentUser().getId());
		String result = "0";
		if(!newpwd1.equals(newpwd2)){
			result = "2pwddif";//两次密码不一致
		}else if(!oldpwd.equals(this.getCurrentUser().getUserPassword())){
			result = "oldpwddif";//输入的原密码不正确
		}else{
			try {
				u.setUserCode(null);
				u.setUserName(null);
				u.setUserPassword(newpwd1);
				u.setUserPassword(MD5.MD5Encode(u.getUserPassword()));
				userService.modifyUser(u);
				result = "success";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				result = "failed";
			}
		}
		this.getOut().write(result);
		this.closeOut(this.getOut());
	}



	public User getU() {
		return u;
	}



	public void setU(User u) {
		this.u = u;
	}
	
	
}
