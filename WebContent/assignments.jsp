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

	<!--Navigation Bar Section-->
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
	
		<div style="width: 600px; float: center;">
		<input type='button' value='Assignment(과제) ex1'
			style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex1.jsp'" /> <input type='button'
			value='Assignment(과제) ex2' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex2.jsp'" /> <input type='button'
			value='Assignment(과제) ex3' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex3.jsp'" /> <input type='button'
			value='Assignment(과제) ex4' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex4.jsp'" /> <input type='button'
			value='Assignment(과제) ex5' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex5.jsp'" /> <input type='button'
			value='Assignment(과제) ex6' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex6.jsp'" /> <input type='button'
			value='Assignment(과제) ex7' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex7.jsp'" /> <input type='button'
			value='Assignment(예제) ex8' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex8.jsp'" /> <input type='button'
			value='Assignment(예제) ex9' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex9.jsp'" /> <input type='button'
			value='Assignment(예제) ex10' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex10.jsp'" /> <input type='button'
			value='Assignment(예제) ex11' style='width: 100%;'
			onclick="location.href='ex11.jsp'" />
	</div>
		
	<div
		style="margin-left: 30px; margin-right: 30px; margin-bottom: 60px; margin-top: 60px;">
		<!-- 01172021_Mason>> About Mason section begin from here -->
		<div class="card-deck">
			<div class="card border-dark mb-3" style="max-width: 18rem;">
			  <div class="card-header">Header</div>
			  <div class="card-body text-dark">
			    <h5 class="card-title">Dark card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			</div>	
			<div class="card border-dark mb-3" style="max-width: 18rem;">
			  <div class="card-header">Header</div>
			  <div class="card-body text-dark">
			    <h5 class="card-title">Dark card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			</div>	
			<div class="card border-dark mb-3" style="max-width: 18rem;">
			  <div class="card-header">Header</div>
			  <div class="card-body text-dark">
			    <h5 class="card-title">Dark card title</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  </div>
			</div>	
		</div>
	</div>






	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>