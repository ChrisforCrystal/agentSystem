<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/head.jsp" %>
<div class="mbxnav">
	<a href="javascript:void();">系统管理</a> \ <a href="/userlist.action">用户管理</a>
</div>
<div class="container">


<div class="searchuserdiv ope">
	<ul>
		<li>
		<form action="/userlist.action" method="post">
		用户名称:
		<input type="text" id="uname" name="uname" value="<s:property value="uname"/>"/>
		角色：
		<select name="user.roleId">
 			<option value="" selected="selected">--请选择--</option>
 			<s:if test="roleList != null">
 				<s:iterator value="roleList">
 					<option 
 					<s:if test="user.roleId == id">selected = "selected"</s:if>
 					value="<s:property value='id'/>"><s:property value="roleName"/></option>
 				</s:iterator>
 			</s:if>
 		</select>
 		是否启用：
		<select name="user.isStart">
		<option value="" selected="selected">--请选择--</option>
 			<s:if test="user.isStart == 1">
 				<option value="1" selected="selected">启用</option>
 				<option value="0">未启用</option>
 			</s:if>
 			<s:elseif test="user.isStart == 0">
 				<option value="0" selected="selected">未启用</option>
 				<option value="1">启用</option>
 			</s:elseif>
 			<s:else>
	 			<option value="0">未启用</option>
	 			<option value="1">启用</option>
 			</s:else>
 		</select>
		<input type="submit" value="查询"/>
		</form>
		</li>
	</ul>
