<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void(0);">系统管理</a> \ <a href="/caiwu.action">财务管理</a>
</div>
<div class="container">
<div class="searchuserdiv">
<div>搜索用户：<input id="searchUerText" type="text" /> 输入后自动搜索<div id="serachresult" class="searchresult"></div>
</div>
</div>
<div class="searchuserdiv ope">
	<ul>
		<li>操作类型：
		<select id="zijintype">
			<option value="0">--请选择--</option>
			<s:iterator value="accountConfigList">
				<option value="<s:property value='id'/>"><s:property value='configTypeName'/></option>
			</s:iterator>
		</select></li>
		
		<li class="important">操作资金：<input type="text" id="zijin"/> <br/>重要提示：输入的资金数，<b>正数(1000)</b>为向账户增加1000元，<b>负数（-1000）</b>为向账户减少1000元，精确到小数点两位数</li>
		<li>操作备注：<br/><textarea id="memo"></textarea></li>
		<li><input id="caiwuok" type="button" value="确定"/></li>
		<li class="tip">操作提示 : <span id="systemtip">输入的资金数，正数(1000)为向账户增加1000元，负数（-1000）为向账户减少1000元，精确到小数点两位数</span></li>
	</ul>
</div>
</div>
<link id='theme' rel='stylesheet' href='/css/caiwu.css'/>
<script type="text/javascript" src="/js/caiwu.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>