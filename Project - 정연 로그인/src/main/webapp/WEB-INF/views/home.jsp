<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>

<style>
@import url('https://fonts.googleapis.com/css?family=Bitter|Roboto');

.divLogo img {
	width: 10%;
	height: 10%;
}

/* .divLogo {
	margin-top: 1%;
	margin-left: 1%;
} */

.divHeader, .divBody, .divAccount {
	text-align: center;
}

.divHeader {
	font-family: 'Bitter', serif;
	font-size: 300%;
}

.divBody {
	background-image: url("resources/image/hero-bg.png");
	background-position: bottom;
	background-repeat: no-repeat;
}

.divMenu {
	text-align: right;
}

.tab-col-s1 a {
	color: #535461;
}

.divAccount a {
	color: #71C55D;
	padding: 1%;
	border: 3.5px solid #71C55D;
	border-radius: 20px;
	font-family: 'Roboto', sans-serif;
}
</style>

<body>
<!-- 	<div class="row">
		<div class="col s6">
			<div class="divLogo">
				<a href="/"><img src="resources/image/marvelousmonday.png"></a>
			</div>
		</div>
		<div class="col s6">
			<div class="divMenu">
				<div class="col s12">
					<ul class="tabs">
						<li class="tab-col-s1"><a href="#test1">About</a></li>
						<li class="tab-col-s1"><a href="/mindMap">마인드맵</a></li>
						<li class="tab-col-s1"><a href="#test3">스크랩</a></li>
						<li class="tab-col-s1"><a href="#test4">공유</a></li>
						<li class="tab-col-s1"><a href="/logout">로그아웃</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div> -->
	
    <div class="row">
    <div class="col s6">6-columns (one-half)</div>
    <div class="col s6">
    	<ul class="tabs">
			<li class="tab-col-s1"><a href="#test1">About</a></li>
			<li class="tab-col-s1"><a href="/mindMap">마인드맵</a></li>
			<li class="tab-col-s1"><a href="#test3">스크랩</a></li>
			<li class="tab-col-s1"><a href="#test4">공유</a></li>
			<li class="tab-col-s1"><a href="/logout">로그아웃</a></li>
		</ul></div>
    </div>
	
	<br>
	<div class="divHeader">Welcome to MindHeya</div>
	<br>
	<div class="divBody">
		<img
			src="https://bootstrapmade.com/demo/themes/eStartup/img/hero-img.png"
			class="mainImg"><br> <br>
	</div>
	<br>
	<c:if test="${sessionScope.loginId==null}">
		<div class="divAccount">
			<a href="goJoin">GET STARTED</a> <a href="login">LOGIN</a>
		</div>
	</c:if>




	<!--Import jQuery before materialize.js-->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
</body>
</html>