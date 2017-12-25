$(document).ready(function(){
	$("#menu li").mouseover(function(){
		$(this).css({"background":"rgb(255,255,255)","color":"rgb(113,113,113)"});
		$("#menu_right").show();
	});
	$("#menu li").mouseout(function(){
		$(this).css({"background":"rgb(113,113,113)","color":"rgb(255,255,255)"});
		$("#menu_right").hide();
	});
	$("#menu_right").mouseover(function(){
		$("#menu_right").show();
	});
	$("#menu_right").mouseout(function(){
		$("#menu_right").hide();
	});
	
	/*******商品特效**********/

	/******************/
	
	
	//轮播图部分
	var length, currentIndex = 0, interval, hasStarted = false, // 是否已经开始轮播
	t = 3000; // 轮播时间间隔
	length = $('.photo-img').length;
	$('.photo-img:not(:first)').hide();
	$('.photo-item:first').addClass('add');
	$('.photo-page').hide();
	// 鼠标上悬时显示向前、向后翻按钮,停止滑动，鼠标离开时隐藏向前、向后翻按钮，开始滑动
	$('.photo-img, .photo-pre, .photo-next').hover(function() {
		stop();
		$('.photo-page').show();
	}, function() {
		$('.photo-page').hide();
		start();
	});
	$('.photo-item').hover(
			function(e) {
				stop();
				var preIndex = $(".photo-item")
						.filter(".add").index();
				currentIndex = $(this).index();
				play(preIndex, currentIndex);
			}, function() {
				start();
			});
	$('.photo-pre').unbind('click');
	$('.photo-pre').bind('click', function() {
		pre();
	});
	$('.photo-next').unbind('click');
	$('.photo-next').bind('click', function() {
		next();
	});
	/**
	 * 向前翻页
	 */
	function pre() {
		var preIndex = currentIndex;
		currentIndex = (--currentIndex + length) % length;
		play(preIndex, currentIndex);
	}
	/**
	 * 向后翻页
	 */
	function next() {
		var preIndex = currentIndex;
		currentIndex = ++currentIndex % length;
		play(preIndex, currentIndex);
	}
	function play(preIndex, currentIndex) {
		$('.photo-img').eq(preIndex).fadeOut(500).parent().children().eq(
				currentIndex).fadeIn(1000);
		$('.photo-item').removeClass('add');
		$('.photo-item').eq(currentIndex).addClass('add');
	}

	function start() {
		if (!hasStarted) {
			hasStarted = true;
			interval = setInterval(next, t);
		}
	}

	function stop() {
		clearInterval(interval);
		hasStarted = false;
	}
	start();
	
	/*
	 * 从数据库调取商品
	 */
	ajax();
	
	function ajax(){
		var datas={};
		$.ajax({
			url : 'CommodityServlet',
			type : 'post',
			dataType : 'json',
			data : datas,
			success:success_function,
			error:error_function
		});
	}
	function success_function(ajaxdata){
		if(ajaxdata=="0"){
			return;
		}
		
	}
	function error_function(){
		alert("ajax出错！");
	}
	
	
})