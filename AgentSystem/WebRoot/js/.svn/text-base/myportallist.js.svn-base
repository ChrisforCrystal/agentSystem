$().ready(function(){
	mover(2);
	trBackground("tabletr");
	
	$(".viewPortal").click(function(){
		var c = $(this);
		var k_id = c.attr('id');
		var c_id = c.attr('customId');
		window.location.href="/viewportal.action?keywords.id="+k_id+"&keywords.customId="+c_id;
	});
	$(".modifyPortal").click(function(){
		var c = $(this);
		var k_id = c.attr('id');
		var c_id = c.attr('customId');
		var cname = c.attr('cname');
		var kword = c.attr('kword');
		window.location.href="/modifyportal.action?keywords.id="+k_id+"&keywords.customId="+c_id+"&cname="+cname+"&kword="+kword;
	});
});