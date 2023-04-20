<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.security.MessageDigest"%>
<%@ page import="java.security.NoSuchAlgorithmException"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.security.SecureRandom"%>
<%@ include file="dbconn.jsp"%>

<% 
    SecureRandom random = new SecureRandom();
    byte[] saltBytes1 = new byte[16];
    random.nextBytes(saltBytes1);
    String salt = Base64.getEncoder().encodeToString(saltBytes1);
    String password = request.getParameter("password");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("mail");

    String generatedPassword = null;
    try {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] saltBytes = salt.getBytes(StandardCharsets.UTF_8);
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
    
    ResultSet rs = null;

    String sql1 = "SELECT M_ID FROM MEMBER WHERE M_ID = '" + id + "'";

    Statement stmt = conn.createStatement();

    rs = stmt.executeQuery(sql1);

    if(rs.next()){
        String dbID = rs.getString("M_ID");
            if(dbID.equals(id)){
                out.println("<script>alert(\"Duplicate ID.\"); location.href=\"../view/signup.jsp\"</script>");
            }
    }else{

    String sql = "INSERT INTO MEMBER (M_ID, M_PASS, M_NAME, M_MAIL, M_SALT, M_NUM) VALUES ('" + id + "','" + generatedPassword + "','" + name + "','" + email + "','" + salt + "'," + 0 + ")";
    
    stmt.executeUpdate(sql);
    stmt.close();
    conn.close();
    out.println("<script>alert(\"Successful Signup\"); location.href=\"../view/login.jsp\" </script>");
    }
%>

