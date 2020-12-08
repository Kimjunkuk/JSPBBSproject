<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.io.PrintWriter" %>
<%@ page import="skillbbs.Skillbbs" %>
<%@ page import="skillbbs.SkillbbsDAO" %>
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

</head>

<body> 

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int skillbbsID = 0;
		
		//sillbbsID가 존재한다면 아래 실행
		if(request.getParameter("skillbbsID") != null){
			skillbbsID = Integer.parseInt(request.getParameter("skillbbsID"));
		}
		if(skillbbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('This article is not valid.')");
			script.println("location.href = 'skillbbs.jsp'");
			script.println("</script>");
		}
		
		//해당글의 구체적인 내용 가져오기
		Skillbbs skillbbs = new SkillbbsDAO().getSkillbbs(skillbbsID);
        SkillbbsDAO skillbbsDAO = new SkillbbsDAO();
        skillbbsDAO.updateBoardCnt(skillbbsID);

	
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
				<li><a href="skillbbs.jsp">Skills Inventory</a></li>
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

			<table class="table table-striped"
				style=" border: 1px solid #dddddd">
				<thead>
					<tr>
						<!-- colspan : 열의 개수를 지정한다 -->
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">게시판
							글쓰기 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style=" text-align: center;">글 제목</td>
						<td colspan="2" style="text-align: left;"><%= skillbbs.getSkillbbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
					<tr>
						<td style=" text-align: center;">작성자</td>
						<td colspan="2" style="text-align: left;"><%=skillbbs.getUserID()%></td>
					</tr>
					<tr>
						<td style="text-align: center;">작성 일자</td>
						<td colspan="2" style="text-align: left;"><%= skillbbs.getSkillbbsDate().substring(0, 11) + skillbbs.getSkillbbsDate().substring(11, 13) + "시"  + skillbbs.getSkillbbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<tr>
						<td style="text-align: center;">조회수</td>
						<td colspan="2" style="text-align: left;"><%= skillbbs.getSkillbbsCnt() %></td>
					</tr>
					<tr>
						<td style="text-align: center;">내용</td> 
						<!-- .replaceAll(" ","&nbsp;") 통해 공백 표현, 이후 특수문자까지 치환 처리함 아울러 해당 기능을 구현함으로서 악성 스크립트 공격으로 부터 방어할 수 있다 (크로스사이트 스크립트 공격) -->
						<td colspan="2" style="height: 200px; text-align: left;"><%=skillbbs.getSkillbbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="skillbbs.jsp" class="btn btn-primary">List</a>
			<%
				//본인이면 글을 수정할 수 있도록 구성
				if(userID != null && userID.equals(skillbbs.getUserID())){			
			%> 
					<a href="update.jsp?skillbbsID=<%= skillbbsID %>" class="btn btn-primary">Update</a>
					<a onclick="return confirm('Really? Do you wanna delete it? Are you serious? ')" href="deleteAction.jsp?skillbbsID=<%= skillbbsID %>" class="btn btn-primary">Delete</a>
			<%
				}
			%>
			
			<input type="submit" class="btn btn-primary pull-right" value="write">

		</div>
	</div>



	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>