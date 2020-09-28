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
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You have to login first!')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		int skillbbsID = 0;
		//sillbbsID의 내용이 존재하는지 확인 만약 존재한다면 아래 실행(계정 로그인이 되어 있는지 확인)
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
		
		Skillbbs skillbbs = new SkillbbsDAO().getSkillbbs(skillbbsID);
		
		if(!userID.equals(skillbbs.getUserID())){
			//세션의 있는 값과 이글을 작성한 사람이 맞는지 검토
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You don't have Permission')");
			script.println("location.href = 'skillbbs.jsp'");
			script.println("</script>");
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
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">main</a></li>
				<li><a href="http://masonlaboratory.com/">MasonLAB</a></li>
				<li class="active"><a href="skillbbs.jsp">Skills Inventory</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<!--Create Drop down button on Nav Bar-->
				<li class="dropdown">
					<!--# <= Meaning is No link--> <a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">My page<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<!--Active : 현제 선택이 되었다.-->
						<!--<li class="active"><a href="index.jsp">login</a></li>-->
						<li><a href="logoutAction.jsp">logOut</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
	
		<!-- striped는 홍수와 짝수가 번갈아가면서 색상이 변경되도록 해주어 가독성을 높여주는 요소 -->
		<div class="row">
			<form method="post" action="updateAction.jsp?skillbbsID=<%= skillbbsID %>"><!-- updateAction페이지로 데이터 송부 -->
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<!-- colspan : 열의 개수를 지정한다 -->
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><!-- updataAction페이지의 매개변수값으로 넘어간다 --><input type="text" class="form-control" placeholder="글 제목" name="skillbbsTitle" maxlength="50" value="<%= skillbbs.getSkillbbsTitle() %>"><!-- skillbbs.getSkillbbsTitle()를 통해 수정전 내용 확인 할 수 있도록 함 --></input></td>
						</tr>
						<tr>
							<td><!-- updataAction페이지의 매개변수값으로 넘어간다 --><textarea class="form-control" placeholder="글 내용" name="skillbbsContent" maxlength="2048" style="height:350px;"><%= skillbbs.getSkillbbsContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="Update">
			</form>
		</div>
	</div>



	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>