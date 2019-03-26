<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>selectMind</title>
<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--Import materialize.css-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
<!--Let browser know website is optimized for mobile-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<style>
@import url('https://fonts.googleapis.com/css?family=Bitter|Noto+Sans+KR');
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');


.optionBtn{
	text-align: center;
}

#createMindMap, #deleteMindMap, #shareMindMap{
	color: white;
	border-radius: 50%;
	box-shadow: 0 5px 15px;
	font-size: 25px;
	float: center;
	width: 300px;
	height: 100px;
	margin: 50px;

}


#createMindMap {
	border: 2px solid #40BBB4;
	background-color: #40BBB4;
}

#deleteMindMap {
	border: 2px solid #F78181;
	background-color: #F78181;
}

#shareMindMap {
	border: 2px solid #3B6EB5;
	background-color: #3B6EB5;
}


.mindMapList {
	margin-left: 5%;
}

.mindGroupName {
	margin-top: 100px;
}
.mindMapDiv {

	border-radius: 50%;
	box-shadow: 0 5px 15px;
	vertical-align: middle;
	border: 2px solid black;
	float: left;
	width: 250px;
	height: 250px;
	margin: 40px;
	text-align: center;
}

.leaderImg {
	width: 30px;
	height: 30px;
}


.divHeader {
   font-size: 150%;
   text-align: center;
   font-family: 'Noto Sans KR', sans-serif;
   margin-top: 0.5%;
   margin-left: 0.5%;
}


/* ----------------------- */
.mainImg{
	width: 800px;
	height: 500px;
}

