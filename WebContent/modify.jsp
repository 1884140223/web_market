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
<title>修改密码</title>
<script src="js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="js/modify.js" type="text/javascript" charset="utf-8"></script>
<link type="text/css" href="css/modify.css" rel="stylesheet" />
</head>
<body>
	<%
		String str = (String) session.getAttribute("name");
		if (str == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		List<Account> list = (List<Account>)session.getAttribute("listAccount");
		Account account = new Account();
		account = list.get(0);
		String phone = account.getCode();
		
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
					<li><a href="order.jsp">我的订单</a></li>
					<li><a href="modify.jsp" style="color:red;">修改密码</a></li>
				</ul>
			</div>
			<div class="right_part">
				<div class="safety">安全验证</div>
				<div class="mod_pwd">修改密码</div>
				<div id="safety">
			<div>
				<input type="button" value="账号" class="radio" /><input type="text"  id="code" value="${code}" readonly  /><br />
				<input type="button" value="验证码" class="radio" /><input type="text" id="myVcode" />
				<input type="text" value="" id="Vcode" readonly /><input type="button" value="获取验证码" onclick="obtain();" style="width:80px;height:40px;" /><br />
				<input type="button" value="提交" onclick="ajax();" class="sub" />
			</div>
		</div>
		<div id="mod_pwd">
			<div>
				<input type="hidden" value="${code}" id="codes" />
				<input type="button" value="新密码" class="radio" /><input type="password"  id="pwd1" /><br />
				<input type="button" value="确认密码" class="radio" /><input type="password" id="pwd2" /><br />
				<input type="button" value="提交" onclick="function_ajax();"  class="sub"/>
			</div>
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
</html>