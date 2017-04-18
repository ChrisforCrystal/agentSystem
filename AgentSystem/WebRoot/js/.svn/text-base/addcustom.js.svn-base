contactcount = 0;
$().ready(function(){
	
	$("#regdate").val(new Date().format("yyyy-MM-dd"));
	
	$("#selectcardtype").change(function(){
		$("#cardtypename").val($("#selectcardtype").find("option:selected").text()) ;
	});
	
	$("#selectcustomtype").change(function(){
		$("#customtypename").val($("#selectcustomtype").find("option:selected").text()) ;
	});
	
	
	$("#selectprovince").change(function(){
		$("#selectcity").empty();
		$("#selectcity").append("<option value=\"0\" selected=\"selected\">--请选择--</option>");
		$("#selectarea").empty();
		$("#selectarea").append("<option value=\"0\" selected=\"selected\">--请选择--</option>");
		var s_province = $("#selectprovince").val();
		$.post("/loadcity.action",{'province.provinceID':s_province},function(result){
			if(result != ""){
				for(var i=0;i<result.length;i++){
					$("#selectcity").append("<option value=\""+result[i].cityID+"\">"+result[i].city+"</option>");
				}
			}else{
				alert("城市加载失败！");
			}
		},'json');	
	});
	
	$("#selectcity").change(function(){
		$("#selectarea").empty();
		$("#selectarea").append("<option value=\"0\" selected=\"selected\">--请选择--</option>");
		var s_city = $("#selectcity").val();
		$.post("/loadarea.action",{'city.cityID':s_city},function(result){
			if(result != ""){
				for(var i=0;i<result.length;i++){
					$("#selectarea").append("<option value=\""+result[i].areaID+"\">"+result[i].area+"</option>");
				}
			}else{
				alert("区域加载失败！");
			}
		},'json');
	});
	
	$("#addcontact").click(function(){
		var str = $("<tr><td><input type='text' name='contactList["+contactcount+"].contactName'/><span style='color:red;'>*</span></td>"+
				"<td><input type='text' style='width:100px;' name='contactList["+contactcount+"].contactTel'/><span style='color:red;'>*</span></td>"+
				"<td><input type='text' style='width:100px;' name='contactList["+contactcount+"].contactFax'/></td>"+
				"<td><input type='text' style='width:100px;' name='contactList["+contactcount+"].contactEmail'/></td>"+
				"<td><input type='text' style='width:100px;' name='contactList["+contactcount+"].contactRole'/></td>"+
				"<td style='width:100px;' onclick='getDel(this)'><a href='javascript:void(0);'>删除</a></td></tr>");
	    $("#addtr").append(str);
		contactcount = contactcount + 1;
	});
	
	$("#card_num").blur(function(){
		var t = $("#card_num").val();
		if(!checkValidateNum(t))
			alert("请输入数字！");
		
	});
	
});
	function checksave(){
		var custom_name = $.trim($("#custom_name").val());
		var customtypename = $("#customtypename").val();
		$.post("/isExitCustomName.action",{'custom.customName':custom_name},function(result){
			if(result == "peat"){
				alert("对不起，该企业名称已存在。");
			}else if(result == "nopeat"){
				if(custom_name != null && custom_name != "" && customtypename != null && customtypename != "" && customtypename != "--请选择--"){
					var f = $("#cform");
					f.submit();
				}else{
					if(custom_name == null || custom_name == ""){
						alert("企业名称不能为空！");
					}
					if(customtypename == null || customtypename == "" || customtypename == "--请选择--"){
						alert("请选择企业类型！");
					}
				}
			}
		},'html');
		
	}
	//js验证只能输入数字
	function checkValidateNum(value){
		var reg = new RegExp("^[0-9]*$");
		if(reg.test(value)){
			return true;
		}
		return false;
	}
	
	function getDel(k){  
	   $(k).parent().remove();       
    } 