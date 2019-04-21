<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content="">
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
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
@import url('https://fonts.googleapis.com/css?family=Gamja+Flower');
@import url('https://fonts.googleapis.com/css?family=Kosugi+Maru');


		.chooseText {
			font-size: 45px;
      		font-family: 'Gamja Flower', cursive;

		}

		.idTitle {
			font-family: 'Gamja Flower', cursive;
		
		}

</style>

<!-- CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/css/animate.min.css" rel="stylesheet">
    <link href="resources/css/owl.carousel.css" rel="stylesheet">
    <link href="resources/css/owl.transitions.css" rel="stylesheet">
    <link href="resources/css/prettyPhoto.css" rel="stylesheet">
    <link href="resources/css/main.css" rel="stylesheet">
    <link href="resources/css/styles.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="resources/images/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="resources/images/ico/apple-touch-icon-57-precomposed.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head><!--/head-->

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


<body id="home" class="homepage">

    <header id="header">
        <nav id="main-menu" class="navbar navbar-default navbar-fixed-top" role="banner" style="height:100px;">
            <div class="container" style="margin-left: 100px;">
                <div class="navbar-header">
                    <a class="navbar-brand" href="home" style="padding-top: 15px;"><img src="resources/images/marvelousmonday.png" alt="logo" width="200px" height="70px"></a>
                </div>
               <div class="collapse navbar-collapse navbar-right" style="width: 80%;">
                    <ul class="nav navbar-nav" style="width: 170%;">
                        <li class="scroll" style="margin-left:10%; font-size: 180%; font-family: 'Kosugi Maru', sans-serif;"><a href="goMindmap" style="font-size: 90%">MindMap</a></li>
                        <li class="scroll" style="margin-left:10%; font-size: 180%; font-family: 'Kosugi Maru', sans-serif;" ><a href="goScrap" style="font-size: 90%">Scrap</a></li>
                        <li class="scroll" style="margin-left:10%; font-size: 180%; font-family: 'Kosugi Maru', sans-serif;"><a href="goShare" style="font-size: 90%">Share</a></li>                        
						<c:if test="${sessionScope.loginId==null}">
                        <li class="scroll" style="margin-left:10%; font-size: 180%; font-family: 'Kosugi Maru', sans-serif;"><a href="login" style="font-size: 90%">Login</a></li>                        						
						</c:if>
						<c:if test="${sessionScope.loginId!=null}">
                        <li class="scroll" style="margin-left:10%; font-size: 180%; font-family: 'Kosugi Maru', sans-serif;"><a href="logout" style="font-size: 90%">Logout</a></li>                        						
						</c:if>
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
    </header><!--/header-->

    <section id="services" >
        <div class="container" style="width:100%;">

            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown idTitle" style="font-size: 65px;">${sessionScope.loginId}'s MindMap</h2>
                <p class="text-center wow fadeInDown chooseText">マインドヘヤ</p>
            </div>
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
            <div class="row">
                <div class="features" style="width: 100%;">
                </div>
            </div><!--/.row-->    
        </div><!--/.container-->
    </section><!--/#services-->

    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2019 MarvelousMonday.
                </div>
                <div class="col-sm-6">
                </div>
            </div>
        </div>
    </footer><!--/#footer-->

    <input type='hidden' id='userId' value='${sessionScope.loginId}'>

    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/mousescroll.js"></script>
    <script src="resources/js/smoothscroll.js"></script>
    <script src="resources/js/jquery.prettyPhoto.js"></script>
    <script src="resources/js/jquery.isotope.min.js"></script>
    <script src="resources/js/jquery.inview.min.js"></script>
    <script src="resources/js/wow.min.js"></script>
    <script src="resources/js/main.js"></script>

</body>
</html>