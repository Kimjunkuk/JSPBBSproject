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
<title>예제8 - 김준국</title>

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
	<input type='button' value='Back' onclick="location.href='assignments.jsp'"/>
		<h3>Request 객체를 사용하여 클라이언트 및 서버의 정보를 읽어 옵니다.</h3>

		클라이언트 IP :
		<%=request.getRemoteAddr()%><br> 요청정보 길이 :
		<%=request.getContentLength()%><br> 요청정보 인코딩 :
		<%=request.getCharacterEncoding()%><br> 요청정보 콘텐츠 타입 :
		<%=request.getContentLength()%><br> 요청정보 프로토콜 :
		<%=request.getProtocol()%><br> 요청정보 전송방식 :
		<%=request.getMethod()%><br> 요청 URI :
		<%=request.getRequestURI()%><br> 컨텍스트 경로 :
		<%=request.getContextPath()%><br> 서버 이름 :
		<%=request.getServerName()%><br>

	</div>



	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>