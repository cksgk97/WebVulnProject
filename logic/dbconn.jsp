<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    Connection conn = null;

    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String user = "jsp";
    String pass = "1234";

    conn = DriverManager.getConnection(url, user, pass);

    %>