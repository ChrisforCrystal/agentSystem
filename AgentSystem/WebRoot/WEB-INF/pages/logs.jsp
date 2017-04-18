<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="/main.action">代理商管理</a> \ <a href="/mylogs.action">查看操作日志</a>
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
		  <th>用户名称</th>
		  <th>操作信息</th>
		  <th>操作时间</th>
	  </tr>
  </thead>   
  <tbody>
	<s:if test="page.items!=null">
		<s:iterator value="page.items" status="adIndex" var="logs">
		<tr>
		<td>
			<s:if test="1 >= page.page"><s:property value='#adIndex.index+1' /></s:if>
			<s:else>
			<s:property value='(page.page-1) * page.pageSize+#adIndex.index+1' />
			</s:else>
			</td>
			<td><s:property value='#logs.userName' /></td>
			<td><s:property value='#logs.operateInfo' /></td>
			<td class="center"><s:date name='#logs.operateDatetime' format="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
		</s:iterator>
	</s:if>
</tbody>
</table>

<div class="pagination pagination-centered">
						  <ul>
							<li><a href="/mylogs.action?page.page=1" title="首页">首页</a></li>
							<s:if test="page.prevPages!=null">
								<s:iterator value="page.prevPages" var="num">
									<li><a
										href="/mylogs.action?page.page=${num}"
										class="number" title="<s:property value='#num'/>"><s:property
											value="#num" /> </a></li>
								</s:iterator>
							</s:if>
							<li class="active">
							  <a href="#"title="<s:property value='page.page'/>"><s:property value='page.page' /> </a>
							</li>
							<s:if test="page.nextPages!=null">
								<s:iterator value="page.nextPages" var="num">
									<li><a href="/mylogs.action?page.page=${num }" title="<s:property value='#num'/>">
									<s:property value="#num" /> </a></li>
								</s:iterator>
							</s:if>
							<li><a href="/mylogs.action?page.page=${page.pageCount}" title="尾页">尾页</a></li>
						  </ul>
						</div>
</div>
<link id='theme' rel='stylesheet' href='/css/logs.css'/>
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>