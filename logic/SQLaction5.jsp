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
    String id1 = "";
    String pw1 = "";
    if (id != null || pw !=null) {
      id1 = id.replaceAll("'", "");
      pw1 = pw.replaceAll("'", "");
    }
    ResultSet rs = null;
	Statement stmt = conn.createStatement();

try{
    String sql = "SELECT * FROM member where M_ID='" + id1 + "' AND M_PASS='" + pw1 + "'";

    rs = stmt.executeQuery(sql);

    if (rs.next()){ 
        out.println("<script>alert(\"SQL Injection Success\"); location.href=\"../view/index.jsp\"</script>");
        
    } else {
        out.println("<script>alert(\"Retry\"); location.href=\"../view/SQL5.jsp\"</script>");
    }   
    }catch(SQLException e){
        out.println("<script>alert(\"Retry\"); location.href=\"../view/SQL5.jsp\"</script>");
    }

%>
</body>