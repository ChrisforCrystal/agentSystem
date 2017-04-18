<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
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
<div class="mbxnav">
	 账号：【<s:property value="user.userCode"/>】代理商预付款
</div>
<div class="container">
<div class="searchuserdiv ope">
	<ul>
		<li>
		<form action="/yfklist.action" method="post" onsubmit="return searchyfklistFunc();">
		<input type="hidden" id="usercode" name="userCode" value="<s:property value='user.userCode'/>">
	    <input type="hidden" id="userid" name="userId" value="<s:property value='user.id'/>">
		操作类型：
		<select name="accountDetail.detailType">
		<option value="" >---请选择---</option>
		<option <s:if test="accountDetail.detailType == 9999">
					selected = "selected"
				</s:if> value="9999">系统自动-关键词申请扣款</option>
		<option <s:if test="accountDetail.detailType == 9998">
					selected = "selected"
				</s:if> value="9998">系统自动-返回预注册冻结资金</option>
		<option <s:if test="accountDetail.detailType == 9997">
					selected = "selected"
				</s:if> value="9997">系统自动-扣除申请关键词的所有资金</option>
		<option <s:if test="accountDetail.detailType == 9996">
					selected = "selected"
				</s:if> value="9996">系统自动-扣除关键词续费资金</option>
			<s:iterator value="accountConfigList">
				<option
				<s:if test="accountDetail.detailType == id">
					selected = "selected"
				</s:if>
				 value="<s:property value='id'/>"><s:property value='configTypeName'/></option>
			</s:iterator>
		</select>
		操作时间：
		<input class="Wdate" size="15" name="accountDetail.startTime" id="starttime" value="<s:date name='accountDetail.startTime' format='yyyy-MM-dd'/>" readonly="readonly"  type="text" onClick="WdatePicker()" />
		至
		<input class="Wdate" size="15" name="accountDetail.endTime" id="endtime" value="<s:date name='accountDetail.endTime' format='yyyy-MM-dd'/>" readonly="readonly"  type="text" onClick="WdatePicker()" />
		
		<input type="submit" value="查询"/>
		</form>
		</li>
	</ul>
</div>


 <table>
  <thead>
	  <tr>
		  <th>账务类型</th>
		  <th>账务资金</th>
		  <th>账户余额</th>
		  <th>备注信息</th>
		  <th>明细时间</th>                                          
	  </tr>
  </thead>   
  <tbody>
	<s:if test="page.items!=null">
		<s:iterator value="page.items" status="adIndex" var="accountDetail">
		<tr>
			<td><s:property value='#accountDetail.detailTypeName' /></td>
			<td>￥<s:property value='#accountDetail.money' /></td>
			<td>￥<s:property value='#accountDetail.accountMoney' /></td>
			<td><s:property value='#accountDetail.memo' /></td>
			<td class="center"><s:date name='#accountDetail.detailDateTime' format="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
		</s:iterator>
	</s:if>
</tbody>
</table>

<div class="pagination pagination-centered">
	  <ul>
		<li><a href="/yfklist.action?page.page=1&user.id=<s:property value='user.id'/>&user.userCode=<s:property value='user.userCode'/>&accountDetail.detailType=<s:property value='accountDetail.detailType'/>&accountDetail.startTime=<s:date name='accountDetail.startTime' format='yyyy-MM-dd'/>&accountDetail.endTime=<s:date name='accountDetail.endTime' format='yyyy-MM-dd'/>" title="首页">首页</a></li>
		<s:if test="page.prevPages!=null">
			<s:iterator value="page.prevPages" var="num">
				<li><a
					href="/yfklist.action?page.page=${num}&user.id=<s:property value='user.id'/>&user.userCode=<s:property value='user.userCode'/>&accountDetail.detailType=<s:property value='accountDetail.detailType'/>&accountDetail.startTime=<s:date name='accountDetail.startTime' format='yyyy-MM-dd'/>&accountDetail.endTime=<s:date name='accountDetail.endTime' format='yyyy-MM-dd'/>"
					class="number" title="<s:property value='#num'/>"><s:property
						value="#num" /> </a></li>
			</s:iterator>
		</s:if>
		<li class="active">
		  <a href="#"title="<s:property value='page.page'/>"><s:property value='page.page' /> </a>
		</li>
		<s:if test="page.nextPages!=null">
			<s:iterator value="page.nextPages" var="num">
				<li><a href="/yfklist.action?page.page=${num}&user.id=<s:property value='user.id'/>&user.userCode=<s:property value='user.userCode'/>&accountDetail.detailType=<s:property value='accountDetail.detailType'/>&accountDetail.startTime=<s:date name='accountDetail.startTime' format='yyyy-MM-dd'/>&accountDetail.endTime=<s:date name='accountDetail.endTime' format='yyyy-MM-dd'/>" title="<s:property value='#num'/>">
				<s:property value="#num" /> </a></li>
			</s:iterator>
		</s:if>
		<li><a href="/yfklist.action?page.page=${page.pageCount}&user.id=<s:property value='user.id'/>&user.userCode=<s:property value='user.userCode'/>&accountDetail.detailType=<s:property value='accountDetail.detailType'/>&accountDetail.startTime=<s:date name='accountDetail.startTime' format='yyyy-MM-dd'/>&accountDetail.endTime=<s:date name='accountDetail.endTime' format='yyyy-MM-dd'/>" title="尾页">尾页</a></li>
	  </ul>
	</div>
</div>
<link id='theme' rel='stylesheet' href='/css/yfk.css'/>
<script type="text/javascript" src="/medire/WdatePicker.js"></script>
<script type="text/javascript" src="/js/yfklist.js"></script>
</body>
</html>