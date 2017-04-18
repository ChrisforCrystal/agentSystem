package org.agent.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.agent.common.Constants;
import org.agent.pojo.Function;
import org.agent.pojo.Premission;
import org.agent.pojo.Role;
import org.agent.pojo.RoleFunctions;
import org.agent.service.function.FunctionService;
import org.agent.service.premission.PremissionService;
import org.agent.service.role.RoleService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class FunctionAction extends BaseAction{
	
	private static final long serialVersionUID = -3765217442922162026L;
	private Logger logger = Logger.getLogger(FunctionAction.class);
	private Function function;
	private List<Function> funcList;
	private String checkFuncList;
	@Autowired
	private FunctionService functionService;
	@Autowired
	private PremissionService premissionService;
	private Integer roleId;
	private Premission premission;
	private List<Role> roleList;
	@Autowired
	private RoleService roleService;
	
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	
	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	public String getCheckFuncList() {
		return checkFuncList;
	}
	public void setCheckFuncList(String checkFuncList) {
		this.checkFuncList = checkFuncList;
	}
	public Function getFunction() {
		return function;
	}
	public void setFunction(Function function) {
		this.function = function;
	}
	public List<Function> getFuncList() {
		return funcList;
	}
	public void setFuncList(List<Function> funcList) {
		this.funcList = funcList;
	}
	
	/**
	 * 获取功能列表
	 */
	public String funcList(){
		try {
			funcList = functionService.getFunctionList();
			Premission pm = new Premission();
			pm.setRoleId(this.getRoleId());
			pm.setIsStart(1);
			List<Premission> pList = premissionService.getList(pm);
			if(pList != null){
				for(Premission p : pList)
					for(Function f : funcList){
						if(p.getFunctionId() == f.getId())
							f.setIsCheck(true);
					}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	

	/**
	 *获取角色列表
	 */
	public String roleList(){
		try {
			roleList = roleService.getRoleIdAndNameList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	private void updateRoleFunc() throws Exception{
		//init menu
		List<Role> roleList = roleService.getRoleIdAndNameList();
		List<Function> menuFunctionList = functionService.getMenuFunction();
		List<Function> fList;
		ArrayList<RoleFunctions> roleFunctionsList;

		for(Role role : roleList){
			fList = new ArrayList<Function>();
			roleFunctionsList = new ArrayList<RoleFunctions>();
			Premission premission = new Premission();
			premission.setRoleId(role.getId());
			premission.setIsStart(1);
			List<Premission> premissionList = premissionService.getList(premission);
			for(int j = 0; j < premissionList.size(); j++){
				Function function = new Function();
				function.setId(premissionList.get(j).getFunctionId());
				function = functionService.getFunctionById(function);
				fList.add(function);
			}
			
			List<Function> subFunction;
			for(Function f:menuFunctionList){
				RoleFunctions roleFunctions = new RoleFunctions();
				roleFunctions.setMainFunction(f);
			//	System.out.println("---------------->"+f.getFunctionName());
				subFunction = new ArrayList<Function>();
				if( null != fList && fList.size() > 0){
					for(Function subf : fList){
						if(subf.getParentId() == f.getId()){
							subFunction.add(subf);
						}
					}
				}
				roleFunctions.setSubFunctions(subFunction);
				roleFunctionsList.add(roleFunctions);
			}
			Constants.MENU.put(role.getId(), roleFunctionsList);

		}
	}
	
	/**
	 * 保存角色对应的功能到权限表
	 */
	public void saveRoleFunc(){
		String flag = "failed";
		Premission pm = new Premission();
		pm.setRoleId(this.getRoleId());
		pm.setId(null);
		pm.setCreatedBy(this.getCurrentUser().getUserCode());
		pm.setCreationTime(new Date());
		pm.setIsStart(1);
		try {
			premissionService.hl_delAddPremission(pm,this.getCheckFuncList());
			this.setLog(this.getCurrentUser(), "用户修改角色ID："+pm.getRoleId()+" 的对应的功能ID为："+this.getCheckFuncList());
			updateRoleFunc();
			flag = "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	
}
