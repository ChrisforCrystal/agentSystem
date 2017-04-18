<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="cn">
<head>
	<meta charset="utf-8">
	<title>代理商管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="/css/public.css" rel="stylesheet"/>
	<link href="/css/main.css" rel="stylesheet"/>
	<link rel="stylesheet" id='skin' type="text/css" href="/alertframe/skin/simple_gray/ymPrompt.css" />
	<link id='theme' rel='stylesheet' href='/humane/themes/original.css'/>
	<!-- jQuery -->
	<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script> 
	<script type="text/javascript" src="/alertframe/ymPrompt.js"></script>
    <script type="text/javascript" src="/humane/humane.js"></script>
    <script type="text/javascript" src="/js/public.js"></script>
    <script type="text/javascript" src="/js/main.js" charset="UTF-8"></script> 
</head>
<body>
<div class="head">
<ul>
	<li><h2><!--  <img src="/imgs/logo.png" width="130px"/> --></h2></li>
	<li class="headfunc">
		<ul>
			<li>欢迎您：<s:property value="currentUser.userName"/>
			<a class="modifypwd" id="modifypwdbtna">
			修改密码
			</a> <a href="/exit.action">退出</a>
			</li>
		</ul>
	</li>
</ul>
</div>
        <s:iterator value="funcList" status="sta">
            	<tr>
                    <td><s:property value="functionName"/></td>
                
                 </tr>   
        </s:iterator>

<div id="menu">
		<ul>
		<s:iterator value="roleFunctions" status="sta">
			<s:if test="#sta.index == 0">
			<li class="m_line"><img src="/imgs/line1.gif" /></li>
			<li id="m_<s:property value="#sta.index + 1"/>" class='m_li_a' onmouseover='mover(<s:property value="#sta.index + 1"/>);'><a href="<s:property value="mainFunction.funcUrl"/>"><s:property value="mainFunction.functionName"/></a></li>
			</s:if><s:else>
			<li class="m_line"><img src="/imgs/line1.gif" /></li>
			<li id="m_<s:property value="#sta.index + 1"/>" class='m_li' onmouseover='mover(<s:property value="#sta.index + 1"/>);'><a href="<s:property value="mainFunction.funcUrl"/>"><s:property value="mainFunction.functionName"/></a></li>
			</s:else>
		</s:iterator>
	</ul>
	</div><!--menu end-->



	<div class="subbox">
		<ul class="smenu">
		
			<s:iterator value="roleFunctions" status="sta">
				<s:if test="subFunctions != null && subFunctions.size()>0">
					<s:if test="#sta.index == 0">
					<li style="padding-left:10px;" id="s_1" class='s_li_a'>
					<s:iterator value="subFunctions">
						<a href="<s:property value="funcUrl"/>"><s:property value="functionName"/></a>
					</s:iterator>
					</li>
					</s:if><s:elseif test="#sta.index == 1">
					<li style="padding-left:131px;" id="s_2" class='s_li' onmouseover='mover(2);'>
						<s:iterator value="subFunctions">
						<a href="<s:property value="funcUrl"/>"><s:property value="functionName"/></a>
						</s:iterator>
					</li>
					</s:elseif><s:elseif test="#sta.index == 2">
					<li style="padding-left:243px;" id="s_3" class='s_li' onmouseover='mover(3);'>
						<s:iterator value="subFunctions">
						<a href="<s:property value="funcUrl"/>"><s:property value="functionName"/></a>
						</s:iterator>
					</li>
					</s:elseif><s:elseif test="#sta.index == 3">
					<li style="padding-left:140px;" id="s_4" class='s_li' onmouseover='mover(4);'>
						<s:iterator value="subFunctions">
						<a href="<s:property value="funcUrl"/>"><s:property value="functionName"/></a>
						</s:iterator>
					</li>
					</s:elseif><s:elseif test="#sta.index == 4">
					<li style="padding-left:220px;" id="s_5" class='s_li' onmouseover='mover(5);'>
						<s:iterator value="subFunctions">
						<a href="<s:property value="funcUrl"/>"><s:property value="functionName"/></a>
						</s:iterator>
					</li>
					</s:elseif>
				</s:if><s:else>
					<s:if test="#sta.index == 0">
						<li style="padding-left:10px;" id="s_1" class='s_li_a'>
					</s:if><s:elseif test="#sta.index == 1">
						<li style="padding-left:131px;" id="s_2" class='s_li' onmouseover='mover(2);'>
					</s:elseif><s:elseif test="#sta.index == 2">
					<li style="padding-left:243px;" id="s_3" class='s_li' onmouseover='mover(3);'>
					</s:elseif><s:elseif test="#sta.index == 3">
					<li style="padding-left:360px;" id="s_4" class='s_li' onmouseover='mover(4);'>
					</s:elseif><s:elseif test="#sta.index == 4">
					<li style="padding-left:460px;" id="s_5" class='s_li' onmouseover='mover(5);'>
					</s:elseif>
						<a href="/main.action"  title="无权限">无权限</a>
					</li>
				</s:else>
			</s:iterator>	
