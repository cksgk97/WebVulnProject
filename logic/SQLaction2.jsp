<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 중</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<% 
    String id = request.getParameter("id");
    String pw = request.getParameter("password");

    ResultSet rs = null;
	Statement stmt = conn.createStatement();

try{
    String sql = "SELECT * FROM member where M_ID='" + id + "'\n"
         + "AND M_PASS='" + pw + "'";

    rs = stmt.executeQuery(sql);

    if (rs.next()){ 
        session.setAttribute("SQL1",pw);
        out.println("<script>alert(\"SQL Injection Success\"); location.href=\"../view/SQL3.jsp\"</script>");
        
    } else {
        out.println("<script>alert(\"Retry\"); location.href=\"../view/SQL2.jsp\"</script>");
    }   
    }catch(SQLException e){
        out.println("<script>alert(\"Retry\"); location.href=\"../view/SQL2.jsp\"</script>");
    }

%>
</body>