package org.agent.service.user;

import java.math.BigDecimal;
import java.util.List;


import org.agent.dao.account.AccountMapper;
import org.agent.dao.user.UserMapper;
import org.agent.pojo.Account;
import org.agent.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;

public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	@Autowired
	private AccountMapper accountMapper;
		
	@Override
	public List<User> getUserList(User user)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getUserList(user);
	}

	@Override
	public List<User> getUserListBySearch(User user)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getUserListBySearch(user);
	}

	@Override
	public User getUser(User user)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getUser(user);
	}

	@Override
	public int addUser(User user)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addUser(user);
	}
	
	public void hl_AddUser(User user) throws Exception{
		mapper.addUser(user);
		Account account  = new Account();
		account.setUserId(mapper.getAddUserId());
		account.setMoney(new BigDecimal(0));
		account.setMoneyBak(new BigDecimal(0));
		System.out.println("----------------------->" + account.getUserId());
		accountMapper.addAccount(account);
	}
	
	@Override
	public int modifyUser(User user)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.modifyUser(user);
	}

	@Override
	public int deleteUser(User user)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.deleteUser(user);
	}

	@Override
	public int getAddUserId() throws Exception {
		// TODO Auto-generated method stub
		return mapper.getAddUserId();
	}
	
	@Override
	public int count(User user) throws Exception {
		// TODO Auto-generated method stub
		return mapper.count(user);
	}

	@Override
	public User getLoginUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getLoginUser(user);
	}

	@Override
	public int isExitLoginUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return mapper.isExitLoginUser(user);
	}

}
