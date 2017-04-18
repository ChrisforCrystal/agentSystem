$().ready(function(){
	//init
	$("#addUserDiv").css("display","none");
	$("#modifyUserDiv").css("display","none");
	
	$(".modifyUser").click(function(){
		var b = $(this);
		$("#addUserDiv").slideUp(500);
		$("#modifyUserDiv").slideDown(500);
		$("#m_userCode").val(b.attr('usercode'));
		$("#m_userName").val(b.attr('username'));
		/*$("#m_userPassword").val(b.attr('userpassword'));*/
		$("#m_userId").val(b.attr('userid'));
		var isStart = b.attr('isstart');
		var select;
		if(isStart == '1'){
			select = $("<select id=\"m_isStart\" name=\"user.isStart\">"+
	      				"<option value=\"1\" selected=\"selected\">启用</option>"+
	      				"<option value=\"0\">不启用</option>"+
      					"</select>");
		}else{
			select = $("<select id=\"m_isStart\" name=\"user.isStart\">"+
	      				"<option value=\"1\">启用</option>"+
	      				"<option value=\"0\" selected=\"selected\">不启用</option>"+
      					"</select>");
		}
		$("#m_Select").html('');
		$("#m_Select").append(select);
		var roleId = b.attr('roleid');
		var roleName = b.attr('rolename');
		var selectrole;
		selectrole = "<select id=\"m_roleId\" name=\"user.roleId\">";
		for(var i=0;i<roleListJson.length-1;i++){
			if(roleListJson[i].id == roleId){
				selectrole = selectrole + "<option value=\""+roleId+"\" selected=\"selected\">"+roleName+"</option>";
			}else{
				selectrole = selectrole + "<option value=\""+roleListJson[i].id+"\">"+roleListJson[i].roleName+"</option>";
			}
		}
		selectrole = $(selectrole);
		$("#m_SelectRole").html('');
		$("#m_SelectRole").append(selectrole);
	});
	
	
	$("#addUser").click(function(){
		$("#modifyUserDiv").slideUp(500);
		$("#addUserDiv").slideDown(500);
	});
	
	$("#addcancel").click(function(){
		$("#addUserDiv").slideUp(500);		
	});
	
	$("#modifycancel").click(function(){
		$("#modifyUserDiv").slideUp(500);		
	});
	
	$("#addUserSubmit").click(function(){
		var a_userCode = $.trim($('#a_userCode').val());
		var a_userName = $.trim($("#a_userName").val());
		var a_userPassword = $.trim($("#a_userPassword").val());
		var a_isStart = $("#a_isStart").val();
		var a_roleId = $("#a_roleId").val();
		if(a_userCode == ''){
			alert("登录账号不能为空！");
		}else if(a_userName == ''){
			alert("用户名称不能为空！");
		}else if(a_userPassword == ''){
			alert("登录密码不能为空！");
		}
		else if(a_roleId == '0'){
			alert("请选择角色！");
		}else if(a_isStart == ''){
			alert("请选择是否启用！");
		}else{
			$.post("/edituser.action?type=add",{'user.userCode':a_userCode,'user.userName':a_userName,'user.userPassword':a_userPassword,'user.isStart':a_isStart,'user.roleId':a_roleId},function(result){
				if("success" == result){
					alert("添加成功！");
					window.location.href="/userlist.action";
				}else if("repeat" == result){
					alert("登录账号已存在！");
				}else{
					alert("添加失败！");
				}
			},'html');
		}
	});
	
	$("#modifyUserSubmit").click(function(){
		var m_userId = $("#m_userId").val();
		var m_userCode = $.trim($("#m_userCode").val());
		var m_userName = $.trim($("#m_userName").val());
		var m_userPassword = $.trim($("#m_userPassword").val());
		var m_isStart = $("#m_isStart").val();
		var m_roleId = $("#m_roleId").val();
		if(m_userCode == ''){
			alert("登录账号不能为空！");
		}else if(m_userName == ''){
			alert("用户名称不能为空！");
		}else if(m_userPassword == ''){
			alert("登录密码不能为空！");
		}else if(m_isStart == ''){
			alert("请选择是否启用！");
		}else if(m_roleId == '' || m_roleId == 0){
			alert("请选择角色！");
		}else{
			$.post("/edituser.action?type=modify",{'user.id':m_userId,'user.userCode':m_userCode,'user.userName':m_userName,'user.isStart':m_isStart,'user.userPassword':m_userPassword,'user.roleId':m_roleId},function(result){
				if("success" == result){
					alert("修改成功！");
					window.location.href="/userlist.action";
				}else if("repeat" == result){
					alert("登录账号已存在！");
				}else{
					alert("修改失败！");
				}
			},'html');
		}
	});
	
	$(".deleteUser").click(function(){
		var d = $(this);
		var d_userId = d.attr('userid');
		var d_userCode = d.attr('userCode');
		var d_userRoleId = d.attr('roleId');
		var currentUserRoleId = d.attr('currentUserRoleId');
		if(currentUserRoleId != 1 && d_userRoleId == 1){//当前用户角色不是系统管理员，并且要删除系统管理员账号
			alert("该账号角色为：系统管理员，不能被删除！");
		}else{
			if(confirm("您确定要删除【"+d_userCode+"】这个账号吗？")){
				//delete
				$.post("/deluser.action",{'user.id':d_userId},function(result){
					if("success" == result){
						alert("删除成功！");
						window.location.href="userlist.action";
					}else{
						alert("删除失败！");
					}
				},'html');
			}
			
		}
		
	});
	
	
	mover(4);
});	
