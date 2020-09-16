<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

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
    	
    	//이미로그인 되었다면 아래와 같이 실행함
    	if (userID != null){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('You are already logged in.')");
    		script.println("location.href = 'index.jsp'");
    		script.println("</script>");
    	}
    
        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUserID(), user.getUserPassword());

        if (result == 1){
        	//Give session when login succeeds
        	session.setAttribute("userID", user.getUserID());
        	
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'index.jsp'");
            script.println("</script>");
        }//로그인 성공시 메인 페이지로 이동
        
        else if (result == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Password is not correct')");
            script.println("history.back()");
            script.println("</script>");
            
        }
        
        else if (result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('ID is not exist')");
            script.println("history.back()");
            script.println("</script>");
            
        }
        
        else if (result == -2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Database Error')");
            script.println("history.back()");
            script.println("</script>");
            
        }
    %>

</body>
</html>