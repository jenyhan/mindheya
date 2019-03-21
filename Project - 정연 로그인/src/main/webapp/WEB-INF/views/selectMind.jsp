<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>selectMind</title>
<style>

	.mindMapDiv {
		border: 1px solid black;
		float: left;
		width: 100px;
		height: 100px;
		margin: 10px;
	}

</style>
</head>
<!-- Firebase App is always required and must be first -->
<script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-app.js"></script>

<!-- Add additional services that you want to use -->
<script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-database.js"></script>
<script	src="https://www.gstatic.com/firebasejs/5.7.1/firebase-firestore.js"></script>
<script	src="https://www.gstatic.com/firebasejs/5.7.1/firebase-messaging.js"></script>
<script	src="https://www.gstatic.com/firebasejs/5.7.1/firebase-functions.js"></script>

<!-- Comment out (or don't include) services that you don't want to use -->
<!-- <script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-storage.js"></script> -->
<script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
<!-- Firebase App is always required and must be first -->

<!-- 제이쿼리 사용 임포트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!--Optional JavaScript for Bootstrap
    jQuery first, then Popper.js, then Bootstrap JS-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script>
	  // 파이어베이스 초기화 세팅
	  //80~86에 본인의 파이어베이스 변수 가져오기(파이어베이스 로그인 -> 프로젝트 선택 -> 좌측메뉴의 Authentication -> 우측 상단의 '웹 설정' 클릭 후 복사 붙이기)
	  var config = {
			    apiKey: "AIzaSyDbP5rLbpe6JFedjvFxaI3gM2jm1REFrJ8",
			    authDomain: "web-crawling-6562b.firebaseapp.com",
			    databaseURL: "https://web-crawling-6562b.firebaseio.com",
			    projectId: "web-crawling-6562b",
			    storageBucket: "web-crawling-6562b.appspot.com",
			    messagingSenderId: "407695243177"
	  };
	
	  // Initialize the default app
	  var defaultApp = firebase.initializeApp(config);
	  
	  // You can retrieve services via the defaultApp variable...
	  var defaultStorage = defaultApp.storage();
	  var defaultDatabase = defaultApp.database();		
/* --------------------------------------------------------------------------------------- */

	$(function(){
		//로그인한 UserId를 input hidden 태그에서 가져온다.
		var userId = $('#userId').val();	
		//파이어베이스에서 가져올 DB 경로 설정
		var mindRef = firebase.database().ref('/users/' + userId);
		
		//객체별 마인드맵 리스트를 배열로 받는다.
		var savedList = [];

		var seq = 0;
		
		function createMind(newMap){
			//파이어베이스 저장하기
			firebase.database().ref('users/' + userId + '/' + newMap.groupName).set({	    
				
				seq : ++seq,
				leader : userId,
				groupName : newMap.groupName,
				numLimit : newMap.numLimit
				
			});

		}

		
		//파이어베이스 업데이트 값 불러오기
		mindRef.on('value', function(snapshot) {
			
			loadList(snapshot);
			
		}); 
		
		function loadList(snapshot){
			var mindMapList =JSON.parse(JSON.stringify(snapshot));
			
			savedList = [];
			
			//seq세팅
			for (var key in mindMapList){
				if(mindMapList[key].leader == userId){
					if(mindMapList[key].seq > seq){
						seq = mindMapList[key].seq;
					}
				}
			}
			
			//jArrays를 돌리면서 savedArray에 저장해줄 것.
			for (var key in mindMapList) {
				var groupObject = mindMapList[key];
				savedList.push(groupObject); 								
			}
			
			showMap();
		}
		
		function showMap(){
			var content = '';
			
			$.each(savedList, function(index, item){
				content += '<div class="mindMapDiv" mind-value="' + item.seq +  '">';
				content += '<div class="mindMapLeader" leader-value="' + item.leader + '"> 리더 : ' + item.leader + '</div>';
				content += '<div class="mindgroupName" name-value="' + item.groupName + '"> 제목 : ' + item.groupName + '</div>';
				content += '<div class="mindMapNumLimit" limit-value="' + item.numLimit +'"> 인원 제한 : ' + item.numLimit + ' 명 </div>';
				content += '</div>';
			});

			$('.mindMapList').html(content);
			
			$('.mindMapDiv').on('click', function(){
				var gotSeq = $(this).attr('mind-value');				
				var leader = $('.mindMapLeader', this).attr('leader-value');
				var groupName = $('.mindgroupName', this).attr('name-value');
				var numLimit = $('.mindMapNumLimit', this).attr('limit-value');
				
				if(confirm('이동하시겠습니까?')){
					$('#gotSeq').val(gotSeq);
					$('#leader').val(leader);
					$('#groupName').val(groupName);
					$('#numLimit').val(numLimit);					
					$('#goMap').submit();
					
				} else{
					alert('이동을 취소합니다.');					
				}
				
			});
		}


		$("#createMindMap").on("click", function(){
			var groupName = prompt("새로운 그룹명을 정해주세요.");
			var numLimit = prompt("그룹 인원수를 정해주세요.");		

			var newMap = {
					groupName : groupName,
					numLimit : numLimit
			}
			
			createMind(newMap);

		});
		
		
		
	});
	
	
	
	</script>
<body>
	<input type='hidden' id='userId' value='${sessionScope.loginId}'>
	<div class="divHeader">${sessionScope.loginId}님의마인드맵</div>
	<button id="createMindMap">추가</button>
	<button id="deleteMindMap">삭제</button>
	<div class="mindMapList"></div>
	
	<form id="goMap" action="goMap" method="GET">
		<input type="hidden" id="gotSeq" name="gotSeq">
		<input type="hidden" id="leader" name="leader">
		<input type="hidden" id="groupName" name="groupName">
		<input type="hidden" id="numLimit" name="numLimit">
	</form>
	
	
	
</body>
</html>