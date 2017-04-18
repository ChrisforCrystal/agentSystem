package org.agent.service.keywords;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.agent.pojo.Keywords;
import org.agent.pojo.User;

public interface KeywordsService {
	/**
	 * getList
	 * @return
	 */
	public List<Keywords> getList() throws Exception;
	/**
	 * 
	 * @param keywords
	 * @return
	 * @throws Exception
	 */
	public Integer count(Keywords keywords) throws Exception;
	/**
	 * getKeywordsById
	 * @param keywords
	 * @return
	 */
	public Keywords getKeywordsById(Keywords keywords) throws Exception;
	/**
	 * getKeywordsBySearch
	 * @param keywords
	 * @return
	 */
	public List<Keywords> getKeywordsBySearch(Keywords keywords) throws Exception;
	/**
	 * modifyKeywords
	 * @param keywords
	 * @return
	 */
	public int modifyKeywords(Keywords keywords) throws Exception;
	/**
	 * addKeywords
	 * @param keywords
	 * @return
	 */
	public int addKeywords(Keywords keywords)  throws Exception;
	/**
	 * deleteKeywords
	 * @param keywords
	 * @return
	 */
	public int deleteKeywords(Keywords keywords)  throws Exception;
	/**
	 * getKeywordsByKeyword
	 * @param keywords
	 * @return
	 * @throws Exception
	 */
	public Keywords getKeywordsByKeyword(Keywords keywords) throws Exception;
	/**
	 * hl_SaveKeywords
	 * @throws Exception
	 */
	public void hl_SaveKeywords(Keywords keywords,User user,Date date) throws Exception;
	/**
	 * hl_changeStatusToOK
	 * @param keywords
	 * @param user
	 * @param date
	 * @throws Exception
	 */
	public void hl_changeStatusToOK(Keywords keywords ,User user ,Date date) throws Exception;
	/**
	 * hl_changeStatusToNo
	 * @param keywords
	 * @param user
	 * @param date
	 * @throws Exception
	 */
	public void hl_changeStatusToNo(Keywords keywords ,User user ,Date date) throws Exception;
	/**
	 * hl_keywordsXuFei
	 * @param keywords
	 * @param date
	 * @throws Exception
	 */
	public void hl_keywordsXuFei(Keywords keywords,String productType 
			,String xufeiYears,BigDecimal price,Date date)throws Exception;
	
	/**
	 * portalcount
	 * @param keywords
	 * @return
	 * @throws Exception
	 */
	public int portalcount(Keywords keywords) throws Exception;
	
	/**
	 * getPortalBySearch
	 * @param keywords
	 * @return
	 * @throws Exception
	 */
	public List<Keywords> getPortalBySearch(Keywords keywords) throws Exception;
}
