<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%@ include file="../logic/dbconn.jsp"%>
<%@ include file="../logic/SessionMain.jsp" %>
<!doctype html>
<html>
   <head>
      <link rel="icon" href="https://avatars.githubusercontent.com/u/69230350?v=4">
      <title>Lv2.XSS</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="../assets/css/main.css">
      <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js?autoload=true&amp;skin=sunburst&amp;lang=css" defer=""></script>   
   </head>
   <body>
      
   <%
   String XSS = (String) session.getAttribute("XSS");
   if(mem_id==null && mem_pw == null){
    out.println("<script>alert(\"LOGIN REQUIRED\"); location.href=\"../view/index.jsp\"</script>");
   }
   if(XSS==null){
      out.println("<script>alert(\"You can try after clearing Level 1.\"); location.href=\"../view/XSS1.jsp\"</script>");
      } else{
      %>
      <!-- heading 1 -->
      <h1 class="bold topp left" > $ Lv2.XSS</h1>
      <h2></h2>
      <!-- gray text --->
      <l class="gray left" >Run alert to clear and move to the next level</l>

      <br>
      </br>
      <!-- buttons -->
      <a href="../view/index.jsp" class="button leftmar ">HOME</a>
      
      
      <!-- horizontal rule -->
      <hr>
      <!-- paragraph -->
      
      <br>
      
      </br>

        </br>
        <form action = "../view/XSS2.jsp" class="login-container" method="post" style="margin-left: 5%;">

        <textarea style="width: 30%; height: 15em; border: none; resize: none; background-color: #3D3D3D; color: white; border: 2px; border-color: azure; border-radius: 3%; outline-color: #BAB9B9;" placeholder="Content" required name="content"></textarea></br></br>
        <input type="submit" value="Submit" style="margin-left: 25%; background-color: #3D3D3D; color: white;">

        </form>
      <br>
      
<% 
      
   String content = request.getParameter("content");
   String sanitizedContent1 = null;
   if (content != null) {
      sanitizedContent1 = content.replaceAll("(?i)script", "");
   }

   
   String sql1 = "SELECT MAX(NUM) FROM XSS";
   Statement stmt = conn.createStatement();
   ResultSet rs = stmt.executeQuery(sql1);
   int num = 0;
   if(rs.next()){
      num = rs.getInt("max(num)")+ 1;
   }

   PreparedStatement pstmt = null;
   String sql2 = "INSERT INTO XSS (NUM, CONTENT, ID) VALUES (?, ?, ?)";
   pstmt = conn.prepareStatement(sql2);
   pstmt.setString(1, String.valueOf(num));
   pstmt.setString(2, sanitizedContent1);
   pstmt.setString(3, mem_id);
   pstmt.executeUpdate();

   String sql3 = "SELECT CONTENT FROM XSS WHERE NUM = (SELECT MAX(NUM) FROM XSS) AND ID = ?";
   pstmt = conn.prepareStatement(sql3);
   pstmt.setString(1, mem_id);
   ResultSet rs1 = pstmt.executeQuery();

   if (rs1 != null && rs1.next()) {
      String content1 = rs1.getString("CONTENT");
      if (content1 != null) {
            if(content1.matches(".*(<script>|<\\/script>&alert\\(|onerror=|onload=|eval\\().*")){
               session.setAttribute("XSS1",content1);
               out.println("<p style='display: none;'>" + content1 + "</p><script>location.href='../view/XSS3.jsp'</script>");

            }else{
         out.println("<script>location.href=\"../view/XSS2.jsp\"</script>");
      }
      
   }
}
   pstmt.close();
   conn.close();

%>
      </br>
      <div class="horizontalscroll left">
         <l>Enjoy the Hack</l>
      </div>
      <br>
      <!-- footer -->
      <footer class="w3-center w3-black w3-padding-64 w3-opacity w3-hover-opacity-off">
         <button onclick="topFunction()" class="w3-button w3-light-grey" title="Go to top"><i class="fa fa-arrow-up w3-margin-right w3-light-grey"></i>To Top</button>
         <div class="w3-xlarge w3-section">
            
            <!-- small logo with redirecting link -->
            <a href="javascript:alert('문제 푸세요.');" onfocus="this.blur()" <i class="fa fa-twitter w3-hover-opacity"></a>
            <a href="javascript:alert('문제 푸세요.');" onfocus="this.blur()" <i class="fa fa-instagram w3-hover-opacity"></a>
            <a href="javascript:alert('문제 푸세요.');" onfocus="this.blur()" <i class="fa fa-github w3-hover-opacity"></a>
            
         </div>
         <!-- page link -->
         <p>
            <a href="#" onClick="history.back()" title="" target="_self" class="w3-hover-text-green">&#8592 Back</a>
            <h> & </h> <a href="XSS3.jsp" title="" target="_self" class="w3-hover-text-green">NEXT &#8594</a></br>
          <a href="../view/index.jsp" title="" target="_self" class="w3-hover-text-green">HOME</a>
            
            
            
         </p>
         <h class="w3-center"><em>Requested from </em></h>
         <h id="usrip">  </h>
         
      </footer>
      
      <script> // js for scroll to TOP
            function topFunction() {
      
      document.body.scrollTop = 0; // For Safari
      
      document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
      
      }
      </script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"> </script>
      <script src="../assets/js/ip.js"> </script>
   </div>
<%
}
%>
</body>
</html>