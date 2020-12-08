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
		<h3>Select Sites.</h3>

		<%
		String strSite = request.getParameter("siteName");
		
		if(strSite.equals("apple")){
			response.sendRedirect("http://www.apple.com");
		}
		else if(strSite.equals("microsoft")){
			response.sendRedirect("http://www.microsoft.com");
		}
		else if(strSite.equals("google")){
			response.sendRedirect("http://www.google.com");
		}
		else if(strSite.equals("MasonLAB")){
			response.sendRedirect("http://masonlaboratory.com/");
		}
		else if(strSite.equals("SMBeautyUSA")){
			response.sendRedirect("https://smbeautyusa.com/");
		}
		else{
			response.sendRedirect("https://www.sistarcosmetics.com/");
		}
		%>

	</div>



	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>