<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="skillbbs.Skillbbs"%>
<%@ page import="skillbbs.SkillbbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--This meta tag defines web pages size that can resize web pages depends on device screen size-->
 <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">

<!--This link tag make this web site can use bootstrap's css-->
<link rel="stylesheet" href="css/bootstrap.css">

<!--This title tag shows us about what kind of website is-->
<title>MasonLAB</title>

</head>

<body class="p-3 mb-2 bg-dark text-white">

	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int skillbbsID = 0;

		//sillbbsID가 존재한다면 아래 실행
		if (request.getParameter("skillbbsID") != null) {
			skillbbsID = Integer.parseInt(request.getParameter("skillbbsID"));
		}
		if (skillbbsID == 0) {
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
	<div>
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="index.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="projects.jsp">Projects</a></li>
			<li class="nav-item"><a class="nav-link"
				href="workexperience.jsp">WorkExperiencee</a></li>
			<li class="nav-item"><a class="nav-link" href="assignments.jsp">Assignments</a></li>
			<%
				if (userID == null) {
			%>
			<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="join.jsp">Join</a>
			</li>
			<!-- <li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">CONNECT</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="login.jsp">LOGIN</a> <a
						class="dropdown-item" href="join.jsp">JOIN</a>
				</div></li> -->
			<%
				} else {
			%>
			<li class="nav-item"><a class="nav-link" href="#">MyProfile</a></li>
			<li class="nav-item"><a class="nav-link" href="logoutAction.jsp">Logout</a></li>

			<%
				}
			%>
		</ul>
	</div>


	<div class="container p-3 mb-2 bg-dark text-white"
		style="display: flex; justify-content: center; align-items: center; margin-top: 0; padding-top: 0;">

		<!-- striped는 홍수와 짝수가 번갈아가면서 색상이 변경되도록 해주어 가독성을 높여주는 요소  colspan="2" -->
		<div style="width: 100%">

			<table class="table table-striped p-3 mb-2 bg-dark text-white"
				style="border: 1px solid #dddddd">
				<thead>
					<tr>
						<!-- colspan : 열의 개수를 지정한다 -->
						<th style="background-color: #eeeeee; text-align: center;">ToolBoxContent</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: left;">
						Title: <%=skillbbs.getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%>
						<br>User:<%=skillbbs.getUserID()%>
						<br>Date:<%=skillbbs.getSkillbbsDate().substring(0, 11) + skillbbs.getSkillbbsDate().substring(11, 13) + ":" + skillbbs.getSkillbbsDate().substring(14, 16) + ""%>
						<br>View:<%=skillbbs.getSkillbbsCnt()%>
						</td>
					<!--  <tr>
						<td style="text-align: center;">Content</td>

					</tr>-->
					<tr>
						<!-- .replaceAll(" ","&nbsp;") 통해 공백 표현, 이후 특수문자까지 치환 처리함 아울러 해당 기능을 구현함으로서 악성 스크립트 공격으로 부터 방어할 수 있다 (크로스사이트 스크립트 공격) -->
						<td style="height: 200px; text-align: left;"><%=skillbbs.getSkillbbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
					.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
					</tr>
				</tbody>
			</table>
			<a href="index.jsp">[List]</a>
			<%
				//본인이면 글을 수정할 수 있도록 구성
				if (userID != null && userID.equals(skillbbs.getUserID())) {
			%>
			<a href="update.jsp?skillbbsID=<%=skillbbsID%>">[Update]</a> <a
				onclick="return confirm('Really? Do you wanna delete it? Are you serious? ')"
				href="deleteAction.jsp?skillbbsID=<%=skillbbsID%>">[Delete]</a>
			<%
				}
			%>
			<a href="write.jsp">[Write]</a>
			<!-- <input type="submit" value="[write]"> -->

		</div>
	</div>



	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>