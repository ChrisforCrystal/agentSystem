<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="/report.action">报表管理</a> \ <a href="/report.action">报表管理</a>
</div>
<div class="container">


<div class="searchuserdiv ope">
	<ul>
		<li>
		<form action="/report.action" method="post" onsubmit="return searchReportFunc();">
		
		操作类型：
		<select name="reportType" id="reporttype">
		<option value="999" style="background: #333333;padding:3px;color:#fff;">财务报表</option>
		<option value="1" <s:if test="reportType == 1">selected="selected"</s:if> style="padding:3px;">	&nbsp;&nbsp;&nbsp;&nbsp;代理商账户余额报表</option>
		<option value="2" <s:if test="reportType == 2">selected="selected"</s:if> style="padding:3px;">	&nbsp;&nbsp;&nbsp;&nbsp;预付款流水报表</option>
		<option value="3" <s:if test="reportType == 3">selected="selected"</s:if> style="padding:3px;">	&nbsp;&nbsp;&nbsp;&nbsp;代理商流水报表</option>
		<option value="998" style="background: #333333;padding:3px;color:#fff;">产品报表</option>
		<option value="4" <s:if test="reportType == 4">selected="selected"</s:if> style="padding:3px;">	&nbsp;&nbsp;&nbsp;&nbsp;产品分类数量/金额汇总</option>
		<option value="997" style="background: #333333;padding:3px;color:#fff;">消费报表</option>
		<option value="6" <s:if test="reportType == 5">selected="selected"</s:if> style="padding:3px;">	&nbsp;&nbsp;&nbsp;&nbsp;客户消费汇总(暂无)</option>
		</select>
		<div id="opertime" style="margin-top:-20px; margin-left:280px;">
		操作时间：
		<input class="Wdate" size="15" name="startTime" id="starttime" value="<s:date name='startTime' format='yyyy-MM-dd'/>" readonly="readonly" type="text" onClick="WdatePicker()" />
		至
		<input class="Wdate" size="15" name="endTime" id="endtime" value="<s:date name='endTime' format='yyyy-MM-dd'/>" readonly="readonly" type="text" onClick="WdatePicker()" />
		</div>
		<div style="margin-top:-20px; margin-left:580px;">
		<input type="submit" value="查询"/>
		</div>
		</form>
		</li>
	</ul>
</div>
<s:if test="reportType == 1">
<div class="downloadfile">
<ul>
	<li><img src="/imgs/pdf.png" /><a href="/reportaccount.action">PDF下载</a></li>
	<li><img src="/imgs/excel.png" /><a href="/reportaccounte.action">Excel下载</a></li>
</ul>
</div>
<h1>代理商余额报表</h1>
<table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>代理商名称</th>
		  <th>账户余额</th>
	  </tr>
  </thead>   
  <tbody>
	<s:if test="accountList !=null ">
		<s:iterator value="accountList" status="adIndex">
		<tr>
			<td>
			<s:property value='#adIndex.index+1' />
			</td>
			<td><s:property value='userName' /></td>
			<td>￥<s:property value='money' /></td>
		</tr>
		</s:iterator>
	</s:if>
</tbody>
</table>
</s:if><s:elseif test="reportType==2">
<div class="downloadfile">
<ul>
	<li><img src="/imgs/pdf.png" /><a href="/reportYfkpdf.action?startTime=<s:date name="startTime" format="yyyy-MM-dd"/>&endTime=<s:date name="endTime"  format="yyyy-MM-dd"/>">PDF下载</a></li>
	<li><img src="/imgs/excel.png" /><a href="/reportYfke.action?startTime=<s:date name="startTime" format="yyyy-MM-dd"/>&endTime=<s:date name="endTime"  format="yyyy-MM-dd"/>">Excel下载</a></li>
</ul>
</div>
<h1>预付款流水报表</h1>
<table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>代理商名称</th>
		  <th>预付款</th>
		  <th>账户余额</th>
		  <th>备注信息</th>
		  <th>时间</th>
	  </tr>
  </thead>   
  <tbody>
	<s:if test="accountDetailList !=null ">
		<s:iterator value="accountDetailList" status="adIndex">
		<tr>
			<td>
			<s:property value='#adIndex.index+1' />
			</td>
			<td><s:property value='userName' /></td>
			<td><s:property value='money' /></td>
			<td><s:property value='accountMoney' /></td>
			<td><s:property value='memo' /></td>
			<td><s:date name='detailDateTime' format="yyyy-MM-dd HH:ss:mm"/></td>
		</tr>
		</s:iterator>
	</s:if>
</tbody>
</table>
</s:elseif><s:elseif test="reportType==3">
<div class="downloadfile">
<ul>
	<li><img src="/imgs/pdf.png" /><a href="/reportdlspdf.action?startTime=<s:date name="startTime" format="yyyy-MM-dd"/>&endTime=<s:date name="endTime"  format="yyyy-MM-dd"/>">PDF下载</a></li>
	<li><img src="/imgs/excel.png" /><a href="/reportdlse.action?startTime=<s:date name="startTime" format="yyyy-MM-dd"/>&endTime=<s:date name="endTime"  format="yyyy-MM-dd"/>">Excel下载</a></li>
