<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--This meta tag defines web pages size that can resize web pages depends on device screen size-->
<meta name="viewport" content="width=device-width", initial-scale="1">

<!--This link tag make this web site can use bootstrap's css-->
<link rel="stylesheet" href="css/bootstrap.css">

<!--This title tag shows us about what kind of website is-->
<title>문제3 - 김준국</title>

</head>

<body> 

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
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
	<div>
		<input type='button' value='Back' onclick="location.href='assignments.jsp'"/>
		<h3>연습문제 3번입니다.</h3><br>
		
		<%
		

		
		int intVar1 = 20;
		int intVar2 = 4;
		
		int intResult1 = intVar1/intVar2;
		int intResult2 = intVar1%intVar2;
		
		out.println("몫은"+intResult1+"입니다."+"<br>"+"나머지는"+intResult2+"입니다."+"<br>");
		
	
		%>
		<h3>나누기 입력값 연산 기능입니다.</h3>
		<form action="ex3Action.jsp" method="post">

			<!--action은 서버 쪽 주소(jsp로 구성), 여기에서는 html에 보냄-->

			<table>

				<tr>

					<td>나눌 대상값 입력!!!</td>

					<td>
					
					<input type="number" name="num1" id="num1"> 
					<!-- 서버에서는 name으로, 자바스크립트는 id로 인식하므로 둘의 이름을 같게 명시해야 한다-->

					</td>

				</tr>

				<tr>

					<td>나눌 숫자를 입력해 주세요!!!</td>

					<td><input type="number" name="num2" id="num2"></td>

				</tr>

				<tr>

					<td colspan="2"></td>
					<!--컬럼 2칸 합치기-->

					<td><input type="submit" value="나누기"></td>

				</tr>

			</table>

		</form>

	</div>




	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>