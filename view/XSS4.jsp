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
      <title>Reflected XSS</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="../assets/css/main.css">
      <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js?autoload=true&amp;skin=sunburst&amp;lang=css" defer=""></script>
      
   </head>
   <%
   if(mem_id==null && mem_pw == null){
     out.println("<script>alert(\"LOGIN REQUIRED\"); location.href=\"../view/index.jsp\"</script>");
   }else{
   %>
   <body>
      <h2></h2>
      <!-- heading 1 -->
      <h1 class="bold topp left" > $ XSS</h1>
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
      <form action="XSS4.jsp" method="get">
         <a style="color: white; margin-left:10%;" href="?img=../images/hacker1.jpg">Image 1</a>
         <a style="color: white; margin-left:2%;" href="?img=../images/hacker2.jpg">Image 2</a>
         <a style="color: white; margin-left:2%;" href="?img=../images/hacker3.png">Image 3</a>
         <a style="color: white; margin-left:2%;" href="?img=../images/hacker4.jpg">Image 4</a>
         <input type = "hidden" name = "img">
      </form>
      
      <br>
      
      <%
         String image = request.getParameter("img");
         if (image == null || image.equals("")) {
            out.println("<img style=\"width:40%; margin-left:5%;\" src='../images/alert.png'>");
         } else {
            out.println("<img style=\"width:30%; margin-left:10%; margin-bottom: 3%;\" src='" + image + "'");
         }
      %>   
      </br>
      <div class="horizontalscroll left">
         <l>Enjoy the theme</l>
      </div>
      <br>
      <!-- footer -->
      <footer class="w3-center w3-black w3-padding-64 w3-opacity w3-hover-opacity-off">
         <button onclick="topFunction()" class="w3-button w3-light-grey" title="Go to top"><i class="fa fa-arrow-up w3-margin-right w3-light-grey"></i>To Top</button>
         <div class="w3-xlarge w3-section">
            
            <!-- small logo with redirecting link -->
            <a href="https://twitter.com/thelearn_tech/" <i class="fa fa-twitter w3-hover-opacity"></a>
            <a href="https://instagram.com/thelearn_tech/" <i class="fa fa-instagram w3-hover-opacity"></a>
            <a href="https://github.com/thelearn-tech/" <i class="fa fa-github w3-hover-opacity"></a>
            
         </div>
         <!-- page link -->
         <p>
            <a href="#" onClick="history.back()" title="" target="_self" class="w3-hover-text-green">&#8592 Back</a>
            <h> & </h> <a href="hacker-theme-page3.html" title="" target="_self" class="w3-hover-text-green">3</a>
            
            
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