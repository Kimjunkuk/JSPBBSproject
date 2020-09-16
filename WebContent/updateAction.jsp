<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="skillbbs.SkillbbsDAO" %>
<%@ page import="skillbbs.Skillbbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
    <title>JSP BBS Project</title>

    <!--java.io.PrintWriter : 자바 스크립스 문장을 작성하기위해 사용됨-->
    <!--request.setCharacterEncoding("UTF-8") : 건너오는 모든 데이터를 UTF-8로 받을 수 있도록 함-->

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body> 
    <%
    
		String userID = null; //when userID variable empty process start
	    
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		//로그인이 되어있지 않은 유저에게 로그인을 유도함
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You need to login')");
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
		} else{
	    	
			//Title과 Content의 갑이 null인지 빈칸인지 확인
			//beans를 사용하지 않기때문에 SkillbbsTitle로 넘어온 값들을 전부 분석 비교 필요
			//updata페이지에서 넘어온 매개변수 값 
	    	if(request.getParameter("skillbbsTitle") == null || request.getParameter("skillbbsContent")  == null
	    		|| request.getParameter("skillbbsTitle").equals("") || request.getParameter("skillbbsContent").equals("")) {
	            PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('Title & Content is empty!')");
	            script.println("history.back()");
	            script.println("</script>");
	    	}
	    
	    	//Title과 Content 입력이 정상적으로 잘 되었을 경우 진행
	    	else {
	            SkillbbsDAO skillbbsDAO = new SkillbbsDAO();
	            int result = skillbbsDAO.update(skillbbsID, request.getParameter("skillbbsTitle"), request.getParameter("skillbbsContent")); //SkillbbsDAO 클래스에 있는 write 메소드 호출 

	            if (result == -1){
	                PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("alert('... Failed to update.')");
	                script.println("history.back()");
	                script.println("</script>");
	            }
	            
	            //글쓰기가 성공했을 경후 진행
	            else {
	                PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("location.href ='skillbbs.jsp'");
	                script.println("</script>");
	                
	            }
	    	}
		}
		
    %>

</body>
</html>