<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--This meta tag defines web pages size that can resize web pages depends on device screen size-->
<meta name="viewport" content="width=device-width", initial-scale="1">

<!--This link tag make this web site can use bootstrap's css-->
<link rel="stylesheet" href="css/bootstrap.css">

<!--This title tag shows us about what kind of website is-->
<title>JSP BBS Project</title>

</head>

<body> 

	<!--Navigation Bar Section-->
	<nav class="navbar navbar-default">

		<!--Navi Bar Contents Section-->
		<div class="navbar-header">

			<!--This button tag is defined right side line button-->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				
				<!--This span tag shows us the line on the line button and I added one more line-->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

			<!--해당 a태그에 작성된 내용이 네비바 위에 사이트 제목처럼 노출된다
			This a tag show us at Navbar about something contents what we write -->
			<a class="navbar-brand" href="main.jsp">JSP BBS Project_MasonKim</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">main</a></li>
				<li><a href="http://masonlaboratory.com/">MasonLAB</a></li>
				<li><a href="skillbbs.jsp">Skills Inventory</a></li>
				<li><a href="assignments.jsp">Assignments</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<!--Create Drop down button on Nav Bar-->
				<li class="dropdown">
					<!--# <= Meaning is No link-->
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Connect<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<!--Active : 현제 선택이 되었다.-->
						<li class="active"><a href="index.jsp">Main</a></li>
						<li><a href="join.jsp">Join</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<!--Login Form Section below-->
	<div class="container">
		<div class="col-lg-4"></div>

		<!--Loing Form contents below-->
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<!--post: 어떠한 정보를 숨기면서 보낼때 사용하는 Method
				loginAction : loginAction라는 페이지로 로그인 정보를 보내겠다는 의미-->
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">Login Page</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="password" name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="Login">
				</form>
			</div>
		</div>

		<div class="col-lg-4"></div>
	</div>


	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>