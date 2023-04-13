<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../logic/SessionMain.jsp" %>
<!doctype html>
<html>
  <head>
    <link rel="icon" href="https://avatars.githubusercontent.com/u/69230350?v=4">
    <title>Lv2. SQL Injection</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../assets/css/login_sign_up.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
  </head>
  <body>
    <%
    String SQL = (String) session.getAttribute("SQL");
    if(mem_id==null && mem_pw == null){
      out.println("<script>alert(\"LOGIN REQUIRED\"); location.href=\"../view/index.jsp\"</script>");
      }else if(SQL==null){
      out.println("<script>alert(\"You can try after clearing Level 1.\"); location.href=\"../view/SQL1.jsp\"</script>");
   } else{
      out.println("<script>alert(\"SQL Injection SUCCESS\")</script>");
    %>
    <div class="login">
      
      <h2 class="login-header">$ Lv2. SQL Injection</h2>
      <form action="../logic/SQLaction2.jsp" class="login-container" method="post">
        <p><input type="text" placeholder="ID" required name="id"></p>
        <p><input type="password" placeholder="Password" required name="password"></p>
        <p><input type="submit" value="Log in"></p>
      </form>
      <footer class="w3-center w3-black w3-padding-64 w3-opacity w3-hover-opacity-off">
        <p>No Account! <a href="javascript:alert('문제 푸세요.');" onfocus="this.blur()" target="_self" class="linkk bold"><b>Sign up</b></a></p>
        
        <a href="javascript:alert('문제 푸세요.');" onfocus="this.blur()" <i class="fa fa-twitter w3-hover-opacity"></a>
        <a href="javascript:alert('문제 푸세요.');" onfocus="this.blur()" <i class="fa fa-instagram w3-hover-opacity"></a>
        <a href="javascript:alert('문제 푸세요.');" onfocus="this.blur()" <i class="fa fa-github w3-hover-opacity"></a>

        <p>
          <a href="#" onClick="history.back()" title="" target="_self" class="w3-hover-text-green">&#8592 Back</a>
          <h> & </h> <a href="SQL3.jsp" title="" target="_self" class="w3-hover-text-green">NEXT &#8594</a></p></br>
          <a href="../view/index.jsp" title="" target="_self" class="w3-hover-text-green">HOME</a>
                    
        </p>
        <h class="w3-center"><em>Requested from </em></h>
        <h id="usrip">  </h>
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"> </script>
        <script src="../assets/js/ip.js"> </script>
        
      </footer>
      
    </div>
  <%
  }
  %>
  </body>
</html>