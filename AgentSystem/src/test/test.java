package test;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperRunManager;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class test {
	@Test
	public void mytest(){
		File reportFile=new File("C:\\Users\\chirs\\report1.jasper");
		
	if(reportFile!=null && reportFile.exists()){
			try {
				FileOutputStream fs=new FileOutputStream("d:\\a.pdf");
				Connection conn=null;
				//获取sql的连接操作  JDBC
			ApplicationContext atx=new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
			DataSource da=atx.getBean("dataSource",DataSource.class);
			conn=da.getConnection();
			//当ireport中没有SQL语句时
			ResultSet rst = conn.prepareStatement("select d.* ,u.userName form as_accountDetail as d, as_user as u where d.userId=u.id")
					.executeQuery();
			/**
			 * 看下面那一句话是不是很厉害
			 */
			//byte[] bytes=JasperRunManager.runReportToPdf(reportFile.getAbsolutePath(), null,new JRResultSetDataSource(rst));
			
				byte[] bytes=JasperRunManager.runReportToPdf(reportFile.getAbsolutePath(), null,conn);
				fs.write(bytes);
				fs.flush();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
	}
	
	@Test
	public void mytest2(){
		File reportFile=new File("C:\\Users\\chirs\\report1.jasper");
		
	if(reportFile!=null && reportFile.exists()){
			try {
				FileOutputStream fs=new FileOutputStream("d:\\b.pdf");
				Connection conn=null;
				//获取sql的连接操作  JDBC
			ApplicationContext atx=new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
			DataSource da=atx.getBean("dataSource",DataSource.class);
			conn=da.getConnection();
			//当ireport中没有SQL语句时
			/**
			 * 注意拼接的时候要加空格~
			 */
			ResultSet rst = conn.prepareStatement(
					"select count(1) as number,sum(price) as price,configTypeName from as_keywords,as_systemconfig " +
					" where as_keywords.productType==as_systemconfig.id group by productType "
					)
					.executeQuery();
			/**
			 * 怎么传递参数？稳的一匹。
			 */
			//byte[] bytes=JasperRunManager.runReportToPdf(reportFile.getAbsolutePath(), null,new JRResultSetDataSource(rst));
			
				Map<String, Object> params=new HashMap();
				params.put("title","产品分类数量/金额汇总");
				byte[] bytes=JasperRunManager.runReportToPdf(reportFile.getAbsolutePath(), params,conn);
				fs.write(bytes);
				fs.flush();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JRException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
	}
}
