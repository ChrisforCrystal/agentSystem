<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@include file="/inc/iframehead.jsp" %>
	<div class="container">
	<h3>功能列表</h3>
	<div class="btndiv">
		<input type="hidden" id="roleid" value="<s:property value="roleId"/>"/>
		<input id="saverolefunc" type="button" value="保存" />
		<input id="cancel" type="button" value="取消" />
	</div>
		
		<s:if test="funcList != null">
            <table>
            <thead>
            <tr>
	     	<th><input type="checkbox" id="cball"/>全选/全不选</th>
	     	<th>功能名称</th>
	     	<th>功能URL</th>
	     	<th>创建时间</th>
	     	<th>是否启用</th>
  			</tr>
            </thead>
            <tbody>
            <s:iterator value="funcList" status="sta">
            	<tr>
                    <td>
                    <s:if test="isCheck">
                    	<input class="cb" type="checkbox" checked="checked" value="<s:property value='id'/>"/>
                    </s:if>
                    <s:else>
                    	<input class="cb" type="checkbox" value="<s:property value='id'/>"/>
                    </s:else>
                    </td>
                    <td><s:property value="functionName"/></td>
                    <td><s:property value="funcUrl"/></td>
                    <td><s:date name="creationTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                    <s:if test="isStart == 1">启用</s:if>
                    <s:else>未启用</s:else>
                    </td>
                 </tr>   
              </s:iterator>
              </tbody>
            </table>
       </s:if>
       
</div>
<link id='theme' rel='stylesheet' href='/css/functionlist.css'/>
<script type="text/javascript" src="/js/functionlist.js" charset="UTF-8"></script> 
</body>
</html>
