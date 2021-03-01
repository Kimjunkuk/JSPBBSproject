<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="skillbbs.SkillbbsDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>


<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="skillbbs" class="skillbbs.Skillbbs" scope="page" />
<jsp:setProperty name="skillbbs" property="skillbbsTitle" />
<jsp:setProperty name="skillbbs" property="skillbbsContent" />

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
		
		else{
	    	
			//Title과 Content를 등록이 되었는지 안되었는지 식별하여 안되었다면 안되었다고 오류를 보냄
	    	if(skillbbs.getSkillbbsTitle() == null || skillbbs.getSkillbbsContent() == null){
	            PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('Title & Content is empty!')");
	            script.println("history.back()");
	            script.println("</script>");
	    	}
	    
	    	//Title과 Content 입력이 정상적으로 잘 되었을 경우 진행
	    	else {
	            SkillbbsDAO skillbbsDAO = new SkillbbsDAO();
	            int result = skillbbsDAO.write(skillbbs.getSkillbbsTitle(), userID ,skillbbs.getSkillbbsContent()); //SkillbbsDAO 클래스에 있는 write 메소드 호출 

	            if (result == -1){
	                PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("alert('... Failed to write.')");
	                script.println("history.back()");
	                script.println("</script>");
	            }
	            
	            //글쓰기가 성공했을 경후 진행
	            else {
	                PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("location.href ='index.jsp'");
	                script.println("</script>");
	                
	            }
	    	}
		}
		


        

    %>

</body>
</html>