function ajax(){
	var myVcode =$("#myVcode").val();
	var Vcode =$("#Vcode").val();
	if(myVcode != Vcode){
		alert("验证码输入错误");
	}else{
		$(".safety").css({"background":"#B0D4DF"});
		$(".mod_pwd").css({"background":"#37B5DF"});
		$("#safety").hide();
		$("#mod_pwd").show();
	}
}



function function_ajax(){
	var pwd1 = $("#pwd1").val();
	var pwd2 = $("#pwd2").val();
	if(pwd2.length==0 || pwd1.length==0){
		alert("两密码输入不能为空，请重新输入哦~~");
	}else if(pwd1 != pwd2 ){
		alert("两次密码输入不一致，请重新输入哦~~");
	}else{
		var datas={"password":$("#pwd1").val(),"code":$("#codes").val()};
		$.ajax({
			url : 'Modify',
			type : 'post',
			dataType : 'json',
			data : datas,
			success:success_function,
			error:error_function
		});
		/*************/
	}
}

function success_function(ajaxdata){
	if(ajaxdata=='0'){
		alert("修改成功");
		$(".safety").css({"background":"#37B5DF"});
		$(".mod_pwd").css({"background":"#B0D4DF"});
		$("#safety").show();
		$("#mod_pwd").hide();
	}else{
		alert("修改失败");
	}
	
}
function error_function(){
	alert("ajax出错！");
}

function obtain(){//获取验证码函数
	var radm = Math.random()*10000;
	var rad = Math.round(radm);
	$("#Vcode").attr("value",rad);
}