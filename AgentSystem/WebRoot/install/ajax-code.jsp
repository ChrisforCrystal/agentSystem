<%@page import="org.apache.tools.ant.*"%>
<%@page import="org.apache.tools.ant.taskdefs.*"%>
<%@page import="org.apache.tools.ant.types.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String sitetitle = request.getParameter("sitetitle");
String admin = request.getParameter("admin");
String adminpwd = request.getParameter("adminpwd");
String dbinfo = (String)session.getAttribute("dbinfo");
String dbname = (String)session.getAttribute("dbname");
String dbusername = (String)session.getAttribute("dbusername");
String dbpassword = (String)session.getAttribute("dbpassword");
String dbaddress = (String)session.getAttribute("dbaddress");
String root = request.getRealPath("/");
if(sitetitle != null &&admin != null &&adminpwd != null &&dbinfo != null){session.setAttribute("admin", admin);
try{
String jdbcPath = root + File.separator + "WEB-INF" + File.separator + "classes" + File.separator + "jdbc.properties"; 
File file = new File(jdbcPath);
if(!file.exists()){
file.createNewFile();
}else{
	PrintWriter fout = new PrintWriter(file);
	fout.write(dbinfo);
}
String sqlPath = root+"install"+File.separator+"init.sql";
String linkStr = "jdbc:mysql://"+dbaddress+":3306/"+dbname+"?useUnicode=true&characterEncoding=UTF-8";
SQLExec sqlExec = new SQLExec();
sqlExec.setDriver("com.mysql.jdbc.Driver");
sqlExec.setUrl(linkStr);
sqlExec.setUserid(dbusername);
sqlExec.setPassword(dbpassword);
sqlExec.setSrc(new File(sqlPath));
sqlExec.setProject(new Project());
sqlExec.execute();
File installFile = new File(root+"installed");
if(!installFile.exists()){installFile.createNewFile();}
}catch(Exception e){
File installFile = new File(root+"installed");
if(installFile.exists()){installFile.delete();}
out.print("false");}finally{}}else{out.print("false");}%>