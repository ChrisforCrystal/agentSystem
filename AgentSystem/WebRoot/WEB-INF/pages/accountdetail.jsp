<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="/main.action">代理商管理</a> \ <a href="/main.action">当前账户信息</a> \ <a href="accountdetail.action">查看账户明细</a>
</div>
<div class="container">
<!-- 
private Integer detailType;
	private String  detailTypeName;
	private BigDecimal money;
	private BigDecimal accountMoney;
	private String memo;
	private Date detailDateTime;
 -->
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
							<li><a href="/accountdetail.action?page.page=1" title="首页">首页</a></li>
							<s:if test="page.prevPages!=null">
								<s:iterator value="page.prevPages" var="num">
									<li><a
										href="/accountdetail.action?page.page=${num}"
										class="number" title="<s:property value='#num'/>"><s:property
											value="#num" /> </a></li>
								</s:iterator>
							</s:if>
							<li class="active">
							  <a href="#"title="<s:property value='page.page'/>"><s:property value='page.page' /> </a>
							</li>
							<s:if test="page.nextPages!=null">
								<s:iterator value="page.nextPages" var="num">
									<li><a href="/accountdetail.action?page.page=${num }" title="<s:property value='#num'/>">
									<s:property value="#num" /> </a></li>
								</s:iterator>
							</s:if>
							<li><a href="/accountdetail.action?page.page=${page.pageCount}" title="尾页">尾页</a></li>
						  </ul>
						</div>
</div>
<link id='theme' rel='stylesheet' href='/css/accountdetail.css'/>
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>