<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--Import materialize.css-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');

.logo {
   width: 10%;
}
.divLogo {
   padding-top: 0.5%;
   padding-left: 0.5%;
   margin-botton: -0.5%;
}
.divHeader {
   font-size: 150%;
   text-align: center;
   font-family: 'Noto Sans KR', sans-serif;
   margin-top: 0.5%;
   margin-left: 0.5%;
}
.divMenu{
	text-align: right;
	padding: -0.5%;
	margin-top: -1.5%;
	font-family: 'Noto Sans KR', sans-serif;
	font-weignt: bolder;
	font-size: 150%;
}
.tabs .indicator{
	background-color:#4db6ac;
} 
</style>
</head>
<!-- Firebase App is always required and must be first -->
<script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-app.js"></script>

<!-- Add additional services that you want to use -->
<script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-firestore.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-messaging.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-functions.js"></script>
<!-- Comment out (or don't include) services that you don't want to use -->
<!-- <script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-storage.js"></script> -->
<script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
<!-- Firebase App is always required and must be first -->

<script>
	  // 파이어베이스 초기화 세팅
	  // 본인의 파이어베이스 변수 가져오기(파이어베이스 로그인 -> 프로젝트 선택 -> 좌측메뉴의 Authentication -> 우측 상단의 '웹 설정' 클릭 후 복사 붙이기)
	  var config = {
			    apiKey: "AIzaSyB2cNuvRyMFsiLRaUK0320cBc3GTkpGvK0",
			    authDomain: "firstpractice-190218.firebaseapp.com",
			    databaseURL: "https://firstpractice-190218.firebaseio.com",
			    projectId: "firstpractice-190218",
			    storageBucket: "firstpractice-190218.appspot.com",
			    messagingSenderId: "375340198473"
	  };

	  // Initialize the default app
	  var defaultApp = firebase.initializeApp(config);
	  
	  // You can retrieve services via the defaultApp variable...
	  var defaultStorage = defaultApp.storage();
	  var defaultDatabase = defaultApp.database();
	  
	  /* --------------------------------------------------------------------------------------- */	  
	  
	  //파이어베이스에서 가져온 공유 알림 리스트 객체들을 저장.
	  var notificationArray=[];
	  
	  var leader;	  // 공유하는 사람 id
	  var seq;		  // 공유 맵 시퀀스
	  var groupName;  // 공유 맵 이름
	  var numLimit;	  // 총 공유 인원
	  //var numShare;	//현재 공유 인원
	  //init();
	  $(function(){
	 	  // 로그인한 UserId를 input hidden 태그에서 가져온다.
		  var userId = $('#userId').val();	
		  
	 	  // 파이어베이스에서 가져올 DB 경로 설정
		  var notificationRef = firebase.database().ref('/users/' + userId + '/notification');
	    	
			function loadNotification(snapshot){
				var notiList =JSON.parse(JSON.stringify(snapshot));
				
				for(var key in notiList){

					var leader = notiList[key];
					
				}
				
				
				
				
				
				
				
				notificationRef.once('value').then(function(snapshot){
					var leader = snapshot.child('notification/leader');
					alert(leader);
				});
			}
				
				
				
				
				
				//배열 초기화			
/* 				notificationList = [];

				
				//seq세팅
				for (var key in notiList){
					var notiList2 = JSON.parse(JSON.stringify(notiList[key]));
					
					for(var key2 in notiList2){

						var notiObject = notiList2[key2];
						notificationList.push(notiObject);
					}
				}*/
				
	  });

</script>


<body>
<div class="divLogo">
   <a href="home"><img src="resources/image/marvelousmonday.png" class="logo"></a>
</div>
<br>
<div class="divMenu">
	<div class="col s12">
		<ul class="tabs">
			<li class="tab col s1"><a href="#test1" class="teal-text text-lighten-2">About</a></li>
			<li class="tab col s1"><a href="goMindmap" id="goMindmap" class="teal-text text-lighten-2">마인드맵</a></li>
			<li class="tab col s1"><a href="#test3" id="goScrap" class="teal-text text-lighten-2">스크랩</a></li>
			<li class="tab col s1"><a href="#test4" class="teal-text text-lighten-2">공유</a></li>
		
			<c:if test="${sessionScope.loginId!=null}">
			<li class="tab col s1"><a href="logout" id="logout" class="teal-text text-lighten-2">로그아웃</a></li>
			</c:if>
		</ul>
	</div>
</div>

<input type='hidden' id='userId' value='${sessionScope.loginId}'>
<div class="divHeader">${sessionScope.loginId}님의 공유 마인드맵</div>
<br>
<div>
	<table>
		<tr>
			<td>공유하는 사람</td>
			<td>공유 마인드맵 이름</td>
			<td>공유된 인원/총 공유 인원</td>
			<td>이동</td>
		</tr>
	</table>
</div>
</body>
</html>