<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="/main.action">代理商管理</a> \ <a href="/customlist.action">代理商客户管理</a> \ <a href="/addcustom.action?custom.id=<s:property value='custom.id'/>">添加客户信息</a>
</div>
<div class="container">
<form id="cform" action="/addsavecustom.action" method="post">
	<div class="subtitle">基本信息</div>
	<div class="info1">
		<ul>
			<li>企业名称：
			<input type="text" name="custom.customName" id="custom_name"/> <span style="color:red;">*</span></li>
			<li>企业类型：<input id="customtypename" type="hidden" name="custom.customTypeName" value=""/>
        	 	<select id="selectcustomtype" name="custom.customType">
        	 		<option value="0" selected="selected">--请选择--</option>
	      				<s:if test="customTypeList != null">
	      					<s:iterator value="customTypeList">
	      						<option value="<s:property value='configTypeValue'/>"><s:property value="configTypeName"/></option>
	      					</s:iterator>
	      				</s:if>
	      		</select> <span style="color:red;">*</span></li>
			<li>企业主页：<input type="text" name="custom.siteUrl" /></li>
			<li>状态：<select name="custom.customStatus">
	      			<option value="1" selected="selected">启用</option>
	      			<option value="0">停用</option>
	      		 </select> <span style="color:red;">*</span></li>
		</ul>
		<div class="clear"></div>
	</div>
	<div class="subtitle">门户信息</div>
	<div class="info2">
		<ul>
			<li>法人代表：<input type="text" name="custom.bossName"/></li>
			<li>注册日期：<input class="Wdate" id="regdate" size="15" name="custom.regDatetime" value="" readonly="readonly"  type="text" onClick="WdatePicker()" /></li>
			<li>证件类型：<input id="cardtypename" type="hidden" name="custom.cardTypeName" value=""/>
			<select id="selectcardtype" name="custom.cardType">
        	 		<option value="0" selected="selected">--请选择--</option>
	      				<s:if test="cardTypeList != null">
	      					<s:iterator value="cardTypeList">
	      						<option value="<s:property value='configTypeValue'/>"><s:property value="configTypeName"/></option>
	      					</s:iterator>
	      				</s:if>
	      		</select></li>
			<li>证件号码：<input id="card_num" type="text" name="custom.cardNum"/></li>
			<li>国家：<input type="text" name="custom.country" value="中国" /></li>
			<li>省/地区：<select id="selectprovince" name="custom.province">
        	 		<option value="0" selected="selected">--请选择--</option>
	      				<s:if test="provinceList != null">
	      					<s:iterator value="provinceList">
	      						<option value="<s:property value='provinceID'/>"><s:property value="province"/></option>
	      					</s:iterator>
	      				</s:if>
	      		</select>
			</li>
			<li>公司传真：<input type="text" name="custom.companyFax"/></li>
			<li>城市：
			<select id="selectcity" name="custom.city">
        	 		<option value="0" selected="selected">--请选择--</option>
	      		</select>
			</li>
			<li>公司电话：<input type="text" name="custom.companyTel"/></li>
			<li>区：
			<select id="selectarea" name="custom.area">
        	 		<option value="0" selected="selected">--请选择--</option>
	      		</select>
			<li>公司地址：<input type="text" name="custom.companyAddress"/></li>
		</ul>
		<div class="clear"></div>
		<div>
		备注：<textarea rows="2" cols="50" name="custom.memo"></textarea>
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
            </tbody>
          </table>    
	</div>
	<div class="goback"><input type="button" value="保存" onclick="checksave();"/> <input type="button" onclick="window.history.back(-1);" value="返回" /> </div>


</form>
	
</div>
<link id='theme' rel='stylesheet' href='/css/addcustom.css'/>
<script type="text/javascript" src="/js/addcustom.js" charset="UTF-8"></script> 
<script type="text/javascript" src="/medire/WdatePicker.js"></script>
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>
