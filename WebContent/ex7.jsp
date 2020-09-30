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
<!--  <link rel="stylesheet" href="css/bootstrap.css">-->

<!--This title tag shows us about what kind of website is-->
<title>문제7 - 김준국</title>

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

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	
	%>

	<div>
		<input type='button' value='Back' onclick="location.href='assignments.jsp'"/>
		<h3>연습문제 7번입니다.</h3><br>

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
		
		 %>

		<table	>

			<%
				for (int i = 0; i <= 3; i++) {
			%>
			<tr>
				<%
					for (int j = 0; j <= 2; j++) {
				%>
				<td align=center><%=strPerson[i][j]%></td>

				<%
					}
				%>
			</tr>

			<%
				}
			%>

		</table>

	</div>
	









	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>