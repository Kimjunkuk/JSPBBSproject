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
<title>예제9 - 김준국</title>

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
		<h3>폼을 이용한 데이터 입력 예제2.</h3>

		<form action="ex9Action.jsp" method="post">
			Name : <input type="text" name="userName" size=10><p>
				Address : <input type="text" name="userAddress" size=30><p>

				Favorite animal : 
				<input type="checkbox" name="userPets" value="dog">강아지
				<input type="checkbox" name="userPets" value="cat">고양이 
				<input type="checkbox" name="userPets" value="pig">돼지<p>
				<input type="submit" value="전송"> <input type="reset" value="재작성">
		</form>

	</div>



	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>