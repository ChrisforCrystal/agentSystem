<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void();">系统配置管理</a> \ 
	<s:if test="configType == 1">
		<a href="/caiwutype.action">账务类型</a>
	</s:if>
	<s:elseif test="configType == 2">
		<a href="/servicetype.action">服务类型</a>
	</s:elseif>
	<s:elseif test="configType == 3">
		<a href="/serviceyears.action">服务年限</a>
	</s:elseif>
	<s:elseif test="configType == 4">
		<a href="/appurl.action">APP地址</a>
	</s:elseif>
	<s:elseif test="configType == 5">
		<a href="/customtype.action">客户类型</a>
	</s:elseif>
	<s:elseif test="configType == 6">
		<a href="/cardtype.action">证件类型</a>
	</s:elseif>
	<s:elseif test="configType == 7">
		<a href="/youhuitype.action">优惠类型</a>
	</s:elseif>
	
</div>
<div class="container">
<s:if test="configType == 1 || configType == 2 || configType == 5 || configType == 6 || configType == 7">
<div id="modifySystemdiv" class="modifySystemdiv modifyback">
	<ul>
		<li class="lititle"><b>您正在进行修改操作</b></li>
		<li>
		<input type="hidden" id="sid"/>
		<input type="hidden" id="modifyConfigType" value="<s:property value='configType'/>"/>
		类型名称：<input type="text" id="configName"/></li>
		<s:if test="configType == 7 || configType == 2">
			<li>类型数值：<input type="text" id="modifyConfigValue"/></li>
		</s:if>
		<s:if test="configType == 7">
			<li>实际数值：<input type="text" id="modifyConfigTypeValue"/></li>
		</s:if>
		<li>是否启用：<span id="isstart"></span> 
		<input type="button" id="modifySystemConfigBtn" value="保存"/> 
		<input type="button" id="cancleModifySystemConfigBtn" value="取消"/> 
		</li>
	</ul>
</div>
<div id="addSystemdiv" class="modifySystemdiv addback">
	<ul>
		<li class="lititle"><b>您正在进行添加操作</b></li>
		<li>
		<input type="hidden" id="addConfigType" value="<s:property value='configType'/>"/>
		类型名称：<input type="text" id="addConfigName"/></li>
		<s:if test="configType == 7 || configType == 2">
			<li>类型数值：<input type="text" id="addConfigValue"/></li>
		</s:if>
		<s:if test="configType == 7">
			<li>实际数值：<input type="text" id="addConfigTypeValue"/></li>
		</s:if>
		<li>是否启用：
		<select id="addIsStartSelect">
			<option value="1">启用</option>
			<option value="2">不启用</option>
		</select> 
		<input type="button" id="addSystemConfigBtn" value="保存"/> 
		<input type="button" id="cancleAddSystemConfigBtn" value="取消"/> 
		</li>
	</ul>
