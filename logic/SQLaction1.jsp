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
    String ses = request.getParameter("ses");
    ResultSet rs = null;
	Statement stmt = conn.createStatement();

    String sql = "SELECT * FROM MEMBER WHERE M_ID = '" + id + "' and  M_PASS = '" + pw + "'";

    rs = stmt.executeQuery(sql);

    if (rs.next()){ 
        session.setAttribute("SQL",ses);
        out.println("<script>location.href=\"../view/SQL2.jsp\"</script>");
        
    } else {
        out.println("<script>alert(\"Retry\"); location.href=\"../view/SQL1.jsp\"</script>");
        
    }

%>
</body>