<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/iframehead.jsp" %>
<div class="addAppTitle">
	<h2><font size="2">为<s:property value="keywords.keywords"/>续费 </font>
<s:if test="account != null"><font color="red" size="2"> 
【当前账户余额：￥ <span id="accountspan"><s:property value="account.money"/></span>】</font></s:if>
</h2>
</div>
<div class="message">

</div>
<div class="formdiv">
	<ul>
		<li><a>客户名称：</a><input id="customname" class="customname" value="<s:property value="keywords.customName"/>" type="text" readonly="readonly"/></li>
		<li><a>关键词：</a><input id="keyword" class="keyword" type="text" value="<s:property value="keywords.keywords"/>" readonly="readonly"/> <span id="keywordtip" class="keywordtip"></span></li>
		<li><a>服务类别：</a>
			<select id="servicetype">
				<s:iterator value="serviceType">
					<option value="<s:property value='id'/>" <s:if test="keywords.productType == id">selected="selected"</s:if>><s:property value="configTypeName"/></option>
				</s:iterator>
			</select>
		</li>
		<li><a>服务年限：</a><input type="hidden" id="kid" value="<s:property value="keywords.id"/>"/>
		<select id="serviceyears">
			<option value="0" selected="selected">--请选择--</option>
			<option value="1" >1年</option>
			<option value="2" >2年</option>
			<option value="3" >3年</option>
			<option value="4" >4年</option>
			<option value="5" >5年</option>
			<option value="6" >6年</option>
			<option value="7" >7年</option>
			<option value="8" >8年</option>
			<option value="9" >9年</option>
			<option value="10">10年</option>
			</select>
		</li>
		<li><a>价格：</a><input class="price" id="price" type="text" readonly="readonly"/></li>
		<li><input id="submitkeyword" type="button" value="续费提交"/></li>
	</ul>
</div>
<link id='theme' rel='stylesheet' href='/css/xufei.css'/>
<script type="text/javascript" src="/js/xufei.js" charset="UTF-8"></script> 
</body></html>