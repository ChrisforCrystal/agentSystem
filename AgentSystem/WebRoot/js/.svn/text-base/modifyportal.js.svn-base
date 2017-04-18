$().ready(function(){
	mover(2);
	
	
	$("#appUserName").blur(function(){
		var appUserName = $.trim($("#appUserName").val()); 
		
		if(appUserName == null){
			alert("登录账号不能为空，请输入！");
		}
	});
	$("#appPassword").blur(function(){
		var appPassword = $.trim($("#appPassword").val()); 
		
		if(appPassword == null){
			alert("登录密码不能为空，请输入！");
		}
	});
	
	$("#iosDownloadUrl").blur(function(){
		var iosDownloadUrl = $.trim($("#iosDownloadUrl").val()); 
		
		if(iosDownloadUrl != null && isURL(iosDownloadUrl) == false){
			alert("客户端下载地址(IOS)输入的URL格式不正确，请重新输入！");
		}
	});
	$("#codeIosUrl").blur(function(){
		var codeIosUrl = $.trim($("#codeIosUrl").val()); 
		
		if(codeIosUrl != null && isURL(codeIosUrl) == false){
			alert("二维码下载地址(IOS)输入的URL格式不正确，请重新输入！");
		}
	});
	$("#androidDownloadUrl").blur(function(){
		var androidDownloadUrl = $.trim($("#androidDownloadUrl").val()); 
		
		if(androidDownloadUrl != null && isURL(androidDownloadUrl) == false){
			alert("客户端下载地址(Android)输入的URL格式不正确，请重新输入！");
		}
	});
	$("#codeAndroidUrl").blur(function(){
		var codeAndroidUrl = $.trim($("#codeAndroidUrl").val()); 
		
		if(codeAndroidUrl != null && isURL(codeAndroidUrl) == false){
			alert("二维码下载地址(Android)输入的URL格式不正确，请重新输入！");
		}
	});
	
});

function validateSavePortalFunc(){
	var flag = true;
	var iosDownloadUrl = $.trim($("#iosDownloadUrl").val()); 
	var codeIosUrl = $.trim($("#codeIosUrl").val()); 
	var androidDownloadUrl = $.trim($("#androidDownloadUrl").val()); 
	var codeAndroidUrl = $.trim($("#codeAndroidUrl").val()); 
	var appUserName = $.trim($("#appUserName").val()); 
	var appPassword = $.trim($("#appPassword").val()); 
	
	if(appUserName == null || appUserName == ""){
		alert("登录账号不能为空，请输入！");
		flag = false;
	}else if(appPassword == null || appPassword == ""){
		alert("登录密码不能为空，请输入！");
		flag = false;
	}else if(iosDownloadUrl != null && iosDownloadUrl != "" && isURL(iosDownloadUrl) == false){
		alert("客户端下载地址(IOS)输入的URL格式不正确，请重新输入！");
		flag = false;
	}else if(codeIosUrl != null  && codeIosUrl != "" && isURL(codeIosUrl) == false){
		alert("二维码下载地址(IOS)输入的URL格式不正确，请重新输入！");
		flag = false;
	}else if(androidDownloadUrl != null  && androidDownloadUrl != "" && isURL(androidDownloadUrl) == false){
		alert("客户端下载地址(Android)输入的URL格式不正确，请重新输入！");
		flag = false;
	}else if(codeAndroidUrl != null  && codeAndroidUrl != "" && isURL(codeAndroidUrl) == false){
		alert("二维码下载地址(Android)输入的URL格式不正确，请重新输入！");
		flag = false;
	}
	return flag;
}

function isURL(url){
	var strRegex = "^((https|http|ftp|rtsp|mms)://)?[a-z0-9A-Z]{3}\.[a-z0-9A-Z][a-z0-9A-Z]{0,61}?[a-z0-9A-Z]\.com|net|cn|cc (:s[0-9]{1-4})?/$";
	var re = new RegExp(strRegex);
	if (re.test(url))
		return true;
	else 
		return false;
}