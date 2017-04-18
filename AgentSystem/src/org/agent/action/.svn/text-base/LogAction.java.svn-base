package org.agent.action;

import java.util.List;

import org.agent.common.Constants;
import org.agent.common.PageSupport;
import org.agent.pojo.Logs;
import org.agent.pojo.User;
import org.agent.service.logs.LogsService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class LogAction extends BaseAction{

	private static final long serialVersionUID = 7051544543003566067L;
	private Logger logger = Logger.getLogger(LogAction.class);
	private Logs logs;
	@Autowired
	private LogsService logsService;
	private List<Logs> logList;
	private User user;
	private String userCode;
	private String userId;
	private List<Logs> logsList;
	
	public String logs(){
		
		logger.error("----------------------------logs------------------------");
		
		Logs logs = new Logs();
		logs.setUserId(this.getCurrentUser().getId());
		
		if(this.getPage() == null){
			this.setPage(new PageSupport());
			this.setLog(this.getCurrentUser(), "用户进行操作日志查看操作");
		}
		try {
			this.getPage().setTotalCount(logsService.count(logs));
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
			logs.setStarNum((this.getPage().getPage() - 1) * this.getPage().getPageSize());
			logs.setPageSize(this.getPage().getPageSize());
			try {
				logsList = logsService.getList(logs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				logsList = null;
				if(this.getPage() == null){
					this.setPage(new PageSupport());
					this.getPage().setItems(null);
				}
			}
			this.getPage().setItems(logsList);
		}else{
			this.getPage().setItems(null);
		}
		
		return SUCCESS;
	}
	public List<Logs> getLogsList() {
		return logsList;
	}
	public void setLogsList(List<Logs> logsList) {
		this.logsList = logsList;
	}
	
	
	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserCode() {
		return userCode;
	}


	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public List<Logs> getLogList() {
		return logList;
	}


	public void setLogList(List<Logs> logList) {
		this.logList = logList;
	}


	public Logs getLogs() {
		return logs;
	}


	public void setLogs(Logs logs) {
		this.logs = logs;
	}


	public String logList(){
		if(logs == null)  logs = new Logs();
		if(null != logs){
			if(user != null && user.getId() != null){
				logs.setUserId(user.getId());
			}else{
				logs.setUserId(Integer.valueOf(userId));
				user = new User();
				user.setId(Integer.valueOf(userId));
				user.setUserCode(userCode);
			}
		}
		if(this.getPage() == null){
			this.setPage(new PageSupport());
			//操作写进Log
			this.setLog(this.getCurrentUser(), Constants.OPERATE_INFO_USER_LOGLIST_SEARCH);
		}
		try {
			if(logs.getOperateDatetime() != null && !logs.getOperateDatetime().equals("")){
				String odt = new java.text.SimpleDateFormat("yyyy-MM-dd").format(logs.getOperateDatetime());
				logs.setOdt(odt);
			}
			this.getPage().setTotalCount(logsService.count(logs));
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
			logs.setStarNum((this.getPage().getPage() - 1) * this.getPage().getPageSize());
			logs.setPageSize(this.getPage().getPageSize());
			try {
				logList = logsService.getList(logs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				logList = null;
				if(this.getPage() == null){
					this.setPage(new PageSupport());
					this.getPage().setItems(null);
				}
			}
			this.getPage().setItems(logList);
		}else{
			this.getPage().setItems(null);
		}
		return SUCCESS;
	}

}
