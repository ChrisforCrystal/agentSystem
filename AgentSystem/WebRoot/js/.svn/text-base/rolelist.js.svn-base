$().ready(function(){
	//init
	$("#addRoleDiv").css("display","none");
	$("#modifyRoleDiv").css("display","none");
	
	$(".modifyRole").click(function(){
		var b = $(this);
		$("#addRoleDiv").slideUp(500);
		$("#modifyRoleDiv").slideDown(500);
		$("#m_roleName").val(b.attr('rolename'));
		$("#m_roleId").val(b.attr('roleid'));
		var isStart = b.attr('isstart');
		var select;
		if(isStart == '1'){
			select = $("<select id=\"m_isStart\" name=\"role.isStart\">"+
	      				"<option value=\"1\" selected=\"selected\">启用</option>"+
	      				"<option value=\"0\">不启用</option>"+
      					"</select>");
		}else{
			select = $("<select id=\"m_isStart\" name=\"role.isStart\">"+
	      				"<option value=\"1\">启用</option>"+
	      				"<option value=\"0\" selected=\"selected\">不启用</option>"+
      					"</select>");
		}
		$("#m_Select").html('');
		$("#m_Select").append(select);
	});
	
	
	$("#addRole").click(function(){
		$("#modifyRoleDiv").slideUp(500);
		$("#addRoleDiv").slideDown(500);
	});
	
	$("#addcancel").click(function(){
		$("#addRoleDiv").slideUp(500);		
	});
	
	$("#modifycancel").click(function(){
		$("#modifyRoleDiv").slideUp(500);		
	});
	
	$("#addRoleSubmit").click(function(){
		var a_roleName = $.trim($("#a_roleName").val());
		var a_isStart = $("#a_isStart").val();
		if(a_roleName == ''){
			alert("角色名称不能为空！");
		}
		else if(a_isStart == ''){
			alert("请选择是否启用！");
		}else{
			$.post("/editrole.action?type=add",{'role.roleName':a_roleName,'role.isStart':a_isStart},function(result){
				if("success" == result){
					alert("添加成功！");
					window.location.href="/rolelist.action";
				}else if("repeat" == result){
					alert("角色名称已存在");
				}else{
					alert("添加失败！");
				}
			},'html');
		}
	});
	
	$("#modifyRoleSubmit").click(function(){
		var m_roleId = $("#m_roleId").val();
		var m_roleName = $.trim($("#m_roleName").val());
		var m_isStart = $("#m_isStart").val();
		if(m_roleName == ''){
			alert("角色名称不能为空！");
		}
		else if(m_isStart == ''){
			alert("请选择是否启用！");
		}else{
			$.post("/editrole.action?type=modify",{'role.id':m_roleId,'role.roleName':m_roleName,'role.isStart':m_isStart},function(result){
				if("success" == result){
					alert("修改成功！");
					window.location.href="/rolelist.action";
				}else if("repeat" == result){
					alert("角色名称已存在");
				}else{
					alert("修改失败！");
				}
			},'html');
		}
	});
	
	$(".deleteRole").click(function(){
		var d = $(this);
		var d_roleId = d.attr('roleid');
		var d_roleName = d.attr('rolename');
		if(confirm("您确定要删除【"+d_roleName+"】这个角色吗？")){
			//delete
			$.post("/delrole.action",{'role.id':d_roleId},function(result){
				if("success" == result){
					alert("删除成功！");
					window.location.href="rolelist.action";
				}else if("failed" == result){
					alert("删除失败！");
				}else{
					if(result != null && result != ""){
						result = result.substring(0,result.length-1);
						alert("系统中有用户被授权该角色，请先删除用户！用户账号：【"+result+"】");
					}
				}
			},'html');
		}
	});
	mover(4);
});	