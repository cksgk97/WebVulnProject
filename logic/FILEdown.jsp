<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download</title>
</head>
<body>
	<% 
	
	request.setCharacterEncoding("utf-8");

	String downLoadFile = "C:\\Program Files\\Java\\Server\\apache-tomcat-9.0.73\\webapps\\chan\\upload\\suji.jpg"; 
  
	File file = new File(downLoadFile);
    FileInputStream in = new FileInputStream(downLoadFile);
	
    String fileName = "suji.jpg";
    fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
    
    response.setContentType("application/octet-stream; charset=UTF-8");
	response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");

	out.clear();					
	out = pageContext.pushBody();
    
    OutputStream os = response.getOutputStream();
    
    int length;
    byte[] b = new byte[(int)file.length()];

    while ((length = in.read(b)) > 0) {
    	os.write(b,0,length);
    }
    
    os.flush();
    
    os.close();
    in.close();
    
%>
</body>
</html>