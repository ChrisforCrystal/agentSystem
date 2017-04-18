$().ready(function(){
	mover(3);
	if($("#reporttype").val() != 1 && $("#reporttype").val() != 4){
		document.getElementById("opertime").style.display="block";
	}else{//代理商余额报表、产品分类数量/金额汇总
		document.getElementById("opertime").style.display="none";
	}
	$("#reporttype").change(function(){
		if($("#reporttype").val() != 1 && $("#reporttype").val() != 4){
//			$("#starttime").removeAttr("disabled");
//			$("#endtime").removeAttr("disabled");
			document.getElementById("opertime").style.display="block";
		}else{//代理商余额报表、产品分类数量/金额汇总
//			$("#starttime").attr("disabled","disabled");
//			$("#endtime").attr("disabled","disabled");
			document.getElementById("opertime").style.display="none";
		}
	});
});

//js日期比较（yyyy-MM-dd）
function comtime(s,e){
	var arr1 = s.split("-");
	var starttime = new Date(arr1[0],arr1[1],arr1[2]);
	var starttimes = starttime.getTime();
	var arr2 = e.split("-");
	var endtime = new Date(arr2[0],arr2[1],arr2[2]);
	var endtimes = endtime.getTime();
	if(starttimes > endtimes)
		return false;
	else
		return true;
}

function searchReportFunc(){
	if(comtime($("#starttime").val(),$("#endtime").val()) == false){
		alert("开始时间大于结束时间，请检查");
		return false;
	}
	return true;
}