<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>

<%@ include file="dbconn.jsp"%>
<%@ include file="../logic/SessionMain.jsp" %>

<% 
    String saveFolder = application.getRealPath("/upload") ;
    String encType = "UTF-8";
    int maxSize = 5 * 1024 * 1024;
    MultipartRequest multi = null;
    multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
    String subject = multi.getParameter("subject");
    String content = multi.getParameter("content");
    String fileName = multi.getFilesystemName("uploadFile");
    String original = multi.getOriginalFileName("uploadFile");
    int readcount = 0;


    String sql1 = "SELECT MAX(NUM) FROM BOARD";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql1);
    int num = 0;
    if(rs.next()){
        num = rs.getInt("max(num)")+ 1;
    }

    String sql2 = "INSERT INTO BOARD (NUM, ID, SUBJECT, CONTENT, READCOUNT, FILENAME, FILEDATA, CUR_DATE) VALUES ('" + num + "','" + mem_id + "','" + subject + "','" + content + "','" + readcount + "','" + fileName + "','" + original + "', + sysdate)";
    
    stmt = conn.createStatement();
    
    stmt.executeUpdate(sql2);

    String sql3 = "SELECT FILEDATA FROM BOARD WHERE NUM = ";
    sql3 += num ;
    stmt = conn.createStatement();
    ResultSet rs1 = stmt.executeQuery(sql3);

    if (rs1.next()) {
    String filedata = rs1.getString("FILEDATA");
    out.println("<script>alert('"+ filedata +" UPLOAD COMPLETE'); location.href=\"../view/FILEupload.jsp\"</script>");
   }
    stmt.close();
    conn.close();
%>

