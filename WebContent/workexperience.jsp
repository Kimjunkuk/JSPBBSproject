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
		<li class="nav-item"><a class="nav-link" href="#">MY PROFILE</a></li>
		<li class="nav-item"><a class="nav-link" href="#">LOGOUT</a></li>

		<%
			}
		%>
	</ul>

	<table
		style="margin-top: 50px; max-width: 600px; align: center; margin-left: auto; margin-right: auto;">
		<tr style="vertical-align: top;">
			<td
				style="border-top: 3px solid white; border-bottom: 3px solid white;">
				<div class="col ">
					<div class="card mb-3 p-3 mb-2 bg-dark text-white">
						<a href="https://www.sistarcosmetics.com/"><img
							src="..\img\sistarweb.JPG" class="card-img-top" alt="..."></a>
						<div class="card-body">
							<a href="https://www.sistarcosmetics.com/"><h5
									class="card-title">SistarCosmetics</h5></a>
							<p class="card-text">Platform: Shopify</p>
							<p class="card-text">Language: Rubby, Liquid</p>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr class="justify-content-center"
			style="border-bottom: 3px solid white;">
			<td>
				<div class="col">
					<div class="card mb-3 p-3 mb-2 bg-dark text-white">
						<img src="..\img\smbeauty.JPG" class="card-img-top" alt="...">
						<div class="card-body">
							<a href="https://smbeautyusa.com/"><h5 class="card-title">SMBeauty
									USA</h5></a>
							<p class="card-text">Platform: Shopify</p>
							<p class="card-text">Language: Rubby, Liquid</p>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr class="justify-content-center"
			style="border-bottom: 3px solid white;">
			<td>
				<div class="col">
					<div class="card mb-3 p-3 mb-2 bg-dark text-white">
						<img src="..\img\smbeautyad.JPG" class="card-img-top" alt="...">
						<div class="card-body">
							<a
								href="https://play.google.com/store/apps/details?id=com.smusacosmetics.mason.smbeautyusa"><h5
									class="card-title">SMBeauty USA Android APP</h5></a>
							<p class="card-text">Web APP</p>
							<p class="card-text">Create the Web APP & Deploy</p>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr class="justify-content-center"
			style="border-bottom: 3px solid white;">
			<td>
				<div class="col">
					<div class="card mb-3 p-3 mb-2 bg-dark text-white">
						<img src="..\img\saplaya.JPG" class="card-img-top" alt="...">
						<div class="card-body">
							<a href="https://saplayaskincare.com/"><h5 class="card-title">Saplaya
									Skincare</h5></a>
							<p class="card-text">Platform: Shopify</p>
							<p class="card-text">Language: Rubby, Liquid</p>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr class="justify-content-center"
			style="border-bottom: 3px solid white;">
			<td>
				<div class="col">
					<div class="card mb-3 p-3 mb-2 bg-dark text-white">
						<img src="..\img\sistarbeautyweb.JPG" class="card-img-top"
							alt="...">
						<div class="card-body">
							<a href="https://sistarbeauty.com/"><h5 class="card-title">SistarBeauty</h5></a>
							<p class="card-text">Platform: Shopify</p>
							<p class="card-text">Language: Rubby, Liquid</p>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr class="justify-content-center"
			style="border-bottom: 3px solid white;">
			<td>
				<div class="col">
					<div class="card mb-3 p-3 mb-2 bg-dark text-white">
						<img src="..\img\sistarbeautyapp.JPG" class="card-img-top"
							alt="...">
						<div class="card-body">
							<a
								href="https://play.google.com/store/apps/details?id=com.smusacosmetics.mason.smbeautypickupcopy"><h5
									class="card-title">SistarBeautyPickup Android APP</h5></a>
							<p class="card-text">Web APP</p>
							<p class="card-text">Create the Web APP & Deploy</p>
						</div>
					</div>
				</div>
			</td>
		</tr>

	</table>


</body>
</html>