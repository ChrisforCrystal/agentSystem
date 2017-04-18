<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="/main.action">代理商管理</a> \ <a href="/keyword.action">关键词申请</a>
</div>
<div class="container">
<div class="searchuserdiv">
<div>搜索客户：<input id="searchUerText" type="text" /> 输入后自动搜索  
<s:if test="account != null"><font color="red" size="2"> 
【当前账户余额：￥ <span id="accountspan"><s:property value="account.money"/></span>】</font></s:if>
<div id="serachresult" class="searchresult"></div>
</div>
</div>
<div class="formdiv">
	<ul>
		<li><a>客户名称：</a><input id="customname" class="customname" type="text" readonly="readonly"/></li>
		<li><a>关键词：</a><input id="keyword" class="keyword" type="text" /> <span id="keywordtip" class="keywordtip"></span></li>
		<li><a>服务类别：</a>
			<select id="servicetype">
				<option value="0" selected="selected">--请选择--</option>
				<s:iterator value="serviceType">
					<option value="<s:property value='id'/>"><s:property value="configTypeName"/></option>
				</s:iterator>
			</select>
		</li>
		<li><a>服务年限：</a>
		<select id="serviceyears">
			<option value="0" selected="selected">--请选择--</option>
			<s:bean name="org.apache.struts2.util.Counter" id="counter">
		        <s:param name="first" value="1" />
		        <s:param name="last" value="systemConfig.configValue" />
		        <s:iterator>  
		              <option value="<s:property/>"><s:property/></option>
		        </s:iterator>
		     </s:bean>
			<s:iterator value="youhuiType">
				<option value="id_<s:property value='id'/>"><s:property value="configTypeName"/></option>
			</s:iterator>
			</select>
		</li>
		<li><a>价格：</a><input class="price" id="price" type="text" readonly="readonly"/></li>
		<li><input id="submitkeyword" type="button" value="提交申请"/></li>
	</ul>
</div>

</div>
<link id='theme' rel='stylesheet' href='/css/keyword.css'/>
<script type="text/javascript" src="/js/keyword.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>