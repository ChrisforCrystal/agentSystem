package org.agent.service.report;

import java.util.List;

import org.agent.dao.report.ReportMapper;
import org.agent.pojo.Account;
import org.agent.pojo.ReportProduct;
import org.springframework.beans.factory.annotation.Autowired;

public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportMapper mapper;
	
	@Override
	public List<Account> accountBalance(Account account) throws Exception {
		// TODO Auto-generated method stub
		return mapper.accountBalance(account);
	}


	@Override
	public List<ReportProduct> reportProduct(ReportProduct reportProduct) throws Exception {
		// TODO Auto-generated method stub
		return mapper.reportProduct(reportProduct);
	}

}
