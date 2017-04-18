<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
Object sessionObject = session.getAttribute("install");
if(null == sessionObject){
	response.sendRedirect("/install/index.jsp");
}

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


String dbname = null;
String dbusername = null;
String dbpassword = null;
String dbaddress = null;
try{
dbname = request.getParameter("dbname");
dbusername = request.getParameter("dbusername");
dbpassword = request.getParameter("dbpassword");
dbaddress = request.getParameter("dbaddress");
}catch(Exception e){
	dbname = null;
	dbusername = null;
	dbpassword = null;
	dbaddress = null;
}



%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>AgentSystem 安装-数据库信息验证</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	html,body,img{margin: 0px;padding: 0px;}
	body{font-size:12px;line-height:20px;background: #efefef;color:#333;}
	div,p{background: #fff;}
		.logo{
			margin:20px;
			padding:20px;
			
		}
		.content{
			padding:20px;
		}
		ul{list-style: none;
		padding:10px;
		}
	</style>
  </head>
  
  <body>
    <div class="logo">
    	<div><img src="/imgs/logo.jpg" width="200px"/></div>
    	<div class="content">
    		<%
    			boolean isok = false;
    			String linkStr = "";
    			if(dbname!=null && dbusername!=null && dbpassword !=null && dbaddress != null){
    			Connection conn = null;
    			try{
    				Class.forName("com.mysql.jdbc.Driver").newInstance();
    				linkStr = "jdbc:mysql://"+dbaddress+":3306/"+dbname+"?useUnicode=true&characterEncoding=UTF-8";
    				conn = DriverManager.getConnection(linkStr,dbusername,dbpassword);
    				if(conn != null && !conn.isClosed()){
    					
    					String jdbcStr = "driverClassName=com.mysql.jdbc.Driver\n";
    					jdbcStr += ("url="+linkStr);
    					jdbcStr += ("\nusername="+dbusername);
    					jdbcStr += ("\npassword="+dbpassword);
    					jdbcStr += ("\nminIdle=50");
    					jdbcStr += ("\nmaxIdle=500");
    					jdbcStr += ("\ninitialSize=10");
    					jdbcStr += ("\nmaxActive=1000");
    					jdbcStr += ("\nmaxWait=2000");
    					jdbcStr += ("\nremoveAbandonedTimeout=180");
    					jdbcStr += ("\nremoveAbandoned=true");
    					
    					session.setAttribute("dbname", dbname);
    					session.setAttribute("dbusername", dbusername);
    					session.setAttribute("dbpassword", dbpassword);
    					session.setAttribute("dbaddress", dbaddress);
    					session.setAttribute("dbinfo", jdbcStr);
    				
    					isok = true;
    			%>
    			<p>
    			非常好！您已顺利完成安装中的这一步骤，AgentSystem已经可以和您的数据库通讯。若您准备好了。现在就...
    			</p>
    			<input id="installbutton" type="button" value="进行安装" onclick="window.location.href='/install/welcome.jsp';"/>
    			<%
    				}else{
    				isok = false;
    				}
    				conn.close();
    				}catch(Exception e){
    				e.printStackTrace();
    					isok = false;
    				}finally{
    					if(conn != null){
    						conn.close();
    						conn = null;
    					}
    				}
    		 %>
    		<%}else{ isok = false;} %>
    		
    		<%
    			if(!isok){
    		 %>
    		<p>
    		对不起，您提供的数据库的有关信息不能够正常进行连接，如果您不太清楚，请先联系您的空间提供商...
    		</p>
    		<input type="button" value="返回重新填写" onclick="window.history.back(-1);"/>
    		<%} %>
    	</div>
    </div>
  </body>
</html>
