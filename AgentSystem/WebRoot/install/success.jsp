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
    
    <title>AgentSystem 安装成功</title>
    
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
		ul li{
			background:#efefef;
			margin:10px;
			padding: 10px;
		}
		ul li a{font-weight:bold;font-size:14px;display: block;width:160px;float:left;}
		h1{padding:10px;border-bottom:1px solid #ccc;}
	</style>
  </head>
  
  <body>
    <div class="logo">
    	<div><img src="/imgs/logo.jpg" width="200px"/></div>
    	<div class="content">
    		<h1>完成</h1>
    			<p>AgentSystem安装完成。您是否还沉浸在愉悦的安装过程中？很遗憾，一切皆已完成。：-）</p>
    			<ul>
	    		<li><a>用户名：</a><%=session.getAttribute("admin") %></li>
	    		<li><a>密码：</a>您自己设定的密码</li>
	    		</ul>
    		<p style="color:#006c7f">
    			重要提示：为了您的系统安全，请手动删除根目录下的install文件夹，删除后，请重启您的Tomcat服务器。
    			重启之后即可正常使用AgentSystem，谢谢您的使用。
    		</p>	
    		
    	</div>
    </div>
  </body>
</html>
