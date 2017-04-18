<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="cn">
<head>
	<meta charset="utf-8">
	<title>代理商管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="/css/public.css" rel="stylesheet"/>
	<link href="/css/default.css" rel="stylesheet"/>
	<!-- jQuery -->
	<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script> 
	<script type="text/javascript" src="/js/login.js" charset="UTF-8"></script> 
</head>
<body>
<div class="head">
<h1>AgentSystem  | 代理商管理系统 <span>v1.01</span></h1>
</div>
<div class="container">
	
	<form action="/login.action?isStart=1" method="post" class="jNice" onsubmit="return validateLoginUserFunc();">
	<h1>登录系统 | Sign in</h1>
	<ul class="loginul">
		<li>登录账号：<input type="text" id="usercode" name="user.userCode" value="" maxlength="20" /></li>
		<li>登录密码：<input type="password" id="userpassword" name="user.userPassword" value="" maxlength="20" /></li>
		<li><input type="submit" id="loginBtn" value="登录| Login"/></li>
	</ul>
	</form>
  
</div>
<!-- 
<div>
<script type="text/javascript" src="/medire/WdatePicker.js"></script>
<input class="Wdate" id="startTime" size="15" name="news.dateTime" readonly="readonly"  type="text" onClick="WdatePicker()" />
</div>
 -->

<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>