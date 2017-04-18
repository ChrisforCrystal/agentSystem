package org.agent.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import org.agent.pojo.Role;
import org.agent.pojo.User;
import org.agent.service.role.RoleService;
import org.agent.service.user.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class RoleAction extends BaseAction{
	private static final long serialVersionUID = 4920579023717100919L;
	private Logger logger = Logger.getLogger(RoleAction.class);
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;
	private List<Role> roleList;
	private String type;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Role> getRoleList() {
		return roleList;
	}


	private Role role;
	
	
	/**
	 *获取角色列表
	 */
	public String roleList(){
		try {
			roleList = roleService.getRoleList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 新增/修改角色(type=add/modify)
	 * 
	 */
	public void editRole(){
		String flag = "failed";
		String type = this.getType();
		if(role != null && role.getRoleName() != null && !role.getRoleName().equals("") &&
			role.getIsStart() != null && !role.getIsStart().equals("")){
			try {
				role.setCreatedBy(this.getCurrentUser().getUserCode());
				role.setLastUpdateTime(new Date());
				if(type.equals("add")){
					role.setCreationTime(new Date());
					if(roleService.getRole(role) == null){
						roleService.addRole(role);
						flag = "success";
						this.setLog(this.getCurrentUser(), "用户添加<"+role.getRoleName()+">角色");
					}else{
						flag = "repeat";
					}
				}else if(type.equals("modify")){
					int id = role.getId();
					role.setId(null);
					Role temp_role = roleService.getRole(role);
					if(temp_role == null || temp_role.getId() == id){
						role.setId(id);
						roleService.modifyRole(role);
						flag = "success";
						this.setLog(this.getCurrentUser(), "用户修改<"+role.getRoleName()+">角色");
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
	 * 删除角色
	 */
	public void delRole(){
		String flag =  "failed";
		if(null != role && null != role.getId() && !role.getId().equals("")){
			try {
				User u = new User();
				List <User> uList = null;
				u.setRoleId(role.getId());
				uList = userService.getUserListBySearch(u);
				if(uList == null || uList.size() == 0){
					roleService.deleteRole(role);
					flag = "success";
					this.setLog(this.getCurrentUser(), "用户删除<"+role.getRoleName()+">角色");
				}else{
					flag = "";
					for(int i = 0; i < uList.size(); i++){
						flag += uList.get(i).getUserCode();
						flag += ","; 
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
	
	
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}


	public Role getRole() {
		return role;
	}


	public void setRole(Role role) {
		this.role = role;
	}


	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	

}
