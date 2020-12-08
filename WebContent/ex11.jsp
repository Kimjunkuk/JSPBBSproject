<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
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
<title>예제11 - 김준국</title>

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

		10개의 정수값을 입력하시오<br>
		<%
		//크기가 10인 정수형 배열 int_array선언
		int[] int_array = new int[10];
		int int_sum=0;
		int_array[0] = 11;
		int_array[1] = 12;
		int_array[2] = 33;
		int_array[3] = 94;
		int_array[4] = 75;
		int_array[5] = 46;
		int_array[6] = 37;
		int_array[7] = 48;
		int_array[8] = 59;
		int_array[9] = 10;
		
		for(int j=0; j<=9; j++){
			out.println("배열 int_array"+j+"번째 원소는 : "+int_array[j]+"입니다<br>");
			int_sum = int_sum + int_array[j];
		}
		
		out.println("배열 int_array의 총 합은"+int_sum+"입니다<br>");
		
		%>

	</div>



	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>