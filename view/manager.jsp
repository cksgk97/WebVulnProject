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
      <!-- Version 1.0.1-->
     <script type="text/javascript">
         function openPopup(subject, content) {
            var popup = document.getElementById("popup");
            var popupContent = "<div class='content'>" +
                  "<div style='display:flex; justify-content:space-between; align-items:center;'>" +
                  "<h2 style='display:inline-block;'>" + subject + "</h2>" +
                  "<a href='#' onclick='closePopup()' style='color: white; text-decoration: none; display: inline-block; font-size: 30px;'>X</a>" +
                  "</div>" +
                  "</br>" +
                  "<div class='prettyprint'>" + content + "</div>" +
                  "</div>";
            popup.innerHTML = popupContent;
            popup.style.display = "block";
         }
         function closePopup() {
            var popup = document.getElementById("popup");
            popup.style.display = "none";
         }
	</script>
   <style type="text/css">
		/* 팝업 스타일 */
		#popup {
			display: none; /* 팝업 초기 상태는 숨김 처리 */
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(0, 0, 0, 0.2); /* 팝업 배경색 지정 */
		}
		#popup .content {
	   position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: #1A1A1A;
      padding: 20px;
      border-radius: 10px;
      text-align: left;
      width : 700px;
      height : 500px;
    }
	</style>  
   </head>
   <body>
        <!-- heading 1 -->
      <h1 class="bold topp left" > $ Contact details</h1>
      <h2></h2>
      <!-- gray text --->
      <l class="gray left" >Please check inquiry</l>
      <br>
      </br>
      <!-- buttons -->
      <a href="../view/index.jsp" class="button leftmar ">HOME</a>
      
      
      <!-- horizontal rule -->
      <hr>
      <!-- paragraph -->
      </br>
      <form action="manager.jsp" method="get" style="margin-left: 35%;">
        <input type="search" name="search" placeholder="Subject" style="background-color: #3D3D3D; color: white;">
        <input type="submit" value="Submit" style="background-color: #3D3D3D; color: white;">
      </form>

      </br>
        <table style="margin-left: 10%; width:40%;">
            <th style="width:15%"align="center">NUM</th>
            <th style="width:40%"align="center">SUBJECT</th>
            <th style="width:20%"align="center">ID</th>
            <th style="width:25%"align="center">DATE</th>
    <%
      String search = request.getParameter("search");
    
      if(search == null){
    %>  
    <%
      ResultSet rs = null;
      String sql = "SELECT NUM, ID, SUBJECT, CONTENT, CUR_DATE FROM BOARD1 ORDER BY NUM DESC";
      
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
      <td><a href="#" style="text-decoration: none" onclick="openPopup(`<%=SUBJECT%>`, `<%=CONTENT%>`)"><%=NUM%></a></td>
      <td><a href="#" style="text-decoration: none" onclick="openPopup(`<%=SUBJECT%>`, `<%=CONTENT%>`)"><%=SUBJECT%></a></td>
      <td><a href="#" style="text-decoration: none" onclick="openPopup(`<%=SUBJECT%>`, `<%=CONTENT%>`)"><%=ID%></a></td>
      <td><a href="#" style="text-decoration: none" onclick="openPopup(`<%=SUBJECT%>`, `<%=CONTENT%>`)"><%=CUR_DATE%></a></td>
   </tr>
   <%
    }
}else{
      ResultSet rs = null;
      String sql = "SELECT NUM, ID, SUBJECT, CONTENT, CUR_DATE FROM BOARD1 WHERE SUBJECT LIKE '%";
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
               <td><a href="#" style="text-decoration: none" onclick="openPopup(`<%=SUBJECT%>`, `<%=CONTENT%>`)"><%=NUM%></a></td>
               <td><a href="#" style="text-decoration: none" onclick="openPopup(`<%=SUBJECT%>`, `<%=CONTENT%>`)"><%=SUBJECT%></a></td>
               <td><a href="#" style="text-decoration: none" onclick="openPopup(`<%=SUBJECT%>`, `<%=CONTENT%>`)"><%=ID%></a></td>
               <td><a href="#" style="text-decoration: none" onclick="openPopup(`<%=SUBJECT%>`, `<%=CONTENT%>`)"><%=CUR_DATE%></a></td>
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
      
      <div id="popup">
      </div>

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
            <h> & </h> <a href="SQL9.jsp" title="" target="_self" class="w3-hover-text-green">NEXT &#8594</a></br>
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