.logo {
	height: 7.5%;
}
.divLogo {
	padding-top: 0.5%;
	padding-left: 0.5%;
	margin-botton: -0.5%;
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
<script	src="https://www.gstatic.com/firebasejs/5.7.1/firebase-firestore.js"></script>
<script	src="https://www.gstatic.com/firebasejs/5.7.1/firebase-messaging.js"></script>
<script	src="https://www.gstatic.com/firebasejs/5.7.1/firebase-functions.js"></script>

<!-- Comment out (or don't include) services that you don't want to use -->
<!-- <script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-storage.js"></script> -->
<script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
<!-- Firebase App is always required and must be first -->

<!-- <!-- 제이쿼리 사용 임포트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--Optional JavaScript for Bootstrap: jQuery first, then Popper.js, then Bootstrap JS-->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
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
	  
	  //객체별 마인드맵 리스트를 배열로 받는다.
	  var savedList = [];
	  
	  var notificationList = [];
	  
/* --------------------------------------------------------------------------------------- */
	$(function(){
		//로그인한 UserId를 input hidden 태그에서 가져온다.
		var userId = $('#userId').val();	
		//파이어베이스에서 가져올 DB 경로 설정
		var mindRef = firebase.database().ref('/users/' + userId + '/mindMapList');
		
		var notificationRef = firebase.database().ref('/users/' + userId + '/notification');

		
		
		var seq = 0;
		
		var selectFlag = 0;
				
		
		function createMind(){			

			
			for(var i = 0; i < savedList.length; i++){
				
				firebase.database().ref('users/' + userId + '/mindMapList/' + savedList[i].groupName).set({
					
					seq : savedList[i].seq,
					leader : savedList[i].leader,
					groupName : savedList[i].groupName,
					numLimit : savedList[i].numLimit
					
				});

			}
			
			//파이어베이스 저장하기
		}
		
		//파이어베이스 업데이트 값 불러오기
		mindRef.on('value', function(snapshot) {
			loadList(snapshot);
			
		}); 
		
		function loadList(snapshot){
			var mindMapList =JSON.parse(JSON.stringify(snapshot));
			//배열 초기화
			savedList = [];
			
						
			//seq세팅
			for (var key in mindMapList){
				if(mindMapList[key].leader == userId){
					if(mindMapList[key].seq > seq){
						seq = mindMapList[key].seq;
					}
				}
			}
			
			//jArrays를 돌리면서 savedList에 저장해줄 것.
			for (var key in mindMapList) {
				var groupObject = mindMapList[key];
				savedList.push(groupObject); 								
			}			
			
			showMap();
		}
		
		function showMap(){
			
			if(savedList.length == 0){
				return;
			}
			var content = '';
			
			$.each(savedList, function(index, item){
				content += '<div class="mindMapDiv" mind-value="' + item.seq +  '">';
				content += '<div class="mindGroupName" name-value="' + item.groupName + '"><h3>' + item.groupName + '</h3></div>';
				content += '<div class="mindMapLeader" leader-value="' + item.leader + '"><img src="resources/image/leader.png" class="leaderImg">' + item.leader + '</div>';
				content += '<div class="mindMapNumLimit" limit-value="' + item.numLimit +'">Member<br> ' + item.numLimit + '</div>';
				content += '</div>';
				
			});

			$('.mindMapList').html(content);
			
			$('.mindMapDiv').on('click', function(){
				var gotSeq = $(this).attr('mind-value');				
				var leader = $('.mindMapLeader', this).attr('leader-value');
				var groupName = $('.mindgroupName', this).attr('name-value');
				var numLimit = $('.mindMapNumLimit', this).attr('limit-value');
				
				
				if(selectFlag==0){
					if(confirm('이동하시겠습니까?')){
						$('#gotSeq').val(gotSeq);
						$('#leader').val(leader);
						$('#groupName').val(groupName);
						$('#numLimit').val(numLimit);					
						$('#goMap').submit();
						
					} else{
						alert('이동을 취소합니다.');					
					}
				
				} else if(selectFlag==1){
					
					selectFlag = 0;
					if(confirm('삭제하시겠습니까?')){
															
						for(var i = 0; i < savedList.length; i++){
							if(savedList[i].leader == leader){
								if(savedList[i].seq == gotSeq){
									mindRef.child(savedList[i].groupName).remove();									
									savedList.splice(i, 1);
								}
							}
							
						}
						
						
					} else{
						alert('삭제를 취소합니다.');					
					}
					
				} else if(selectFlag == 2){				
					var shareId = prompt("공유할 아이디를 입력해주세요.");
					
					$.ajax({
						url : "selectShare",
						data : {shareId : shareId},
						type : "get",
						success : function(result) {

							if(result=="fail"){
								alert('존재하지 않는 아이디입니다, 다시 선택해주세요.');
							} else {
								selectFlag = 0;
								var question = confirm('존재하는 아이디입니다. 공유 메세지를 보내시겠습니까?');
								if(question){
									alert('메세지를 보냅니다.');
									
									var messageObj = {
											seq : gotSeq,
											leader : leader,
											groupName : groupName,
											numLimit : numLimit
									};
									
									notificationList.push(messageObj);
									
									
									for(var i = 0; i < notificationList.length; i++){
										
										firebase.database().ref('users/' + shareId + '/notification/' +  notificationList[i].leader + '/' + notificationList[i].seq).set({
											
											seq : notificationList[i].seq,
											leader : notificationList[i].leader,
											groupName : notificationList[i].groupName,
											numLimit : notificationList[i].numLimit
	
										});
									}
									
									//알림 처리 기능
									
									
									//공유 받을 사람 칼럼 추가
								    /* var ref = new Firebase('https://firstpractice-190218.firebaseio.com'); */
								    mindRef.on('child_added', function(snapshot) {
								        snapshot.ref().update({shared: shareId});
								    });
									
								} else{
									alert('공유 취소');
								}
							}							
						}
					});

					
				}
				
			});
		}
		notificationRef.on('value', function(snapshot) {
			
			loadNotification(snapshot);
			
		}); 
		
		function loadNotification(snapshot){
			var notiList =JSON.parse(JSON.stringify(snapshot));
			//배열 초기화
			
			notificationList = [];


			
			//seq세팅
			for (var key in notiList){

				var notiList2 = JSON.parse(JSON.stringify(notiList[key]));
				
				for(var key2 in notiList2){

					var notiObject = notiList2[key2];
					notificationList.push(notiObject);
					
				}
			}
			

		}

		
		
		
		
		$("#createMindMap").on("click", function(){
			var groupName;
			var checkName = true;
			

			
			if(savedList.length == 0){
				groupName = prompt("새로운 그룹명을 정해주세요.");
			} else {
			
				//동일한 마인드맵 이름 체크
				while(checkName){
					groupName = prompt("새로운 그룹명을 정해주세요.");
					if(groupName==null){
						alert('등록을 취소합니다.');
						return;
					}					
					for(var i = 0; i < savedList.length; i++){
						
						if(savedList[i].groupName==groupName){
							alert('동일한 이름이 존재합니다.');
							break;
						}
						
						if(i == savedList.length - 1 && checkName == true){
							checkName = false;
						}
					}
				}				
			}
			

			var numLimit = prompt("그룹 인원수를 정해주세요.");	
			if(numLimit==null){
				alert('등록을 취소합니다.');
				return;
			}
			seq = seq + 1;
			var newMap = {
					seq : seq,
					leader : userId,
					groupName : groupName,
					numLimit : numLimit
			}
			
			savedList.push(newMap);
			createMind();	

		});
		
		$('#deleteMindMap').on("click", function(){
			selectFlag = 1;	
			alert('삭제할 마인드맵을 선택하세요');		
		});
		
		$('#shareMindMap').on("click", function(){
			selectFlag = 2;
			alert('공유할 마인드맵을 선택하세요');
		});
		
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
<br>
	<input type='hidden' id='userId' value='${sessionScope.loginId}'>
	<div class="divHeader">${sessionScope.loginId}님의 마인드맵</div>
	<div class="optionBtn">
	<button id="createMindMap">추가</button>
	<button id="deleteMindMap">삭제</button>
	<button id="shareMindMap">공유</button>
	</div>
	<div class="mindMapList"></div>
	<div class="notificationList"></div>
	<form id="goMap" action="goMap" method="GET">
		<input type="hidden" id="gotSeq" name="gotSeq">
		<input type="hidden" id="leader" name="leader">
		<input type="hidden" id="groupName" name="groupName">
		<input type="hidden" id="numLimit" name="numLimit">
	</form>
</body>
</html>