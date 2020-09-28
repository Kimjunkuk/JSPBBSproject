<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--This meta tag defines web pages size that can resize web pages depends on device screen size-->
<meta name="viewport" content="width=device-width", initial-scale="1">

<!--This link tag make this web site can use bootstrap's css-->
<link rel="stylesheet" href="css/bootstrap.css">

<!--This title tag shows us about what kind of website is-->
<title>문제4 - 김준국</title>

</head>

<body> 

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	
	%>

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
			<a class="navbar-brand" href="index.jsp">JSP BBS Project_MasonKim</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">main</a></li>
				<li><a href="http://masonlaboratory.com/">MasonLAB</a></li>
				<li><a href="skillbbs.jsp">Skills Inventory</a></li>
			</ul>
			
			<%
				if(userID == null){
			%>
				<ul class="nav navbar-nav navbar-right">
					<!--Create Drop down button on Nav Bar-->
					<li class="dropdown">
						<!--# <= Meaning is No link-->
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Connect<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<!--Active : 현제 선택이 되었다.-->
							<!--<li class="active"><a href="index.jsp">login</a></li>-->
							<li><a href="login.jsp">login</a></li>
							<li><a href="join.jsp">Join</a></li>
						</ul>
					</li>
				</ul>
			<% 
				} else {
			%>
				<ul class="nav navbar-nav navbar-right">
					<!--Create Drop down button on Nav Bar-->
					<li class="dropdown">
						<!--# <= Meaning is No link-->
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">My page<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<!--Active : 현제 선택이 되었다.-->
							<!--<li class="active"><a href="index.jsp">login</a></li>-->
							<li><a href="logoutAction.jsp">logOut</a></li>
						</ul>
					</li>
				</ul>
			<%
				}
			%>
			
			
		</div>

	</nav>
	<div>
		<input type='button' value='Back' onclick="location.href='assignments.jsp'"/>
		<h3>연습문제 4번입니다.</h3><br>
		
		<%
		String[][] strPerson = new String[4][3];
		
		strPerson[0][0] = "김갑수";
		strPerson[1][0] = "강문철";
		strPerson[2][0] = "신선영";
		strPerson[3][0] = "이명숙";
		strPerson[0][1] = "남";
		strPerson[1][1] = "남";
		strPerson[2][1] = "여";
		strPerson[3][1] = "여";
		strPerson[0][2] = "사장";
		strPerson[1][2] = "팀장";
		strPerson[2][2] = "부장";
		strPerson[3][2] = "사원";
		
		for(int i=0; i<=3 ; i++){
			out.println(strPerson[i][0]+"<br>");
		}
		
		for(int i=0; i<=3 ; i++){
			out.println(strPerson[i][1]+"<br>");
		}
		
		%>
	</div>




	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>