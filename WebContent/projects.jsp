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
	<ul class="nav justify-content-center">
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="index.jsp">Home</a></li>
		<li class="nav-item"><a class="nav-link" href="projects.jsp">Projects</a></li>
		<li class="nav-item"><a class="nav-link"
			href="workexperience.jsp">WorkExperiencee</a></li>
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


	<table 
		style="margin-top: 50px; align: center; margin-left: auto; margin-right: auto; max-width: 600px;">
		<tr>
			<td
				style="border-top: 3px solid white; border-bottom: 3px solid white; ">
				<div class="col ">
					<div class="card mb-3 p-3 mb-2 bg-dark text-white">
						<a href="http://masonlaboratory.com/index.jsp"><img
							src="..\img\masonlab2.JPG" class="card-img-top" alt="..."></a>
						<div class="card-body">
							<a href="http://masonlaboratory.com/index.jsp"><h5
									class="card-title">MasonLAB Personal Website</h5></a>
							<p class="card-text">Server: Tomcat V9</p>
							<p class="card-text">Hosting: Personal Hosting</p>
							<p class="card-text">Language: Java, HTML, CSS, JS</p>
							<p class="card-text">Github:</p>
							<a href="https://github.com/Kimjunkuk/JSPBBSproject">https://github.com/Kimjunkuk/JSPBBSproject</a>
						</div>
					</div>
				</div>
			</td>
		</tr>


	</table>

</body>
</html>