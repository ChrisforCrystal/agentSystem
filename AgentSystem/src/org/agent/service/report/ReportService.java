package org.agent.service.report;

import java.util.List;

import org.agent.pojo.Account;
import org.agent.pojo.ReportProduct;

public interface ReportService {
	//代理商余额报表
		//预付款流水报表
		//代理商流水报表
		//产品分类金额汇总
		//产品分类数量汇总
		//客户消费汇总
		/**
		 * accountBalance
		 * @param account
		 * @return
		 * @throws Exception
		 */
		public List<Account> accountBalance(Account account) throws Exception;
		/**
		 * reportProduct
		 * @param reportProduct
		 * @return
		 * @throws Exception
		 */
		public List<ReportProduct> reportProduct(ReportProduct reportProduct) throws Exception;
}
