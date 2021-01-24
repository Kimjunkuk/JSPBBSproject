<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.io.PrintWriter" %>
<%@ page import="RealTime.realtime" %>
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
<title>문제2 - 김준국</title>

</head>
<script type="text/javascript">

function go_time(){

var now = new Date();

var year = now.getFullYear(); //년
var month = now.getMonth(); //월
var day = now.getDay();  //일
var hour = now.getHours();  //시
var min = now.getMinutes();  //분
var sec = now.getSeconds();  //초

document.getElementById("clock").innerHTML 
= year+"year "+ month+"month "+day+"day "+hour+":"+min+":"+sec
//id가 clock인 html에 현재시각을 넣음

setTimeout("go_time()", 1000);
//1초마다 해당 펑션을 실행함.
}	
</script>

<body onload="go_time()"> 

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
		<input type='button' value='Back'onclick="location.href='assignments.jsp'" /><br>
		<h3>연습문제 2번입니다.</h3><br>
		<% 
		
		
			Date varTime = new Date();

			out.println("<br>" + "현제" + "<br>" + "서버의" + "<br>" + "시간은" + "<br>" + varTime + "<br>" + "입니다"+"<br>");
			
			out.println("<br>"+"그리고 현제 서버의 시간은 이렇게 흘러 가고 있습니다 :"+"<div id="+"clock"+"></div>");
		%>
		

	
	</div>
	





	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>



</body>
</html>