<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../logic/dbconn.jsp"%>
<%@ include file="../logic/SessionMain.jsp" %>
<!doctype html>
<html>
   <head>
   <link rel="icon" href="https://avatars.githubusercontent.com/u/69230350?v=4">
   <title>Contact details</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="../assets/css/login_sign_up.css">
   <link rel="stylesheet" href="../assets/css/main.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js?autoload=true&amp;skin=sunburst&amp;lang=css" defer=""></script>

   </head>
   <body>
        <!-- heading 1 -->
      <h1 class="bold topp left" > $ My contact</h1>
      <h2></h2>
      <!-- gray text --->
      <l class="gray left" >My questions</l>
      <br>
      </br>
      <!-- buttons -->
      <a href="../view/index.jsp" class="button leftmar ">HOME</a>
      
      
      <!-- horizontal rule -->
      <hr>
      <!-- paragraph -->
      </br>
      <form action="myquestion.jsp" method="get" style="margin-left: 35%;">
        <input type="search" name="search" placeholder="Subject" style="background-color: #3D3D3D; color: white;">
        <input type="submit" value="Submit" style="background-color: #3D3D3D; color: white;">
      </form>

      </br>
        <table style="margin-left: 10%; width:40%;">
            <th style="width:40%"align="center">SUBJECT</th>
            <th style="width:20%"align="center">ID</th>
            <th style="width:25%"align="center">DATE</th>
    <%
      String search = request.getParameter("search");
    
      if(search == null){
   
      ResultSet rs = null;
      String sql = "SELECT NUM, ID, SUBJECT, CONTENT, CUR_DATE FROM BOARD1 where ID = '" + mem_id + "' ORDER BY NUM DESC";
      
      Statement stmt = conn.createStatement();

      rs = stmt.executeQuery(sql);
      int NUM = 0;
      String ID = "";
      String SUBJECT = "";
      String CONTENT = "";
      String CUR_DATE = "";

      while(rs.next()){
         NUM = rs.getInt(1); 
         ID = rs.getString(2);
         SUBJECT = rs.getString(3);
         CONTENT = rs.getString(4);
         CUR_DATE = rs.getString(5);
   %>
    <tr>
      <td><a href="detail.jsp?num=<%=NUM%>" style="text-decoration: none"><%=SUBJECT%></a></td>
      <td><a href="detail.jsp?num=<%=NUM%>" style="text-decoration: none"><%=ID%></a></td>
      <td><a href="detail.jsp?num=<%=NUM%>" style="text-decoration: none"><%=CUR_DATE%></a></td>
   </tr>
   <%
}
   
}else{
      ResultSet rs = null;
      String sql = "SELECT NUM, ID, SUBJECT, CONTENT, CUR_DATE FROM BOARD1 WHERE ID = '" + mem_id + "' AND SUBJECT LIKE '%";
      sql += search + "%' ORDER BY NUM DESC";
      Statement stmt = conn.createStatement();
      
      rs = stmt.executeQuery(sql);
      int NUM = 0;
      String ID = "";
      String SUBJECT = "";
      String CONTENT = "";
      String CUR_DATE = "";

      while(rs.next()){ 
        NUM = rs.getInt(1); 
        ID = rs.getString(2);
        SUBJECT = rs.getString(3);
        CONTENT = rs.getString(4);
        CUR_DATE = rs.getString(5);
     
        %> 
            <tr>
               <td><a href="detail.jsp?num=<%=NUM%>" style="text-decoration: none"><%=SUBJECT%></a></td>
               <td><a href="detail.jsp?num=<%=NUM%>" style="text-decoration: none"><%=ID%></a></td>
               <td><a href="detail.jsp?num=<%=NUM%>" style="text-decoration: none"><%=CUR_DATE%></a></td>
            </tr>
        
        <%
        }
        }
    %>

   </table>
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
            <h> & </h> <a href="#" title="" target="_self" class="w3-hover-text-green">NEXT &#8594</a></br>
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

</body>
</html>