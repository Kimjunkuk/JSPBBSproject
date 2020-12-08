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
			
		} else {
			
            SkillbbsDAO skillbbsDAO = new SkillbbsDAO();
            int result = skillbbsDAO.delete(skillbbsID); //SkillbbsDAO 클래스에 있는 delete 메소드 호출 

            if (result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('... Failed to Delete.')");
                script.println("history.back()");
                script.println("</script>");
            }
            
            //글삭제가 성공했을 경후 진행
            else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href ='skillbbs.jsp'");
                script.println("</script>");
                
            }
    	}
		
    %>

</body>
</html>