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
      <h1 class="bold topp left" > $ FileUpload</h1>
      <h2></h2>
      <!-- gray text --->
      <l class="gray left" >Upload a file with file modulation</l>
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
   <%
    String sql = "SELECT FILENAME,FILEDATA FROM BOARD WHERE ID = '" + mem_id + "' and num = (SELECT MAX(num) FROM BOARD WHERE ID = '" + mem_id + "')";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    String filename = "";
    String filedata = "";
    if (rs.next()) {
      filename = rs.getString("FILENAME");
      filedata = rs.getString("FILEDATA");
    }
     if(filename==null || filedata==null){
      %>
      <form action="../logic/FILEaction.jsp" enctype="multipart/form-data" method="post" style="margin-left: 10%;">
         <input type="file" name="uploadFile" style="color:white; background-color: #3D3D3D; font-family: monaco;" required><br><br>
         <input type="submit" value="Submit" style="margin-left: 86%; background-color: #3D3D3D; color: white; font-family: monaco;">
      </form>
      </div>
      <%
     }else{
      %>
   <div style="display: inline-block; vertical-align: top; margin-right: 20%;">
      <form action="../logic/FILEaction.jsp" enctype="multipart/form-data" method="post" style="margin-left: 10%;">
         <input type="file" name="uploadFile" style="color:white; background-color: #3D3D3D; font-family: monaco;" required><br><br>
         <input type="submit" value="Submit" style="margin-left: 86%; background-color: #3D3D3D; color: white; font-family: monaco;">
      </form>
   </div>
   
  <%
    String sql1 = "SELECT FILENAME,FILEDATA FROM BOARD WHERE ID = '" + mem_id + "' and num = (SELECT MAX(num) FROM BOARD WHERE ID = '" + mem_id + "')";
    Statement stmt1 = conn.createStatement();
    ResultSet rs1 = stmt1.executeQuery(sql1);
    if (rs1.next()) {
      String filename1 = rs.getString("FILENAME");
      String filedata1 = rs.getString("FILEDATA");
     %>
     <div style="display: inline-block; vertical-align: top;">
    <img style="width: 20%;" src="../upload/<%=filedata1%>"></div>
   </br>
</br>
      <form action="../logic/FILEdownload.jsp" method="post" > 
         <input type="hidden" name="filename" value="<%=filename1%>">
         <input type="hidden" name="filedata" value="<%=filedata1%>">
         <a href="javascript:;" onclick="document.forms[1].submit();" style="margin-left: 37.5%; color: white;"><%=filedata1%></a>
      </form>
      
   <%
   }
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
  
<%
}
%>

</body>
</html>