<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
<script src="js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="js/forget.js" type="text/javascript" charset="utf-8"></script>
<link type="text/css" href="css/forget.css" rel="stylesheet" />
</head>
<body>
	<div id="title">
		<img src="image/login_logo.png" /><span>|忘记密码<span>
	</div>
	<div id="content">
		<div class="safety">安全验证</div>
		<div class="mod_pwd">修改密码</div>
		<div id="safety">
			<div>
				<input type="button" value="账号" class="radio" /><input type="text"  id="code" /><br />
				<input type="button" value="验证码" class="radio" /><input type="text" id="myVcode" />
				<input type="text" value="" id="Vcode" readonly /><input type="button" value="获取验证码" onclick="obtain();" style="width:80px;height:40px;" /><br />
				<input type="button" value="提交" onclick="ajax();" class="sub" />
			</div>
		</div>
		<div id="mod_pwd">
			<div>
				<input type="hidden" value="${code}" id="code" />
				<input type="button" value="新密码" class="radio" /><input type="password"  id="pwd1" /><br />
				<input type="button" value="确认密码" class="radio" /><input type="password" id="pwd2" /><br />
				<input type="button" value="提交" onclick="function_ajax();"  class="sub"/>
			</div>
		</div>
	</div>
</body>
</html>