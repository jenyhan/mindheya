<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
@import url('https://fonts.googleapis.com/css?family=Gamja+Flower');
@import url('https://fonts.googleapis.com/css?family=Cute+Font|Jua');		

		
.optionSet{
	margin: 30px;
	font-size: 25px;
	font-weight: bold;
}
.logo{
  width: 200px;
  height: 70px;
}
.register-page {
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
#register-button {

  font-family: 'Gamja Flower', cursive;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 25px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 15px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
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
 <script> 

 function login(){
	
	 var id = $("#id").val();
	 var pw =$("#pw").val();
	 var email=$("#email").val();
	 var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		if(id.length<1||id.length>50||id.value==""){
			alert("ID를 다시 입력하세요");
			return;
		}
		
		if(pw.length<1||pw.length>50||pw.value==""){
			alert("PW를 다시 입력하세요");
			return;
		}
		
		if(email.length<1||email.length>100||email.value==""){			
			alert("EMAIL을 다시 입력하세요");
			return;
 		}
		
		if(!getMail.test($("#email").val())){
	        alert("이메일형식에 맞게 입력해주세요");
	        $("#mail").val("");
	        $("#mail").focus();
	        return false;
	    }

		
		$.ajax({
			url : "checkEmail",
			data : {email:email},
			type : "get",
			success : function(result) {
				if(result=="ok"){
					$("#register-form").submit();					
				} else {
					alert('이미 등록된 이메일입니다.');
				}			
			}
		});

  }
</script>  
<body>
<div class="register-page">
  <div class="form" style="margin-top:70px;">
  
    <form class="register-form" id="register-form" action="register-form" method="post">
	  <img src="resources/image/marvelousmonday.png" class="logo"><br><br> 
      <input type="text" placeholder="username" id="id" name="id" value="${member.id}"><br>
      <input type="password" placeholder="password" id="pw"name="pw" value="${member.pw}"><br>
      <input type="text" placeholder="email" id="email"name="email" value="${member.email}"><br>
      <font color="red">${warning}</font>
      <input type="hidden" name="tabNum" value="${tabNum}">
      <input type="button" onclick="javascript:login()" value="create" id="register-button">
      <p class="message">Already registered?<br> 
      <a href="login?tabNum=${tabNum}" class="optionSet">login</a><a href="home" class="optionSet">Home</a></p>
    </form>
  
  </div>
</div>
</body>
</html>