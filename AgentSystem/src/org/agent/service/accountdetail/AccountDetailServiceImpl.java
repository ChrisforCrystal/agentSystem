package org.agent.service.accountdetail;

import java.util.List;

import org.agent.dao.accountdetail.AccountDetailMapper;
import org.agent.pojo.AccountDetail;
import org.springframework.beans.factory.annotation.Autowired;

public class AccountDetailServiceImpl implements AccountDetailService {
	@Autowired
	private AccountDetailMapper mapper;
	@Override
	public List<AccountDetail> getAccountDetailList(AccountDetail accountDetail) throws Exception{
		// TODO Auto-generated method stub
		return mapper.getAccountDetailList(accountDetail);
	}

	@Override
	public int addAccountDetail(AccountDetail accountDetail)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addAccountDetail(accountDetail);
	}

	@Override
	public int modifyAccountDetail(AccountDetail accountDetail)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.modifyAccountDetail(accountDetail);
	}

	@Override
	public int deleteAccountDetail(AccountDetail accountDetail)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.deleteAccountDetail(accountDetail);
	}

	@Override
	public Integer count(AccountDetail accountDetail)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.count(accountDetail);
	}

	@Override
	public List<AccountDetail> repostAgentDetail(AccountDetail accountDetail)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.repostAgentDetail(accountDetail);
	}

}
