<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../logic/SessionMain.jsp" %>
<%@ include file="../logic/dbconn.jsp" %>  
<!doctype html>
<html>
   <head>
      <link rel="icon" href="https://avatars.githubusercontent.com/u/69230350?v=4">
      <title>Hacker theme (thelearn-tech)</title>
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
   if(mem_id==null && mem_pw == null){
     out.println("<script>alert(\"LOGIN REQUIRED\"); location.href=\"../view/index.jsp\"</script>");
   }else{
   %>
      <!-- heading 1 -->
      <h1 class="bold topp left" > $ File Download</h1>
      <h2></h2>
      <!-- gray text --->
      <l class="gray left" >Manipulate the file and download it</l>
      <br>
      </br>
      <!-- buttons -->
      <a href="../view/index.jsp" class="button leftmar ">HOME</a>
      
      
      <!-- horizontal rule -->
      <hr>
      <!-- paragraph -->
      
      <br>
      
      </br>
      <span style="display:inline-block; margin-left: 2.7%; color: white; font-size: 18px; font-family: monaco;">FileName : </span><a href="../logic/FILEdown.jsp" style="display:inline-block; margin-left: 1%; color: white; text-decoration: none;">Suji.jpg</a>
   <%
      }
      %>
   </br></br>
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
            <a href="https://twitter.com/thelearn_tech/" <i class="fa fa-twitter w3-hover-opacity"></a>
            <a href="https://instagram.com/thelearn_tech/" <i class="fa fa-instagram w3-hover-opacity"></a>
            <a href="https://github.com/thelearn-tech/" <i class="fa fa-github w3-hover-opacity"></a>
            
         </div>
         <!-- page link -->
         <p>
            <a href="#" onClick="history.back()" title="" target="_self" class="w3-hover-text-green">&#8592 Back</a>
            <h> & </h> <a href="XSS2.jsp" title="" target="_self" class="w3-hover-text-green">NEXT &#8594</a>
            
            
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

</body>
</html>