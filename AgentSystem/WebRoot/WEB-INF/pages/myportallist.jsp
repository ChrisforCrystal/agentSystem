<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="/myportalmanage.action">门户管理</a> \ <a href="/myportalmanage.action">门户管理</a>
</div>
<div class="container">

<div class="searchuserdiv ope">
	<ul>
		<li>
		<form action="/myportalmanage.action" method="post">
		关键词：<input type="text" value="<s:property value='kword'/>" name="kword"/>
		客户名称:<input type="text" name="cname" value="<s:property value="cname"/>"/>
		<input type="submit" value="查询"/>
		</form>
		</li>
	</ul>
</div>


 <table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>门户名称</th>
		  <th>客户名称</th>
		  <th>法人代表</th>
		  <th>代理商</th>
		  <th>注册日期</th>
		  <th>类型</th>
		  <th>状态</th>
		  <th>操作</th>
	  </tr>
  </thead>   
  <tbody>
	<s:if test="page.items!=null">
		<s:iterator value="page.items" status="adIndex" var="keyword">
		<tr class="tabletr">
			<td>
			<s:if test="1 >= page.page"><s:property value='#adIndex.index+1' /></s:if>
			<s:else>
			<s:property value='(page.page-1) * page.pageSize+#adIndex.index+1' />
			</s:else>
			</td>
			<td><s:property value='#keyword.keywords' /></td>
			<td><s:property value='#keyword.customName' /></td>
			<td><s:property value='#keyword.bossName' /></td>
			<td><s:property value='#keyword.agentName' /></td>
			<td><s:date name='#keyword.regDatetime' format="yyyy-MM-dd HH:mm:ss"/></td>
			<td><s:property value='#keyword.customTypeName'/></td>
			<td>
			<s:if test="<s:property value='#keyword.isUse'/> == 1">
				已使用
			</s:if>
			<s:else>未使用</s:else>
			</td>
			<td colspan="2">
              <span class="viewPortal" id="<s:property value="#keyword.id"/>" customId="<s:property value="#keyword.customId"/>" > <a>查看</a></span> | <span class="modifyPortal" id="<s:property value="#keyword.id"/>" customId="<s:property value="#keyword.customId"/>" kword="<s:property value="kword"/>" cname="<s:property value="cname"/>"> <a>修改</a></span>
			</td>
		</tr>
		</s:iterator>
	</s:if>
</tbody>
</table>

<div class="pagination pagination-centered">
						  <ul>
							<li><a href="/myportalmanage.action?page.page=1&keywords.keywords=<s:property value='keywords.keywords'/>&kword=<s:property value='kword'/>&cname=<s:property value='cname'/>" title="首页">首页</a></li>
							<s:if test="page.prevPages!=null">
								<s:iterator value="page.prevPages" var="num">
									<li><a
										href="/myportalmanage.action?page.page=${num}&keywords.keywords=<s:property value='keywords.keywords'/>&kword=<s:property value='kword'/>&cname=<s:property value='cname'/>"
										class="number" title="<s:property value='#num'/>"><s:property
											value="#num" /> </a></li>
								</s:iterator>
							</s:if>
							<li class="active">
							  <a href="#"title="<s:property value='page.page'/>"><s:property value='page.page' /> </a>
							</li>
							<s:if test="page.nextPages!=null">
								<s:iterator value="page.nextPages" var="num">
									<li><a href="/myportalmanage.action?page.page=${num}&keywords.keywords=<s:property value='keywords.keywords'/>&kword=<s:property value='kword'/>&cname=<s:property value='cname'/>" title="<s:property value='#num'/>">
									<s:property value="#num" /> </a></li>
								</s:iterator>
							</s:if>
							<li><a href="/myportalmanage.action?page.page=${page.pageCount}&keywords.keywords=<s:property value='keywords.keywords'/>&kword=<s:property value='kword'/>&cname=<s:property value='cname'/>" title="尾页">尾页</a></li>
						  </ul>
						</div>
</div>
<link id='theme' rel='stylesheet' href='/css/myportallist.css'/>
<script type="text/javascript" src="/js/myportallist.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>