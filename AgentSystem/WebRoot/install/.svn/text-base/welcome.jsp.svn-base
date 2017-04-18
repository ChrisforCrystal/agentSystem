<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    
    <title>AgentSystem 安装-欢迎</title>
    
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
	h1{padding:10px;border-bottom:1px solid #ccc;}
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
		p{padding-left:10px;}
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
		.loadingdiv{
			border:1px solid #efefef;
			padding:1px;
			width:100%;
			display: none;
		}
		.loading{
			border:1px solid #00c6f7;
			background: #00c6f7;
			width:1%;
		}
	</style>
	<script src="/js/jquery-1.7.2.min.js"></script>
	<script>
	
		$().ready(function(){
			$("#sitetitle").blur(function(){
			var sitetitle = $("#sitetitle").val();
				if(sitetitle != ""){
					$("#sitetitle").attr("class","vliOkbackground");
				}
			});
			$("#admin").blur(function(){
			var admin = $("#admin").val();
				if(admin != ""){
					$("#admin").attr("class","vliOkbackground");
				}
			});
			$("#adminpwd").blur(function(){
			var adminpwd = $("#adminpwd").val();
				if(adminpwd != ""){
					$("#adminpwd").attr("class","vliOkbackground");
				}
			});
			$("#adminpwd2").blur(function(){
			var adminpwd2 = $("#adminpwd2").val();
				if(adminpwd2 != ""){
					$("#adminpwd2").attr("class","vliOkbackground");
				}
			});
		
		
			$("#putsitebutton").click(function(){
				var sitetitle = $("#sitetitle").val();
				var admin = $("#admin").val();
				var adminpwd = $("#adminpwd").val();
				var adminpwd2 = $("#adminpwd2").val();
				if(sitetitle == ""){
					$("#sitetitle").focus();
					$("#sitetitle").addClass("vliErrorbackground");
					return false;
				}
				if(admin == ""){
					$("#admin").focus();
					$("#admin").addClass("vliErrorbackground");
					return false;
				}
				if(adminpwd == ""){
					$("#adminpwd").focus();
					$("#adminpwd").addClass("vliErrorbackground");
					return false;
				}
				
				if(adminpwd.length < 7){
					$("#adminpwd").focus();
					$("#adminpwd").addClass("vliErrorbackground");
					alert("密码不能小于7位！");
					return false;
				}
				
				if(adminpwd2 == ""){
					$("#adminpwd2").focus();
					$("#adminpwd2").addClass("vliErrorbackground");
					return false;
				}
				
				
				if($("#adminpwd").val() != $("#adminpwd2").val()){
					$("#adminpwd2").focus();
					$("#adminpwd2").attr("class","vliOkbackground");
					alert("对不起，您两次输入的密码不一致，请重新输入。");
					return false;
				}
		
					
				$.post(
					"/install/ajax.jsp",
					{
						sitetitle:sitetitle,
						admin:admin,
						adminpwd:adminpwd
					},
					function(data,status){
						if(status == 'success' && data == "true"){
							closeTimer();
						    window.location.href="/install/success.jsp";
						}else{
							closeTimer();
							$("#loadingdivid").hide();
						}
					}
				);
				
				$("#loadingdivid").show();
				loading();
				return true;
			});
		});
		
		var load = null;
		function closeTimer(){
			window.clearInterval(load);
		}
		function loading(){
			var step = 1;
		load = setInterval(function(){
			step += 1;
			if(step <= 110){
				if(step == 100){step = 1;}
				$("#loading").css("width",step+"%");
			}else{
				window.clearInterval(load);
			}
		},10);
		}
		
	</script>
  </head>
  
  <body>
    <div class="logo">
    	<div><img src="/imgs/logo.jpg" width="200px"/></div>
    	<div class="content">
    			<p>
    			<h1>欢迎</h1>
    			<p>欢迎使用AgentSystem五分钟安装程序。您只需要简单滴填写下面的表格，开始使用这个强大的软件系统。</p>
    			<h1>需要您提供的信息</h1>
    			<p>您需要填写一些基本信息。无需担心填错，这些信息以后可以再次修改。</p>
    			<div class="loadingdiv" id="loadingdivid">
	    			<div id="loading" class="loading"></div>
	    		</div>
	    		<ul>
	    		<li><a>站点名称：</a><input class="vliOkbackground" id="sitetitle" name="sitetitle" type="text"/><span>AgentSystem站点名称</span></li>
	    		<li><a>用户名：</a><input class="vliOkbackground" id="admin" name="admin" type="text"/><span>用户名只能包含字母、数字、下划线。</span></li>
	    		<li><a>密码，两次：</a>
	    		<input class="vliOkbackground" id="adminpwd" name="adminpwd" type="password"/><br/><br/>
	    		<a>&nbsp;</a><input class="vliOkbackground" id="adminpwd2" name="adminpwd2" type="password"/>
	    		<span>密码至少包含7个字符。</span></li>
	    		</ul>
	    		
	    		
	    		<input id="putsitebutton" type="button" value="安装AgentSystem"/> 
	    		
    			</p>
    			
    			<p>
    			</p>
    	</div>
    </div>
  </body>
</html>
