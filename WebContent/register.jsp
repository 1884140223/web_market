<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="js/register.js"></script>
<link type="text/css" href="css/register.css" rel="stylesheet" />
<title>注册页面</title>
<%
	String path = request.getContextPath();
%>
</head>
<body>
	<div id="title">
		<img src="image/login_logo.png" /><span>|用户登录<span>
	</div>
	<div id="content">
		<div id="login">
			<div id="mess"></div>
			<form action=" " method="post" id="register">
			<ul>
				<li>
					<input type="button" value="手机号" class="user" /><input type="text" class="name" placeholder="用于你的登录账户" id="phone" /><br /><br />
				</li>
				<li>
					<input type="button" value="用户名" class="user" /><input type="text" class="name" placeholder="您的用户名" id="name" /><br /><br />
				</li>
				<li>
					<input type="button" value="用户邮箱" class="user" /><input type="text" class="name" placeholder="请输入你的邮箱" id="email" /><br /><br />
				</li>
				<li>
					<input type="button" value="用户密码" class="user" /><input type="password" class="name" placeholder="请输入密码" id="password" /><br /><br />
				</li>
				<li>
					<input type="button" value="确认密码" class="user" /><input type="text" class="name" placeholder="请再次输入密码" id="pwd" /><br /><br />
				</li>
				<li class="account"><a href="login.jsp">已有账户登录</a></li>
				<li><input type="button" value="立即注册" class="sub" onclick="ajax();" /></li>
			</ul>
		</form>
		</div>
	</div>
</body>
</html>