</div>
</s:if>

	<s:if test="configType == 1">
	
		<div>
		<div class="addSystemConfig">
			<input type="button" id="addsystemconfig" value="添加账务类型"/>
		</div>
			<table>
			  <thead>
				  <tr>
					  <th>序号</th>
					  <th>配置类型</th>
					  <th>是否启用</th>
					  <th colspan="2">操作</th>                                          
				  </tr>
			  </thead>   
			  <tbody>
			  <s:iterator value="systemConfigList" status="sta">
			  	<tr>
					<td><s:property value="#sta.index + 1"/></td>
					<td><s:property value="configTypeName"/></td>
					<td><s:if test="isStart == 1"><font color="green">启用</font></s:if><s:else><font color="red">未启用</font></s:else>  </td>
					<td colspan="2">
						<span class="modifySystemBtn" sid="<s:property value="id"/>" configtype="<s:property value="configType"/>" sname="<s:property value="configTypeName"/>" isstart="<s:property value="isStart"/>"><a>修改</a></span> | 
						<span class="deleteSystemBtn" sname="<s:property value="configTypeName"/>" sid="<s:property value="id"/>"><a>删除</a></span>
					</td>
				<tr>
			  </s:iterator>
			</table>
		</div>		

	</s:if>
	<s:elseif test="configType == 2">
		<div>
		<div class="addSystemConfig">
			<input type="button" id="addsystemconfig" value="添加服务类型"/>
		</div>
			<table>
			  <thead>
				  <tr>
					  <th>序号</th>
					  <th>配置类型</th>
					  <th>配置数值</th>
					  <th>是否启用</th>
					  <th colspan="2">操作</th>                                          
				  </tr>
			  </thead>   
			  <tbody>
			  <s:iterator value="systemConfigList" status="sta">
			  	<tr>
					<td><s:property value="#sta.index + 1"/></td>
					<td><s:property value="configTypeName"/></td>
					<td><s:property value="configValue"/></td>
					<td><s:if test="isStart == 1"><font color="green">启用</font></s:if><s:else><font color="red">未启用</font></s:else>  </td>
					<td colspan="2">
						<span class="modifySystemBtn" sid="<s:property value="id"/>" configtype="<s:property value="configType"/>" sname="<s:property value="configTypeName"/>" configvalue="<s:property value="configValue"/>" isstart="<s:property value="isStart"/>"><a>修改</a></span> 
						<s:if test="id!=12 && id!=13">
						| <span class="deleteSystemBtn" sname="<s:property value="configTypeName"/>" sid="<s:property value="id"/>"><a>删除</a></span>
						</s:if>
					</td>
				<tr>
			  </s:iterator>
			</table>
		</div>		
	</s:elseif>
	<s:elseif test="configType == 3">
		<div class="simpleconfig">
		<H3>服务年限管理-填写最大的服务年限</H3>
			<input type="hidden" id="configType" value="<s:property value='configType'/>"/>
			<ul>
				<li>配置名称：<input type="text" id="simpTypeName" value="<s:property value='systemConfig.configTypeName'/>" disabled="disabled"/></li>
				<li>配置数值：<input type="text" id="simpConfigValue" value="<s:property value='systemConfig.configValue'/>"/></li>
				<li>
				<input type="hidden" id="simpleId" value="<s:property value='systemConfig.id'/>"/>
				<input type="button" id="simpleBtn" value="保存"/></li>
			</ul>
		</div>
	</s:elseif>
	<s:elseif test="configType == 4">
		<div class="simpleconfig">
		<H3>APP URL管理-填写制作APP的系统的URL地址</H3>
			<input type="hidden" id="configType" value="<s:property value='configType'/>"/>
			<ul>
				<li>配置名称：<input type="text" id="simpTypeName" value="<s:property value='systemConfig.configTypeName'/>"/></li>
				<li>配置数值：<input type="text" id="simpConfigValue" value="<s:property value='systemConfig.configValue'/>"/></li>
				<li>
				<input type="hidden" id="simpleId" value="<s:property value='systemConfig.id'/>"/>
				<input type="button" id="simpleBtn" value="保存"/></li>
			</ul>
		</div>
	</s:elseif>
	<s:elseif test="configType == 5">
		<div>
		<div class="addSystemConfig">
			<input type="button" id="addsystemconfig" value="添加客户类型"/>
		</div>
			<table>
			  <thead>
				  <tr>
					  <th>序号</th>
					  <th>配置类型</th>
					  <th>是否启用</th>
					  <th colspan="2">操作</th>                                          
				  </tr>
			  </thead>   
			  <tbody>
			  <s:iterator value="systemConfigList" status="sta">
			  	<tr>
					<td><s:property value="#sta.index + 1"/></td>
					<td><s:property value="configTypeName"/></td>
					<td><s:if test="isStart == 1"><font color="green">启用</font></s:if><s:else><font color="red">未启用</font></s:else>  </td>
					<td colspan="2">
						<span class="modifySystemBtn" sid="<s:property value="id"/>" configtype="<s:property value="configType"/>" sname="<s:property value="configTypeName"/>" isstart="<s:property value="isStart"/>"><a>修改</a></span> | <span class="deleteSystemBtn" sname="<s:property value="configTypeName"/>" sid="<s:property value="id"/>"><a>删除</a></span>
					</td>
				<tr>
			  </s:iterator>
			</table>
		</div>		
	</s:elseif>
	<s:elseif test="configType == 6">
		<div>
		<div class="addSystemConfig">
			<input type="button" id="addsystemconfig" value="添加证件类型"/>
		</div>
			<table>
			  <thead>
				  <tr>
					  <th>序号</th>
					  <th>配置类型</th>
					  <th>是否启用</th>
					  <th colspan="2">操作</th>                                          
				  </tr>
			  </thead>   
			  <tbody>
			  <s:iterator value="systemConfigList" status="sta">
			  	<tr>
					<td><s:property value="#sta.index + 1"/></td>
					<td><s:property value="configTypeName"/></td>
					<td><s:if test="isStart == 1"><font color="green">启用</font></s:if><s:else><font color="red">未启用</font></s:else>  </td>
					<td colspan="2">
						<span class="modifySystemBtn" sid="<s:property value="id"/>" configtype="<s:property value="configType"/>" sname="<s:property value="configTypeName"/>" isstart="<s:property value="isStart"/>"><a>修改</a></span> | <span class="deleteSystemBtn" sname="<s:property value="configTypeName"/>" sid="<s:property value="id"/>"><a>删除</a></span>
					</td>
				<tr>
			  </s:iterator>
			</table>
		</div>		
	</s:elseif>
	<s:elseif test="configType == 7">
		<div>
		<div class="addSystemConfig">
			<input type="button" id="addsystemconfig" value="添加优惠类型"/>
		</div>
			<table>
			  <thead>
				  <tr>
					  <th>序号</th>
					  <th>配置类型</th>
					  <th>配置数值</th>
					  <th>实际数值</th>
					  <th>是否启用</th>
					  <th colspan="2">操作</th>                                          
				  </tr>
			  </thead>   
			  <tbody>
			  <s:iterator value="systemConfigList" status="sta">
			  	<tr>
					<td><s:property value="#sta.index + 1"/></td>
					<td><s:property value="configTypeName"/></td>
					<td><s:property value="configValue"/></td>
					<td><s:property value="configTypeValue"/></td>
					<td><s:if test="isStart == 1"><font color="green">启用</font></s:if><s:else><font color="red">未启用</font></s:else>  </td>
					<td colspan="2">
						<span class="modifySystemBtn" sid="<s:property value="id"/>" configtype="<s:property value="configType"/>" sname="<s:property value="configTypeName"/>" configvalue="<s:property value="configValue"/>" isstart="<s:property value="isStart"/>" configtypevalue="<s:property value="configTypeValue"/>"><a>修改</a></span> | <span class="deleteSystemBtn" sname="<s:property value="configTypeName"/>" sid="<s:property value="id"/>"><a>删除</a></span>
					</td>
				<tr>
			  </s:iterator>
			</table>
		</div>		
	</s:elseif>

</div>
<link id='theme' rel='stylesheet' href='/css/systemconfig.css'/>
<script type="text/javascript" src="/js/systemconfig.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>