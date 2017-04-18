<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="/main.action">代理商管理</a> \ <a href="/customlist.action">代理商客户管理</a> \ <a href="/modifycustom.action?custom.id=<s:property value='custom.id'/>">修改客户信息</a>
</div>
<div class="container">
<form id="cform" action="/modifysavecustom.action" method="post">
	<input type="hidden" id="id" name="custom.id" value="<s:property value='custom.id'/>"/>
	<input type="hidden" name="cname" value="<s:property value='cname'/>"/>
	<div class="subtitle">基本信息</div>
	<div class="info1">
		<ul>
			<li>企业名称：
			<input type="text" id="custom_name" name="custom.customName" value="<s:property value="custom.customName"/>" /> <span style="color:red;">*</span></li>
			<li>企业类型：<input id="customtypename" type="hidden" name="custom.customTypeName" value="<s:property value="custom.customTypeName"/>"/>
			    <select id="selectcustomtype" name="custom.customType">
        	 		<option value="0" selected="selected">--请选择--</option>
	      				<s:if test="customTypeList != null">
	      					<s:iterator value="customTypeList">
	      					<option
							<s:if test="custom.customType == configTypeValue">
							selected = "selected"
							</s:if>
				 			value="<s:property value='configTypeValue'/>"><s:property value='configTypeName'/></option>
	      					</s:iterator>
	      				</s:if>
	      		</select> <span style="color:red;">*</span></li>
			<li>企业主页：<input type="text" name="custom.siteUrl" value="<s:property value="custom.siteUrl"/>" /></li>
			<li>状态：<select name="custom.customStatus" >
	        	 	  <s:if test="custom.customStatus == 1">
	        	 	  	<option value="1" selected="selected">启用</option>
	        	 	  	<option value="0">停用</option>
	        	 	  </s:if>
	        	 	  <s:else>
	        	 	  	<option value="0" selected="selected">停用</option>
	        	 	  	<option value="0">启用</option>
					  </s:else>
	      		 </select> <span style="color:red;">*</span></li>
		</ul>
		<div class="clear"></div>
	</div>
	<div class="subtitle">门户信息</div>
	<div class="info2">
		<ul>
			<li>法人代表：<input type="text" name="custom.bossName" value="<s:property value="custom.bossName"/>" /></li>
			<li>注册日期：<input class="Wdate" id="regdate" size="15" name="custom.regDatetime" value="<s:date name="custom.regDatetime" format="yyyy-MM-dd"/>" readonly="readonly"  type="text" onClick="WdatePicker()" /></li>
			<li>证件类型：<input id="cardtypename" type="hidden" name="custom.cardTypeName" value="<s:property value="custom.cardTypeName"/>"/>
			     <select id="selectcardtype" name="custom.cardType" >
        	 		<option value="0" selected="selected">--请选择--</option>
	      				<s:if test="cardTypeList != null">
	      					<s:iterator value="cardTypeList">
	      					<option
							<s:if test="custom.cardType == configTypeValue">
							selected = "selected"
							</s:if>
				 			value="<s:property value='configTypeValue'/>"><s:property value='configTypeName'/></option>
	      					</s:iterator>
	      				</s:if>
	      		</select></li>
			<li>证件号码：<input type="text" name="custom.cardNum" value="<s:property value="custom.cardNum"/>" /></li>
			<li>国家：<input type="text" name="custom.country" value="<s:property value="custom.country"/>" /></li>
			<li>省/地区：<select id="selectprovince" name="custom.province" >
					<s:if test="custom.province == 0">
					<option value="0" selected="selected">--请选择--</option>
					</s:if>
        	 		<s:if test="provinceList != null">
        	 		 <s:iterator value="provinceList">
		        	 	  <s:if test="custom.province == provinceID">
		        	 	    <option value="<s:property value='provinceID'/>" selected="selected"><s:property value="province"/></option>
		        	 	  </s:if>
		        	 	  <s:else>
		        	 	  	<option value="<s:property value='provinceID'/>"><s:property value="province"/></option>
		        	 	  </s:else>
					  </s:iterator>
					</s:if>
	      		 </select>
			</li>
			<li>公司传真：<input type="text" name="custom.companyFax" value="<s:property value="custom.companyFax"/>"/></li>
			<li>城市：
			<select id="selectcity" name="custom.city" >
					<s:if test="custom.city == 0">
					<option value="0" selected="selected">--请选择--</option>
					</s:if>
        	 		<s:if test="cityList != null">
        	 		 <s:iterator value="cityList">
		        	 	  <s:if test="custom.city == cityID">
		        	 	    <option value="<s:property value='cityID'/>" selected="selected"><s:property value="city"/></option>
		        	 	  </s:if>
		        	 	  <s:else>
		        	 	  	<option value="<s:property value='cityID'/>"><s:property value="city"/></option>
		        	 	  </s:else>
					  </s:iterator>
					</s:if>
	      		 </select>
			</li>
			<li>公司电话：<input type="text" name="custom.companyTel" value="<s:property value="custom.companyTel"/>"/></li>
			<li>区：
			<select id="selectarea" name="custom.area" >
					<s:if test="custom.area == 0">
					<option value="0" selected="selected">--请选择--</option>
					</s:if>
        	 		<s:if test="areaList != null">
        	 		 <s:iterator value="areaList">
		        	 	  <s:if test="custom.area == areaID">
		        	 	    <option value="<s:property value='areaID'/>" selected="selected"><s:property value="area"/></option>
		        	 	  </s:if>
		        	 	  <s:else>
		        	 	  	<option value="<s:property value='areaID'/>"><s:property value="area"/></option>
		        	 	  </s:else>
					  </s:iterator>
					</s:if>
	      		 </select>
			<li>公司地址：<input type="text" name="custom.companyAddress" value="<s:property value="custom.companyAddress"/>" /></li>
		</ul>
		<div class="clear"></div>
		<div>
		备注：<textarea rows="2" cols="50" name="custom.memo"><s:property value="custom.memo"/></textarea>
		</div>
	</div>
	<div class="subtitle"> 
	<a href="javascript:void(0);" id="addcontact">添加一个联系人</a>
          <s:if test="contactList == null"><input type="hidden" id="c_count" value="0"/></s:if>
          <s:else><input type="hidden" id="c_count" value="<s:property value="contactList.size()"/>"/></s:else></div>
	<div class="info3">
		<table>
            <thead>
            <tr>
	     	<th>姓名</th>
	     	<th>电话</th>
	     	<th>传真</th>
	     	<th>邮箱</th>
	     	<th>职务</th>
	     	<th>操作</th>
  			</tr>                                                                          
            </thead>
            <tbody id="addtr">
            	<s:if test="contactList != null">
            	<s:iterator value="contactList" status="sta">
            		<tr>
            		<td><input type="text" name="contactList[<s:property value='#sta.index'/>].contactName" value="<s:property value="contactName"/>"/><span style="color:red;">*</span></td>
					<td><input type="text" name="contactList[<s:property value='#sta.index'/>].contactTel" value="<s:property value="contactTel"/>"/><span style="color:red;">*</span></td>
					<td><input type="text" name="contactList[<s:property value='#sta.index'/>].contactFax" value="<s:property value="contactFax"/>"/></td>
					<td><input type="text" name="contactList[<s:property value='#sta.index'/>].contactEmail" value="<s:property value="contactEmail"/>"/></td>
					<td><input type="text" name="contactList[<s:property value='#sta.index'/>].contactRole" value="<s:property value="contactRole"/>"/></td>
					<td onclick="getDel(this)"><a href='javascript:void(0);'>删除</a></td>
					</tr>
            	</s:iterator>
            	</s:if>
            </tbody>
          </table>    
	</div>
	<div class="goback"><input type="button" value="保存" onclick="checksave();"/> <input type="button" onclick="window.history.back(-1);" value="返回" /> </div>


</form>


</div>
<link id='theme' rel='stylesheet' href='/css/modifycustom.css'/>
<script type="text/javascript" src="/js/modifycustom.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>
