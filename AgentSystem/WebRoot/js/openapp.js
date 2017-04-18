$().ready(function(){
	
	$("#s_key").innerText = $("#a_keywords").val();
	$("#s_key").html($("#a_keywords").val());
	$("#s_cn").innerText = $("#a_customname").val();
	$("#s_cn").html($("#a_customname").val());
	$("#s_price").innerText = $("#a_price").val();
	$("#s_price").html($("#a_price").val());
	$("#s_type").innerText = $("#a_type").val();
	$("#s_type").html($("#a_type").val());
});