</ul>
	</div>

<%--
	<div id="menu">
		<ul>
			<li class="m_line"><img src="/imgs/line1.gif" /></li>
			<li id="m_1" class='m_li_a' onmouseover='mover(1);'><a href="/main.action">代理商管理</a></li>
			<li class="m_line"><img src="/imgs/line1.gif" /></li>
			<li id="m_2" class='m_li' onmouseover='mover(2);'><a href="/main.action">门户管理</a></li>
			<li class="m_line"><img src="/imgs/line1.gif" /></li>
			<li id="m_3" class='m_li' onmouseover='mover(3);'><a href="javascript:void();">报表管理</a></li>
			<li class="m_line"><img src="/imgs/line1.gif" /></li>
			<li id="m_4" class='m_li' onmouseover='mover(4);'><a href="javascript:void();">系统管理</a></li>
			<li class="m_line"><img src="/imgs/line1.gif" /></li>
			<li id="m_5" class='m_li' onmouseover='mover(5);'><a href="javascript:void();">系统配置管理</a></li>
			<li class="m_line"><img src="/imgs/line1.gif" /></li>
		</ul>
	</div>
	-->
	<!--menu end-->
	<!--  
	<div class="subbox">
		<ul class="smenu">
			<li style="padding-left:10px;" id="s_1" class='s_li_a'>
				<a href="/keyword.action"  title="关键词申请">关键词申请</a>
				<a href="/customlist.action"  title="代理商客户管理">代理商客户管理</a>
				<a href="/yfk.action"  title="代理商预付款">代理商预付款</a>
				<a href="/keywordmanage.action"  title="关键词申请管理">关键词申请管理</a>
				<a href="/mylogs.action"  title="操作日志">操作日志</a>
			</li>
			<li style="padding-left:131px;" id="s_2" class='s_li' onmouseover='mover(2);'>
				<a href="/"  title="门户管理">门户管理</a>
			</li>
			<li style="padding-left:243px;" id="s_3" class='s_li' onmouseover='mover(3);'>
				<a href="/"  title="业务报表">业务报表</a>
			</li>
			<li style="padding-left:140px;" id="s_4" class='s_li' onmouseover='mover(4);'>
				<a href="/caiwu.action"  title="财务管理">财务管理</a>
				<a href="/rolelist.action"  title="角色管理">角色管理</a>
				<a href="/premission.action"  title="角色权限配置">角色权限配置</a>
				<a href="/userlist.action"  title="代理商用户管理">代理商用户管理</a>
				<a href="/checkkeyword.action"  title="关键词审核">关键词审核</a>
			</li>
			<li style="padding-left:290px;" id="s_5" class='s_li' onmouseover='mover(5);'>
				<a href="/caiwutype.action"  title="账务类型配置">账务类型</a>
				<a href="/servicetype.action"  title="服务类型配置">服务类型</a>
				<a href="/serviceyears.action"  title="服务年限配置">服务年限</a>
				<a href="/appurl.action"  title="APP系统地址">APP地址</a>
				<a href="/customtype.action"  title="客户类型管理">客户类型</a>
				<a href="/cardtype.action"  title="证件类型管理">证件类型</a>
				<a href="/youhuitype.action"  title="优惠类型管理">优惠类型</a>
			</li>
		</ul>
	</div>--%>
	<!--subbox end-->
	
	<div id="modifydiv" class="modifydiv">
			<div class='modifTop'></div>
			<div class="modifyPasswordContent">
			<ul>
			<li>请输入原密码：<input type="password" id="oldpwdtext"/> <span id="oldpwdtip">您本次登录时的密码</span></li>
			<li>请输入新密码：<input type="password" id="newpwd"/> <span id="newpwdtip">新密码不少于6个字符</span></li>
			<li>请确认新密码：<input type="password" id="newpwd2"/> <span id="newpwdtip1">新密码不少于6个字符</span></li>
			<li class="btnli">
			<input id="modifypwdbtn" type="button" value="确认修改密码"/> 
			<input id="modifypwconcledbtn" type="button" value="取消"/> 
			</li>
			</ul>
			</div>
	</div>