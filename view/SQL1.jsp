<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../logic/SessionMain.jsp" %>
<!doctype html>
<html>
  <head>
    <link rel="icon" href="https://avatars.githubusercontent.com/u/69230350?v=4">
    <title>Lv1. SQL Injection</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../assets/css/login_sign_up.css">
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js?autoload=true&amp;skin=sunburst&amp;lang=css" defer=""></script>
      <!-- Version 1.0.1-->
   </head>
    <script type="text/javascript">
		function openPopup() {
			var popup = document.getElementById("popup");
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
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background-color:#1A1A1A;
			padding: 20px;
			border-radius: 10px;
		}
	</style>

  </head>
  <body>
    <%
    if(mem_id==null && mem_pw == null){
      out.println("<script>alert(\"LOGIN REQUIRED\"); location.href=\"../view/index.jsp\"</script>");
    }else{
    %>
    <div class="login">
      
      <h2 class="login-header">$ Lv1. SQL Injection</h2>
      <form action="../logic/SQLaction1.jsp" class="login-container" method="post">
        <p><input type="text" placeholder="ID" required name="id"></p>
        <p><input type="password" placeholder="Password" required name="password"></p>
        <input type="hidden" name="ses">
        <p><input type="submit" value="Log in"></p>
      </form>
      <footer class="w3-center w3-black w3-padding-64 w3-opacity w3-hover-opacity-off">
      <button onclick="openPopup()">HINT</button>
      <div id="popup">
		<div class="content">
			<h2>Lv1. SQL Injection</h2>
			<pre class="prettyprint">
  // Javascript with syntax highlighting
  // thelearn-tech@github
                     
String id = request.getParameter("id");
String pw = request.getParameter("password");

ResultSet rs = null;

Statement stmt = conn.createStatement();

String sql = "SELECT * FROM MEMBER WHERE M_ID = '" + id + "' and  M_PASS = '" + pw + "'";

rs = stmt.executeQuery(sql);
</pre>
			<button onclick="closePopup()">Close</button>
		</div>
	</div>
        <p>No Account! <a href="javascript:alert('문제 푸세요.');" onfocus="this.blur()" target="_self" class="linkk bold"><b>Sign up</b></a></p>
        
        <a href="javascript:alert('문제 푸세요.');" onfocus="this.blur()" <i class="fa fa-twitter w3-hover-opacity"></a>
        <a href="javascript:alert('문제 푸세요.');" onfocus="this.blur()" <i class="fa fa-instagram w3-hover-opacity"></a>
        <a href="javascript:alert('문제 푸세요.');" onfocus="this.blur()" <i class="fa fa-github w3-hover-opacity"></a>

        <p>
          <a href="#" onClick="history.back()" title="" target="_self" class="w3-hover-text-green">&#8592 Back</a>
          <h> & </h> <a href="SQL2.jsp" title="" target="_self" class="w3-hover-text-green">NEXT &#8594</a></p></br>
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