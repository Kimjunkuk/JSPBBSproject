<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.io.PrintWriter" %>

<%@ page import="skillbbs.SkillbbsDAO" %>
<%@ page import="skillbbs.Skillbbs" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--This meta tag defines web pages size that can resize web pages depends on device screen size-->
<meta name="viewport" content="width=device-width", initial-scale="1">

<!--This link tag make this web site can use bootstrap's css-->
<link rel="stylesheet" href="css/bootstrap.css">

<!--This title tag shows us about what kind of website is-->
<title>JSP BBS Project</title>

<style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
</style>

</head>

<body> 

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		
		int pageNumber  = 1;
		
		if (request.getParameter("pageNumber") != null){
			//parseInt는 데이터를 Integer type으로 변경해주는 함수 이다. 
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	
	%>

	<!--Navigation Bar Section-->
	<nav class="navbar navbar-default">

		<!--Navi Bar Contents Section-->
		<div class="navbar-header">

			<!--This button tag is defined right side line button-->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				
				<!--This span tag shows us the line on the line button and I added one more line-->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

			<!--해당 a태그에 작성된 내용이 네비바 위에 사이트 제목처럼 노출된다
			This a tag show us at Navbar about something contents what we write -->
			<a class="navbar-brand" href="index.jsp">JSP BBS Project_MasonKim</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">main</a></li>
				<li><a href="http://masonlaboratory.com/">MasonLAB</a></li>
				<li class="active"><a href="skillbbs.jsp">Skills Inventory</a></li>
				<li><a href="assignments.jsp">Assignments</a></li>
			</ul>
			
			<%
				if(userID == null){
			%>
				<ul class="nav navbar-nav navbar-right">
					<!--Create Drop down button on Nav Bar-->
					<li class="dropdown">
						<!--# <= Meaning is No link-->
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Connect<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<!--Active : 현제 선택이 되었다.-->
							<!--<li class="active"><a href="index.jsp">login</a></li>-->
							<li><a href="login.jsp">login</a></li>
							<li><a href="join.jsp">Join</a></li>
						</ul>
					</li>
				</ul>
			<% 
				} else {
			%>
				<ul class="nav navbar-nav navbar-right">
					<!--Create Drop down button on Nav Bar-->
					<li class="dropdown">
						<!--# <= Meaning is No link-->
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">My page<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<!--Active : 현제 선택이 되었다.-->
							<!--<li class="active"><a href="index.jsp">login</a></li>-->
							<li><a href="logoutAction.jsp">logOut</a></li>
						</ul>
					</li>
				</ul>
			<%
				}
			%>
			
			
		</div>
	</nav>
	
	<div class="container">
	
		<!-- striped는 홍수와 짝수가 번갈아가면서 색상이 변경되도록 해주어 가독성을 높여주는 요소 -->
		<div class="row">
			<table class="table table-striped" style=" border: 1px soid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				
					<%
						SkillbbsDAO skillbbsDAO = new SkillbbsDAO();
						ArrayList<Skillbbs> list = skillbbsDAO.getList(pageNumber);
						for(int i = 0; i<list.size(); i++){
					%>
						<tr>
							<td style="text-align: center;"><%= list.get(i).getSkillbbsID() %></td>
							
							<td><a href="view.jsp?skillbbsID=<%= list.get(i).getSkillbbsID() %>"><%= list.get(i).getSkillbbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a><!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
							<td style="text-align: center;"><%= list.get(i).getUserID() %></td>
							
							<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
							<td style="text-align: center;"><%= list.get(i).getSkillbbsDate().substring(0, 11) + list.get(i).getSkillbbsDate().substring(11, 13) + "시"  + list.get(i).getSkillbbsDate().substring(14, 16) + "분" %></td>
						</tr>	
					<% 
						}
					%>

				</tbody>
			
			</table>
			
			<% 
				if(pageNumber != 1){					
			%>
			    <!-- 페이지넘버 변수에 담긴 값에서 1을 뺀 값만큼 페이지 이동  -->
				<a href="skillbbs.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arrow-left">Previous</a>
			<%
				} if(skillbbsDAO.nextPage(pageNumber + 1)){
					//다음페이지가 존재 한다면 
			%>
				<a href="skillbbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">Next</a>
			<%
				}
			%>
						
			<a href="write.jsp" class="btn btn-primary pull-right">Write</a>
		</div>
	</div>



	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>