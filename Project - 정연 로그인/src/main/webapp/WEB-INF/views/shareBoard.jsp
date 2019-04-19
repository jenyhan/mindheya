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
@import url('https://fonts.googleapis.com/css?family=Kosugi+Maru');

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	  
	  var sharedList=[];
	  
	  var leader;	  // 공유하는 사람 id
	  var seq;		  // 공유 맵 시퀀스
	  var groupName;  // 공유 맵 이름
	  var numLimit;	  // 총 공유 인원
	  var numShare;	  //현재 공유 인원

	  $(function(){
		  
	 	  // 로그인한 UserId를 input hidden 태그에서 가져온다.
		  var userId = $('#userId').val();

	 	  // 파이어베이스에서 가져올 DB 경로 설정
		  var notificationRef = firebase.database().ref('/users/' + userId + '/notification');
	    	
 		  notificationRef.on('value', function(snapshot){
			  loadNotification(snapshot);
		  });
		  
 	});
	  
	  //파이어베이스 데이터를 가져와서 변수에 저장하는 함수
	  function loadNotification(snapshot){
			
			//JSON 객체로 리스트 저장
			var notiList = JSON.parse(JSON.stringify(snapshot));
			
			//배열 초기화
			notificationArray = [];
			
			for(var key in notiList){
					
				var leader = notiList[key];
				
				notificationArray.push(leader);

				showNotification(notificationArray);
			}
		}		
				
			
		function showNotification(notificationArray){
	
			var contents = '';
			
			var sharedRef = firebase.database().ref('/users/' + userId + '/mindMapList/mind/shared');
			sharedRef.on('value', function(snapshot){
			var	mindMapList = JSON.parse(JSON.stringify(snapshot));
			})
			
			sharedList = [];
			
			for (var key in mindMapList) {
				var share = mindMapList[key];
				alert(share);
			}
			
			
				
			$.each(notificationArray, function(index, item){
					
				for(var i in item){

					contents += '<table>';
					contents += '<tr class="mindMapSeq" seq-value="'item[i].seq'">';
					contents += 	'<td class="mindMapLeader" leader-value="'+item[i].leader+'">'+item[i].leader+'<td>';
					contents += 	'<td class="mindMapGroup" name-value="'+item[i].groupName+'">'+item[i].groupName+'<td>';
					//contents += 	'<td>'+mindMapList[].shared+'</td>';
					//contents += 	'<td class="mindMapLimit" limit-value="'+item[i].numLimit+'">'+item[i].numLimit+'<td>';
					//contents += 	'<td class="mindMapShare" share-value="'+item[i].numShare+'">'+item[i].numShare+'<td>';
					contents += 	'<td><button class="mindMapDiv">이동<td>';
					contents += '</tr>';
					contents += '</table>';
					
				}
			});
				
			$('.shareTable').html(contents);
			
			$('.mindMapDiv').on('click', function(){

	         	var gotSeq = $('.mindMapSeq', this).attr('seq-value');        
	            var leader = $('.mindMapLeader', this).attr('leader-value');
	            var groupName = $('.mindMapGroup', this).attr('name-value');
	            var numLimit = $('.mindMapLimit', this).attr('limit-value');
			});
			
			if(confirm('이동하시겠습니까?')){
                $('#gotSeq').val(gotSeq);
                $('#leader').val(leader);
                $('#groupName').val(groupName);
                $('#numLimit').val(numLimit);               
                $('#goMap').submit();
			}
		}


</script>


<body>
<div class="divLogo">
   <a href="home"><img src="resources/image/marvelousmonday.png" class="logo"></a>
</div>
<br>
<div class="divMenu">
	<div class="col s12">
		<ul class="tabs">
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
			<td>공유된 id</td>
			<td>이동</td>
     		<td>마인드 맵 삭제</td>
     		<c:if test="${sessionScope.loginId==leader}">
            <td>멤버 삭제</td>
            </c:if>
		</tr>
	</table>
</div>
<div>
<table class="shareTable"></table>
</div>

</body>
</html>