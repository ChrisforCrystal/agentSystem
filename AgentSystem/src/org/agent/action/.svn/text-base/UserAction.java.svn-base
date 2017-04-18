package org.agent.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import org.agent.common.Constants;
import org.agent.common.MD5;
import org.agent.common.PageSupport;
import org.agent.common.SQLTools;
import org.agent.pojo.Role;
import org.agent.pojo.User;
import org.agent.service.role.RoleService;
import org.agent.service.user.UserService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;


public class UserAction extends BaseAction{
	private static final long serialVersionUID = 4920579023717100919L;
	private Logger logger = Logger.getLogger(UserAction.class);
	@Autowired
	private UserService userService;
	private List<User> userList;
	private String type;
	private User user;
	private String uname;
	@Autowired
	private RoleService roleService;
	private List<Role> roleList;
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	/**
	 * 获取用户列表（分页）
	 * @return
	 */
	public String userList(){
		try {
			roleList = roleService.getRoleIdAndNameList();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(user == null)  user = new User();
		if(null != uname){
			user.setUserName("%"+SQLTools.transfer(uname)+"%");
		}
		if(this.getPage() == null){
			this.setPage(new PageSupport());
			//操作写进Log
			this.setLog(this.getCurrentUser(), Constants.OPERATE_INFO_USER_lIST_SEARCH);
		}
		try {
			this.getPage().setTotalCount(userService.count(user));
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
			user.setStarNum((this.getPage().getPage() - 1) * this.getPage().getPageSize());
			user.setPageSize(this.getPage().getPageSize());
			try {
				userList = userService.getUserList(user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				userList = null;
				if(this.getPage() == null){
					this.setPage(new PageSupport());
					this.getPage().setItems(null);
				}
			}
			this.getPage().setItems(userList);
		}else{
			this.getPage().setItems(null);
		}
		return SUCCESS;
	}
	
	/**
	 * 新增/修改用户(type=add/modify)
	 */
	public void editUser(){
		String flag = "failed";
		String type = this.getType();
		if(null != user && user.getUserCode() != null && !user.getUserCode().equals("") &&
				user.getUserName() != null && !user.getUserName().equals("") &&
				user.getUserPassword() != null && !user.getUserPassword().equals("") &&
				user.getRoleId() != null && user.getRoleId() != 0){
			try {
				user.setCreatedBy(this.getCurrentUser().getUserCode());
				user.setLastUpdateTime(new Date());
				if(type.equals("add")){
					user.setCreationTime(new Date());
					if(userService.getUser(user) == null){
						user.setUserPassword(MD5.MD5Encode(user.getUserPassword()));
						userService.hl_AddUser(user);
						flag = "success";
						this.setLog(this.getCurrentUser(), "添加<"+user.getUserCode()+">用户");
					}else{
						flag = "repeat";
					}
				}else if(type.equals("modify")){
					int id = user.getId();
					user.setId(null);
					User temp_user = userService.getUser(user);
					if(temp_user == null || temp_user.getId() == id){
						user.setId(id);
						user.setUserPassword(MD5.MD5Encode(user.getUserPassword()));
						userService.modifyUser(user);
						flag = "success";
						this.setLog(this.getCurrentUser(), "修改<"+user.getUserCode()+">用户");
					}else{
						flag = "repeat";
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		PrintWriter out = null;
		try {
			out = getResponse().getWriter();
			out.write(flag);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(null != out){
				out.close();
				out = null;
			}
		}
	}
	
	/**
	 * 删除用户
	 */
	public void delUser(){
		boolean flag = false;
		if(null != user && user.getId() != null && !user.getId().equals("")){
			try {
				userService.deleteUser(user);
				flag = true;
				this.setLog(this.getCurrentUser(), "删除<"+user.getUserCode()+">用户");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		PrintWriter out = null;
		try {
			out = getResponse().getWriter();
			if(flag)
				out.write("success");
			else 
				out.write("failed");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(null != out){
				out.close();
				out = null;
			}
		}
		
	}
	
}
