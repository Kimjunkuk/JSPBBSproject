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

<body class="p-3 mb-2 bg-dark text-white">

	<div class="p-3 mb-2 bg-dark text-white">

		<%
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
		%>


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

	<div style="width: 600px; float: center;">
		<input type='button' value='Assignment ex1'
			style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex1.jsp'" /> <input type='button'
			value='Assignment ex2' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex2.jsp'" /> <input type='button'
			value='Assignment ex3' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex3.jsp'" /> <input type='button'
			value='Assignment ex4' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex4.jsp'" /> <input type='button'
			value='Assignment ex5' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex5.jsp'" /> <input type='button'
			value='Assignment ex6' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex6.jsp'" /> <input type='button'
			value='Assignment ex7' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex7.jsp'" /> <input type='button'
			value='Assignment ex8' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex8.jsp'" /> <input type='button'
			value='Assignment ex9' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex9.jsp'" /> <input type='button'
			value='Assignment ex10' style='width: 100%; margin-bottom: 10px;'
			onclick="location.href='ex10.jsp'" /> <input type='button'
			value='Assignment ex11' style='width: 100%;'
			onclick="location.href='ex11.jsp'" />
	</div>

	<div
		style="margin-left: 30px; margin-right: 30px; margin-bottom: 60px; margin-top: 60px;">
		<!-- 01172021_Mason>> About Mason section begin from here -->
		<div class="card-deck" style="color: black;">
			<div class="card border-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">Assignment ex1</div>
				<div class="card-body text-dark">
					<a href="ex1.jsp"><h5 class="card-title">Assignment ex1</h5></a>
					<p class="card-text">JSP Basic</p>
				</div>
			</div>
			<div class="card border-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">Assignment ex2</div>
				<div class="card-body text-dark">
					<a href="ex2.jsp"><h5 class="card-title">Assignment ex2</h5></a>
					<p class="card-text">JSP Basic</p>
				</div>
			</div>
			<div class="card border-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">Assignment ex3</div>
				<div class="card-body text-dark">
					<a href="ex3.jsp"><h5 class="card-title">Assignment ex3</h5></a>
					<p class="card-text">JSP Basic</p>
				</div>
			</div>
		</div>
	</div>
	<div
		style="margin-left: 30px; margin-right: 30px; margin-bottom: 60px; margin-top: 60px;">
		<!-- 01172021_Mason>> About Mason section begin from here -->
		<div class="card-deck" style="color: black;">
			<div class="card border-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">Assignment ex4</div>
				<div class="card-body text-dark">
					<a href="ex4.jsp"><h5 class="card-title">Assignment ex4</h5></a>
					<p class="card-text">JSP Basic</p>
				</div>
			</div>
			<div class="card border-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">Assignment ex5</div>
				<div class="card-body text-dark">
					<a href="ex5.jsp"><h5 class="card-title">Assignment ex5</h5></a>
					<p class="card-text">JSP Basic</p>
				</div>
			</div>
			<div class="card border-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">Assignment ex6</div>
				<div class="card-body text-dark">
					<a href="ex6.jsp"><h5 class="card-title">Assignment ex6</h5></a>
					<p class="card-text">JSP Basic</p>
				</div>
			</div>
		</div>
	</div>
	<div
		style="margin-left: 30px; margin-right: 30px; margin-bottom: 60px; margin-top: 60px;">
		<!-- 01172021_Mason>> About Mason section begin from here -->
		<div class="card-deck" style="color: black;">
			<div class="card border-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">Assignment ex7</div>
				<div class="card-body text-dark">
					<a href="ex7.jsp"><h5 class="card-title">Assignment ex7</h5></a>
					<p class="card-text">JSP Basic</p>
				</div>
			</div>
			<div class="card border-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">Assignment ex8</div>
				<div class="card-body text-dark">
					<a href="ex8.jsp"><h5 class="card-title">Assignment
							ex8</h5></a>
					<p class="card-text">JSP Basic</p>
				</div>
			</div>
			<div class="card border-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">Assignment ex9</div>
				<div class="card-body text-dark">
					<a href="ex9.jsp"><h5 class="card-title">Assignment
							ex9</h5></a>
					<p class="card-text">JSP Basic</p>
				</div>
			</div>
		</div>
	</div>
	<div
		style="margin-left: 30px; margin-right: 30px; margin-bottom: 60px; margin-top: 60px;">
		<!-- 01172021_Mason>> About Mason section begin from here -->
		<div class="card-deck" style="color: black;">
			<div class="card border-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">Assignment ex10</div>
				<div class="card-body text-dark">
					<a href="ex10.jsp"><h5 class="card-title">Assignment ex10</h5></a>
					<p class="card-text">JSP Basic</p>
				</div>
			</div>
			<div class="card border-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">Assignment ex11</div>
				<div class="card-body text-dark">
					<a href="Assignment ex11"><h5 class="card-title">Assignment
							ex11</h5></a>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
			</div>
			<div class="card border-dark mb-3" style="max-width: 18rem;">
				<div class="card-header">Assignment ex12</div>
				<div class="card-body text-dark">
					<h5 class="card-title">Dark card title</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
			</div>
		</div>
	</div>






	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>