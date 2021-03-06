<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="skillbbs.SkillbbsDAO"%>
<%@ page import="skillbbs.Skillbbs"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--This meta tag defines web pages size that can resize web pages depends on device screen size-->
<meta name="viewport" content="width=device-width" , initial-scale="1">

<!--This link tag make this web site can use bootstrap's css-->
<link rel="stylesheet" href="css/bootstrap-grid.css">
<link rel="stylesheet" href="css/bootstrap-reboot.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<!--This title tag shows us about what kind of website is-->
<title>JSP BBS Project</title>

<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
	span {color: red, text-decoration:underline;
}
}
</style>

</head>

<body>

	<%
		//Bilqess 의 계정과 JUNKUK의 계정만 접속이 가능하도록 계정 식별 함
		String userID = null;
		String mason = "mason";
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		else if (userID != mason) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You don't have permission')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You don't have permission')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}

		//SkillbbsDAO 클래스에 있는 updateBoardCnt메소드 호출	
		SkillbbsDAO skillbbsDAO = new SkillbbsDAO();
		int pageNumber = 1;
		int count = 0;

		count = skillbbsDAO.getCount(pageNumber); // 데이터베이스에 저장된 총 갯수

		if (request.getParameter("pageNumber") != null) {
			//parseInt는 데이터를 Integer type으로 변경해주는 함수 이다. 
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<!--Navigation Bar Section-->
	<nav class="navbar navbar-default">

		<!--Navi Bar Contents Section-->
		<div class="navbar-header">

			<!--This button tag is defined right side line button-->
			<!-- <button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				
				<!--This span tag shows us the line on the line button and I added one more line-->
			<!--<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button> -->

			<!--해당 a태그에 작성된 내용이 네비바 위에 사이트 제목처럼 노출된다
			This a tag show us at Navbar about something contents what we write -->

		</div>

		<!--Navigation Bar Section-->
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link " href="index.jsp">HOME</a>
			</li>
			<%
				if (userID == null) {
			%>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">CONNECT</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="login.jsp">LOGIN</a> <a
						class="dropdown-item" href="join.jsp">JOIN</a>
				</div></li>
			<%
				} else {
			%>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">MY PAGE</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">MY PROFILE</a> <a
						class="dropdown-item" href="logoutAction.jsp">LOGOUT</a>
				</div></li>
			<%
				}
			%>
			<li class="nav-item dropdown active"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">MENU</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="projects.jsp">PROJECTS</a> <a
						class="dropdown-item" href="skillbbs.jsp">TOOLBOX</a> <a
						class="dropdown-item" href="bbjun.jsp">BB&JUN</a> <a
						class="dropdown-item" href="assignments.jsp">ASSIGNMENTS</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Separated link</a>
				</div></li>
		</ul>

		<!--011720201_Mason>> Make this NAV section to commant<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">HOME</a></li>
				<li><a href="projects.jsp"></a></li>
				<li><a href="skillbbs.jsp">Toolbox</a></li>
				<li><a href="assignments.jsp">Assignments</a></li>
			</ul>
			
	//if(userID == null){
			%>
				<ul class="nav navbar-nav navbar-right">
					<!--Create Drop down button on Nav Bar-->
		<!--<li class="dropdown">
						<!--# <= Meaning is No link-->
		<!--<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Connect<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<!--Active : 현제 선택이 되었다.-->
		<!--<li class="active"><a href="index.jsp">login</a></li>
							<li><a href="login.jsp">login</a></li>
							<li><a href="join.jsp">Join</a></li>
						</ul>
					</li>
				</ul>
	//} else {
			%>
				<ul class="nav navbar-nav navbar-right">
					<!--Create Drop down button on Nav Bar-->
		<!--<li class="dropdown">
						<!--# <= Meaning is No link-->
		<!--<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">My page<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<!--Active : 현제 선택이 되었다.-->
		<!--<li class="active"><a href="index.jsp">login</a></li>
							<li><a href="logoutAction.jsp">logOut</a></li>
						</ul>
					</li>
				</ul>
	//}
			%>
			
			
		</div>-->
	</nav>

	<div class="container">
		(총 레코드 수 :
		<%=count%>)

		<!-- striped는 홀수와 짝수가 번갈아가면서 색상이 변경되도록 해주어 가독성을 높여주는 요소 -->
		<div class="row">
			<form method="post" action="skillbbs.jsp?sort_type=searchresult"
				enctype="multipart/from-data">
				<!-- 검색 인자 입력 구간  -->
				<table style="float: right;">
					<tbody>
						<tr>
							<th><select name="search_type">
									<option value="skillbbsTitle">TitleName</option>
									<option value="userID">UserID</option>
									<option value="skillbbsContent">Contents</option>
							</select></th>
							<th><input type="text" name="search_string" size=20></th>
							<th><input type="submit" value="Search"></th>
						</tr>
					</tbody>
				</table>
			</form>
			<table class="table table-striped" style="border: 1px soid #dddddd;">
				<thead>
					<tr>
						<th
							style="background-color: #eeeeee; text-align: center; width: 10%;">번호
							<a href="skillbbs.jsp?sort_type=upnumber">▲</a><a
							href="skillbbs.jsp?sort_type=downnumber">▼</a>
						</th>
						<th
							style="background-color: #eeeeee; text-align: center; width: 50%;">제목
							<a href="skillbbs.jsp?sort_type=uptitle">▲</a><a
							href="skillbbs.jsp?sort_type=downtitle">▼</a>
						</th>
						<th
							style="background-color: #eeeeee; text-align: center; width: 15%;">작성자
							<a href="skillbbs.jsp?sort_type=upname">▲</a><a
							href="skillbbs.jsp?sort_type=downname">▼</a>
						</th>
						<th
							style="background-color: #eeeeee; text-align: center; width: 15%;">작성일
							<a href="skillbbs.jsp?sort_type=update">▲</a><a
							href="skillbbs.jsp?sort_type=downdate">▼</a>
						</th>
						<th
							style="background-color: #eeeeee; text-align: center; width: 10%;">조회수
							<a href="skillbbs.jsp?sort_type=upview">▲</a><a
							href="skillbbs.jsp?sort_type=downview">▼</a>
						</th>
					</tr>
				</thead>
				<tbody>

					<%
						// 전달받은 값 받아오기
						String strSortType = request.getParameter("sort_type");

						String strType = request.getParameter("search_type");
						String strString = request.getParameter("search_string");

						int pageSize = 10; // 한 페이지에 출력할 레코드 수

						// 페이지 링크를 클릭한 번호 / 현재 페이지
						String pageNum = request.getParameter("pageNum");
						if (pageNum == null) { // 클릭한게 없으면 1번 페이지
							pageNum = "1";
						}
						// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
						int currentPage = Integer.parseInt(pageNum);

						// 해당 페이지에서 시작할 레코드 / 마지막 레코드
						int startRow = (currentPage - 1) * pageSize + 1;
						int endRow = currentPage * pageSize;

						if (strSortType == null) {

							ArrayList<Skillbbs> list = skillbbsDAO.getList(pageNumber);

							for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=list.get(i).getSkillbbsID()%>"><%=list.get(i).getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=list.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=list.get(i).getSkillbbsDate().substring(0, 11)
							+ list.get(i).getSkillbbsDate().substring(11, 13) + "시"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + "분"%></td>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsCnt()%></td>
					</tr>
					<%
						}
					%>
					<%
						} else if (strSortType.equals("upnumber")) {

							ArrayList<Skillbbs> listupnumber = skillbbsDAO.getList(pageNumber);

							for (int i = 0; i < listupnumber.size(); i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=listupnumber.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=listupnumber.get(i).getSkillbbsID()%>"><%=listupnumber.get(i).getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=listupnumber.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=listupnumber.get(i).getSkillbbsDate().substring(0, 11)
							+ listupnumber.get(i).getSkillbbsDate().substring(11, 13) + "시"
							+ listupnumber.get(i).getSkillbbsDate().substring(14, 16) + "분"%></td>
						<td style="text-align: center;"><%=listupnumber.get(i).getSkillbbsCnt()%></td>
					</tr>
					<%
						}
					%>

					<%
						} else if (strSortType.equals("downnumber")) {

							ArrayList<Skillbbs> listdownnumber = skillbbsDAO.downgetList(pageNumber);

							for (int i = 0; i < listdownnumber.size(); i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=listdownnumber.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=listdownnumber.get(i).getSkillbbsID()%>"><%=listdownnumber.get(i).getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=listdownnumber.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=listdownnumber.get(i).getSkillbbsDate().substring(0, 11)
							+ listdownnumber.get(i).getSkillbbsDate().substring(11, 13) + "시"
							+ listdownnumber.get(i).getSkillbbsDate().substring(14, 16) + "분"%></td>
						<td style="text-align: center;"><%=listdownnumber.get(i).getSkillbbsCnt()%></td>
					</tr>
					<%
						}
					%>

					<%
						} else if (strSortType.equals("uptitle")) {

							ArrayList<Skillbbs> list = skillbbsDAO.upSkillbbstitle(pageNumber);

							for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=list.get(i).getSkillbbsID()%>"><%=list.get(i).getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=list.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=list.get(i).getSkillbbsDate().substring(0, 11)
							+ list.get(i).getSkillbbsDate().substring(11, 13) + "시"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + "분"%></td>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsCnt()%></td>
					</tr>
					<%
						}
					%>

					<%
						} else if (strSortType.equals("downtitle")) {

							ArrayList<Skillbbs> list = skillbbsDAO.downSkillbbstitle(pageNumber);

							for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=list.get(i).getSkillbbsID()%>"><%=list.get(i).getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=list.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=list.get(i).getSkillbbsDate().substring(0, 11)
							+ list.get(i).getSkillbbsDate().substring(11, 13) + "시"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + "분"%></td>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsCnt()%></td>
					</tr>
					<%
						}
					%>

					<%
						} else if (strSortType.equals("upname")) {

							ArrayList<Skillbbs> list = skillbbsDAO.upuserID(pageNumber);

							for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=list.get(i).getSkillbbsID()%>"><%=list.get(i).getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=list.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=list.get(i).getSkillbbsDate().substring(0, 11)
							+ list.get(i).getSkillbbsDate().substring(11, 13) + "시"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + "분"%></td>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsCnt()%></td>
					</tr>
					<%
						}
					%>

					<%
						} else if (strSortType.equals("downname")) {

							ArrayList<Skillbbs> list = skillbbsDAO.downuserID(pageNumber);

							for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=list.get(i).getSkillbbsID()%>"><%=list.get(i).getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=list.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=list.get(i).getSkillbbsDate().substring(0, 11)
							+ list.get(i).getSkillbbsDate().substring(11, 13) + "시"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + "분"%></td>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsCnt()%></td>
					</tr>
					<%
						}
					%>

					<%
						} else if (strSortType.equals("update")) {

							ArrayList<Skillbbs> list = skillbbsDAO.upskillbbsDate(pageNumber);

							for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=list.get(i).getSkillbbsID()%>"><%=list.get(i).getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=list.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=list.get(i).getSkillbbsDate().substring(0, 11)
							+ list.get(i).getSkillbbsDate().substring(11, 13) + "시"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + "분"%></td>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsCnt()%></td>
					</tr>
					<%
						}
					%>

					<%
						} else if (strSortType.equals("downdate")) {

							ArrayList<Skillbbs> list = skillbbsDAO.downskillbbsDate(pageNumber);

							for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=list.get(i).getSkillbbsID()%>"><%=list.get(i).getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=list.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=list.get(i).getSkillbbsDate().substring(0, 11)
							+ list.get(i).getSkillbbsDate().substring(11, 13) + "시"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + "분"%></td>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsCnt()%></td>
					</tr>
					<%
						}
					%>

					<%
						} else if (strSortType.equals("upview")) {

							ArrayList<Skillbbs> list = skillbbsDAO.upskillbbsCnt(pageNumber);

							for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=list.get(i).getSkillbbsID()%>"><%=list.get(i).getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=list.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=list.get(i).getSkillbbsDate().substring(0, 11)
							+ list.get(i).getSkillbbsDate().substring(11, 13) + "시"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + "분"%></td>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsCnt()%></td>
					</tr>
					<%
						}
					%>

					<%
						} else if (strSortType.equals("downview")) {

							ArrayList<Skillbbs> list = skillbbsDAO.downskillbbsCnt(pageNumber);

							for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=list.get(i).getSkillbbsID()%>"><%=list.get(i).getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=list.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=list.get(i).getSkillbbsDate().substring(0, 11)
							+ list.get(i).getSkillbbsDate().substring(11, 13) + "시"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + "분"%></td>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsCnt()%></td>
					</tr>
					<%
						}
					%>

					<%
						} else if (strSortType.equals("searchresult")) {

							ArrayList<Skillbbs> list = skillbbsDAO.searchresultlist(pageNumber, strType, strString);

							for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리 strContent = strContent.replaceAll("세션","<span style='color:blue;'>세션</span>");  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=list.get(i).getSkillbbsID()%>"><%=list.get(i).getSkillbbsTitle().replaceAll(strString,
							"<span style='color:red;'>" + strString + "</span>")%></a>
							<!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=list.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=list.get(i).getSkillbbsDate().substring(0, 11)
							+ list.get(i).getSkillbbsDate().substring(11, 13) + "시"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + "분"%></td>
						<td style="text-align: center;"><%=list.get(i).getSkillbbsCnt()%></td>
					</tr>
					<%
						}
					%>

					<%
						}
					%>

				</tbody>

			</table>
			<a href="skillbbs.jsp?pageNumber=<%=pageNumber = 1%>"
				class="btn btn-success btn-arrow-left">First</a>
			<%
				// 페이징  처리
				if (count > 0) {
					// 총 페이지의 수
					int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
					// 한 페이지에 보여줄 페이지 블럭(링크) 수
					int pageBlock = 10;
					// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
					int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
					int endPage = startPage + pageBlock - 1;

					// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
					if (endPage > pageCount) {
						endPage = pageCount;
					}

					if (startPage > pageBlock) { // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
			%>
			<a href="skillbbs.jsp?pageNumber=<%=startPage - 10%>"
				class="btn btn-success btn-arrow-left">[이전]</a>
			<%
				}

					for (int i = startPage; i <= endPage; i++) { // 페이지 블록 번호
						if (i == currentPage) { // 첫번째 패이지
			%>
			<a href="skillbbs.jsp?pageNumber=<%=i%>"
				class="btn btn-success btn-arrow-left">[<%=i%>]
			</a>
			<%
				} else { // 현재 페이지가 아닌 경우 링크 설정
			%>
			<a href="skillbbs.jsp?pageNumber=<%=i%>"
				class="btn btn-success btn-arrow-left">[<%=i%>]
			</a>
			<%
				}
					} // for end

					if (endPage < pageCount) { // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
			%>
			<a href="skillbbs.jsp?pageNumber=<%=startPage + 10%>"
				class="btn btn-success btn-arrow-left">[다음]</a>
			<%
				}
				}
			%>
			<a href="skillbbs.jsp?pageNumber=<%=pageNumber = 4%>"
				class="btn btn-success btn-arrow-left">Last</a> <a href="write.jsp"
				class="btn btn-primary pull-right">Write</a>
		</div>
	</div>



	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>