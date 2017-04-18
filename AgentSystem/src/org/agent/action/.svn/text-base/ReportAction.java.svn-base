package org.agent.action;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.sql.DataSource;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

import org.agent.common.Constants;
import org.agent.pojo.Account;
import org.agent.pojo.AccountDetail;
import org.agent.pojo.ReportProduct;
import org.agent.service.accountdetail.AccountDetailService;
import org.agent.service.report.ReportService;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;


public class ReportAction extends BaseAction {
	private static final long serialVersionUID = -4883697932636073751L;
	private Logger logger = Logger.getLogger(ReportAction.class);
	private Integer reportType;
	private java.sql.Date startTime;
	private Date endTime;
	
	private List<Account> accountList;
	private List<AccountDetail> accountDetailList;
	List<ReportProduct> reportProductList;
	
	@Autowired
	private AccountDetailService accountDetailService;
	@Autowired
	private ReportService reportService;
	
	private void reportExcelSQL(String jasperPath,String sql,String fileName,Connection conn,PreparedStatement ps,Map parameters){
		ResultSet rs = null;
		File reportFile = new File(this.getRequest().getRealPath("/reports/"+jasperPath));
		if(reportFile != null && reportFile.exists()){
			try {
				rs = ps.executeQuery();
				byte[] bytes = null;
				JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(),parameters,new JRResultSetDataSource(rs));
		        JRXlsExporter exporter = new JRXlsExporter();
		        ByteArrayOutputStream xlsReport = new ByteArrayOutputStream();
		        exporter.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
		        exporter.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, xlsReport);
		        exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE); // 删除记录最下面的空行
		        exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,Boolean.FALSE);// 删除多余的ColumnHeader
		        exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);// 显示边框
		        exporter.exportReport();
		        bytes = xlsReport.toByteArray();
		       
		        //System.out.println(bytes.length);
		        if (bytes != null && bytes.length > 0)
		        {
		        	this.getResponse().setContentType("textml;charset=UTF-8");
		        	this.getResponse().setContentType("application/vnd.ms-excel");
		        	this.getResponse().setHeader("Content-Disposition", "attachment;filename="+fileName);
		        	this.getResponse().setContentLength(bytes.length);
		        	ServletOutputStream out = this.getServletOutputStream();
		        	out.write(bytes,0,bytes.length);
		        	out.flush();
		        	this.closeServletOutputStream(out);
		        }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if(conn != null){
					try {
						rs.close();
						ps.close();
						conn.close();
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					conn = null;
					rs = null;
					ps = null;
				}
				if(reportFile != null){
					reportFile = null;
				}
			}
		}else{
			logger.error("++++++++++++++++go else");
		}
		this.getOut().write("对不起，系统原因或者查询错误导致报表没有生成，请重试。");
		this.closeOut(this.getOut());
	}
	
	private void reportPdfSQL(String jasperPath,String sql,String fileName,Connection conn,PreparedStatement ps,Map parameters){
		ResultSet rs = null;
		File reportFile = new File(this.getRequest().getRealPath("/reports/"+jasperPath));
		if(reportFile != null && reportFile.exists()){
			try {
				rs = ps.executeQuery();
				logger.error("+++++++++++++"+conn);
				byte[] bytes = null;
				bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),parameters,new JRResultSetDataSource(rs));
				
		        if (bytes != null && bytes.length > 0)
		        {
		        	this.getResponse().setContentType("textml;charset=UTF-8");
		        	this.getResponse().setContentType("application/pdf");
		        	this.getResponse().setHeader("Content-Disposition", "attachment;filename="+fileName);
		        	this.getResponse().setContentLength(bytes.length);
		        	ServletOutputStream out = this.getServletOutputStream();
		        	out.write(bytes,0,bytes.length);
		        	out.flush();
		        	this.closeServletOutputStream(out);
		        }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if(conn != null){
					try {
						rs.close();
						ps.close();
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					conn = null;
					rs = null;
					ps = null;
				}
				if(reportFile != null){
					reportFile = null;
				}
			}
		}else{
			logger.error("++++++++++++++++go else");
		}
		this.getOut().write("对不起，系统原因或者查询错误导致报表没有生成，请重试。");
		this.closeOut(this.getOut());
		
	}
	
	
	public void reportYfkPdf(){
		DataSource dataSource =  (DataSource)Constants.cxt.getBean("dataSource");
		String  sql = "";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dataSource.getConnection();
			if(null != startTime && null != endTime){
				sql = "SELECT detail.memo,detail.money,detail.accountMoney,detail.memo,detail.detailDateTime,user.userName FROM as_accountdetail as detail,as_user as user "+
						" where user.id = detail.userId and detail.detailType = 9999 and"+
						" detail.detailDateTime >= ? and detail.detailDateTime <= ? "+
						" order by detail.detailDateTime desc";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,startTime);
				ps.setDate(2, endTime);
			}else if(null != startTime && null == endTime){
				sql = "SELECT detail.memo,detail.money,detail.accountMoney,detail.memo,detail.detailDateTime,user.userName FROM as_accountdetail as detail,as_user as user "+
						" where user.id = detail.userId and detail.detailType = 9999 and"+
						" detail.detailDateTime >= ? "+
						" order by detail.detailDateTime desc";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,startTime);
			}else if(null == startTime && null != endTime){
				sql = "SELECT detail.memo,detail.money,detail.accountMoney,detail.memo,detail.detailDateTime,user.userName FROM as_accountdetail as detail,as_user as user "+
						" where user.id = detail.userId and detail.detailType = 9999 and"+
						" detail.detailDateTime <= ? "+
						" order by detail.detailDateTime desc";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,endTime);
			}else{
				sql = "SELECT detail.memo,detail.money,detail.accountMoney,detail.memo,detail.detailDateTime,user.userName FROM as_accountdetail as detail,as_user as user "+
						" where user.id = detail.userId and detail.detailType = 9999"+
						" order by detail.detailDateTime desc";
				ps =  conn.prepareStatement(sql);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		reportPdfSQL("yufukuanReport.jasper",sql,"PrepaymentReport.pdf",conn,ps,null);
	}
	public void reportYfkExcel(){
		DataSource dataSource =  (DataSource)Constants.cxt.getBean("dataSource");
		String  sql = "";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dataSource.getConnection();
			if(null != startTime && null != endTime){
				sql = "SELECT detail.memo,detail.money,detail.accountMoney,detail.memo,detail.detailDateTime,user.userName FROM as_accountdetail as detail,as_user as user "+
						" where user.id = detail.userId and detail.detailType = 9999 and"+
						" detail.detailDateTime >= ? and detail.detailDateTime <= ? "+
						" order by detail.detailDateTime desc";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,startTime);
				ps.setDate(2, endTime);
			}else if(null != startTime && null == endTime){
				sql = "SELECT detail.memo,detail.money,detail.accountMoney,detail.memo,detail.detailDateTime,user.userName FROM as_accountdetail as detail,as_user as user "+
						" where user.id = detail.userId and detail.detailType = 9999 and"+
						" detail.detailDateTime >= ? "+
						" order by detail.detailDateTime desc";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,startTime);
			}else if(null == startTime && null != endTime){
				sql = "SELECT detail.memo,detail.money,detail.accountMoney,detail.memo,detail.detailDateTime,user.userName FROM as_accountdetail as detail,as_user as user "+
						" where user.id = detail.userId and detail.detailType = 9999 and"+
						" detail.detailDateTime <= ? "+
						" order by detail.detailDateTime desc";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,endTime);
			}else{
				sql = "SELECT detail.memo,detail.money,detail.accountMoney,detail.memo,detail.detailDateTime,user.userName FROM as_accountdetail as detail,as_user as user "+
						" where user.id = detail.userId and detail.detailType = 9999"+
						" order by detail.detailDateTime desc";
				ps =  conn.prepareStatement(sql);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		reportExcelSQL("yufukuanReport.jasper",sql,"PrepaymentReport.xls",conn,ps,null);
	}
	public void reportDlsPdf(){
		DataSource dataSource =  (DataSource)Constants.cxt.getBean("dataSource");
		String  sql = "";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dataSource.getConnection();
			if(null != startTime && null != endTime){
				sql = "select detail.*,user.userName from agentsystemdb.as_accountdetail as detail,agentsystemdb.as_user as user where "+
						" user.id = detail.userId"+
						" and detail.detailDateTime >= ? "+
						" and ? >= detail.detailDateTime "+
						" order by detail.userId asc, detail.detailDateTime asc";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,startTime);
				ps.setDate(2, endTime);
			}else if(null != startTime && null == endTime){
				sql = "select detail.*,user.userName from agentsystemdb.as_accountdetail as detail,agentsystemdb.as_user as user where "+
						" user.id = detail.userId"+
						" and detail.detailDateTime >= ? "+
						" order by detail.userId asc, detail.detailDateTime asc";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,startTime);
			}else if(null == startTime && null != endTime){
				sql = "select detail.*,user.userName from agentsystemdb.as_accountdetail as detail,agentsystemdb.as_user as user where "+
						" user.id = detail.userId"+
						" and ? >= detail.detailDateTime "+
						" order by detail.userId asc, detail.detailDateTime asc";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,endTime);
			}else{
				sql = "select detail.*,user.userName from agentsystemdb.as_accountdetail as detail,agentsystemdb.as_user as user where "+
						" user.id = detail.userId"+
						" order by detail.userId asc, detail.detailDateTime asc";
				ps =  conn.prepareStatement(sql);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		reportPdfSQL("agentReport.jasper",sql,"AgentsFlowReport.pdf",conn,ps,null);
	}
	public void reportDlsExcel(){
		DataSource dataSource =  (DataSource)Constants.cxt.getBean("dataSource");
		String  sql = "";
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = dataSource.getConnection();
			
			/*
			 select detail.*,user.userName from agentsystemdb.as_accountdetail as detail,agentsystemdb.as_user as user 
 	<trim prefix="where" prefixOverrides="and | or">
			and user.id = detail.userId 
			<if test="startTime != null and endTime != null">
				and detail.detailDateTime >= #{startTime} 
				and #{endTime} >= detail.detailDateTime
			</if>
			<if test="startTime != null and endTime == null">
				and detail.detailDateTime >= #{startTime} 
			</if>
			<if test="endTime != null and startTime == null">
				and #{endTime} >= detail.detailDateTime
			</if>
		</trim>
	order by detail.userId asc, detail.detailDateTime asc
			 */
			
			
			
			if(null != startTime && null != endTime){
				sql = "select detail.*,user.userName from agentsystemdb.as_accountdetail as detail,agentsystemdb.as_user as user where "+
						" user.id = detail.userId"+
						" and detail.detailDateTime >= ? "+
						" and ? >= detail.detailDateTime "+
						" order by detail.userId asc, detail.detailDateTime asc";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,startTime);
				ps.setDate(2, endTime);
			}else if(null != startTime && null == endTime){
				sql = "select detail.*,user.userName from agentsystemdb.as_accountdetail as detail,agentsystemdb.as_user as user where "+
						" user.id = detail.userId"+
						" and detail.detailDateTime >= ? "+
						" order by detail.userId asc, detail.detailDateTime asc";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,startTime);
			}else if(null == startTime && null != endTime){
				sql = "select detail.*,user.userName from agentsystemdb.as_accountdetail as detail,agentsystemdb.as_user as user where "+
						" user.id = detail.userId"+
						" and ? >= detail.detailDateTime "+
						" order by detail.userId asc, detail.detailDateTime asc";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,endTime);
			}else{
				sql = "select detail.*,user.userName from agentsystemdb.as_accountdetail as detail,agentsystemdb.as_user as user where "+
						" user.id = detail.userId"+
						" order by detail.userId asc, detail.detailDateTime asc";
				ps =  conn.prepareStatement(sql);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		reportExcelSQL("agentReport.jasper",sql,"AgentsFlowReport.xls",conn,ps,null);
	}
	public void reportRroductExcel(){
		DataSource dataSource =  (DataSource)Constants.cxt.getBean("dataSource");
		String  sql = "";
		Connection conn = null;
		PreparedStatement ps = null;
		Map parames = new HashMap();
		try {
			conn = dataSource.getConnection();
			if(null != startTime && null != endTime){
				sql = 	"select systemconfig.configTypeName,count(1) as number,sum(price) as price from as_keywords as keywords,as_systemconfig as systemconfig where (keywords.productType = systemconfig.id) and keywords.isUse = 1 and keywords.checkStatus = 2 and systemconfig.configType = 2 "+
						" and keywords.regDatetime >= ? "+
						" and ? >= keywords.regDatetime "+
						" group by systemconfig.id";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,startTime);
				ps.setDate(2, endTime);
			}else if(null != startTime && null == endTime){
				sql =	"select systemconfig.configTypeName,count(1) as number,sum(price) as price from as_keywords as keywords,as_systemconfig as systemconfig where (keywords.productType = systemconfig.id) and keywords.isUse = 1 and keywords.checkStatus = 2 and systemconfig.configType = 2 "+
						" and keywords.regDatetime >= ? "+
						" group by systemconfig.id";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,startTime);
			}else if(null == startTime && null != endTime){
				sql = "select systemconfig.configTypeName,count(1) as number,sum(price) as price from as_keywords as keywords,as_systemconfig as systemconfig where (keywords.productType = systemconfig.id) and keywords.isUse = 1 and keywords.checkStatus = 2 and systemconfig.configType = 2 "+
						" and ? >= keywords.regDatetime "+
						" group by systemconfig.id";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,endTime);
			}else{
				sql = "select systemconfig.configTypeName,count(1) as number,sum(price) as price from as_keywords as keywords,as_systemconfig as systemconfig where (keywords.productType = systemconfig.id) and keywords.isUse = 1 and keywords.checkStatus = 2 and systemconfig.configType = 2 "+
						" group by systemconfig.id";
				ps =  conn.prepareStatement(sql);
			}
			parames.put("title", "产品分类数量/金额报表");
		}catch(Exception e){
			e.printStackTrace();
		}
		reportExcelSQL("productReport.jasper",sql,"productReport.xls",conn,ps,null);
	}
	public void reportProductPdf(){
		DataSource dataSource =  (DataSource)Constants.cxt.getBean("dataSource");
		String  sql = "";
		Connection conn = null;
		PreparedStatement ps = null;
		Map parames = new HashMap();
		try {
			conn = dataSource.getConnection();
			if(null != startTime && null != endTime){
				sql = 	"select systemconfig.configTypeName,count(1) as number,sum(price) as price from as_keywords as keywords,as_systemconfig as systemconfig where (keywords.productType = systemconfig.id) and keywords.isUse = 1 and keywords.checkStatus = 2 and systemconfig.configType = 2 "+
						" and keywords.regDatetime >= ? "+
						" and ? >= keywords.regDatetime "+
						" group by systemconfig.id";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,startTime);
				ps.setDate(2, endTime);
			}else if(null != startTime && null == endTime){
				sql =	"select systemconfig.configTypeName,count(1) as number,sum(price) as price from as_keywords as keywords,as_systemconfig as systemconfig where (keywords.productType = systemconfig.id) and keywords.isUse = 1 and keywords.checkStatus = 2 and systemconfig.configType = 2 "+
						" and keywords.regDatetime >= ? "+
						" group by systemconfig.id";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,startTime);
			}else if(null == startTime && null != endTime){
				sql = "select systemconfig.configTypeName,count(1) as number,sum(price) as price from as_keywords as keywords,as_systemconfig as systemconfig where (keywords.productType = systemconfig.id) and keywords.isUse = 1 and keywords.checkStatus = 2 and systemconfig.configType = 2 "+
						" and ? >= keywords.regDatetime "+
						" group by systemconfig.id";
				ps =  conn.prepareStatement(sql);
				ps.setDate(1,endTime);
			}else{
				sql = "select systemconfig.configTypeName,count(1) as number,sum(price) as price from as_keywords as keywords,as_systemconfig as systemconfig where (keywords.productType = systemconfig.id) and keywords.isUse = 1 and keywords.checkStatus = 2 and systemconfig.configType = 2 "+
						" group by systemconfig.id";
				ps =  conn.prepareStatement(sql);
			}
			parames.put("title", "产品分类数量/金额报表");
		}catch(Exception e){
			e.printStackTrace();
		}
		reportPdfSQL("productReport.jasper",sql,"productReport.pdf",conn,ps,parames);
	}
	
	
	public void reportFileExcel(){
		File reportFile = new File(this.getRequest().getRealPath("/reports/accountBalance.jasper"));
		if(reportFile != null && reportFile.exists()){
			Connection conn = null;
			DataSource dataSource =  (DataSource)Constants.cxt.getBean("dataSource");
			try {
				conn = dataSource.getConnection();
				logger.error("+++++++++++++"+conn);
				byte[] bytes = null;
				JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(),null,conn);
		        JRXlsExporter exporter = new JRXlsExporter();
		        ByteArrayOutputStream xlsReport = new ByteArrayOutputStream();
		        exporter.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
		        exporter.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, xlsReport);
		        exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE); // 删除记录最下面的空行
		        exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,Boolean.FALSE);// 删除多余的ColumnHeader
		        exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);// 显示边框
		        exporter.exportReport();
		        bytes = xlsReport.toByteArray();
		       
		        //System.out.println(bytes.length);
		        if (bytes != null && bytes.length > 0)
		        {this.getResponse().setContentType("textml;charset=UTF-8");
		        this.getResponse().setContentType("application/vnd.ms-excel");
		        this.getResponse().setHeader("Content-Disposition", "attachment;filename=AgentsBalanceReport.xls");
		        this.getResponse().setContentLength(bytes.length);
				ServletOutputStream out = this.getServletOutputStream();
				out.write(bytes,0,bytes.length);
				out.flush();
				this.closeServletOutputStream(out);
		        }
				
				
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					conn = null;
				}
				if(reportFile != null){
					reportFile = null;
				}
			}
		}else{
			logger.error("++++++++++++++++go else");
		}
		this.getOut().write("对不起，系统原因或者查询错误导致报表没有生成，请重试。");
		this.closeOut(this.getOut());
	}
	
	public void reportFile(){
		File reportFile = new File(this.getRequest().getRealPath("/reports/accountBalance.jasper"));
		if(reportFile != null && reportFile.exists()){
			Connection conn = null;
			DataSource dataSource =  (DataSource)Constants.cxt.getBean("dataSource");
			try {
				conn = dataSource.getConnection();
				logger.error("+++++++++++++"+conn);
				byte[] bytes = null;
				bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),null,conn);
		        if (bytes != null && bytes.length > 0)
		        {this.getResponse().setContentType("textml;charset=UTF-8");
		        this.getResponse().setContentType("application/pdf");
		        this.getResponse().setHeader("Content-Disposition", "attachment;filename=AgentsBalanceReport.pdf");
		        this.getResponse().setContentLength(bytes.length);
				ServletOutputStream out = this.getServletOutputStream();
				out.write(bytes,0,bytes.length);
				out.flush();
				this.closeServletOutputStream(out);
		        }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					conn = null;
				}
				if(reportFile != null){
					reportFile = null;
				}
			}
		}else{
			logger.error("++++++++++++++++go else");
		}
		this.getOut().write("对不起，系统原因或者查询错误导致报表没有生成，请重试。");
		this.closeOut(this.getOut());
	}
	
	
	public String report(){
		if(reportType != null && reportType > 0 && reportType < 900){
			if(reportType == 1){
				//代理商余额报表
				Account account = new Account();
				try {
					accountList = reportService.accountBalance(account);
					logger.error("^^^^^^^^^^^^^^^^"+reportType + "^^^^^^^" + accountList.size());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(reportType == 2){
				//预付款流水报表
				logger.error("^^^^^^^^^^^^^^^^"+reportType);
				AccountDetail accountDetail = new AccountDetail();
				accountDetail.setStartTime(startTime);
				if (null != endTime) {
					DateFormat df = DateFormat.getDateInstance();
					String dfString  = df.format(endTime)+" 23:59:59";
					SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					try {
						accountDetail.setEndTime(sdf.parse(dfString));
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				accountDetail.setDetailType(9999);
				accountDetail.setStarNum(0);
				accountDetail.setPageSize(99999);
				try {
					accountDetailList = accountDetailService.getAccountDetailList(accountDetail);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(reportType == 3){
				//代理商流水报表
				logger.error("^^^^^^^^^^^^^^^^"+reportType);
				AccountDetail accountDetail = new AccountDetail();
				accountDetail.setStartTime(startTime);
				if (null != endTime) {
					DateFormat df = DateFormat.getDateInstance();
					String dfString  = df.format(endTime)+" 23:59:59";
					SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					try {
						accountDetail.setEndTime(sdf.parse(dfString));
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				try {
					accountDetailList = accountDetailService.repostAgentDetail(accountDetail);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(reportType == 4){
				//产品分类数量/金额汇总
				try {
					ReportProduct reportProduct = new ReportProduct();
					reportProduct.setStartTime(startTime);
					if (null != endTime) {
						DateFormat df = DateFormat.getDateInstance();
						String dfString  = df.format(endTime)+" 23:59:59";
						SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						reportProduct.setEndTime(sdf.parse(dfString));
					}
					reportProductList = reportService.reportProduct(reportProduct);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				logger.error("^^^^^^^^^^^^^^^^"+reportType);
			}else if(reportType == 5){
				//客户消费汇总
				logger.error("^^^^^^^^^^^^^^^^"+reportType);
				/*
				 * select keywords.agentName,c.customName,sum(price) as price from as_customs as  c, as_keywords as keywords where c.id = keywords.customId
group by c.id
				 */
			}
		}
		return SUCCESS;
	}

	public Integer getReportType() {
		return reportType;
	}

	public void setReportType(Integer reportType) {
		this.reportType = reportType;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public List<Account> getAccountList() {
		return accountList;
	}

	public void setAccountList(List<Account> accountList) {
		this.accountList = accountList;
	}
	public List<AccountDetail> getAccountDetailList() {
		return accountDetailList;
	}
	public void setAccountDetailList(List<AccountDetail> accountDetailList) {
		this.accountDetailList = accountDetailList;
	}

	public List<ReportProduct> getReportProductList() {
		return reportProductList;
	}

	public void setReportProductList(List<ReportProduct> reportProductList) {
		this.reportProductList = reportProductList;
	}
	
	
}
