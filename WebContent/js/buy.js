$(document).ready(function(){
	 
	
	
})
function ajax_buy(){		//立即购买
	var datas={
			"flag":"1",
			"code":$("#codes").text(),
			"commodity":$("#image").attr("src"),
			"oneMoney":$("#money").html(),
			"name":$("#person").val(),
			"province":$("#province option:checked").text(),
			"adress":$("#adress").val(),				
			"id":$("#ord").val(),
			"number":$("#number").val(),
			"status":"已支付"
			};
	$.ajax({
		url : 'BuyServlet',
		type : 'post',
		dataType : 'json',
		data : datas,
		success:success_function,
		error:error_function
	});
}



function ajax_car(){		//加入购物车
		var datas={
				"flag":"2",
				"code":$("#codes").text(),
				"commodity":$("#image").attr("src"),
				"oneMoney":$("#money").html(),
				"name":$("#person").val(),
				"province":$("#province option:checked").text(),
				"adress":$("#adress").val(),				
				"id":$("#ord").val(),
				"number":$("#number").val(),
				"status":"待支付"
		};
		$.ajax({
			url : 'BuyServlet',
			type : 'post',
			dataType : 'json',
			data : datas,
			success:success_function,
			error:error_function
		});
	}

	
	function success_function(ajaxdata){
		if(ajaxdata=="0"){
			alert("购买成功");
			location.href="home.jsp";
		}else if(ajaxdata =="2"){
			alert("加入购物车成功");
			location.href="home.jsp";
		}else{
			alert("操作失败");
		}
		
	}
	function error_function(){
		alert("ajax出错！");
	}
	
	


function less(){
	var number = $("#number").val();
	var num = number-1;
	$("#number").attr("value",num);
}
function add(){
	var number = $("#number").val();
	var num = parseInt(number)+1;
	$("#number").attr("value",num);
}