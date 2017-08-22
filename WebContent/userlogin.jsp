<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Login form</title>
  <!-- CORE CSS-->
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">

<style type="text/css">
html,
body {
    height: 100%;
}
html {
    display: table;
    margin: auto;
}
body {
    display: table-cell;
    vertical-align: middle;
}
.margin {
  margin: 0 !important;
}
</style>
  
</head>

<body class="cyan">


  <div id="login-page" class="row">
    <div class="col s12 z-depth-6 card-panel">
      <form class="login-form" action="userloginprocess.jsp">
        <div class="row">
          <div class="input-field col s12 center">
            <img src="logo-M(converted).png" alt="" class="responsive-img valign profile-image-login">
            <p class="center login-form-text">STAY CONNECTED TO ALL YOUR ACCOUNTS AT ONE PLACE</p>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
            <input name="username" type="text" class="validate" placeholder="Username">
            <!-- <input class="validate" id="email" type="email"> -->
            <!-- <label for="email" data-error="wrong" data-success="right" class="center-align">Email</label> -->
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-action-lock-outline prefix"></i>
            <input name="loginpassword" type="password" placeholder="Password">
            <!-- <label for="password">Password</label> -->
          </div>
        </div>
        <div class="row">          
          <div class="input-field col s12 m12 l12  login-text">
              <input type="checkbox" id="remember-me" />
              <label for="remember-me">Remember me</label>			<!-- Implementation needed? -->
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
            <!-- <a href="login.html" class="btn waves-effect waves-light col s12">Login</a> -->
            <button type="submit" class="btn waves-effect waves-light col s12">Login</button>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s6 m6 l6">
            <p class="margin medium-small"><a href="usersignup.jsp">Register Now!</a></p>
          </div>
          <div class="input-field col s6 m6 l6">
              <p class="margin right-align medium-small"><a href="forgot-password.html">Forgot password?</a></p>
          </div>          
        </div>

      </form>
    </div>
  </div>


  <!-- <center>
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
Post Page - Responsive
<ins class="adsbygoogle"
     style="display:inline-block;width:300px;height:250px"
     data-ad-client="ca-pub-5104998679826243"
     data-ad-slot="3470684978"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
</center> -->



  <!-- ================================================
    Scripts
    ================================================ -->

  <!-- jQuery Library -->
 <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <!--materialize js-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>


   <footer class="page-footer">
          <div class="footer-copyright">
            <div class="container">
            © 2017 Multibanking.info
            <a class="grey-text text-lighten-4 right" href="authors.jsp">About Us</a>	<!--TODO:	Implement Authors page. -->
            </div>
          </div>
  </footer>
</body>

</html>