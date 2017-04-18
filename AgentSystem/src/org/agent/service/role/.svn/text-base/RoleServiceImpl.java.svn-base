package org.agent.service.role;

import java.util.List;

import org.agent.dao.role.RoleMapper;
import org.agent.pojo.Role;
import org.springframework.beans.factory.annotation.Autowired;

public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleMapper  mapper;
	@Override
	public List<Role> getRoleList()  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getRoleList();
	}

	@Override
	public Role getRole(Role role)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getRole(role);
	}

	@Override
	public int addRole(Role role)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addRole(role);
	}

	@Override
	public int modifyRole(Role role)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.modifyRole(role);
	}

	@Override
	public int deleteRole(Role role)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.deleteRole(role);
	}

	@Override
	public List<Role> getRoleIdAndNameList() throws Exception {
		// TODO Auto-generated method stub
		return mapper.getRoleIdAndNameList();
	}

}
