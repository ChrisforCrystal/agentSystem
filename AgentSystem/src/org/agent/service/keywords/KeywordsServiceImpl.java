package org.agent.service.keywords;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.agent.common.TimeFormat;
import org.agent.dao.account.AccountMapper;
import org.agent.dao.accountdetail.AccountDetailMapper;
import org.agent.dao.keywords.KeywordsMapper;
import org.agent.dao.logs.LogsMapper;
import org.agent.dao.systemconfig.SystemConfigMapper;
import org.agent.pojo.Account;
import org.agent.pojo.AccountDetail;
import org.agent.pojo.Keywords;
import org.agent.pojo.Logs;
import org.agent.pojo.SystemConfig;
import org.agent.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;

public class KeywordsServiceImpl implements KeywordsService {

	@Autowired
	private KeywordsMapper mapper;
	@Autowired
	private AccountMapper accountMapper;
	@Autowired
	private LogsMapper logsMapper;
	@Autowired
	private AccountDetailMapper accountDetailMapper;
	@Autowired
	private SystemConfigMapper systemConfigMapper;
	
	
	@Override
	public List<Keywords> getList()  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public Keywords getKeywordsById(Keywords keywords)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getKeywordsById(keywords);
	}

	@Override
	public List<Keywords> getKeywordsBySearch(Keywords keywords)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getKeywordsBySearch(keywords);
	}

	@Override
	public int modifyKeywords(Keywords keywords)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.modifyKeywords(keywords);
	}

	@Override
	public int addKeywords(Keywords keywords)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addKeywords(keywords);
	}

	@Override
	public int deleteKeywords(Keywords keywords)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.deleteKeywords(keywords);
	}

	@Override
	public Keywords getKeywordsByKeyword(Keywords keywords) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getKeywordsByKeyword(keywords);
	}

	@Override
	public void hl_SaveKeywords(Keywords keywords, User user,Date date) throws Exception {
		// TODO Auto-generated method stub
		//save keywords
		mapper.addKeywords(keywords);
		//save account
		Account account = new Account();
		account.setUserId(user.getId());
		account = accountMapper.getAccount(account);
		account.setMoney(account.getMoney().subtract(keywords.getPreRegFrozenMoney()));
		account.setMoneyBak(account.getMoney());
		accountMapper.modifyAccount(account);
		//save accountDetail
		AccountDetail accountDetail = new AccountDetail();
		accountDetail.setUserId(user.getId());
		//预注册冻结资金 类型ID号为9999
		accountDetail.setDetailType(9999);
		accountDetail.setDetailTypeName("预注册冻结资金");
		accountDetail.setMoney(new BigDecimal(0).subtract(keywords.getPreRegFrozenMoney()));
		accountDetail.setAccountMoney(account.getMoney());
		accountDetail.setMemo(user.getUserName() + "对" + keywords.getKeywords() + "进行关键词申请预注册操作，冻结资金：" + keywords.getPreRegFrozenMoney().toString());
		accountDetail.setDetailDateTime(date);
		accountDetailMapper.addAccountDetail(accountDetail);
		//save logs
		Logs logs = new Logs();
		logs.setUserId(user.getId());
		logs.setUserName(user.getUserName());
		logs.setOperateInfo(user.getUserName() + "对" + keywords.getKeywords() + "进行关键词申请预注册操作，冻结资金：" + keywords.getPreRegFrozenMoney().toString());
		logs.setOperateDatetime(date);
		logsMapper.addLogs(logs);
	}

	@Override
	public Integer count(Keywords keywords) throws Exception {
		// TODO Auto-generated method stub
		return mapper.count(keywords);
	}

	@Override
	public void hl_changeStatusToOK(Keywords keywords, User user, Date date)
			throws Exception {
		// TODO Auto-generated method stub
		/*
		 * 首先修改关键词的状态
		 * 然后先返还申请注册时冻结的资金
		 * 最后再在总账户中扣除掉正式注册所需的所有资金
		 * 最后记录流水和日志
		 * 此次操作流水记录两次，一次是返还冻结资金的流水，一次是扣除正式注册的所需资金
		 */
		int status = keywords.getCheckStatus();
		keywords = mapper.getKeywordsById(keywords);
		keywords.setCheckStatus(status);
	
		//返还冻结资金
		//save account
		Account account = new Account();
		account.setUserId(keywords.getAgentId());
		account = accountMapper.getAccount(account);
		account.setMoney(account.getMoney().add(keywords.getPreRegFrozenMoney()));
		account.setMoneyBak(account.getMoney());
		accountMapper.modifyAccount(account);
		//save accountDetail
		AccountDetail accountDetail = new AccountDetail();
		accountDetail.setUserId(user.getId());
		//返回预注册冻结资金 类型ID号为9998
		accountDetail.setDetailType(9998);
		accountDetail.setDetailTypeName("返还预注册冻结资金");
		accountDetail.setMoney(keywords.getPreRegFrozenMoney());
		accountDetail.setAccountMoney(account.getMoney());
		accountDetail.setMemo(user.getUserName() + "对" + keywords.getKeywords() + "进行关键词申请审核通过操作，返还冻结资金：" + keywords.getPreRegFrozenMoney().toString());
		accountDetail.setDetailDateTime(date);
		accountDetailMapper.addAccountDetail(accountDetail);
		
		//正式通过审核后进行扣款操作
		account.setMoney(account.getMoney().subtract(keywords.getPrice()));
		account.setMoneyBak(account.getMoney());
		accountMapper.modifyAccount(account);
		//save accountDetail
		accountDetail = new AccountDetail();
		accountDetail.setUserId(user.getId());
		//扣除申请关键词的所有资金 类型ID号为9997
		accountDetail.setDetailType(9997);
		accountDetail.setDetailTypeName("扣除【"+keywords.getKeywords()+"】的正式注册资金。");
		accountDetail.setMoney(keywords.getPrice());
		accountDetail.setAccountMoney(account.getMoney());
		accountDetail.setMemo(user.getUserName() + "对" + keywords.getKeywords() + "进行关键词申请审核通过自动正式扣款操作，扣除正式注册资金：" + keywords.getPrice().toString());
		accountDetail.setDetailDateTime(date);
		accountDetailMapper.addAccountDetail(accountDetail);
		
		keywords.setPreRegFrozenMoney(new BigDecimal(0));
		keywords.setPreRegPassDatetime(keywords.getRegPassDatetime());
		mapper.modifyKeywords(keywords);

		
		//save logs
		Logs logs = new Logs();
		logs.setUserId(user.getId());
		logs.setUserName(user.getUserName());
		logs.setOperateInfo(user.getUserName() + "对" + keywords.getKeywords() + "进行关键词状态修改，状态修改为审核通过,并扣款。");
		logs.setOperateDatetime(date);
		logsMapper.addLogs(logs);
	}

	@Override
	public void hl_changeStatusToNo(Keywords keywords, User user, Date date)
			throws Exception {
		// TODO Auto-generated method stub
		/*
		 * 首先修改关键词的状态
		 * 然后返还申请注册时冻结的资金
		 * 最后记录流水和日志
		 * 此次操作流水记录返还冻结资金的流水
		 */
		int status = keywords.getCheckStatus();
		keywords = mapper.getKeywordsById(keywords);
		keywords.setCheckStatus(status);
		//返还冻结资金
		//save account
		Account account = new Account();
		account.setUserId(keywords.getAgentId());
		account = accountMapper.getAccount(account);
		account.setMoney(account.getMoney().add(keywords.getPreRegFrozenMoney()));
		account.setMoneyBak(account.getMoney());
		accountMapper.modifyAccount(account);
		//save accountDetail
		AccountDetail accountDetail = new AccountDetail();
		accountDetail.setUserId(user.getId());
		//返回预注册冻结资金 类型ID号为9998
		accountDetail.setDetailType(9998);
		accountDetail.setDetailTypeName("返还预注册冻结资金");
		accountDetail.setMoney(keywords.getPreRegFrozenMoney());
		accountDetail.setAccountMoney(account.getMoney());
		accountDetail.setMemo(user.getUserName() + "对" + keywords.getKeywords() + "进行关键词申请不通过操作，返还冻结资金：" + keywords.getPreRegFrozenMoney().toString());
		accountDetail.setDetailDateTime(date);
		accountDetailMapper.addAccountDetail(accountDetail);
		
		keywords.setPreRegFrozenMoney(new BigDecimal(0));
		keywords.setPreRegPassDatetime(TimeFormat.parseStringToDate("2010-01-01 00:01:01"));
		mapper.modifyKeywords(keywords);
		
		
		//save logs
		Logs logs = new Logs();
		logs.setUserId(user.getId());
		logs.setUserName(user.getUserName());
		logs.setOperateInfo(user.getUserName() + "对" + keywords.getKeywords() + "进行关键词状态修改，状态修改为未审核通过,并返还冻结资金"+keywords.getPreRegFrozenMoney()+"。");
		logs.setOperateDatetime(date);
		logsMapper.addLogs(logs);
	}

	@Override
	public int portalcount(Keywords keywords) throws Exception {
		// TODO Auto-generated method stub
		return mapper.portalcount(keywords);
	}

	@Override
	public List<Keywords> getPortalBySearch(Keywords keywords) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getPortalBySearch(keywords);
	}

	@Override
	public void hl_keywordsXuFei(Keywords keywords, String productType,
			String xufeiYears, BigDecimal price, Date date) throws Exception {
		// TODO Auto-generated method stub
		Integer type = Integer.valueOf(productType);
		Integer years = Integer.valueOf(xufeiYears);
		keywords = mapper.getKeywordsById(keywords);
		keywords.setProductType(type);
		keywords.setPrice(keywords.getPrice().add(price));
		keywords.setServiceYears(keywords.getServiceYears() + years);
		Date xufei = keywords.getRegPassDatetime();
		xufei.setYear(xufei.getYear() + years);
		keywords.setRegPassDatetime(xufei);
		//save account
		Account account = new Account();
		account.setUserId(keywords.getAgentId());
		account = accountMapper.getAccount(account);
		account.setMoney(account.getMoney().subtract(price));
		account.setMoneyBak(account.getMoney());
		accountMapper.modifyAccount(account);
		//save accountDetail
		AccountDetail accountDetail = new AccountDetail();
		accountDetail.setUserId(keywords.getAgentId());
		//扣除续费资金 类型ID号为9996
		accountDetail.setDetailType(9996);
		accountDetail.setDetailTypeName("扣除续费资金"+years+"年"+price+"元");
		accountDetail.setMoney(price);
		accountDetail.setAccountMoney(account.getMoney());
		accountDetail.setMemo(keywords.getAgentName() + "对" + keywords.getKeywords() + "进行关键词续费操作，扣除续费资金：" + +years+"年"+price+"元");
		accountDetail.setDetailDateTime(date);
		accountDetailMapper.addAccountDetail(accountDetail);
		
		mapper.modifyKeywords(keywords);
		
		
		
		//save logs
		Logs logs = new Logs();
		logs.setUserId(keywords.getAgentId());
		logs.setUserName(keywords.getAgentName());
		logs.setOperateInfo(keywords.getAgentName() + "对" + keywords.getKeywords() + "进行关键词续费操作，扣除续费资金：" + +years+"年"+price+"元");
		logs.setOperateDatetime(date);
		logsMapper.addLogs(logs);
	}


}
