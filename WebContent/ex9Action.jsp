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
<title>예제9 출력- 김준국</title>

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
		<input type='button' value='Back' onclick="location.href='assignments.jsp'" />
		<h3>ex9페이지로 부터 Request 객체로 받은 값을 화면에 출력합니다.</h3>

		<%
			String strName = request.getParameter("userName");
			String strAddress = request.getParameter("userAddress");
			String[] strPets = request.getParameterValues("userPets");

			out.println("이름은" + strName + "입니다.<br>");
			out.println("주소는" + strAddress + "입니다.<br>");

			if (strPets != null) {
				for (int i = 0; i < strPets.length; i++) {
					out.println("선택한 동물은" + strPets[i] + "입니다.<br>");
				}
			} else {
				out.println("선택한 동물이 없습니다. <br>");
			}
		%>


	</div>


	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>