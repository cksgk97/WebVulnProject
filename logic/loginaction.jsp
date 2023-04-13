<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.security.MessageDigest"%>
<%@ page import="java.security.NoSuchAlgorithmException"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 중</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>  

<% 
String id = request.getParameter("id");
String password = request.getParameter("password");

PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "SELECT * FROM MEMBER WHERE M_ID = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
rs = pstmt.executeQuery();

if (rs.next()) {
    String dbSalt = rs.getString("M_SALT"); 

    String generatedPassword = null;
    try {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] saltBytes = dbSalt.getBytes(StandardCharsets.UTF_8);
        byte[] passwordBytes = password.getBytes(StandardCharsets.UTF_8);
        byte[] saltedPasswordBytes = new byte[saltBytes.length + passwordBytes.length];
        System.arraycopy(saltBytes, 0, saltedPasswordBytes, 0, saltBytes.length);
        System.arraycopy(passwordBytes, 0, saltedPasswordBytes, saltBytes.length, passwordBytes.length);
        byte[] hash = md.digest(saltedPasswordBytes);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < hash.length; i++) {
        sb.append(Integer.toString((hash[i] & 0xff) + 0x100, 16).substring(1));
        }
            generatedPassword = sb.toString();
        }catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

    String dbPassword = rs.getString("M_PASS");
    
    if (dbPassword.equals(generatedPassword)) {
        session.setAttribute("id", id); // 사용자 아이디 저장
        out.println("<script>alert(\"LOGIN SUCCESS\"); location.href=\"../view/index.jsp\"</script>");
    } else {
        String sql1 = "SELECT M_NUM FROM MEMBER WHERE M_ID = '" + id + "'";
        Statement stmt1 = conn.createStatement();
        ResultSet rs1 = stmt1.executeQuery(sql1);
        if(rs1.next()){
            int num = rs1.getInt("M_NUM");
            if(num > 5){
            out.println("<script>alert(\"Login try exceeded. Contact admin\"); location.href=\"../view/login.jsp\"</script>");
        }
    }
        String sql2 = "UPDATE MEMBER SET M_NUM = M_NUM + 1 WHERE M_ID = '" + id + "'";
        Statement stmt = conn.createStatement();
        int num = stmt.executeUpdate(sql2);
        out.println("<script>alert(\"LOGIN FAIL\"); location.href=\"../view/login.jsp\"</script>");
        }
}


%>
</body>