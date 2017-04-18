$().ready(function(){
	mover(4);
	trBackgroundBlue("tabletr");
	$(".checkselect").change(function(){
		obj = $(this);
		var v = obj.val();
		var kid = obj.attr("kid");
		if(v == 1){
			if(confirm("您确定要将["+obj.attr("keyword")+"]的状态修改为审核中吗？")){
				$.post('/updatekeyword.action',{'keywords.id':kid,'keywords.checkStatus':1},function(result){
					if("success" == result){
						alert("恭喜您，"+obj.attr("keyword")+"的状态修改为审核中，操作成功。");
						window.location.reload(true);
					}else{
						alert("对不起，"+obj.attr("keyword")+"的状态修改为审核中，操作失败。");
					}
				},'html');
			}
		}else if(v == 2){
			if(confirm("您确定要将["+obj.attr("keyword")+"]的状态修改为审核通过吗？")){
				$.post('/updatekeyword.action',{'keywords.id':kid,'keywords.checkStatus':2},function(result){
					if("success" == result){
						alert("恭喜您，"+obj.attr("keyword")+"的状态修改为审核通过，操作成功。");
						window.location.reload(true);
					}else{
						alert("对不起，"+obj.attr("keyword")+"的状态修改为审核通过，操作失败。");
					}
				},'html');
			}
		}else if(v == 3){
			if(confirm("您确定要将["+obj.attr("keyword")+"]的状态修改为不通过吗？")){
				$.post('/updatekeyword.action',{'keywords.id':kid,'keywords.checkStatus':3},function(result){
					if("success" == result){
						alert("恭喜您，"+obj.attr("keyword")+"的状态修改为不通过，操作成功。");
						window.location.reload(true);
					}else{
						alert("对不起，"+obj.attr("keyword")+"的状态修改为不通过，操作失败。");
					}
				},'html');
			}
		}else if(v == 4){
			if(confirm("您确定要对["+obj.attr("keyword")+"]进行续费操作吗？")){
				//window.location.href='/xufei.action?keywords.id='+kid;
					ymPrompt.win({message:'/xufei.action?keywords.id='+kid,width:600,height:400,title:'当前为【'+obj.attr("keyword")+'】进行续费操作',handler:callBack,iframe:true})
				}
		}else if(v == 5){
			if(confirm("您确定要修改["+obj.attr("keyword")+"]的使用状态为不使用吗？")){
				$.post('/updatekeyword.action',{'keywords.id':kid,'keywords.isUse':0},function(result){
					if("success" == result){
						alert("恭喜您，"+obj.attr("keyword")+"的状态修改为不使用，操作成功。");
						window.location.reload(true);
					}else{
						alert("对不起，"+obj.attr("keyword")+"的状态修改为不使用，操作失败。");
					}
				},'html');
			}
		}else if(v == 6){
			if(confirm("您确定要修改["+obj.attr("keyword")+"]的使用状态为使用吗？")){
				$.post('/updatekeyword.action',{'keywords.id':kid,'keywords.isUse':1},function(result){
					if("success" == result){
						alert("恭喜您，"+obj.attr("keyword")+"的状态修改为使用，操作成功。");
						window.location.reload(true);
					}else{
						alert("对不起，"+obj.attr("keyword")+"的状态修改为使用，操作失败。");
					}
				},'html');
			}
		}
	});
});

function callBack(){
	window.location.reload(true);
}