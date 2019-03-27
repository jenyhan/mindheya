<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');

.divHeader {
	font-size: 150%;
	text-align: center;
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 0.5%;
	margin-left: 0.5%;
}
</style>
</head>
<!-- Firebase App is always required and must be first -->
<script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-app.js"></script>

<!-- Add additional services that you want to use -->
<script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-auth.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/5.7.1/firebase-database.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/5.7.1/firebase-firestore.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/5.7.1/firebase-messaging.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/5.7.1/firebase-functions.js"></script>
<!-- Comment out (or don't include) services that you don't want to use -->
<!-- <script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-storage.js"></script> -->
<script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
<!-- Firebase App is always required and must be first -->

<script>
	  // 파이어베이스 초기화 세팅
	  // 본인의 파이어베이스 변수 가져오기(파이어베이스 로그인 -> 프로젝트 선택 -> 좌측메뉴의 Authentication -> 우측 상단의 '웹 설정' 클릭 후 복사 붙이기)
	  var config = {
			    apiKey: ,
			    authDomain: ,
			    databaseURL: ,
			    projectId: ,
			    storageBucket: ,
			    messagingSenderId: 
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
	  
	  $(function(){
	 	  // 로그인한 UserId를 input hidden 태그에서 가져온다.
		  var userId = $('#userId').val();	
		  
	 	  // 파이어베이스에서 가져올 DB 경로 설정
		  var notificationRef = firebase.database().ref('/users/' + userId + '/notification');
	    
		  // DB 정보를 배열 변수에 담아 주는 함수
	      function loadNotifications(){
	    	
			  for(var i = 0; i < notificationArray.length; i++){
	    		
				leader = notificationArray[i].leader;
	    		seq = notificationArray[i].seq;
	    		groupName = notificationArray[i].groupName;
	    		numLimit = notificationArray[i].numLimit;
	    	}
	      }
		  
		  // 배열을 뽑아주는 함수
		  function showNotifications(){
			  if(notificationArray.length == 0){
					return;
				}
				var content = '';
				
				$.each(savedList, function(index, item){
					content += '<tr>';
					content += '<td>'+item.leader'</td>';
					content += '<td>'+item.groupName'</td>';
					content += '<td>'+item.numLimit'</td>';
					content += '<td><button id="goSharedMap">공유 맵으로 이동</button></td>';
					content += '</tr>';
				});

				$().html(content);
		  }
	  });
	  
	  
	  
</script>


<body>
	<input type='hidden' id='userId' value='${sessionScope.loginId}'>
	<div class="divHeader">${sessionScope.loginId}님의공유 마인드맵</div>
	<br>


	<table>
		<tr>
			<td>공유하는 사람</td>
			<td>공유 마인드맵 이름</td>
			<td>공유된 인원/총 공유 인원</td>
			<td>이동</td>
		</tr>

	</table>
</body>
</html>