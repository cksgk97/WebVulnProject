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

    String sql = "SELECT M_PASS FROM MEMBER WHERE M_ID='";
	sql += id+"'";
	rs = stmt.executeQuery(sql);

    String pw2="";

    while(rs.next()){
		pw2 = rs.getString("M_PASS");
	}

    if (pw.equals(pw2)){ 
        
        out.println("<script>alert(\"SQL Injection SUSCESS\"); location.href=\"../view/index.jsp\"</script>");
        
    }else{
        out.println("<script>alert(\"Retry\"); location.href=\"../view/SQL2.jsp\"</script>");
    }

%>
</body>