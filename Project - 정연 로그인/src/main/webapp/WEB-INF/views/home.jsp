<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<!--Import Google Icon Font-->
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!--Import materialize.css-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
	<!--Let browser know website is optimized for mobile-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<style>
@import url('https://fonts.googleapis.com/css?family=Bitter|Roboto');

.logo {
	height: 7.5%;
}

.divLogo {
	padding-top: 0.5%;
	padding-left: 0.5%;
}

.divHeader, .divBody, .divAccount{
	text-align:center;
}

.divHeader{
	font-family: 'Bitter', serif;
	font-size: 300%;
}
.divBody{
	background-image: url("resources/image/hero-bg.png");
	background-position: bottom;
	background-repeat: no-repeat;
}
.divMenu{
	text-align:right;
}

.divAccount a {
	padding: 1%;
	border: 3.5px solid #71C55D;
	border-radius: 20px;
	font-family: 'Roboto', sans-serif;
}
</style>
</head>

<body>
<div class="divLogo">
	<a href="home"><img src="resources/image/marvelousmonday.png" class="logo"></a>
</div>
<br>
<div class="divMenu">
	<div class="col s12">
		<ul class="tabs">
			<li class="tab col s1"><a href="#test1" class="teal-text text-lighten-2">About</a></li>
			<li class="tab col s1"><a href="#test2" id="goMindmap" class="teal-text text-lighten-2">마인드맵</a></li>
			<li class="tab col s1"><a href="#test3" class="teal-text text-lighten-2">스크랩</a></li>
			<li class="tab col s1"><a href="#test4" class="teal-text text-lighten-2">공유</a></li>
		
			<c:if test="${sessionScope.loginId!=null}">
			<li class="tab col s1"><a href="logout" id="logout" class="teal-text text-lighten-2">로그아웃</a></li>
			</c:if>
		
			<c:if test="${sessionScope.loginId==null}">
			<li class="tab col s1"><a href="login" id="login" class="teal-text text-lighten-2">로그인</a></li>
			</c:if>
		</ul>
	</div>
</div>
<br>
<div class="divHeader">Welcome to MindHeya</div>
<br>
<div class="divBody">
	<img src="https://bootstrapmade.com/demo/themes/eStartup/img/hero-img.png" class="mainImg"><br> <br>
</div>
<br>

<c:if test="${sessionScope.loginId==null}">
<div class="divAccount">
	<a href="goJoin">GET STARTED</a>
</div>
</c:if>




	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
	<script>

		$(function() {
			$('#logout').on("click", function() {
				alert('로그아웃합니다.');
				$('#hiddenlogout').submit();
			});
			
			$('#goMindmap').on("click", function() {
				alert('마인드맵 페이지로 이동합니다.');
				$('#hiddengoMindmap').submit();
			});
			
			$('#login').on("click", function() {
				$('#hiddengoLogin').submit();
			});
		});
	</script>
	<form id="hiddenlogout" action="logout" method="get"></form>
	<form id="hiddengoMindmap" action="goMindmap" method="get"></form>
	<form id="hiddengoLogin" action="login" method="get"></form>
</body>
</html>