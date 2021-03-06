<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Noto+Sans+KR);
@import url('https://fonts.googleapis.com/css?family=Gamja+Flower');



.optionSet{
	margin: 30px;
	font-size: 15px;
}

.logo{
  width: 200px;
  height: 70px;
}
.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  border-radius: 15px;
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: 'Gamja Flower', cursive;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: 'Gamja Flower', cursive;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  font-weight: bold;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 20px 0 0;
  color: #b3b3b3;
  font-size: 15px;
  font-family: 'Gamja Flower', cursive;
  
}
.form .message a {
  margin-top: 25px;
  color: #4CAF50;
  text-decoration: none;
  font-weight: bold;
  font-size: 25px;
  font-family: 'Gamja Flower', cursive;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  
  background: #76b852; /* fallback for old browsers */
  background: -webkit-linear-gradient(right, #76b852, #8DC26F);
  background: -moz-linear-gradient(right, #76b852, #8DC26F);
  background: -o-linear-gradient(right, #76b852, #8DC26F);
  background: linear-gradient(to left, #76b852, #8DC26F);
  font-family: 'Gamja Flower', cursive;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
</style>

<body>
<div class="login-page">
  <div class="form" style="margin-top:90px;">
    <form class="login-form" action="login-form" method="post">
	  <img src="resources/image/marvelousmonday.png" class="logo"><br><br>
      <input type="text" placeholder="username" name="id" value="${member.id}"><br>
      <input type="password" placeholder="password" name="pw"><font color="red">${warning}</font><br>
      <input type="hidden" name="tabNum" value="${tabNum}">
      <button>Login</button>
      <p class="message">Not registered? <br><a href="goJoin?tabNum=1" class="optionSet">Register</a> <a href="home" class="optionSet">Home</a></p>
    </form>
    
  </div>
</div>
</body>
</html>