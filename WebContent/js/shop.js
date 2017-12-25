$(document).ready(function(){
	
})
	/**
	 * 个人信息修改
	 * 
	 */
		
	function ajax_function(){
		var datas =  {
				"code":$("#code").val(),
				"name":$("#name").val(),
				"sex":$('input:radio[name="sex"]:checked').val(),
				"year":$("#year option:checked").text(),
				"month":$("#month option:checked").text(),
				"day":$("#day option:checked").text(),
				"email":$("#email").val()
			};
		$.ajax({
			url : 'UpdateServlet',
			type : 'post',
			dataType : 'json',
			data : datas,
			success:success_function,
			error : error_function
		});
	}
	function success_function(ajaxdata) {
		if (ajaxdata == "0") {
			alert("修改成功！");
			location.href="shop.jsp";
		}else{
			alert("修改失败!");
		}
	}
	function error_function() {
		alert("ajax出错！");
	}

		





		
	