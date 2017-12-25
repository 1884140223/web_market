<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");//传值编码
	response.setContentType("text/html;charset=UTF-8");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单</title>
<script src="js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="js/buycar.js" type="text/javascript" charset="utf-8"></script>
<link type="text/css" href="css/order.css" rel="stylesheet" />
</head>
<body>
	<%
		String str = (String) session.getAttribute("name");
		if (str == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
	%>
	<!-- ************头部************ -->
	
	<div id="title">
		<ul class="title_left">
			<li><a href="home.jsp">返回首页</a></li>
			<li>欢迎光临<%=session.getAttribute("name") %></li>
		</ul>
		<ul class="title_right">
			<li><a href="#">手机APP</a></li>
			<li><a href="#">客户服务</a></li>
			<li><a href="#">商家入驻</a></li>
			<li><a href="#">网站导航</a></li>
			<li><a href="shop.jsp">我的商城</a></li>		
		</ul>
	</div>
	<!-- **********中间部分***************** -->
	<div id="middle">
		<div id="middle_part">
			<div class="left_part">
				<ul>
					<li><a href="shop.jsp">个人信息</a></li>
					<li><a href="order.jsp" style="color:red;">我的订单</a></li>
					<li><a href="modify.jsp">修改密码</a></li>
				</ul>
			</div>
			<div class="right_part">
				<table id="buycar" border="1" style="border-collapse:collapse;">
					<tr>
						<td>商品</td>
						<td>订单号</td>
						<td>收货人</td>
						<td>单价</td>
						<td>数量</td>
						<td>总价</td>
						<td>收货地址</td>
						<td>订单状态</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${page.data}" var="car" varStatus="suoyin">
						<tr>
							<td><img src="${car.commodity}" width="100px" height="80px" /></td> 
							<td>${car.id}</td>
							<td>${car.person}</td>
							<td>${car.oneMoney}</td>
							<td>${car.number}</td>
							<td>${car.money}</td>
							<td>${car.adress}</td>
							<td>${car.status}</td>
							<td>
								<c:if test="${car.status=='已支付'}">
									<input type="button" onclick="del('${suoyin.index}');" value="删除订单">
									
								</c:if>
								<c:if test="${car.status.equals('待支付')}">
									<input type="button" onclick="cancle('${suoyin.index}');" value="取消订单"><br />
									<input type="button" onclick="upd('${suoyin.index}');" value="立即支付">
								
								</c:if>
								
							</td>
						</tr>
					</c:forEach>
				</table>
				<div id="page">
					<span id="codes" style="display:none;" >${code}</span>
					<p>【总共<span id="totalPage">${page.totalPage}</span>页】</p>
					<p>当前页：<span id="pageNo">${page.pageNo}</span>/<span>${page.totalPage}</span></p>
					<c:choose>
						<c:when test="${page.pageNo != 1}">
							<p onclick="page_ajax(1)"><input type="button" value="首页" /></p>
						</c:when>
						<c:otherwise>
							<p onclick="page_ajax(1)"><input type="button" value="首页" disabled="disabled" /></p>
						</c:otherwise>
					</c:choose>
					<c:choose>
		 				<c:when test="${page.pageNo > 1}">
	   	 					<p id="uppage1" onclick="page_ajax(2)" style="color: blue; cursor: pointer;">上一页</p>
		 				</c:when>
		 				<c:otherwise><p id="uppage1">上一页 </p></c:otherwise>
		 			</c:choose>
		 			<c:choose>
			 			<c:when test="${page.pageNo < page.totalPage}">
	   						<p onclick="page_ajax(3)" style="color: blue; cursor: pointer;">下一页</p>
			 			</c:when>
			 			<c:otherwise><p>下一页</p></c:otherwise>
		 			</c:choose>
		 			<c:choose>
		 				<c:when test="${page.pageNo != page.totalPage}">
		 					<p onclick="page_ajax(4)"><input type="button" value="尾页" /></p>
		 				</c:when>
		 				<c:otherwise>
		 					<p onclick="page_ajax(4)"><input type="button" value="尾页" disabled="disabled" /></p>
		 				</c:otherwise>
		 			</c:choose>
					
				</div>
			</div>
			
		</div>
	</div>
	
	<!-- **********尾部***************** -->
	<div id="footer">
			<p>
			<span><a href="#">关于我们|</a></span>
			<span><a href="#">我们的团队|</a></span>
			<span><a href="#">友情链接|</a></span>
			<span><a href="#">办公社区|</a></span>
			<span><a href="#">诚征英才|</a></span>
			<span><a href="#">联系我们|</a></span>
			<span><a href="#">开放平台|</a></span>
			</p>
			<p>
				Copyright &copy;网商平台 2017-2022，All Rights Reserved
			</p>
		</div>
</body>
<script type="text/javascript" charset="utf-8">
	function page_ajax(num){
		if(num==1){
			var datas={"code":$("#codes").text(),"pageNo":"1" };
		}
		if(num==2){
			var datas={"code":$('#codes').text(),"pageNo":parseInt($('#pageNo').text())-1};
		}
		if(num==3){
			var datas={"code":$('#codes').text(),"pageNo":parseInt($('#pageNo').text())+1};
		}
		if(num==4){
			var datas={"code":$('#codes').text(),"pageNo":$('#totalPage').text()};
		}
		
		$.ajax({
			url:'CarServlet',
			type:'post',
			dataType:'json',
			data:datas,
			success:success_function,
			error:error_function
		});
	}
	
	function success_function(ajaxdata){
		if(ajaxdata=='0'){
			location.reload();
		}else{
			alert("error");
		}
		
	}
	function error_function(){
		alert("ajax出错！");
	}
</script>
</html>