</div>
	<div id="addUserDiv" class="addUserDivClass addback">
 		<ul>
 			<li class="lititle">
      				<b>添加代理商用户信息</b>
      			</li>
 			<li>登录账号：<input id="a_userCode" type="text" name="user.userCode" /> <span>*</span></li>
 			<li>用户名称：<input id="a_userName" type="text" name="user.userName"/> <span>*</span></li>
 			<li>登录密码：<input id="a_userPassword" type="password" name="user.userPassword" value="123456"/> <span>*默认初始密码123456</span></li>
 			<li>角&nbsp;&nbsp;&nbsp;&nbsp;色：
 			<select id="a_roleId" name="user.roleId">
 				<option value="0" selected="selected">--请选择--</option>
 				<s:if test="roleList != null">
 					<s:iterator value="roleList">
 						<option value="<s:property value='id'/>"><s:property value="roleName"/></option>
 					</s:iterator>
 				</s:if>
 			</select> <span>*</span>
 			</li>
 			<li>是否启用：
 			<select id="a_isStart" name="user.isStart">
 				<option value="1" selected="selected">启用</option>
 				<option value="0">不启用</option>
 			</select> <span>*</span>
 			<input id="addUserSubmit" type="button" value="保存"/> <input id="addcancel" type="reset" value="取消"/></li>
 		</ul>
	</div>
	  <div id="modifyUserDiv" class="addUserDivClass modifyback">
      		<ul>
      			<li class="lititle">
      				<input id="m_userId" type="hidden" name="user.id"/>
      				<b>修改代理商用户信息</b>
      			</li>
      			<li>登录账号：<input id="m_userCode"  type="text" name="user.userCode" /> <span>*</span></li>
      			<li>用户名称：<input id="m_userName"  type="text" name="user.userName" /> <span>*</span></li>
      			<li>登录密码：<input id="m_userPassword"  type="password" name="user.userPassword" /> <span>*</span></li>
      			<li>角&nbsp;&nbsp;&nbsp;&nbsp;色：
      			<span id=m_SelectRole></span> <span>*</span>
      			</li>
      			<li>是否启用：
      			<span id="m_Select"></span> <span>*</span>
      			<input id="modifyUserSubmit" type="submit" value="保存"/> <input id="modifycancel" type="button" value="取消"/></li>
      		</ul>
      	</div>
      	
      	<div class="addUserDiv"><input id="addUser" type="button" value="新增" /></div>
      	
        <table>
          <thead>
            <tr>
		     	<th>登录账号</th>
		     	<th>用户名称</th>
		     	<th>角色</th>
		     	<th>创建时间</th>
		     	<th>是否启用</th>
		     	<th colspan="3">操作</th>
  			</tr>
          </thead>
          <tbody>
            <s:if test="page.items != null">
            <s:iterator value="page.items" status="sta" var="user">
            	<tr>
                    <td><s:property value="#user.userCode"/></td>
                    <td><s:property value="#user.userName"/></td>
                    <td><s:property value="#user.roleName"/></td>
                    <td><s:date name="#user.creationTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                    <s:if test="#user.isStart == 1">启用</s:if>
                    <s:else>未启用</s:else>
                    </td>
                    <td colspan="3">
						<span class="modifyUser" userid="<s:property value="#user.id"/>" usercode="<s:property value="#user.userCode"/>" username="<s:property value="#user.userName"/>"  userpassword="<s:property value="#user.userPassword"/>" isstart="<s:property value="#user.isStart"/>" roleid="<s:property value="#user.roleId"/>" rolename="<s:property value="#user.roleName"/>"><a>修改</a></span> | <span class="deleteUser" usercode="<s:property value="#user.userCode"/>"  userid="<s:property value="#user.id"/>" currentUserRoleId="<s:property value="currentUser.roleId"/>" roleid="<s:property value="#user.roleId"/>"><a>删除</a></span>  |  <a href="javascript:ymPrompt.win('/yfklist.action?user.id=<s:property value='#user.id'/>&user.userCode=<s:property value='#user.userCode'/>',1000,500,' 预付款',null,null,null,true);">预付款</a> | <a href="javascript:ymPrompt.win('/loglist.action?user.id=<s:property value='#user.id'/>&user.userCode=<s:property value='#user.userCode'/>',1015,540,' LOG日志',null,null,null,true);">LOG日志</a>
					</td>
                    <!--  
                    <td>
                    	<ul>
                     		<li><a class="modifyUser" userid="<s:property value="#user.id"/>" usercode="<s:property value="#user.userCode"/>" username="<s:property value="#user.userName"/>"  userpassword="<s:property value="#user.userPassword"/>" isstart="<s:property value="#user.isStart"/>" roleid="<s:property value="#user.roleId"/>" rolename="<s:property value="#user.roleName"/>">修改</a></li>
                     		<li><a class="deleteUser" usercode="<s:property value="#user.userCode"/>"  userid="<s:property value="#user.id"/>">删除</a></li>
							<li><a href="javascript:ymPrompt.win('/yfklist.action?user.id=<s:property value='#user.id'/>&user.userCode=<s:property value='#user.userCode'/>',800,500,' 预付款',null,null,null,true);">预付款</a></li>
                     	</ul>
					</td>
					-->
                 </tr>   
              </s:iterator>
              </s:if>
           </tbody>
         </table>
              
   <div class="pagination pagination-centered">
	  <ul>
		<li><a href="/userlist.action?page.page=1&user.userName=<s:property value='user.userName'/>&user.roleId=<s:property value='user.roleId'/>&user.isStart=<s:property value='user.isStart'/>" title="首页">首页</a></li>
		<s:if test="page.prevPages!=null">
			<s:iterator value="page.prevPages" var="num">
				<li><a
					href="/userlist.action?page.page=${num}&user.userName=<s:property value='user.userName'/>&user.roleId=<s:property value='user.roleId'/>&user.isStart=<s:property value='user.isStart'/>"
					class="number" title="<s:property value='#num'/>"><s:property
						value="#num" /> </a></li>
			</s:iterator>
		</s:if>
		<li class="active">
		  <a href="#" title="<s:property value='page.page'/>"><s:property value='page.page' /> </a>
		</li>
		<s:if test="page.nextPages!=null">
			<s:iterator value="page.nextPages" var="num">
				<li><a href="/userlist.action?page.page=${num}&user.userName=<s:property value='user.userName'/>&user.roleId=<s:property value='user.roleId'/>&user.isStart=<s:property value='user.isStart'/>" title="<s:property value='#num'/>">
				<s:property value="#num" /> </a></li>
			</s:iterator>
		</s:if>
		<li><a href="/userlist.action?page.page=${page.pageCount}&user.userName=<s:property value='user.userName'/>&user.roleId=<s:property value='user.roleId'/>&user.isStart=<s:property value='user.isStart'/>" title="尾页">尾页</a></li>
	  </ul>
  </div>
</div>

<script type="text/javascript">
	var roleListJson = [
			<s:iterator value="roleList">
			{"id":"<s:property value='id'/>","roleName":"<s:property value='roleName'/>"},
			</s:iterator>{"id":"over","roleName":"over"}];
</script>
<link id='theme' rel='stylesheet' href='/css/userlist.css'/>
<script type="text/javascript" src="/js/userlist.js" charset="UTF-8"></script> 
<jsp:include page="/inc/foot.jsp"></jsp:include>
</body>
</html>
