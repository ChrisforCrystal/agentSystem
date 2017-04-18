<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void();">系统管理</a> \ <a href="/checkkeyword.action">关键词审核</a>
</div>
<div class="container">

<h2>关键词审核</h2>

<div class="searchuserdiv ope">
	<ul>
		<li>
		<form action="/checkkeyword.action" method="post">
		关键词：<input type="text" value="<s:property value='keywords.keywords'/>" name="keywords.keywords"/>
		<input type="submit" value="查询"/> 
		<span class="okflow">审核流程：已申请（代理商申请） 》 审核中 》 通过 》 续费 </span> | 
		<span class="noflow">审核流程：已申请（代理商申请） 》 审核中 》 不通过</span>
		</form>
		</li>
	</ul>
</div>


 <table>
  <thead>
	  <tr>
		  <th>序号</th>
		  <th>关键词</th>
		  <th>客户名称</th>
		  <th>代理商</th>
		  <th>申请年限</th>
		  <th>申请日期</th>
		  <th>到期日期</th>
		  <th>申请到期状态</th>
		  <th>审核状态</th>
		  <th>使用状态</th>
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
			<td><s:property value='#keyword.agentName' /></td>
			<td><s:property value='#keyword.serviceYears' /></td>
			<td><s:date name='#keyword.regDatetime' format="yyyy-MM-dd HH:mm:ss"/></td>
			<td><s:date name='#keyword.regPassDatetime'  format="yyyy-MM-dd HH:mm:ss"/></td>
			<td>
				<s:if test="#keyword.isPass == 0">
					<font color="green">未过期</font>
				</s:if><s:elseif test="#keyword.isPass == 1">
					<font color="red">预注册过期</font>
				</s:elseif><s:elseif test="#keyword.isPass == 2">
					<font color="red">过期</font>
				</s:elseif>
			</td>
			<td>
			<s:if test="#keyword.checkStatus == 0">
					<font color="green">已申请</font>
				</s:if><s:elseif test="#keyword.checkStatus == 1">
					<font color="green">审核中</font>
				</s:elseif><s:elseif test="#keyword.checkStatus == 2">
					<font color="green">已通过</font>
				</s:elseif><s:elseif test="#keyword.checkStatus == 3">
					<font color="red">未通过</font>
				</s:elseif>
			</td>
			<td>
				<s:if test="#keyword.isUse == 0">
					<font color="red">未使用</font>
				</s:if><s:elseif test="#keyword.isUse == 1">
					<font color="green">已使用</font>
				</s:elseif>
			</td>
			<td>
				<select class="checkselect" kid="<s:property value='#keyword.id' />" keyword="<s:property value='#keyword.keywords' />">
					<option value="0">--请选择--</option>
					<s:if test="#keyword.checkStatus == 0 && #keyword.isUse == 1">
						<option value="1">审核中</option>
					</s:if>
					<s:elseif test="#keyword.checkStatus == 1 && #keyword.isUse == 1">
						<option value="2">审核通过</option>
						<option value="3">不通过</option>
					</s:elseif>
					<s:elseif test="#keyword.checkStatus == 2 && #keyword.isUse == 1">
						<option value="4">续费</option>
					</s:elseif>
					<s:if test="#keyword.isUse == 1">
						<option value="5">不使用</option>
					</s:if>
					<s:elseif test="#keyword.isUse == 0">
						<option value="6">使用</option>
					</s:elseif>
				</select>
			</td>
		</tr>
		</s:iterator>
	</s:if>
</tbody>
</table>

<div class="pagination pagination-centered">
						  <ul>
							<li><a href="/checkkeyword.action?page.page=1&keywords.keywords=<s:property value='keywords.keywords'/>" title="首页">首页</a></li>
							<s:if test="page.prevPages!=null">
								<s:iterator value="page.prevPages" var="num">
									<li><a
										href="/checkkeyword.action?page.page=${num}&keywords.keywords=<s:property value='keywords.keywords'/>"
										class="number" title="<s:property value='#num'/>"><s:property
											value="#num" /> </a></li>
								</s:iterator>
							</s:if>
							<li class="active">
							  <a href="#"title="<s:property value='page.page'/>"><s:property value='page.page' /> </a>
							</li>
							<s:if test="page.nextPages!=null">
								<s:iterator value="page.nextPages" var="num">
									<li><a href="/checkkeyword.action?page.page=${num}&keywords.keywords=<s:property value='keywords.keywords'/>" title="<s:property value='#num'/>">
									<s:property value="#num" /> </a></li>
								</s:iterator>
							</s:if>
							<li><a href="/checkkeyword.action?page.page=${page.pageCount}&keywords.keywords=<s:property value='keywords.keywords'/>" title="尾页">尾页</a></li>
						  </ul>
						</div>
</div>
<link id='theme' rel='stylesheet' href='/css/checkkeyword.css'/>
<script type="text/javascript" src="/js/checkkeyword.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>