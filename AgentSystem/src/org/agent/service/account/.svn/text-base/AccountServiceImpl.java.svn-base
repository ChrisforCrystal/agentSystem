package org.agent.service.account;

import java.util.List;

import org.agent.common.AccountsUtil;
import org.agent.dao.account.AccountMapper;
import org.agent.dao.accountdetail.AccountDetailMapper;
import org.agent.dao.logs.LogsMapper;
import org.agent.pojo.Account;
import org.agent.pojo.AccountDetail;
import org.agent.pojo.Logs;
import org.agent.service.logs.LogsService;
import org.springframework.beans.factory.annotation.Autowired;

public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountMapper mapper;
	@Autowired
	private AccountDetailMapper accountDetailmapper;
	@Autowired
	private LogsMapper logsmapper;
	@Override
	public List<Account> getAccountList(Account account)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getAccountList(account);
	}

	@Override
	public Account getAccount(Account account)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getAccount(account);
	}

	@Override
	public int addAccount(Account account)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addAccount(account);
	}

	@Override
	public int modifyAccount(Account account)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.modifyAccount(account);
	}

	@Override
	public int deleteAccount(Account account)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.deleteAccount(account);
	}

	@Override
	public boolean hl_operationAccount(Account oldAccount, Account newAccount,AccountDetail accountDetail,Logs logs)
			throws Exception {
		// 资金计算
		oldAccount.setMoney(AccountsUtil.add(oldAccount.getMoney(),newAccount.getMoney()));
		oldAccount.setMoneyBak(AccountsUtil.add(oldAccount.getMoneyBak(),newAccount.getMoney()));
		//修改账户资金
		mapper.modifyAccount(oldAccount);
		//记录流水
		accountDetailmapper.addAccountDetail(accountDetail);
		//记录管理员操作信息
		logsmapper.addLogs(logs);
		return false;
	}

}
