package org.agent.service.account;

import java.util.List;

import org.agent.pojo.Account;
import org.agent.pojo.AccountDetail;
import org.agent.pojo.Logs;

public interface AccountService {
	/**
	 * getAccountList
	 * @param account
	 * @return
	 */
	public List<Account> getAccountList(Account account)  throws Exception;
	
	/**
	 * getAccount
	 * @param account
	 * @return
	 */
	public Account getAccount(Account account)  throws Exception;
	
	/**
	 * addAccount
	 * @param account
	 * @return
	 */
	public int addAccount(Account account) throws Exception;
	
	/**
	 * modifyAccount
	 * @param account
	 * @return
	 */
	public int modifyAccount(Account account) throws Exception;
	
	/**
	 * deleteAccount
	 * @param account
	 * @return
	 */
	public int deleteAccount(Account account) throws Exception;
	/**
	 * operationAccount
	 * @return
	 * @throws Exception
	 */
	public boolean hl_operationAccount(Account oldAccount, Account newAccount,AccountDetail accountDetail,Logs logs) throws Exception;
}
