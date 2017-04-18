/**
 * 时间对象的格式化;
 */
Date.prototype.format = function(format) {
    /*
     * eg:format="YYYY-MM-dd hh:mm:ss";
     */
    var o = {
        "M+" :this.getMonth() + 1, // month
        "d+" :this.getDate(), // day
        "h+" :this.getHours(), // hour
        "m+" :this.getMinutes(), // minute
        "s+" :this.getSeconds(), // second
        "q+" :Math.floor((this.getMonth() + 3) / 3), // quarter
        "S" :this.getMilliseconds()
    // millisecond
    }

    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "")
                .substr(4 - RegExp.$1.length));
    }

    for ( var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
                    : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}

function mover(object){
	for(var i=1;i<6;i++){
		if(object == i){
			//主菜单
			document.getElementById("m_"+i).className="m_li_a";
			//子菜单
			document.getElementById("s_"+i).style.display="block";
		}else{
			document.getElementById("m_"+i).className="m_li";
			//子菜单
			document.getElementById("s_"+i).style.display="none";
		}
	}
}

function trBackground(classname){
	$("."+classname).mouseenter(function(){
		var tr = $(this);
		tr.css("background","#ebffe0");
	});
	$("."+classname).mouseleave(function(){
		var tr = $(this);
		tr.css("background","#fff");
	});
}

function trBackgroundBlue(classname){
	$("."+classname).mouseenter(function(){
		var tr = $(this);
		tr.css("background","#d6d9fa");
	});
	$("."+classname).mouseleave(function(){
		var tr = $(this);
		tr.css("background","#fff");
	});
}
