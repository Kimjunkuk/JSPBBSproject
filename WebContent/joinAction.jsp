<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

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
		
    	//1차 입력정보 확인 
    	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('There is something that has not been entered.')");
            script.println("history.back()");
            script.println("</script>");
    	}
    
    	//2차 입력정보 검토
    	else {
            UserDAO userDAO = new UserDAO();
            int result = userDAO.join(user); //UserDAO 클래스에 있는 join 메소드 호출 

            if (result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('This ID is already existed')");
                script.println("history.back()");
                script.println("</script>");
            }
            
            //3차 회원가입 성공 
            else {
            	//Give session when login succeeds
            	session.setAttribute("userID", user.getUserID());
            	
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href ='index.jsp'");
                script.println("</script>");
                
            }
    	}

        

    %>

</body>
</html>