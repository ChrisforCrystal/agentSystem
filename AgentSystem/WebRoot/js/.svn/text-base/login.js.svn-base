function validateLoginUserFunc(){
	var flag = false;
	
	var usercode = $.trim($("#usercode").val());
	var userpassword = $.trim($("#userpassword").val());
	
	if(usercode == "" || usercode == null){
		 $("#usercode").focus();
		 alert("对不起，登录账号不能为空。");
	}else if(userpassword == "" || userpassword == null){
		 $("#userpassword").focus();
		 alert("对不起，登录密码不能为空。");
	}else{
		$.ajax({
			url: '/validateLoginUser.action',
			type: 'POST',
			async:false,
			data:{'user.userCode':usercode,'user.userPassword':userpassword},
			dataType: 'html',
			timeout: 5000,
			error: function(){
				alert("error");
			},
			success: function(result){
				if("noexitusercode" == result){
					alert("对不起，登陆账号不存在！");
				}else if("errorpwd" == result){
					alert("对不起，登陆密码错误！");
				}else if("failed" == result){
					alert("数据错误！");
				}else if("success" == result){
					flag = true;
				}
			}
			});
	}
	return flag;
}

