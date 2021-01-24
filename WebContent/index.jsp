<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--This meta tag defines web pages size that can resize web pages depends on device screen size-->
<meta name="viewport" content="width=device-width" , initial-scale="1">

<!--This link tag make this web site can use bootstrap's css-->
<link rel="stylesheet" href="css/bootstrap-grid.css">
<link rel="stylesheet" href="css/bootstrap-reboot.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">



<!--This title tag shows us about what kind of website is-->
<title>JSP BBS Project</title>

</head>

<body>

	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>



	<nav class="navbar navbar-default" style="float: left;">

		<!--Navi Bar Contents Section-->
		<div class="navbar-header">

			<!--This button tag is defined right side line button-->
			<!-- <button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				
				<!--This span tag shows us the line on the line button and I added one more line-->
			<!--<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button> -->

			<!--해당 a태그에 작성된 내용이 네비바 위에 사이트 제목처럼 노출된다
			This a tag show us at Navbar about something contents what we write -->

		</div>

		<!--Navigation Bar Section-->
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active" href="index.jsp">HOME</a>
			</li>
			<%
				if (userID == null) {
			%>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">CONNECT</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="login.jsp">LOGIN</a> <a
						class="dropdown-item" href="join.jsp">JOIN</a>
				</div></li>
			<%
				} else {
			%>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">MY PAGE</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">MY PROFILE</a> <a
						class="dropdown-item" href="logoutAction.jsp">LOGOUT</a>
				</div></li>
			<%
				}
			%>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">MENU</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="projects.jsp">PROJECTS</a> <a
						class="dropdown-item" href="skillbbs.jsp">TOOLBOX</a> <a
						class="dropdown-item" href="bbjun.jsp">BB&JUN</a> <a
						class="dropdown-item" href="assignments.jsp">ASSIGNMENTS</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Separated link</a>
				</div></li>
		</ul>

		<!--011720201_Mason>> Make this NAV section to commant<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">HOME</a></li>
				<li><a href="projects.jsp"></a></li>
				<li><a href="skillbbs.jsp">Toolbox</a></li>
				<li><a href="assignments.jsp">Assignments</a></li>
			</ul>
			
	//if(userID == null){
			%>
				<ul class="nav navbar-nav navbar-right">
					<!--Create Drop down button on Nav Bar-->
		<!--<li class="dropdown">
						<!--# <= Meaning is No link-->
		<!--<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Connect<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<!--Active : 현제 선택이 되었다.-->
		<!--<li class="active"><a href="index.jsp">login</a></li>
							<li><a href="login.jsp">login</a></li>
							<li><a href="join.jsp">Join</a></li>
						</ul>
					</li>
				</ul>
	//} else {
			%>
				<ul class="nav navbar-nav navbar-right">
					<!--Create Drop down button on Nav Bar-->
		<!--<li class="dropdown">
						<!--# <= Meaning is No link-->
		<!--<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">My page<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<!--Active : 현제 선택이 되었다.-->
		<!--<li class="active"><a href="index.jsp">login</a></li>
							<li><a href="logoutAction.jsp">logOut</a></li>
						</ul>
					</li>
				</ul>
	//}
			%>
			
			
		</div>-->
	</nav>

	<div>
		<!-- 01172021_Mason>> github Octo Profile  -->
		<iframe src="https://octoprofile.now.sh/user?id=KIMJUNKUK"
			frameborder="0"
			style="height: 1700px; width: 100%; overflow: hidden;"no"></iframe>
	</div>

	<div
		style="margin-left: 30px; margin-right: 30px; margin-bottom: 60px; margin-top: 60px;">
		<!-- 01172021_Mason>> About Mason section begin from here -->
		<div class="card-deck">
			<div class="card">
				<a href="https://www.hackerrank.com/ehehwnwjs546?hr_r=1"><img
					src="https://pathrise-website-guide-wp.s3.us-west-1.amazonaws.com/guides/wp-content/uploads/2019/05/22174532/hackerrank-logo.jpg"
					class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">Hackerrank</h5>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">Last updated 3 mins ago</small>
				</div>
			</div>
			<div class="card">
				<a href="https://leetcode.com/Kimjunkuk/"><img
					src="https://sarthak-sehgal.github.io/leetcode101/images/logo.png"
					class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">Leetcode</h5>
					<p class="card-text">This card has supporting text below as a
						natural lead-in to additional content.</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">Last updated 3 mins ago</small>
				</div>
			</div>
			<div class="card">
				<a href="www.linkedin.com/in/junkukkim"><img
					src="https://lovetoteach87.com/wp-content/uploads/2016/12/linkedin-400850_1280.png"
					class="card-img-top" alt="..."></a>
				<div class="card-body">
					<h5 class="card-title">Linkedin</h5>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This card has
						even longer content than the first to show that equal height
						action.</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">Last updated 3 mins ago</small>
				</div>
			</div>
		</div>
	</div>

	<div
		style="margin-left: 30px; margin-right: 30px; margin-bottom: 60px;">
		<!-- 01172021_Mason>> About Mason section begin from here -->
		<div class="card-deck">
			<div class="card">
				<img
					src="https://www.researchgate.net/profile/Raoof-Mostafazadeh/post/What-has-more-worth-intelligence-or-experience/attachment/59d61db679197b80779797e0/AS%3A272439999696900%401441966165259/image/Knowledge+and+Experience.jpg"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Experience</h5>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">Last updated 3 mins ago</small>
				</div>
			</div>
			<div class="card">
				<img
					src="https://img.matomo.org/spai/w_1029+q_lossless+ret_img+to_webp/https://static.matomo.org/wp-content/uploads/2019/02/education-analytics.png"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Education</h5>
					<p class="card-text">This card has supporting text below as a
						natural lead-in to additional content.</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">Last updated 3 mins ago</small>
				</div>
			</div>
			<div class="card">
				<img
					src="https://media0.giphy.com/media/XoM4M6KfItzpfAqbU9/giphy.gif"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Award</h5>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This card has
						even longer content than the first to show that equal height
						action.</p>
				</div>
				<div class="card-footer">
					<small class="text-muted">Last updated 3 mins ago</small>
				</div>
			</div>
		</div>
	</div>



	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>