$().ready(function(){
	mover(1);
	trBackground("tabletr");
	
	$(".deletekeyword").click(function(){
		var obj = $(this);
		var kid = obj.attr("kid");
		var keyword = obj.attr("keyword");
		if(confirm("为了数据安全，需要您两次确认才能删除，您确定要删除关键词【"+keyword+"】吗（一次）？")){
			if(confirm("为了数据安全，需要您两次确认才能删除，您确定要删除关键词【"+keyword+"】吗（两次）？")){
				$.post('/deletekeyword.action',{'keywords.id':kid},function(result){
					if("success" == result){
						alert("恭喜您，删除【"+keyword+"】成功。");
						window.location.reload(true);
					}else{
						alert("对不起，删除【"+keyword+"】失败。");
					}
				},'html');
			}
		}
	});
	$(".openapp").click(function(){
		var obj = $(this);
		var kid = obj.attr("kid");
		var keyword = obj.attr("keyword");
		ymPrompt.win({message:'/openapp.action?keywords.id='+kid,width:600,height:400,title:'开通【'+keyword+'】APP',handler:callBack,iframe:true})
	});
	$(".xufei").click(function(){
		var obj = $(this);
		var kid = obj.attr("kid");
		var keyword = obj.attr("keyword");
		ymPrompt.win({message:'/xufei.action?keywords.id='+kid,width:600,height:400,title:'当前为【'+keyword+'】进行续费操作',handler:callBack,iframe:true})
	});
});


function callBack(){
	window.location.reload(true);
}