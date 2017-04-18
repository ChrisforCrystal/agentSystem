$().ready(function(){
	userid = -1;
	$("#searchUerText").keyup(function(){
		loadUsers();
	});
	$("#searchUerText").click(function(){
		loadUsers();
	});
	
	$("#caiwuok").click(function(){
		if(userid <= 0){
			humane.error("对不起，您还没有选择用户，请搜索进行用户的选择。");
			$("#searchUerText").focus();
		}else if($("#zijintype").val() == '0'){
			humane.error("对不起，您还没有选择操作类型，请选择操作类型。");
			$("#zijintype").focus();
		}else if($("#zijin").val() == '' || $("#zijin").val().length <=0){
			humane.error("对不起，您还没有输入需要操作的自己数目，请输入。");
			$("#zijin").focus();
		}else{
			if(confirm("您确定要执行当前财务操作吗？")){
				$.post('/opeaccount.action',
						{
					'account.userId':userid,
					'account.userName':$("#searchUerText").val(),
					'account.money':$("#zijin").val(),
					'accountDetail.detailType':$("#zijintype").val(),
					'accountDetail.detailTypeName':$("#zijintype option:selected").text(),
					'accountDetail.memo':$("#memo").val()
						},function(result){
					if(result == 'success'){
						humane.success("恭喜您，财务操作成功。");
						$("#systemtip").html("恭喜您，财务操作成功。");
					}else{
						humane.error("对不起，当前财务操作失败。");
						$("#systemtip").html("对不起，当前财务操作失败。");
					}
				},'html');
			}
		}
		
	});
	mover(4);
});
function confirmUser(uid,ucode){
	userid = uid;
	$("#searchUerText").val(ucode);
	$("#serachresult").html("");
}

function loadUsers(){
	$.post("/searchuser.action",{'user.userCode':$("#searchUerText").val()},function(result){
		//var json = result;
		var userList = "<ul>";
		for(var i=0;i< result.length;i++){
			userList = userList + "<li onclick=\"confirmUser("+result[i].id+",'"+result[i].userCode+"');\"><a>"+result[i].userCode+"</a></li>";
		}
		userlist = userList +"</ul>";
		$("#serachresult").html(userList);
		
	},'json');
}