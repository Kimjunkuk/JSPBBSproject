<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("euc-kr"); %>
	
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--This meta tag defines web pages size that can resize web pages depends on device screen size-->
<meta name="viewport" content="width=device-width", initial-scale="1">

<!--This link tag make this web site can use bootstrap's css-->
<!--  <link rel="stylesheet" href="css/bootstrap.css">-->

<!--This title tag shows us about what kind of website is-->
<title>예제10 - 김준국</title>

<style>
  table {
    padding:5px;
    margin-left:15px;
    border: 1px solid #444444;
    
  }

  td {
    padding:5px;
    border: 1px solid #444444;
  }


</style>

</head>

<body>
	<div>
		<input type='button' value='Back'onclick="location.href='assignments.jsp'" />
		<h3>Select Sites</h3>

		<form action="ex10Action.jsp" method="get">
			<select name="siteName">
				<option value="apple">apple</option>
				<option value="microsoft">microsoft</option>
				<option value="google">google</option>
				<option value="MasonLAB">MasonLAB</option>
				<option value="SMBeautyUSA">SMBeautyUSA</option>
				<option value="SistarCosmetics">Sistarcosmetics</option>
			</select>
			<input type="submit" value="move">
		</form>

	</div>



	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>