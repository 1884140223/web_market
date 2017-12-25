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
<title>我的商城</title>
<script src="js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="js/shop.js" type="text/javascript" charset="utf-8"></script>
<link type="text/css" href="css/shop.css" rel="stylesheet" />
</head>
<body>
	<%
		String str = (String) session.getAttribute("name");
		if (str == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		String phone = null;
		String sex = null;
		String year = null;
		String month = null;
		String day = null;
		String birthday = null;
		String email = null;
		List<Account> list = (List<Account>)session.getAttribute("listAccount");
		Account account = new Account();
		account = list.get(0);
		phone = account.getCode();
		sex = account.getSex();
		email = account.getEmail();
		String password=account.getPassword();
		birthday = account.getBirthday();
		boolean flag = (null == birthday) ? false : true;
		if (flag) {
			String[] arr = birthday.split("-");
			if (arr.length == 3) {
				year = arr[0];
				month = arr[1];
				day = arr[2];
			}
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
					<li><a href="shop.jsp" style="color:red;">个人信息</a></li>
					<li><a href="order.jsp">我的订单</a></li>
					<li><a href="modify.jsp">修改密码</a></li>
				</ul>
			</div>
			<div class="right_part">
				<form method="post" action="">
					<ul class="list_for">
						<li>
							<input type="button" value="用户账户:" class="title" />
							<input type="text" readonly value="${code}" class="text" id="code" style="border:none" />
						</li>
						<li>
							<input type="button" value="用户名:" class="title" />
							<input type="text" value="${name}" class="text" id="name" />
						</li>
						<li>
							<input type="button" value="性别:" class="title" />
							<input type="radio" name="sex" value="男" <%="男".equals(sex) ? "checked" : ""%> />男
							<input type="radio" name="sex" value="女" <%="女".equals(sex) ? "checked" : ""%> />女
						</li>
						<li>
							<input type="button" value="生日:" class="title" />
							<select id="year">
								<option>请选择</option>
									<option <%="2017".equals(year) ? "selected" : ""%>>2017</option>
									<option <%="2016".equals(year) ? "selected" : ""%>>2016</option>
									<option <%="2015".equals(year) ? "selected" : ""%>>2015</option>
									<option <%="2014".equals(year) ? "selected" : ""%>>2014</option>
									<option <%="2013".equals(year) ? "selected" : ""%>>2013</option>
									<option <%="2012".equals(year) ? "selected" : ""%>>2012</option>
									<option <%="2011".equals(year) ? "selected" : ""%>>2011</option>
									<option <%="2010".equals(year) ? "selected" : ""%>>2010</option>
									<option <%="2009".equals(year) ? "selected" : ""%>>2009</option>
									<option <%="2008".equals(year) ? "selected" : ""%>>2008</option>
									<option <%="2007".equals(year) ? "selected" : ""%>>2007</option>
									<option <%="2006".equals(year) ? "selected" : ""%>>2006</option>
									<option <%="2005".equals(year) ? "selected" : ""%>>2005</option>
									<option <%="2004".equals(year) ? "selected" : ""%>>2004</option>
									<option <%="2003".equals(year) ? "selected" : ""%>>2003</option>
									<option <%="2002".equals(year) ? "selected" : ""%>>2002</option>
									<option <%="2001".equals(year) ? "selected" : ""%>>2001</option>
									<option <%="2000".equals(year) ? "selected" : ""%>>2000</option>
									<option <%="1999".equals(year) ? "selected" : ""%>>1999</option>
									<option <%="1998".equals(year) ? "selected" : ""%>>1998</option>
									<option <%="1997".equals(year) ? "selected" : ""%>>1997</option>
									<option <%="1996".equals(year) ? "selected" : ""%>>1996</option>
									<option <%="1995".equals(year) ? "selected" : ""%>>1995</option>
									<option <%="1994".equals(year) ? "selected" : ""%>>1994</option>
									<option <%="1993".equals(year) ? "selected" : ""%>>1993</option>
									<option <%="1992".equals(year) ? "selected" : ""%>>1992</option>
									<option <%="1991".equals(year) ? "selected" : ""%>>1991</option>
									<option <%="1990".equals(year) ? "selected" : ""%>>1990</option>
							</select>年
							<select id="month">
								<option>请选择：</option>
									<option <%="01".equals(month) ? "selected" : ""%>>01</option>
									<option <%="02".equals(month) ? "selected" : ""%>>02</option>
									<option <%="03".equals(month) ? "selected" : ""%>>03</option>
									<option <%="04".equals(month) ? "selected" : ""%>>04</option>
									<option <%="05".equals(month) ? "selected" : ""%>>05</option>
									<option <%="06".equals(month) ? "selected" : ""%>>06</option>
									<option <%="07".equals(month) ? "selected" : ""%>>07</option>
									<option <%="08".equals(month) ? "selected" : ""%>>08</option>
									<option <%="09".equals(month) ? "selected" : ""%>>09</option>
									<option <%="10".equals(month) ? "selected" : ""%>>10</option>
									<option <%="11".equals(month) ? "selected" : ""%>>11</option>
									<option <%="12".equals(month) ? "selected" : ""%>>12</option>
							</select>月 
							<select id="day">
									<option>请选择：</option>
									<option <%="01".equals(day) ? "selected" : ""%>>01</option>
									<option <%="02".equals(day) ? "selected" : ""%>>02</option>
									<option <%="03".equals(day) ? "selected" : ""%>>03</option>
									<option <%="04".equals(day) ? "selected" : ""%>>04</option>
									<option <%="05".equals(day) ? "selected" : ""%>>05</option>
									<option <%="06".equals(day) ? "selected" : ""%>>06</option>
									<option <%="07".equals(day) ? "selected" : ""%>>07</option>
									<option <%="08".equals(day) ? "selected" : ""%>>08</option>
									<option <%="09".equals(day) ? "selected" : ""%>>09</option>
									<option <%="10".equals(day) ? "selected" : ""%>>10</option>
									<option <%="11".equals(day) ? "selected" : ""%>>11</option>
									<option <%="12".equals(day) ? "selected" : ""%>>12</option>
									<option <%="13".equals(day) ? "selected" : ""%>>13</option>
									<option <%="14".equals(day) ? "selected" : ""%>>14</option>
									<option <%="15".equals(day) ? "selected" : ""%>>15</option>
									<option <%="16".equals(day) ? "selected" : ""%>>16</option>
									<option <%="17".equals(day) ? "selected" : ""%>>17</option>
									<option <%="18".equals(day) ? "selected" : ""%>>18</option>
									<option <%="19".equals(day) ? "selected" : ""%>>19</option>
									<option <%="20".equals(day) ? "selected" : ""%>>20</option>
									<option <%="21".equals(day) ? "selected" : ""%>>21</option>
									<option <%="22".equals(day) ? "selected" : ""%>>22</option>
									<option <%="23".equals(day) ? "selected" : ""%>>23</option>
									<option <%="24".equals(day) ? "selected" : ""%>>24</option>
									<option <%="25".equals(day) ? "selected" : ""%>>25</option>
									<option <%="26".equals(day) ? "selected" : ""%>>26</option>
									<option <%="27".equals(day) ? "selected" : ""%>>27</option>
									<option <%="28".equals(day) ? "selected" : ""%>>28</option>
									<option <%="29".equals(day) ? "selected" : ""%>>29</option>
									<option <%="30".equals(day) ? "selected" : ""%>>30</option>
									<option <%="31".equals(day) ? "selected" : ""%>>31</option>
							</select>日
						</li>
						<li>
							<input type="button" value="邮箱:" class="title" />
							<input type="text" value="<%=email %>" class="text" id="email" />
						</li>
					</ul>
					<input type="button" value="保存" class="sub" onclick="ajax_function();" />
				</form>
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