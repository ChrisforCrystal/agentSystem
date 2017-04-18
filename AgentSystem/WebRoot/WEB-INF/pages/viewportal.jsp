<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="/myportalmanage.action">门户管理</a> \ <a href="/viewportal.action?keywords.id=<s:property value='keywords.id'/>&keywords.customId=<s:property value='keywords.customId'/>">查看门户信息</a>
</div>
<div class="container">

	<div class="subtitle">注册的移动云端信息</div>
	<div class="info1">
		<ul>
			<li>登录账号：<s:property value="keywords.appUserName"/></li>
			<li>登陆密码：<s:property value="keywords.appPassword"/></li>
			<li>关键词：<s:property value="keywords.keywords"/></li>
			<li>登录地址：<s:property value="keywords.loginUrl"/></li>
			<li>客户端下载地址(IOS)：<s:property value="keywords.iosDownloadUrl"/></li>
			<li>二维码下载地址(IOS)：<s:property value="keywords.codeIosUrl"/></li>
			<li>客户端下载地址(Android)：<s:property value="keywords.androidDownloadUrl"/></li>
			<li>二维码下载地址(Android)：<s:property value="keywords.codeAndroidUrl"/></li>
			<li>关键词开始日期：<s:date name="keywords.regDatetime" format="yyyy-MM-dd"/></li>
			<li>关键词结束日期：<s:date name="keywords.regPassDatetime" format="yyyy-MM-dd"/></li>
			<li>关键词有效年限：<s:property value="keywords.serviceYears"/>年</li>
			
		</ul>
		<div class="clear"></div>
	</div>

	<div class="subtitle">基本信息</div>
	<div class="info1">
		<ul>
			<li>企业名称：<s:property value="custom.customName"/></li>
			<li>状态：<s:if test="custom.customStatus == 1">
	        	 	  	<font color="green">启用</font>
	        	 	  </s:if>
	        	 	  <s:else>
	        	 	  	<font color="red">停用</font>
					  </s:else></li>
			<li>企业类型：<s:property value="custom.customTypeName"/></li>
			<li>企业主页：<s:property value="custom.siteUrl"/></li>
		</ul>
		<div class="clear"></div>
	</div>
	<div class="subtitle">门户信息</div>
	<div class="info2">
		<ul>
			<li>法人代表：<s:property value="custom.bossName"/></li>
			<li>注册日期：<s:date name="custom.regDatetime" format="yyyy-MM-dd"/></li>
			<li>证件类型：<s:property value="custom.cardTypeName"/></li>
			<li>证件号码：<s:property value="custom.cardNum"/></li>
			<li>国家：<s:property value="custom.country"/></li>
			<li>省/地区：
				<s:if test="provinceList != null">
        	 		 <s:iterator value="provinceList">
		        	 	  <s:if test="custom.province == provinceID">
		        	 	    <s:property value="province"/>
		        	 	  </s:if>
					  </s:iterator>
					</s:if>
			</li>
			<li>区：
			<s:if test="areaList != null">
        	 		 <s:iterator value="areaList">
		        	 	  <s:if test="custom.area == areaID">
		        	 	    <s:property value="area"/>
		        	 	  </s:if>
					  </s:iterator>
					</s:if>
			</li>
			<li>城市：
			<s:if test="cityList != null">
        	 		 <s:iterator value="cityList">
		        	 	  <s:if test="custom.city == cityID">
		        	 	    <s:property value="city"/>
		        	 	  </s:if>
					  </s:iterator>
					</s:if>
			</li>
			<li>公司电话：<s:property value="custom.companyTel"/></li>
			<li>公司传真：<s:property value="custom.companyFax"/></li>
			<li>公司地址：<s:property value="custom.companyAddress"/></li>
			<li>备注：<s:property value="custom.memo"/></li>
		</ul>
		<div class="clear"></div>
	</div>

	<div class="subtitle">联系人信息</div>
	<div class="info3">
		<ul>
			<s:if test="contactList != null">
            	<s:iterator value="contactList" status="sta">
            		<li>
            			<div>姓名：<s:property value="contactName"/></div>
            			<div>电话：<s:property value="contactTel"/></div>
            			<div>传真：<s:property value="contactFax"/></div>
            			<div>邮箱：<s:property value="contactEmail"/></div>
            			<div>职务：<s:property value="contactRole"/></div>
            		</li>
            	</s:iterator>
            	</s:if><s:else>
            		<li>没有任何联系人</li>
            	</s:else>
		</ul>
		<div class="clear"></div>
	</div>
	<div class="goback"><input type="button" onclick="window.history.back(-1);" value="返回" /> </div>
</div>
<link id='theme' rel='stylesheet' href='/css/viewportal.css'/>
<script type="text/javascript" src="/js/viewportal.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>
