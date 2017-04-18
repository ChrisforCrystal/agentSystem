package org.agent.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.agent.common.Constants;
import org.agent.common.PageSupport;
import org.agent.pojo.Custom;
import org.agent.pojo.Logs;
import org.agent.pojo.RoleFunctions;
import org.agent.pojo.User;
import org.agent.service.custom.CustomService;
import org.agent.service.logs.LogsService;
import org.agent.service.user.UserService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport{
	
	private static final long serialVersionUID = -403323345542984392L;

	@Autowired
	public LogsService logsService;
	@Autowired
	private UserService userService;
	@Autowired
	private CustomService customService;
	
	private User currentUser;
	private String actionMessage;
	private PageSupport page;
	private List<RoleFunctions> roleFunctions;	
	
	public BaseAction(){
		this.setCurrentUser((User)this.getRequest().getSession().getAttribute(Constants.SESSION_USER));
		this.getResponse().setCharacterEncoding("utf-8");
		if(this.getCurrentUser() != null)
		roleFunctions = Constants.MENU.get(this.getCurrentUser().getRoleId());
	}
	
	private PrintWriter out;
	private ServletOutputStream servletOutputStream;
	
	public List<RoleFunctions> getRoleFunctions() {
		return roleFunctions;
	}


	public void setRoleFunctions(List<RoleFunctions> roleFunctions) {
		this.roleFunctions = roleFunctions;
	}


	public PrintWriter getOut() {
		try {
			if( null == out )
				return this.getResponse().getWriter();
			else
				return out;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			return null;
		}
	}
	public ServletOutputStream getServletOutputStream() {
		try {
			if( null == servletOutputStream )
				return this.getResponse().getOutputStream();
			else
				return servletOutputStream;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			return null;
		}
	}

	
	public void closeOut(PrintWriter out){
		if(null != out){
			out.close();
			out = null;
		}
	}
	public void closeServletOutputStream(ServletOutputStream servletOutputStream){
		if(null != servletOutputStream){
			try {
				servletOutputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			servletOutputStream = null;
		}
	}
	
	public void setOut(PrintWriter out) {
		this.out = out;
	}


	public User getCurrentUser() {
		return currentUser;
	}


	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}

	ActionContext context = ActionContext.getContext(); 

	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}
	
	//add logs infomations
	public void setLog(User user,String operateInfo){
		Logs logs = new Logs();
		logs.setUserId(user.getId());
		logs.setUserName(user.getUserCode());
		logs.setOperateInfo(operateInfo);
		logs.setOperateDatetime(new Date());
		try {
			logsService.hladdLogs(logs);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getActionMessage() {
		return actionMessage;
	}
	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

	//用户搜索功能，返回 user List
	public List<User> searchUser(List<User> userList,User user){
		
		try {
			userList = userService.getUserListBySearch(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userList;
	}
	//客户搜索功能，返回 Custom List
	public List<Custom> searchCustom(List<Custom> customList,Custom custom){
		
		try {
			custom.setAgentId(currentUser.getId());
			custom.setCustomStatus(1);
			customList = customService.getCustomBySearch(custom);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return customList;
	}


	public PageSupport getPage() {
		return page;
	}


	public void setPage(PageSupport page) {
		this.page = page;
	}
	
	
}
