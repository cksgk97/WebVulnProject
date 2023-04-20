<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <link rel="icon" href="https://avatars.githubusercontent.com/u/69230350?v=4">
    <title>Hacker theme (thelearn-tech)</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../assets/css/login_sign_up.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  </head>
  <body>
    <div class="login">
      
      <h2 class="login-header">$ Login</h2>
      <form action="../logic/loginaction.jsp" class="login-container" method="post">
        <p><input type="text" placeholder="ID" required name="id"></p>
        <p><input type="password" placeholder="Password" required name="password"></p>
        <p><input type="submit" value="Log in"></p>
      </form>
      <footer class="w3-center w3-black w3-padding-64 w3-opacity w3-hover-opacity-off">
        <p>No Account! <a href="signup.jsp" target="_self" class="linkk bold"><b>Sign up</b></a></p>
        
        <a href="javascript:alert('이거 안돼요.');" onfocus="this.blur()" <i class="fa fa-twitter w3-hover-opacity"></a>
        <a href="javascript:alert('이거 안돼요.');" onfocus="this.blur()" <i class="fa fa-instagram w3-hover-opacity"></a>
        <a href="javascript:alert('이거 안돼요.');" onfocus="this.blur()" <i class="fa fa-github w3-hover-opacity"></a>

        <p>
          <a href="#" onClick="history.back()" title="" target="_self" class="w3-hover-text-green">&#8592 Back</a>
          <h> & </h> <a href="index.jsp" title="" target="_self" class="w3-hover-text-green">HOME</a></p></br>
                    
        </p>
        <h class="w3-center"><em>Requested from </em></h>
        <h id="usrip">  </h>
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"> </script>
        <script src="../assets/js/ip.js"> </script>
        
      </footer>
      
    </div>
  </body>
</html>