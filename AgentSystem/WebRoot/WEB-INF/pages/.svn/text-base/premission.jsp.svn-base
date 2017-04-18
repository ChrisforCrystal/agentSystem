<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void();">系统管理</a> \ <a href="/premission.action">角色权限管理</a>
</div>
<div class="container">
		
		<ul>
			<li class="jslist">
			<ul>
		 		<s:if test="roleList != null">
		 			<s:iterator value="roleList" status="sta">
		       			<li>
		                <div id="sidebar"><a href="/funclist.action?roleId=<s:property value='id'/>" target="funclist">
		                	 + <s:property value="roleName"/></div>
		                </a></li>
		         		</s:iterator>
		 		</s:if>
		 		</ul>
			</li>
			<li class="iframeli"><iframe id="funclist" name="funclist" width="100%" height="99%" src=""></iframe></li>
		</ul>
</div>
<link id='theme' rel='stylesheet' href='/css/premission.css'/>
<script type="text/javascript" src="/js/premission.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>

