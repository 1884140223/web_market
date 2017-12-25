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
<title>商品详情</title>
<script src="js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="js/buy.js" type="text/javascript" charset="utf-8"></script>
<link type="text/css" href="css/buy.css" rel="stylesheet" />
</head>
<body>
	<%
		String name = (String) session.getAttribute("name");
		if (name == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		request.setCharacterEncoding("UTF-8");//传值编码
		response.setContentType("text/html;charset=UTF-8");
		String title = request.getParameter("title");
		String money = request.getParameter("money");
		String img = request.getParameter("img");
		title=new String(title.getBytes("ISO-8859-1"),"utf-8");
		money=new String(money.getBytes("ISO-8859-1"),"utf-8");
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
	<div id="left-part">
		<img src="<%=img %>" width="200px" height="300px" id="image" />
	</div>
	<div id="right-part">
		<form action="" method="post">
			<ul class="info_list">
				<li>商品名称：<span id="titles"><%=title %></span></li>
				<li>商品价格：￥<span id="money"><%=money %></span></li>
				<li>收货人：<input type="text" id="person" style="width:100px; text-align:center;" /></li>
				<li>收货地址：
					<select id="province">
						<option selected>请选择：</option>
						<option>安徽</option>
						<option>浙江</option>
						<option>江苏</option>
						<option>河南</option>
						<option>河北</option>
						<option>湖南</option>
						<option>湖北</option>
						<option>四川</option>
						<option>云南</option>
						<option>辽宁</option>
						<option>吉林</option>
						<option>黑龙江</option>
						<option>山西</option>
						<option>陕西</option>
						<option>山东</option>
						<option>广东</option>
						<option>福建</option>
						<option>贵州</option>
						<option>江西</option>
						<option>甘肃</option>
					</select>省
					<input type="text" id="adress" />
				</li>
				
				<li>数量：
					<input type="button" value="-" style="width:20px;" onclick="less();" />
					<input type="text" id="number" value="1" style="width:30px;text-align:center;" />
					<input type="button" value="+" style="width:20px;" onclick="add();" />
				</li>
			</ul>
			<input type="button" value="立即购买" class="but" onclick="ajax_buy();" />
			<input type="button" value="加入购物车" class="car" onclick="ajax_car();" />
		</form> 
	</div>
	<div id="codes" style="display:none;" >${code}</div>
</body>
</html>