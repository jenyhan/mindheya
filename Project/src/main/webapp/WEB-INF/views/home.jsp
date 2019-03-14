<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!--Import Google Icon Font-->
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!--Import materialize.css-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
	<!--Let browser know website is optimized for mobile-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>

<style>
@import url
.divLogo{
	padding:0.3;
}
.divHeader, .divBody, .divAccount{
	text-align:center;
}
.divMenu{
	text-align:right;
}
</style>

<body>
<div class="divLogo">
<img src="">Marvelous
</div>
<br>
<div class="divMenu">
	<div class="col s12">
	<ul class="tabs">
		<li class="tab col s1"><a href="#test1">About</a></li>
        <li class="tab col s1"><a href="#test2">마인드맵</a></li>
        <li class="tab col s1"><a href="#test3">스크랩</a></li>
        <li class="tab col s1"><a href="#test4">공유</a></li>
        <li class="tab col s1"><a href="logout">로그아웃</a></li>
      </ul>
    </div>
</div> 
<br>
<div class="divHeader">
Welcome to MindHeya
</div>
<br>
<div class="divBody">
<img src="https://bootstrapmade.com/demo/themes/eStartup/img/hero-img.png" class="mainImg">
<br>
</div>
<br>
<div class="divAccount">
<a href="goJoin" class="account">GET STARTED</a>
<a href="login" class="account">GET LOGIN</a>
</div>



	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
</body>
</html>