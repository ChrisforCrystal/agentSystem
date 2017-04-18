<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Object sessionObject = session.getAttribute("install");
if(null == sessionObject){
	response.sendRedirect("/install/index.jsp");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>AgentSystem 安装-填写相关信息</title>
    
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
		ul li span{margin-left:10px;}
		.vliOkbackground{
			background: #fff;
			border:1px solid #ccc;
			height:25px;
		}
		.vliErrorbackground{background: #ffcccc;border:1px solid #ccc;height:25px;}
	</style>
	<script src="/js/jquery-1.7.2.min.js"></script>
	<script>
	
		$().ready(function(){
			$("#dbname").blur(function(){
			var dbname = $("#dbname").val();
				if(dbname != ""){
					$("#dbname").attr("class","vliOkbackground");
				}
			});
			$("#dbusername").blur(function(){
			var dbusername = $("#dbusername").val();
				if(dbusername != ""){
					$("#dbusername").attr("class","vliOkbackground");
				}
			});
			$("#dbpassword").blur(function(){
			var dbpassword = $("#dbpassword").val();
				if(dbpassword != ""){
					$("#dbpassword").attr("class","vliOkbackground");
				}
			});
			$("#dbaddress").blur(function(){
			var dbaddress = $("#dbaddress").val();
				if(dbaddress != ""){
					$("#dbaddress").attr("class","vliOkbackground");
				}
			});
		
		
			$("#putdbbutton").click(function(){
				var dbname = $("#dbname").val();
				var dbusername = $("#dbusername").val();
				var dbpassword = $("#dbpassword").val();
				var dbaddress = $("#dbaddress").val();
				if(dbname == ""){
					$("#dbname").focus();
					$("#dbname").addClass("vliErrorbackground");
					return false;
				}
				if(dbusername == ""){
					$("#dbusername").focus();
					$("#dbusername").addClass("vliErrorbackground");
					return false;
				}
				if(dbpassword == ""){
					$("#dbpassword").focus();
					$("#dbpassword").addClass("vliErrorbackground");
					return false;
				}
				if(dbaddress == ""){
					$("#dbaddress").focus();
					$("#dbaddress").addClass("vliErrorbackground");
					return false;
				}
				
				
				return true;
			});
		});
		
	</script>
  </head>
  
  <body>
    <div class="logo">
    	<div><img src="/imgs/logo.jpg" width="200px"/></div>
    	<div class="content">
    		您应该在下面的表单中填入对应的数据库信息，不确定的项目请联系您的空间提供商，如果已经准备好了...
    		<form action="/install/vlidbinfo.jsp" method="post">
    		<ul>
    		<li><a>数据库名称：</a><input class="vliOkbackground" id="dbname" name="dbname" type="text"/><span id="dbnametip">用于存储AgentSystem数据的数据库名称</span></li>
    		<li><a>数据库用户名：</a><input class="vliOkbackground" id="dbusername" name="dbusername" type="text"/><span id="dbusernametip">您的M有SQL用户名</span></li>
    		<li><a>数据库密码：</a><input class="vliOkbackground" id="dbpassword" name="dbpassword" type="password"/><span  id="dbpasswordtip">...以及MySQL密码</span></li>
    		<li><a>数据库主机地址：</a><input class="vliOkbackground" id="dbaddress" name="dbaddress" type="text" value="localhost"/><span id="dbaddresstip">大部分主机无需修改（本地数据库无需修改）</span></li>
    		</ul>
    		<p>
    		正常情况下，您的空间提供商会告知数据库的有关信息，如果您不太清楚，请先联系您的空间提供商，如果已经准备好了...
    		</p>
    		<input id="putdbbutton" type="submit" value="填好了"/>  
    		<input type="button" value="返回" onclick="window.history.back(-1);"/>
    		</form>
    	</div>
    </div>
  </body>
</html>
