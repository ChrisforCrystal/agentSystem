<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Object sessionObject = session.getAttribute("install");
if(null == sessionObject){
	session.setAttribute("install", "install");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>AgentSystem 安装</title>
    
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
    		欢迎来到AgentSystem的世界！正式开始之前，我们需要一些关于数据库的信息，请确认您已经拥有以下信息：
    		<ul>
    		<li>1. 数据库名称</li>
    		<li>2. 数据库用户名</li>
    		<li>3. 数据库密码</li>
    		<li>4. 数据库主机地址</li>
    		</ul>
    		<p>
    		正常情况下，您的空间提供商会告知数据库的有关信息，如果您不太清楚，请先联系您的空间提供商，如果已经准备好了...
    		</p>
    		<input type="button" value="那么现在开始！" onclick="window.location.href='/install/dbform.jsp'"/>
    	</div>
    </div>
  </body>
</html>
