$().ready(function(){
	var kid = $("#kid").val();
	$("#submitkeyword").click(function(){
		var serviceType = $("#servicetype").val();
		var years = $("#serviceyears").val();
		if(serviceType == 0){
			alert("对不起，您还没有选择服务类型。");
			$("#servicetype").focus();
		}else if(years == 0){
			alert("对不起，您还没有选择服务年限。");
			$("#serviceyears").focus();
		}else if(kid <= 0){
			alert("对不起，数据不完整，您不能进行续费操作。");
		}else{
			
			$.post('/keywordsxufei.action',
					{p:$("#servicetype").val()+"-"+years,'keywords.id':kid},function(result){
				if("exception" == result){
					humane.error("对不起，您提交的关键词出现异常，没有成功，请重试。");
				}else if("nomoney" == result){
					humane.error("对不起，您当前的余额不能支付本次申请，请充值后再进行申请。");
				}else{
					alert("恭喜你，续费成功！");
					$("#accountspan").innerText = result;
					$("#accountspan").html(result);
				}
			},'html');
			
		}
	});
	
	$("#servicetype").change(function(){
		jisuan();
	});
	$("#serviceyears").change(function(){
		jisuan();
	});
	
});
function jisuan(){
	var serviceType = $("#servicetype").val();
	var years = $("#serviceyears").val();
	if(serviceType == 0){
		alert("对不起，您还没有选择服务类型。");
		$("#servicetype").focus();
	}else if(years == 0){
		alert("对不起，您还没有选择服务年限。");
		$("#serviceyears").focus();
	}else{
		$.post('/jisuan.action',{p:serviceType+"-"+years},function(result){
			if("exception" == result){
				alert("对不起，您申请的关键词在计算价格的时候出现异常，请重试。");
			}else{
				$("#price").val(result);
			}
		},'html');
	}
}
