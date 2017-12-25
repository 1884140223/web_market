<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<script src="js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="js/login.js" type="text/javascript" charset="utf-8"></script>
<link type="text/css" href="css/login.css" rel="stylesheet" />
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
			<ul>
				<li>账户密码登录<a href="forget.jsp" style="float:right;" class="modify" >忘记密码？</a>
					<form action=" " method="post">
						<ul>
							<li>
								<input type="button" value="用户ID" class="login" >
								<input type="text" class="code" id="code" value="${code}" placeholder="您的账户 /手机号" required />
							</li>
							<li>
								<input type="button" value="ID密码" class="login" >
								<input type="text" class="pwd" id="pwd" value="${password}" placeholder="请输入密码" required />
							</li>
							<li>
								<input type="button" value="立即登录" class="sub" onclick="ajax();" />
								<a href="register.jsp"><input type="button" value="立即注册" class="reg" /></a>
							</li>
						</ul>
					</form>
				</li>
				<li>扫码登录
					<ul>
						<img src="image/saoma.png" width="120px" height="120px" style="vertical-align:middle;margin-left:60px;" />
						<span>手机APP扫码快速登录</span>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>