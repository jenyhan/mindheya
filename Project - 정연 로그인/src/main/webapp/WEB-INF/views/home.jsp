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
@import url('https://fonts.googleapis.com/css?family=Bitter');

//정연상 자리에서 연습삼아 깃허브

.divLogo img{
	margin:0.5;
	width:15%;
	height:15%;
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
.tabs a{
	color:#535461;
}
.divAccount a{
   color: #71C55D;
   padding: 1%;
   border: 3.5px solid #71C55D;
   border-radius: 20px;
}
</style>

<body>
<div class="divLogo">
<a href="/map"><img src="resources/image/marvelous.png"></a>
</div>
<div class="divMenu">
	<div class="col s12">
	<ul class="tabs">
		<li class="tab col s1"><a href="#test1">About</a></li>
        <li class="tab col s1"><a href="goMindmap" id="goMindmap">마인드맵</a></li>
        <li class="tab col s1"><a href="#test3">스크랩</a></li>
        <li class="tab col s1"><a href="#test4">공유</a></li>
        <li class="tab col s1"><a href="logout" id="logout">로그아웃</a></li>
	</ul>
	</div>
</div> 
<br>
<div class="divHeader">
Welcome to MindHeya
</div>
<br>
<div class="divBody">
<img src="https://bootstrapmade.com/demo/themes/eStartup/img/hero-img.png" class="mainImg"><br>
<br>
</div>
<br>
<c:if test="${sessionScope.loginId==null}">
<div class="divAccount">
<a href="goJoin">GET STARTED</a>
<a href="login">LOGIN</a>
</div>
</c:if>



	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
<script>
$(function(){
		$('#logout').on("click", function(){
			alert('로그아웃합니다.');
			$('#hiddenlogout').submit();
		});
		$('#goMindmap').on("click", function(){
			alert('마인드맵 페이지로 이동합니다.');
			$('#hiddengoMindmap').submit();
		});
	});

</script>
<form id="hiddenlogout" action="logout" method="get"></form>
<form id="hiddengoMindmap" action="goMindmap" method="get"></form>
</body>
</html>