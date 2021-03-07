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
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--This link tag make this web site can use bootstrap's css-->
<link rel="stylesheet" href="css/bootstrap-grid.css">
<link rel="stylesheet" href="css/bootstrap-reboot.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['gauge']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Label', 'Value'],
          ['Memory', 80],
          ['CPU', 55],
          ['Network', 68]
        ]);

        var options = {
          width: 400, height: 120,
          redFrom: 90, redTo: 100,
          yellowFrom:75, yellowTo: 90,
          minorTicks: 5
        };

        var chart = new google.visualization.Gauge(document.getElementById('chart_div'));

        chart.draw(data, options);

        setInterval(function() {
          data.setValue(0, 1, 40 + Math.round(60 * Math.random()));
          chart.draw(data, options);
        }, 13000);
        setInterval(function() {
          data.setValue(1, 1, 40 + Math.round(60 * Math.random()));
          chart.draw(data, options);
        }, 5000);
        setInterval(function() {
          data.setValue(2, 1, 60 + Math.round(20 * Math.random()));
          chart.draw(data, options);
        }, 26000);
      }
    </script>
<title>MasonLAB</title>

</head>

<body class="p-3 mb-2 bg-dark text-white">

	<div class="p-3 mb-2 bg-dark text-white">

		<%
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
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


		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="index.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="projects.jsp">Projects</a></li>
			<li class="nav-item"><a class="nav-link"
				href="workexperience.jsp">WorkExperience</a></li>
			<li class="nav-item"><a class="nav-link" href="assignments.jsp">Assignments</a></li>
			<%
				if (userID == null) {
			%>
			<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="join.jsp">Join</a>
			</li>

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



	<div class="card mb-3 p-3 mb-2 bg-dark text-white"
		style="max-width: 100%; border: 0;">
		<div class="row g-0">
			<div class="col-md-4">
				<img
					src="https://media-exp1.licdn.com/dms/image/C5603AQGuB2YVhAxCQA/profile-displayphoto-shrink_400_400/0/1608133987518?e=1619049600&v=beta&t=eEIpu4Jnvm6-RhXSTqusyeO4OTMwpUk8p0eM15jUn-E"
					style="border-radius: 50%; border: 5px solid blue; width: auto; height: auto; max-width: 100%;">
			</div>
			<div class="col-md-8">
				<div class="card-body">
					<h1>MasonKim(JUNKUK KIM)</h1><br>
					<h1>Server Computational resources</h1>
					<div id="chart_div" style="width: 400px; height: 120px;"></div><br>
					<p class="card-text" style="font-size: 19.2px">Hi, there!</p>
					<p class="card-text" style="font-size: 19.2px">I'm a software
						engineer.</p>
					<p class="card-text" style="font-size: 19.2px">I make &
						maintain websites and apps.</p>
					<p>Thanks for visiting!</p>
					<p>
						Contact:<a href="mailto:ehehwnwjs5052@gmail.com">
							ehehwnwjs5052@gmail.com</a>
					</p>
					<div style="margin-top: 35px">
						<a href="https://github.com/Kimjunkuk"> <i
							class="fa fa-github" style="font-size: 36px; margin-right: 24px;"></i></a>
						<a href="https://linkedin.com/in/junkukkim"><i
							class="fa fa-linkedin-square"
							style="font-size: 36px; margin-right: 24px;"></i></a> <a
							href="https://www.hackerrank.com/ehehwnwjs546?h_r=internal-search&hr_r=1"><span
							class="iconify" data-icon="simple-icons:hackerrank"
							data-inline="false" style="font-size: 36px; vertical-align: top;"></span></a>
					</div>


				</div>
			</div>
		</div>
	</div>

	<div class="p-3 mb-2 bg-dark text-white">
		<div>
			<h1>ToolBox</h1>
		</div>
		(TotalRecode :
		<%=count%>)

		<!-- striped는 홀수와 짝수가 번갈아가면서 색상이 변경되도록 해주어 가독성을 높여주는 요소  id="pc-view" -->
		<div class="row">
			<form method="post" action="index.jsp?sort_type=searchresult"
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
			<table class="table table-striped p-3 mb-2 bg-dark text-white"
				style="background-color: bg-dark; text-align: center;">
				<thead>
					<tr>
						<th style="width: 10%;">No <a
							href="index.jsp?sort_type=upnumber">▲</a><a
							href="index.jsp?sort_type=downnumber">▼</a>
						</th>
						<th style="width: 50%;">Title<a
							href="index.jsp?sort_type=uptitle">▲</a><a
							href="index.jsp?sort_type=downtitle">▼</a>
						</th>
						<th style="width: 15%;">Author <a
							href="index.jsp?sort_type=upname">▲</a><a
							href="index.jsp?sort_type=downname">▼</a>
						</th>
						<th style="width: 15%;">Date<a
							href="index.jsp?sort_type=update">▲</a><a
							href="index.jsp?sort_type=downdate">▼</a>
						</th>
						<th style="width: 10%;">View<a
							href="index.jsp?sort_type=upview">▲</a><a
							href="index.jsp?sort_type=downview">▼</a>
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
						<td style="text-align: left;"><%=list.get(i).getSkillbbsID()%></td>
						<!-- 제목의 최대길이를 제한하여 초과할결우 숨김 처리  -->
						<td
							style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
							href="view.jsp?skillbbsID=<%=list.get(i).getSkillbbsID()%>"><%=list.get(i).getSkillbbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=list.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: left;"><%=list.get(i).getSkillbbsDate().substring(0, 11)
							+ list.get(i).getSkillbbsDate().substring(11, 13) + ":"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + ""%></td>
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
							+ listupnumber.get(i).getSkillbbsDate().substring(11, 13) + ":"
							+ listupnumber.get(i).getSkillbbsDate().substring(14, 16) + ""%></td>
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
							+ listdownnumber.get(i).getSkillbbsDate().substring(11, 13) + ":"
							+ listdownnumber.get(i).getSkillbbsDate().substring(14, 16) + ""%></td>
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
							+ list.get(i).getSkillbbsDate().substring(11, 13) + ":"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + ""%></td>
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
							+ list.get(i).getSkillbbsDate().substring(11, 13) + ":"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + ""%></td>
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
							+ list.get(i).getSkillbbsDate().substring(11, 13) + ":"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + ""%></td>
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
							+ list.get(i).getSkillbbsDate().substring(11, 13) + ":"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + ""%></td>
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
							+ list.get(i).getSkillbbsDate().substring(11, 13) + ":"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + ""%></td>
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
							+ list.get(i).getSkillbbsDate().substring(11, 13) + ":"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + ""%></td>
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
							+ list.get(i).getSkillbbsDate().substring(11, 13) + ":"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + ""%></td>
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
							+ list.get(i).getSkillbbsDate().substring(11, 13) + ":"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + ""%></td>
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
							"<span style='color:red;'>" + strString + "</span>")%></a> <!-- 제목을 눌렀을때 해당게시글의  페이지로 이동 시킴, 해당 게시글 번호를 매개변수로 처리할 수 있도록 함 --></td>
						<td style="text-align: center;"><%=list.get(i).getUserID()%></td>

						<!-- substring 함수를 이용하여 데이터를 형식을 원하는 형식으로 잘라 표현  -->
						<td style="text-align: center;"><%=list.get(i).getSkillbbsDate().substring(0, 11)
							+ list.get(i).getSkillbbsDate().substring(11, 13) + ":"
							+ list.get(i).getSkillbbsDate().substring(14, 16) + ""%></td>
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
			<a href="index.jsp?pageNumber=<%=pageNumber = 1%>">[First]</a>
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
			<a href="index.jsp?pageNumber=<%=startPage - 10%>">[이전]</a>
			<%
				}

					for (int i = startPage; i <= endPage; i++) { // 페이지 블록 번호
						if (i == currentPage) { // 첫번째 패이지
			%>
			<a href="index.jsp?pageNumber=<%=i%>">[<%=i%>]
			</a>
			<%
				} else { // 현재 페이지가 아닌 경우 링크 설정
			%>
			<a href="index.jsp?pageNumber=<%=i%>">[<%=i%>]
			</a>
			<%
				}
					} // for end

					if (endPage < pageCount) { // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
			%>
			<a href="index.jsp?pageNumber=<%=startPage + 10%>"
				class="btn btn-success btn-arrow-left">[다음]</a>
			<%
				}
				}
			%>
			<a href="index.jsp?pageNumber=<%=pageNumber = 4%>">[Last]</a> <a
				href="write.jsp">[Write]</a>
		</div>


	</div>


	<!--Animation-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>