package org.agent.dao.user;

import java.util.List;

import org.agent.pojo.User;

public interface UserMapper {
	
	/**
	 * getUserList
	 * @return
	 */
	public List<User> getUserList(User user) throws Exception;
	/**
	 * getAddUserId
	 * @return
	 * @throws Exception
	 */
	public int getAddUserId() throws Exception;
	
	/**
	 * getUserListBySearch
	 * @param user
	 * @return
	 */
	public List<User> getUserListBySearch(User user) throws Exception;
	
	/**
	 * getUser
	 * @param user
	 * @return
	 */
	public User getUser(User user) throws Exception;
	
	/**
	 * addUser
	 * @param user
	 * @return
	 */
	public int addUser(User user) throws Exception;
	
	/**
	 * modifyUser
	 * @param user
	 * @return
	 */
	public int modifyUser(User user) throws Exception;
	
	/**
	 * deleteUser
	 * @param user
	 * @return
	 */
	public int deleteUser(User user) throws Exception;
	
	/**
	 * count
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public int count(User user) throws Exception;
	/**
	 * isExitLoginUser
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public int isExitLoginUser(User user) throws Exception;
	
	/**
	 * getLoginUser
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public User getLoginUser(User user) throws Exception;
	
}
