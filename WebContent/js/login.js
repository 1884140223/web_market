function ajax(){
		var datas={"code":$("#code").val(),"password":$('#pwd').val()};
		$.ajax({
			url : 'LoginServlet',
			type : 'post',
			dataType : 'json',
			data : datas,
			success:success_function,
			error:error_function
		});
	}
	function success_function(ajaxdata){
		if(ajaxdata=='0'){
			location.href="home.jsp";
		}
		else{
			$("#mess").show();
			$("#mess").html("用户名或密码错误，请重新输入~");
		}
	}
	function error_function(){
		alert("ajax出错！");
	}