package org.agent.dao.account;

import java.util.List;

import org.agent.pojo.Account;;

public interface AccountMapper {
	
	/**
	 * getAccountList
	 * @param account
	 * @return
	 */
	public List<Account> getAccountList(Account account) throws Exception;
	
	/**
	 * getAccount
	 * @param account
	 * @return
	 */
	public Account getAccount(Account account) throws Exception;
	
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
}
