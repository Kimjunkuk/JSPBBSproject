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
		<h3>연습문제 3번입니다.</h3><br>

		
	 	<%
	 	

	 	String num1 = request.getParameter("num1");

		String num2 = request.getParameter("num2");
		
		if(num1.equals("") || num2.equals("")){
			out.println("값이 정확히 입력 되지 않았습니다."+"<br>"+"값을 정확히 입력해주시면 감사하겠습니다.");
		}
		
		else{
			
			int num3 = Integer.parseInt(num1);

			int num4 = Integer.parseInt(num2);
			
			out.println("나눌 대상값 : " + num3+"<br>"); 


			out.println("나눌 값 : " + num4+"<br>");


			out.println("나눈 결과 : " + (num3/num4)+"<br>");
			

			out.println("나머지 : " + (num3%num4));
	 	}
		
	 		

	 	
	 	%>


		
	</div>


	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>