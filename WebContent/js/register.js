function ajax(){
	var pwd1 = $("#password").val();
	var pwd2 = $("#pwd").val();
	if(pwd1!=pwd2||pwd1==""){
		alert("两次密码输入不一致，请重新输入哦~~");
	}else{
		var datas={"code":$("#phone").val(),"name":$("#name").val(),"password":$("#password").val(),"email":$("#email").val()};
		$.ajax({
			url : 'Register',
			type : 'post',
			dataType : 'json',
			data : datas,
			success:success_function,
			error:error_function
		});
	}
}

function success_function(ajaxdata){
	if(ajaxdata=="0"){
		alert("注册成功");
		location.href="login.jsp";
	}else{
		alert("操作失败");
	}
	
}
function error_function(){
	alert("ajax出错！");
}