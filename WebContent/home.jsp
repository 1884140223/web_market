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
<title>商城首页</title>
<script src="js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="js/home.js" type="text/javascript" charset="utf-8"></script>
<link type="text/css" href="css/home.css" rel="stylesheet" />
</head>
<body>
	<div id="home">
		<div id="codes" style="display:none;" >${code}</div>
			<div id="title">
				<ul class="title_left">
					<li><a href="home.jsp">返回首页</a></li>
					<li>
						<c:if test="${empty name}" var="result" scope="request">  
							<a class="login" href="login.jsp">Hi,请登录</a>
						</c:if>
						<c:if test="${not empty name}" var="result" scope="request">
							欢迎用户&nbsp;<%=session.getAttribute("name") %>
						</c:if>
					</li>
					<li style="color:red">
						<c:if test="${not empty name}" var="result" scope="request">
							<a href="login.jsp">注销登录</a>
						</c:if>
						<c:if test="${empty name}">
							<a href="register.jsp" class="clear">注册有礼</a>
						</c:if>
					</li>
				</ul>
				<ul class="title_right">
					<li><a href="#">手机APP</a></li>
					<li><a href="#">客户服务</a></li>
					<li><a href="#">商家入驻</a></li>
					<li><a href="#">网站导航</a></li>
					<li><a href="shop.jsp">我的商城</a></li>
					
				</ul>
			</div>
			<div id="search">
				<div id="logo">
					<img src="image/logo.jpg" alter="logo" title="logo" style="vertical-align:middle;" width="100px" height="100px" />
					<span class="logo_title">优购商城</span>
				</div>
				<div id="search_input">
					<input type="text" class="input" />
					<input type="button" value="搜索" class="butt" /><br />
					<ul class="hot_search">
						<li style="color:red;">热门搜索</li>
						<li><a href="#">手机</a></li>
						<li><a href="#">iPad</a></li>
						<li><a href="#">热水器</a></li>
						<li><a href="#">取暖器</a></li>
						<li><a href="#">空调</a></li>
						<li><a href="#">电视</a></li>
						<li><a href="#">音响</a></li>
						<li><a href="#">手表</a></li>
						<li><a href="#">运动鞋</a></li>
						<li><a href="#">单反</a></li>
						<li><a href="#">奶粉</a></li>
					</ul>
				</div>
				<div id="buy_car">
					<img src="image/car.jpg" style="vertical-align:middle;" width="30px" height="30px" />
					<a href="order.jsp" id="cars">我的购物车</a>
				</div>
			</div>
			<div id="lunbo">
				<div id="menu">
					<ul><p>全部商品分类</p>
						<li>&nbsp;&nbsp;手机 充值 相机 智能数码</li>
						<li>&nbsp;&nbsp;电脑 办公配件</li>
						<li>&nbsp;&nbsp;电视 影音 智能管家 智能家居</li>
						<li>&nbsp;&nbsp;空调 冰箱 洗衣机</li>
						<li>&nbsp;&nbsp;厨房卫浴 生活电器 净化器</li>
						<li>&nbsp;&nbsp;家居 建材 家装服务</li>
						<li>&nbsp;&nbsp;家纺 家居 满99减20</li>
						<li>&nbsp;&nbsp;食品酒水 母婴玩具</li>
						<li>&nbsp;&nbsp;医疗保健 美妆个护</li>
						<li>&nbsp;&nbsp;服饰鞋帽 箱包奢品</li>
						<li>&nbsp;&nbsp;运动户外 钟表首饰</li>
						<li>&nbsp;&nbsp;汽车整车 汽车用品</li>
						
					</ul>
				</div>
				<div id="menu_right">
					<!-- 菜单栏隐藏部分 -->
					<ul>
						<li>
							<ul class="men">
								<li style="color:rgb(113,113,113);">手机通讯</li>
								<li>| <a href="#">手机</a></li>
								<li>| <a href="#">对讲机</a></li>
								<li>| <a href="#">华为</a></li>
								<li>| <a href="#">小米</a></li>
								<li>| <a href="#">三星</a></li>
								<li>| <a href="#">OPPO</a></li>
								<li>| <a href="#">vivo</a></li>
							</ul>
						</li>
						<li>
							<ul class="men">
								<li style="color:rgb(113,113,113);">手机配件 </li>
								<li>| <a href="#">移动电源</a></li>
								<li>| <a href="#">存储卡/读卡器</a></li>
								<li>| <a href="#">蓝牙耳机</a></li>
								<li>| <a href="#">有线耳机</a></li>
								<li>| <a href="#">iPhone配件</a></li>
								<li>| <a href="#">保护套</a></li>
								<li>| <a href="#">贴膜</a></li>
								<li>| <a href="#">手机电池</a></li>
								<li>| <a href="#">智能手环</a></li>
								<li>| <a href="#">其他配件</a></li>
							</ul>
						</li>
						<li>
							<ul class="men">
								<li style="color:rgb(113,113,113);">运营商</li>
								<li>| <a href="#">中国移动</a></li>
								<li>| <a href="#">中国联通</a></li>
								<li>| <a href="#">中国电信</a></li>
								<li>| <a href="#">腾讯王卡</a></li>
								<li>| <a href="#">蚂蚁宝卡</a></li>
								<li>| <a href="#">京东强卡</a></li>
								<li>| <a href="#">百度神卡</a></li>
							</ul>
						</li>
						<li>
							<ul class="men">
								<li style="color:rgb(113,113,113);">摄影摄像 </li>
								<li>| <a href="#">数码相机</a></li>
								<li>| <a href="#">单反相机</a></li>
								<li>| <a href="#">单反/微单相机</a></li>
								<li>| <a href="#">摄像机</a></li>
								<li>| <a href="#">拍立得</a></li>
							</ul>
						</li>
						<li>
							<ul class="men">
								<li style="color:rgb(113,113,113);">拍照配件 </li>
								<li>| <a href="#">存储卡</a></li>
								<li>| <a href="#">单反镜头</a></li>
								<li>| <a href="#">单反配件</a></li>
								<li>| <a href="#">电池/充电器</a></li>
								<li>| <a href="#">拍摄包</a></li>
								<li>| <a href="#">三脚架</a></li>
								<li>| <a href="#">滤镜</a></li>
							</ul>
						</li>
						<li>
							<ul class="men">
								<li style="color:rgb(113,113,113);">智能设备 </li>
								<li>| <a href="#">智能手表</a></li>
								<li>| <a href="#">智能手环</a></li>
								<li>| <a href="#">VR眼睛</a></li>
								<li>| <a href="#">智能家居</a></li>
								<li>| <a href="#">健康监测</a></li>
								<li>| <a href="#">无人机</a></li>
								<li>| <a href="#">智能配饰</a></li>
								<li>| <a href="#">智享生活</a></li>
							</ul>
						</li>
						<li>
							<ul class="men">
								<li style="color:rgb(113,113,113);">试听娱乐 </li>
								<li>| <a href="#">耳机/耳麦</a></li>
								<li>| <a href="#">音箱/音响</a></li>
								<li>| <a href="#">MP3/MP4</a></li>
								<li>| <a href="#">收/录音机</a></li>
							</ul>
						</li>
						<li>
							<ul class="men">
								<li style="color:rgb(113,113,113);">电子教育 </li>
								<li>| <a href="#">电子书</a></li>
								<li>| <a href="#">电子词典</a></li>
								<li>| <a href="#">录音笔</a></li>
								<li>| <a href="#">学生平板</a></li>
								<li>| <a href="#">点读机/复读机</a></li>
							</ul>
						</li>
						<li>
							<ul class="men">
								<li style="color:rgb(113,113,113);">充话费 </li>
								<li>| <a href="#">移动/联通/电信</a></li>
							</ul>
						</li>
						<li>
							<ul class="men">
								<li style="color:rgb(113,113,113);">充流量 </li>
								<li>| <a href="#">移动/联通/电信</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div id="anchor">
					<!-- 右侧固定定位锚链接 -->
					<ul>
						<li>女鞋</li>
						<li>男鞋</li>
						<li>运动</li>
						<li>户外</li>
						<li>服装</li>
						<li>母婴</li>
					</ul>
					
					
				</div>
				<!-- 轮播图部分 -->
				<div id="photo">
					<ul class="photo">
						<li class="photo-img">
							<a href="#" target="_blank"><img alt="" title="" src="image/lun1.jpg" /></a>
						</li>
						<li class="photo-img">
							<a href="#" target="_blank"><img alt="" title="" src="image/lun2.jpg" /></a>
						</li>
						<li class="photo-img">
							<a href="#" target="_blank"><img alt="" title="" src="image/lun3.jpg" /></a>
						</li>
						<li class="photo-img">
							<a href="#" target="_blank"><img alt="" title="" src="image/lun4_.jpg" /></a>
						</li>
						<li class="photo-img">
							<a href="#" target="_blank"><img alt="" title="" src="image/lun5.jpg" /></a>
						</li>
						<li class="photo-img">
							<a href="#" target="_blank"><img alt="" title="" src="image/lun6.jpg" /></a>
						</li>
					</ul>
				<!-- 轮播数字下标 -->
				<div class="photo-mumber">
					<ul class="number">
						<li class="photo-item">1</li>
						<li class="photo-item">2</li>
						<li class="photo-item">3</li>
						<li class="photo-item">4</li>
						<li class="photo-item">5</li>
						<li class="photo-item">6</li>
					</ul>
					<div class="photo-page">
						<a class="photo-pre" href="javascript:;;"><</a> 
						<a class="photo-next" href="javascript:;;">></a>
					</div>
				</div>
			</div>
		</div>
		<div id="middle">
			<div id="activity">
				<img src="image/222.png" style="vertical-align:top;" alt="" title="" />
				<div class="activity_right">
					<ul>
						<li>
							<a href="#"><img src="image/t1.png" width="240px" height="100px" alt="" title="" /></a>
							<a href="#"><img src="image/t2.png" width="240px" height="100px" alt="" title="" /></a>
							<a href="#"><img src="image/t3.png" width="240px" height="100px" alt="" title="" /></a>
							<a href="#"><img src="image/t4.png" width="230px" height="100px" alt="" title="" /></a>
						</li>
						<li>
							<a href="#"><img src="image/s1.png" width="190px" height="210px" alt="" title="" /></a>
							<a href="#"><img src="image/s2.png" width="190px" height="210px" alt="" title="" /></a>
							<a href="#"><img src="image/s3.png" width="190px" height="210px" alt="" title="" /></a>
							<a href="#"><img src="image/s4.png" width="190px" height="210px" alt="" title="" /></a>
							<a href="#"><img src="image/s5.png" width="190px" height="210px" alt="" title="" /></a>
						</li>
						<li>
							<a href="#"><img src="image/s6.png" width="190px" height="210px" alt="" title="" /></a>
							<a href="#"><img src="image/s7.png" width="190px" height="210px" alt="" title="" /></a>
							<a href="#"><img src="image/s8.png" width="190px" height="210px" alt="" title="" /></a>
							<a href="#"><img src="image/s9.png" width="190px" height="210px" alt="" title="" /></a>
							<a href="#"><img src="image/s10.png" width="190px" height="210px" alt="" title="" /></a>
						</li>
					</ul>
					
				</div>
			</div>
			<h2 style="margin-left:30px;">猜你喜欢</h2>
			<div id="commodity">
				<c:forEach items="${listCommodity}" var="commodity" end="9">
					<div class="shop" style="">
						<a href="buy.jsp?img=${commodity.img}&title=${commodity.title}&money=${commodity.money}"
						style="overflow: hidden; display: block; "> <img
						src="${commodity.img}" class="pics" width="230px" height="250px"/>
						</a><br />
						<span class="en" style="font-weight:bold;font-size:15px;">${commodity.title}</span><br />
						<p style="width:150px;height:30px;overflow:hidden;font-size:10px;font-style:italic">
							${commodity.content}
						</p>
						<p>
							<span style="font-weight:bold;color:red;font-size:20px;">￥${commodity.money}</span>
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
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