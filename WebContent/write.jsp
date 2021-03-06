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
<link rel="stylesheet" href="css/bootstrap.css">

<!--This title tag shows us about what kind of website is-->
<title>MasonLAB</title>

</head>

<body class="p-3 mb-2 bg-dark text-white">

	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>

	<!--Navigation Bar Section-->
	<!-- <nav class="navbar navbar-default">

		<!--Navi Bar Contents Section-->
	<!--<div class="navbar-header">

			<!--This button tag is defined right side line button-->
	<!--<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				
				<!--This span tag shows us the line on the line button and I added one more line-->
	<!--<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

			<!--해당 a태그에 작성된 내용이 네비바 위에 사이트 제목처럼 노출된다
			This a tag show us at Navbar about something contents what we write -->
	<!--<a class="navbar-brand" href="index.jsp">JSP BBS Project_MasonKim</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">main</a></li>
				<li><a href="http://masonlaboratory.com/">MasonLAB</a></li>
				<li><a href="skillbbs.jsp">Skills Inventory</a></li>
				<li><a href="assignments.jsp">Assignments</a></li>
			</ul>
			
			//if(userID == null){
			//		//%>
				<ul class="nav navbar-nav navbar-right">
					<!--Create Drop down button on Nav Bar-->
	<!--<li class="dropdown">
						<!--# <= Meaning is No link-->
	<!--<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Connect<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<!--Active : 현제 선택이 되었다.-->
	<!--<li class="active"><a href="index.jsp">login</a></li>-->
	<!--<li><a href="login.jsp">login</a></li>
							<li><a href="join.jsp">Join</a></li>
						</ul>
					</li>
				</ul>
			//} else {
			//		//%>
				<ul class="nav navbar-nav navbar-right">
					<!--Create Drop down button on Nav Bar-->
	<!--<li class="dropdown">
						<!--# <= Meaning is No link-->
	<!--<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">My page<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<!--Active : 현제 선택이 되었다.-->
	<!--<li class="active"><a href="index.jsp">login</a></li>-->
	<!--<li><a href="logoutAction.jsp">logOut</a></li>
						</ul>
					</li>
				</ul>
			//}
			//		//%>
			
			
		</div>
	</nav> -->
	<div>
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="index.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="projects.jsp">Projects</a></li>
			<li class="nav-item"><a class="nav-link"
				href="workexperience.jsp">WorkExperience</a></li>
			<li class="nav-item"><a class="nav-link" href="assignments.jsp">Assignments</a></li>
			<%
				if (userID == null) {
			%>
			<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="join.jsp">Join</a>
			</li>
			<!-- <li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">CONNECT</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="login.jsp">LOGIN</a> <a
						class="dropdown-item" href="join.jsp">JOIN</a>
				</div></li> -->
			<%
				} else {
			%>
			<li class="nav-item"><a class="nav-link" href="#">MyProfile</a></li>
			<li class="nav-item"><a class="nav-link" href="logoutAction.jsp">Logout</a></li>

			<%
				}
			%>
		</ul>
	</div>


	<div class="container p-3 mb-2 bg-dark text-white"
		style="display: flex; justify-content: center; align-items: center; margin-top: 0; padding-top: 0;">

		<!-- striped는 홍수와 짝수가 번갈아가면서 색상이 변경되도록 해주어 가독성을 높여주는 요소 -->
		<div style="width: 100%">
			<form method="post" action="writeAction.jsp"
				enctype="multipart/from-data">
				<!-- writeAction페이지로 데이터 송부 + multipart/from-data : multipart클래스와 매칭 되는 타입-->
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd;">
					<thead>
						<tr>
							<!-- colspan : 열의 개수를 지정한다 -->
							<th style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="skillbbsTitle" maxlength="200"></input></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="skillbbsContent" maxlength="4096" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right"
					value="write">
			</form>
		</div>
	</div>



	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>