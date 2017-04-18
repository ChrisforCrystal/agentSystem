<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="/main.action">代理商管理</a> \ <a href="/customlist.action">代理商客户管理</a>
</div>
<div class="container">
	
		<form action="/customlist.action" method="post" >
             <div>
	            <label>客户名称:</label>
	            <input type="text" id="cname" name="cname" value="<s:property value="cname"/>"/>
	            <input type="submit" value="查询" /> 
              </div>
        </form>
        
        <div class="addCustomDiv">
        <input onclick="javascript:location.href='/addcustom.action';" type="button" value="添加客户" />
        </div>
		<s:if test="customList != null">
            <table>
            <thead>
            <tr>
	     	<th>序号</th>
	     	<th>客户名称</th>
	     	<th>法人代表</th>
	     	<th>注册时间</th>
	     	<th>类型</th>
	     	<th>状态</th>
	     	<th>操作</th>
  			</tr>
            </thead>
            <s:iterator value="customList" status="sta">
            	<tr class="tabletr">
            		<td>
            		<s:if test="1 >= page.page"><s:property value='#sta.index+1' /></s:if>
					<s:else>
					<s:property value='(page.page-1) * page.pageSize+#sta.index+1' />
					</s:else>
            		</td>
                    <td><s:property value="customName"/></td>
                    <td><s:property value="bossName"/></td>
                    <td><s:date name="regDatetime" format="yyyy-MM-dd"/></td>
                    <td><s:property value="customTypeName"/></td>
                    <td>
                    <span id="m_status<s:property value='#sta.index+1'/>">
                    <s:if test="customStatus == 1"><font color="green">启用</font></s:if>
                    <s:else><font color="red">停用</font></s:else>
                    </span>
                    </td>
                    <td class="funcli">
                    	<ul>
                     		<li><a class="viewCustom" id="<s:property value="id"/>">查看</a></li>
                     		<li><a class="modifyCustom" id="<s:property value="id"/>" cname="<s:property value="cname"/>">修改</a></li>
                     		<li>
                     		 <s:if test="customStatus == 1">
                     		 <a class="modifyCustomStatus" id="<s:property value="id"/>" mStatus="<s:property value="#sta.index+1"/>" customStatus="<s:property value="customStatus"/>" customName="<s:property value="customName"/>"><font color="red">停用</font></a></li>
                     		 </s:if>
                    		 <s:else>
							 <a class="modifyCustomStatus" id="<s:property value="id"/>"  mStatus="<s:property value="#sta.index+1"/>" customStatus="<s:property value="customStatus"/>" customName="<s:property value="customName"/>"><font color="green">启用</font></a></li>
							</s:else>
                     		
                     	</ul>
					</td>
                 </tr>   
              </s:iterator>
              </table>
              <div class="pagination pagination-centered">
						  <ul>
							<li><a href="/customlist.action?page.page=1&cname=<s:property value='cname'/>" title="首页">首页</a></li>
							<s:if test="page.prevPages!=null">
								<s:iterator value="page.prevPages" var="num">
									<li><a
										href="/customlist.action?page.page=${num}&cname=<s:property value='cname'/>"
										class="number" title="<s:property value='#num'/>"><s:property
											value="#num" /> </a></li>
								</s:iterator>
							</s:if>
							<li class="active">
							  <a href="#"title="<s:property value='page.page'/>"><s:property value='page.page' /> </a>
							</li>
							<s:if test="page.nextPages!=null">
								<s:iterator value="page.nextPages" var="num">
									<li><a href="/customlist.action?page.page=${num}&cname=<s:property value='cname'/>" title="<s:property value='#num'/>">
									<s:property value="#num" /> </a></li>
								</s:iterator>
							</s:if>
							<li><a href="/customlist.action?page.page=${page.pageCount}&cname=<s:property value='cname'/>" title="尾页">尾页</a></li>
						  </ul>
						</div>
       </s:if>
	</div>
<link id='theme' rel='stylesheet' href='/css/customlist.css'/>
<script type="text/javascript" src="/js/customlist.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>