</ul>
</div>
<h1>代理商流水报表</h1>
<table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>代理商名称</th>
		  <th>预付款</th>
		  <th>账户余额</th>
		  <th>备注信息</th>
		  <th>时间</th>
	  </tr>
  </thead>   
  <tbody>
	<s:if test="accountDetailList !=null ">
		<s:iterator value="accountDetailList" status="adIndex">
		<tr>
			<td>
			<s:property value='#adIndex.index+1' />
			</td>
			<td><s:property value='userName' /></td>
			<td><s:property value='money' /></td>
			<td><s:property value='accountMoney' /></td>
			<td><s:property value='memo' /></td>
			<td><s:date name='detailDateTime' format="yyyy-MM-dd HH:ss:mm"/></td>
		</tr>
		</s:iterator>
	</s:if>
</tbody>
</table>
</s:elseif><s:elseif test="reportType==4">
<div class="downloadfile">
<ul>
<!-- 
	<li><img src="/imgs/pdf.png" /><a href="/reportppdf.action?startTime=<s:date name="startTime" format="yyyy-MM-dd"/>&endTime=<s:date name="endTime"  format="yyyy-MM-dd"/>">PDF下载</a></li>
	<li><img src="/imgs/excel.png" /><a href="/reportppe.action?startTime=<s:date name="startTime" format="yyyy-MM-dd"/>&endTime=<s:date name="endTime"  format="yyyy-MM-dd"/>">Excel下载</a></li>
 -->
</ul>
</div>
<h1>产品分类数量/金额汇总</h1>
<table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>产品分类名称</th>
		  <th>数量</th>
		  <th>价格</th>
	  </tr>
  </thead>   
  <tbody>
	<s:if test="reportProductList !=null ">
		<s:iterator value="reportProductList" status="adIndex">
		<tr>
			<td>
			<s:property value='#adIndex.index+1' />
			</td>
			<td><s:property value='configTypeName' /></td>
			<td><s:property value='number' /></td>
			<td><s:property value='price' /></td>
		</tr>
		</s:iterator>
	</s:if>
</tbody>
</table>
</s:elseif>
<s:else>
</s:else>






<!--  
 <table>
  <thead>
	  <tr>
		  <th>序号</th>
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
		<td>
			<s:if test="1 >= page.page"><s:property value='#adIndex.index+1' /></s:if>
			<s:else>
			<s:property value='(page.page-1) * page.pageSize+#adIndex.index+1' />
			</s:else>
			</td>
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
							<li><a href="/yfk.action?page.page=1&accountDetail.detailType=<s:property value='accountDetail.detailType'/>&accountDetail.startTime=<s:date name='accountDetail.startTime' format='yyyy-MM-dd'/>&accountDetail.endTime=<s:date name='accountDetail.endTime' format='yyyy-MM-dd'/>" title="首页">首页</a></li>
							<s:if test="page.prevPages!=null">
								<s:iterator value="page.prevPages" var="num">
									<li><a
										href="/yfk.action?page.page=${num}&accountDetail.detailType=<s:property value='accountDetail.detailType'/>&accountDetail.startTime=<s:date name='accountDetail.startTime' format='yyyy-MM-dd'/>&accountDetail.endTime=<s:date name='accountDetail.endTime' format='yyyy-MM-dd'/>"
										class="number" title="<s:property value='#num'/>"><s:property
											value="#num" /> </a></li>
								</s:iterator>
							</s:if>
							<li class="active">
							  <a href="#"title="<s:property value='page.page'/>"><s:property value='page.page' /> </a>
							</li>
							<s:if test="page.nextPages!=null">
								<s:iterator value="page.nextPages" var="num">
									<li><a href="/yfk.action?page.page=${num}&accountDetail.detailType=<s:property value='accountDetail.detailType'/>&accountDetail.startTime=<s:date name='accountDetail.startTime' format='yyyy-MM-dd'/>&accountDetail.endTime=<s:date name='accountDetail.endTime' format='yyyy-MM-dd'/>" title="<s:property value='#num'/>">
									<s:property value="#num" /> </a></li>
								</s:iterator>
							</s:if>
							<li><a href="/yfk.action?page.page=${page.pageCount}&accountDetail.detailType=<s:property value='accountDetail.detailType'/>&accountDetail.startTime=<s:date name='accountDetail.startTime' format='yyyy-MM-dd'/>&accountDetail.endTime=<s:date name='accountDetail.endTime' format='yyyy-MM-dd'/>" title="尾页">尾页</a></li>
						  </ul>
						</div>
						-->
</div>
<link id='theme' rel='stylesheet' href='/css/report.css'/>
<script type="text/javascript" src="/js/report.js"></script>
<script type="text/javascript" src="/medire/WdatePicker.js"></script>
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>