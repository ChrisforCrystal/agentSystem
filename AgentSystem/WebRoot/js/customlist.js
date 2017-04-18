$().ready(function(){
	$(".viewCustom").click(function(){
		var c = $(this);
		var c_id = c.attr('id');
		window.location.href="/viewcustom.action?custom.id="+c_id;
	});
	
	$(".modifyCustomStatus").click(function(){
		var c = $(this);
		var c_id = c.attr('id');
		var c_status = c.attr('customStatus');
		var m_status = c.attr('mStatus');
		var c_customname = c.attr('customName');
		if(c_status == '1'){
			if(confirm("确定要停用【"+c_customname+"】这个客户吗？")){
				$.post("/modifycustomstatus.action",{'custom.id':c_id,'custom.customStatus':c_status},function(result){
					if("success" == result){
						alert("停用成功！");
						window.location.reload(true);
					}
				},'html');
			}
		}else{
			if(confirm("确定要启用【"+c_customname+"】这个客户吗？")){
				$.post("/modifycustomstatus.action",{'custom.id':c_id,'custom.customStatus':c_status},function(result){
					if("success" == result){
						alert("启用成功！");
						window.location.reload(true);
					}
				},'html');
			}
		}
		
	});
	
	
	$(".modifyCustom").click(function(){
		var c = $(this);
		var c_id = c.attr('id');
		var cname = c.attr('cname');
		window.location.href="/modifycustom.action?custom.id="+c_id+"&cname="+cname;
	});
	
	trBackground("tabletr");
});
