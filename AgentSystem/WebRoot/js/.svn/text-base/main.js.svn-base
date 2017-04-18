$().ready(function(){
	
	/*
	 *                             
id="oldpwdtip">您本次登录时的密码</sp
newpwdtip">新密码不少于6个字符</span>
"newpwdtip1">新密码不少于6个字符</spa
	 * */
	
	
	$("#modifypwdbtna").click(function(){
		$("#modifydiv").show(500);
		$("#oldpwdtext").val('');
		$("#newpwd").val('');
		$("#newpwd2").val('');
	});
	$("#modifypwconcledbtn").click(function(){
		$("#modifydiv").hide(500);
		$("#oldpwdtext").val('');
		$("#newpwd").val('');
		$("#newpwd2").val('');
	});
	
	
	$("#oldpwdtext").blur(function(){
		if($("#oldpwdtext") != ""){
			$("#oldpwdtip").css("color","green");
		}else{
			$("#oldpwdtip").css("color","red");
		}
	});
	
	$("#newpwd").blur(function(){
		if($("#newpwd") != ""){
			$("#newpwdtip").css("color","green");
		}else{
			$("#newpwdtip").css("color","red");
		}
	});
	$("#newpwd2").blur(function(){
		if($("#newpwd2") != ""){
			$("#newpwdtip1").css("color","green");
		}else{
			$("#newpwdtip1").css("color","red");
		}
	});
	
	
	$("#modifypwdbtn").click(function(){
		var oldpwd = $("#oldpwdtext").val();
		var newpwd = $("#newpwd").val();
		var newpwd2 = $("#newpwd2").val();
		if(oldpwd == ""){
			$("#oldpwdtext").focus();
			$("#oldpwdtip").css("color","red");
		}else if(newpwd == ""){
			$("#newpwd").focus();
			$("#newpwdtip").css("color","red");
		}else if(newpwd2 == ""){
			$("#newpwd2").focus();
			$("#newpwdtip1").css("color","red");
		}else if(newpwd != newpwd2){
			humane.error("您输入的新密码不一致，请重新输入。");
			$("#newpwd2").focus();
			$("#newpwdtip1").css("color","red");
		}else if(oldpwd.length < 6){
			$("#oldpwdtext").focus();
			$("#oldpwdtip").css("color","red");
			humane.error("您输入的旧密码不能小于6位数，请重新输入。");
		}else if(newpwd.length < 6){
			$("#newpwd").focus();
			$("#newpwdtip").css("color","red");
			humane.error("您输入的新密码不能小于6位数，请重新输入。");
		}else if(newpwd2.length < 6){
			$("#newpwd2").focus();
			$("#newpwdtip1").css("color","red");
			humane.error("您第二次输入的新密码不能小于6位数，请重新输入。");
		}else{
			$.post("/modifypwd.action",{'u.userPassword':oldpwd,'u.userCode':newpwd,'u.userName':newpwd2,'u.isStart':1},function(result){
				if("success" == result){
					humane.success("恭喜您，密码修改成功。");
					$("#modifydiv").hide(500);
				}else if("2pwddif" == result){
					humane.error("您输入的新密码不一致，请重新输入。");
					$("#newpwd2").focus();
					$("#newpwdtip1").css("color","red");
				}else if("oldpwddif" == result){
					humane.error("您输入的旧密码不正确，请重新输入。");
					$("#oldpwdtext").focus();
					$("#oldpwdtip").css("color","red");
				}else{
					humane.error("您的操作出现异常，系统没有做出响应，请重试...");
				}
				
			},"html");
		}
	});
});