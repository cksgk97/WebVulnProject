<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    session.removeAttribute("id");

    out.println("<script>alert(\"LOGOUT SUCCESS\"); location.href=\"../view/index.jsp\"</script>");
%>