$(document).ready(function(){
	function ajax(){
		var datas={"code":$("#codes").text(),"pageNo":"1" };
		$.ajax({
			url : 'CarServlet',
			type : 'post',
			dataType : 'json',
			data : datas,
			success:success_function,
			error:error_function
		});
	}
	function success_function(ajaxdata){
		if(ajaxdata=='0'){
			return;
		}
		
	}
	function error_function(){
		alert("ajax出错！");
	}
	
	ajax();
	
	
	
	
})


/**
 * 
 */
function del(ind) {		//删除订单
	var index = parseInt(ind) + 1;// 当前行的索引号
	var datas = {
		"id" : $("tr:eq(" + index + ") td:eq(1)").text(),
		"flag":"1",
		"pageNo":$('#pageNo').text(),
		"code":$("#codes").text()
	};
	$.ajax({
		url : 'DeleteCar',
		type : 'post',
		dataType : 'json',
		data : datas,
		success : success_f,
		error : error_f
	});
}


function cancle(ind) {		//取消订单
	var index = parseInt(ind) + 1;// 当前行的索引号
	var datas = {
		"id" : $("tr:eq(" + index + ") td:eq(1)").text(),
		"flag":"2",
		"pageNo":$('#pageNo').text(),
		"code":$("#codes").text()
	};
	$.ajax({
		url : 'DeleteCar',
		type : 'post',
		dataType : 'json',
		data : datas,
		success : success_f,
		error : error_f
	});
}


function upd(ind) {			//订单支付
	var index = parseInt(ind) + 1;// 当前行的索引号
	var datas = {
		"id" : $("tr:eq(" + index + ") td:eq(1)").text(),
		"pageNo":$('#pageNo').text(),
		"code":$("#codes").text()
	};
	$.ajax({
		url : 'UpdateCar',
		type : 'post',
		dataType : 'json',
		data : datas,
		success : success_f,
		error : error_f
	});
}


function success_f(ajaxdata) {
	if (ajaxdata == '0') {	//删除成功
		location.href="order.jsp";
	}else if(ajaxdata == '1'){
		alert("删除订单失败");
	}else if(ajaxdata == '2'){
		alert("支付成功");
		location.href="order.jsp";
	}else if(ajaxdata == '3'){
		alert("支付失败！");
	}else if(ajaxdata == '4'){
		alert("取消订单成功");
		location.href="order.jsp";
	}else{
		alert("操作失败！");
	}
}
function error_f() {
	alert("ajax出错！");
}


