<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>HR Theme Two</title>
        <style>
			
		@import url(https://fonts.googleapis.com/css?family=Open+Sans);
		@import url('https://fonts.googleapis.com/css?family=Jua&subset=korean');
		@import url('https://fonts.googleapis.com/css?family=Cute+Font|Jua');
		@import url('https://fonts.googleapis.com/css?family=Kosugi+Maru');
			@import url('https://fonts.googleapis.com/css?family=Gamja+Flower');
		
		.idTitle {
			font-family: 'Gamja Flower', cursive;
		}
		
		.makeText {
			font-size: 50px;
	   		font-family: 'Gamja Flower', cursive;
	   			
		}
		
		#putTxt {
			width:300px;
			height: 40px;
			border: 3px solid #41c121;
			border-radius: 10px;
			font-size: 13px;
			font-style: bold;
		}
		
/* 		#putBtn { */
/* 			background-color: white; */
/* 			border: 3px solid #00B4CC; */
/* 			color: #00B4CC; */
/* 			font-size: 15px; */
/* 		    font-family: Dotum,'돋움',Helvetica,"Apple SD Gothic Neo",sans-serif; */
/* 		    width: 90px; */
/* 		    height: 35px; */
		
/* 		} */
		
		
		#putBtn, #deleteBtn, #updateBtn{
		width: 100px;
		height: 40px;
		border: none;
		margin-top: 5px;
		border: 3px solid #41c121;
		color: #41c121;
		border-radius: 10px;
		}
		
		#deleteBtn{
			background-color: white;
		
		}
		
		#updateBtn{
			background-color: white;
		
		}
		
		#putBtn{
			background-color: white;
		
		}
		
		.search {
		  width: 100%;
		  margin: 5px 0;
		}
		
		.searchTerm:focus{
		  color: #41c121;
		}
		
		.searchTerm {
		margin-top: 5px;
		  width:300px;
		  height: 40px;
		  float: right;
		  border: 3px solid #41c121;
		  padding: 5px;
		  border-radius: 10px;
		  color: #9DBFAF;
		}
		
		
		.searchButton {
		
		font-family: 'Cute Font', cursive;
		  width: 120px;
		  height: 38px;
		  float: right;
		  border: 1px solid #00B4CC;
		  border-radius: 5px;
		  font-size: 50px;
		  color: white;
		  background: #00B4CC;
		  text-align: center;
 		  cursor: pointer; 
		  margin-top: 5px;
		}
		

		.wrap{
			margin-bottom: 5px;
		}	
			
		.icon{
			margin: 2px 10px;
		}	
			
			
		.searchResult {
			width: 390px;
			height: 59px;
			float: left;
			
		}	
			
		#HR{
		float: left;
		width: 100%;
		height: 30px;
		text-align: right;
		
		}
			
		#options {
			background-color: #00B4CC;
			width: 1500px;
 			border: 4px solid #00B4CC;
 			float: left; 

		}
		
		#search {
			border: 1px solid black;
			margin: 5px;
		}
		
		#mainFunc{
			margin: 3px;
		}
		
		#searchTxt {
			border: 3px solid #41c121;
			padding: 5px;
			height: 20px;
			border-radius: 5px;
			outline: none;
			color: #9DBFAF;
			width: 86%;
		}
		
		canvas {
			background-color: #f2f2f2;
			float: left; 
		}
		
		#resultBox {
			
			font-family: 'Cute Font', cursive;
			background-color: #00B4CC;
			color: white;
			width: 400px;
			text-align: center;
			font-size: 50px;
			font-weight: bold;
			float: left;
			height: 58px;
			border-top: 5px solid #00B4CC;
 			border-bottom: 5px solid #00B4CC;
 			border-right: 5px solid #00B4CC;
 			border-left: 5px solid #00B4CC;
		  
		}
		
		.newsListDiv{
			width: 400px;
			height: 1000px;
			background-color: grey;
			float: left;
			overflow: auto;
			border-left: 2px dashed #00B4CC;
			
		}
				
		.newsDiv {
			border-radius: 15px;
			width: 370px;
			background-color: #00B4CC;
			border: 2px solid grey;
			margin-top : 5px;
			margin-left : 5px;
			vertical-align: middle;
		}		
		
		.title {
		
			font-size: 25px;
			border-radius: 5px;
			width: 350px;
			line-height:1.5em;
			background-color: #565252;
			color: white;
			margin: 10px;
			padding-top: 5px;
			text-align: center;
			font-family: helvetica, 'M PLUS Rounded 1c', 'Cute Font';
			/* border: 2px solid grey; */
		}
		
		.press {
			font-family: helvetica, 'M PLUS Rounded 1c', 'Cute Font';
			font-size: 20px;
			margin-top: 5px;
			text-align: right;
		}

		.address{

			text-align: center;
		}
				  
		.address a{			
			font-family: 'Cute Font', cursive;
			font-size: 25px;
		}		  
		
		.addBtn {
			text-align: right;
		}
				  
		.summary{
			font-family: helvetica, 'M PLUS Rounded 1c', 'Cute Font';
			line-height: 30px;
			font-weight: bold;
			color: white;
			font-size: 25px;
			margin-left: 10px;
			margin-right: 10px;
			
		}		  
		
		#loadingDiv{

			float: left;
			background-color: grey;
			width: 100%;
			height: 100%;
			text-align: center;
			vertical-align: middle;
			
		}

		#loadingDiv h2{
		
			line-height: 500px;
			text-align: center;
			font-size: 70px;
			color: white;
			font-family: 'Cute Font', cursive;

		}

		#loadingDiv2{

			float: left;
			background-color: grey;
			width: 100%;
			height: 100%;
			text-align: center;
			vertical-align: middle;
			
		}

		#loadingDiv2 h2{
		
			line-height: 500px;
			text-align: center;
			font-size: 70px;
			color: white;
			font-family: 'Cute Font', cursive;

		}
		
		.bmBtn {
			width: 50px;
			height: 50px;
		}
		
		.noResultDiv {
			margin-top : 70px;
			text-align: center;
		}

		.noResultDiv h2 {
			color: white;
			font-family: 'Cute Font', cursive;
			font-size: 70px;
		
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
    <link href="https://fonts.googleapis.com/css?family=M+PLUS+Rounded+1c" rel="stylesheet">
    
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="resources/images/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="resources/images/ico/apple-touch-icon-57-precomposed.png">
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

<!-- 제이쿼리 사용 임포트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!--Optional JavaScript for Bootstrap: jQuery first, then Popper.js, then Bootstrap JS-->
<script>
		$(function() {
			
 			document.body.style.zoom = "80%";			


			$('#logout').on("click", function() {
				alert('로그아웃합니다.');
				$('#hiddenlogout').submit();
			});
			
			 /* ----------------------------기사 테스트------------------------------ */
			$('.searchButton').on("click", function(){
								
				$(".newsListDiv").html("");

				$(".newsListDiv").css("overflow","visible");
				
				var readyHtml = '<div id="loadingDiv">';
				readyHtml += '<h2>Loading...</h2>';
				readyHtml += '</div>';
				
				$(".newsListDiv").html(readyHtml);

				$("#loadingDiv").addClass("readyHtml");
				
				var keyWord = $(".searchTerm").val();
				
				/* 영어인지, 한글인지 아니면 그외 else인지 확인해서 처리하자. */
				
				if (/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(keyWord)) {
					
					$.ajax({
						url : "selectContentKr",
						data : {title:keyWord},
						type : "get",
						success : function(result) {
							
						output(result); 

						$(".newsListDiv").css("overflow","auto");
						
						}
					});
					
				} else if (/^[a-zA-Z]+$/.test(keyWord)) {
					
					$.ajax({
						url : "selectContentEn",
						data : {title:keyWord},
						type : "get",
						success : function(result) {
							
						output(result); 

						$(".newsListDiv").css("overflow","auto");
						
						}
					});
					
				} else {

					$.ajax({
						url : "selectContentJp",
						data : {title:keyWord},
						type : "get",
						success : function(result) {
							
						output(result); 

						$(".newsListDiv").css("overflow","auto");
						
						}
					});
					
				}
				
				
			});
	 
	 
			function output(result){			

				var content = ""; 
				
				if(result == ""){
					content += 	'<div class="noResultDiv">';
					content += '<h2>No News</h2>';						
					content += 	'</div>';
				}
				
				if(result != ""){
					$.each(result, function(index, item){

						content += 	'<div class="newsDiv">';
						content += 		'<div class="title">' + item.title + '</div>';
						content += 		'<div class="summary">&nbsp;&nbsp;' + item.summary + '</div>';
						content += 		'<div class="press">' + item.press + '</div>';
						content += 		'<div class="address"><a href="https://news.google.com'+item.address+'" target="_blank" rel="noopener noreferrer">기사 본문보기</a></div>';
						content += 		'<div class="addBtn"><img src="resources/images/bookMarkIcon.png" class="bmBtn" bm-title="'+ item.title + '" bm-summary="'+ item.summary + '" bm-press="'+ item.press + '" bm-address="https://news.google.com'+ item.address + '" bm-img_src="'+item.img_src+'"></div>';						
						content += 	'</div>';

						if(index == 4){
							return false;
						}

					});														
				} 				
	
				$(".newsListDiv").html(content);
				
				$(".bmBtn").off("click").on("click", function(){
					
					var bmTitle = $(this).attr('bm-title');
					var bmSummary = $(this).attr('bm-summary');
					var bmPress = $(this).attr('bm-press');
					var bmAddress = $(this).attr('bm-address');
					var bmImg_src = $(this).attr('bm-img_src');
					
					
					alert("title : " + bmTitle);
					alert("summary : " + bmSummary);
					alert("press : " + bmPress);
					alert("address : " + bmAddress);
					alert("img_src : " + bmImg_src);
					
				 $.ajax({
					url : "insertBM",
					data : {title:bmTitle
							,summary:bmSummary
							,press:bmPress
							,address:bmAddress
							,img_src:bmImg_src
						},
					type : "post",
					success : function(resultData) {
					
						alert("return값 확인 : " + resultData);
						
					/* 나중에 BookMarkList가 들어가졋을때 select으로 불러오자 */
					/* output(result); */ 
					}
					}); 
			 
				});
				
			}
		});
</script>
<script>
	  // 파이어베이스 초기화 세팅
	  //80~86에 본인의 파이어베이스 변수 가져오기(파이어베이스 로그인 -> 프로젝트 선택 -> 좌측메뉴의 Authentication -> 우측 상단의 '웹 설정' 클릭 후 복사 붙이기)
	  var config = {
  		    apiKey: "AIzaSyDvxN2PM3npv7G-5nwr8tZSzY55Fb5LbEE",
		    authDomain: "fir-1400c.firebaseapp.com",
		    databaseURL: "https://myproject-cf946.firebaseio.com",
		    projectId: "myproject-cf946",
		    storageBucket: "myproject-cf946.appspot.com",
		    messagingSenderId: "659201790301"
		  
	  };

	  // Initialize the default app
	  var defaultApp = firebase.initializeApp(config);
	  
	  // You can retrieve services via the defaultApp variable...
	  var defaultStorage = defaultApp.storage();
	  var defaultDatabase = defaultApp.database();

	//파이어베이스에서 가져온 객체들을 저장.
	var savedArray=[];

	var root;	 // 루트 마인드맵을 저장
	var chkRoot;
	var canvas;  // 캔버스 객체
	var ctx;     // 그리기 도구
	var sx, sy;  // 드래그 시작점
	var ex, ey;  // 드래그 끝점
	var drawing; // 그리고 있는 중인가
	var backup;  // 캔버스 객체 백업
	var depColor = ["#0061ff", "#2678ff", "#4e90fc", "#70a6ff", "#89b5ff", "#a8c8ff", "#bcd5ff"];
	
		
	///////////////
	var area = Math.PI * 2; //파이 정보
	var flag = 0;

	//마인드맵 그릴 때의 네모 크기 프리셋
	var rect = {
		width: 40,
		height: 40};

	//삼각함수를 통해 선택된 가장 가까운 객체를 저장
	var selectedObj;

	//수정할 객체를 버퍼에 잠시 저장
	var bufObj;
		
	//입력버튼 관련 객체
	var checkPut = false; //입력버튼 클릭 여부

	//마인드맵 입력시의 Input 내용을 저장
	var saveId;

	//업데이트 드래그 설정
	var draggable = false;

	//확대 기능
	var canvasScale = 1;
	
	
	//jsp가 로드된 후에 실행
	window.onload = function() {
				
		
		var gotSeq = $("#gotSeq").val();
		var leader = $("#leader").val();
		var groupName = $("#groupName").val();
		var numLimit = $("#numLimit").val();
		
		//로그인한 UserId를 input hidden 태그에서 가져온다.
		var userId = $('#userId').val();

		//파이어베이스에서 가져올 DB 경로 설정
		var mindRef = firebase.database().ref('/users/' + userId + '/MapTree/' + groupName);
		
		//body 내의 캔버스를 가져와 객체에 할당.
		canvas = document.getElementById("canvas");
		if (canvas == null || canvas.getContext == null){
			return;
		}
		ctx = canvas.getContext("2d");
			
		//처음 로딩되었을 때.
		//사용자가 처음 로그인하는 사람이라면
		//루트 마인드맵 1개를 가운데에 세팅한다.
		//파이어베이스에서 불러온 객체가 savedArray객체에 저장되는데
		//저장된 객체가 없을 경우 루트 마인드맵을 삽입
		function init(){
			if(savedArray.length!=0 ||!savedArray){
				return;
			}
			var rootId = prompt('마인드맵 주제를 입력하세요.');
			
			if(rootId!=null){	
				root.id = rootId;
			}
			
			savedArray.push(root);
			writeMindMap(savedArray);
		}

		
		
		//로그인한 ID에 대해 아직 아무 마인드맵도 저장하지 않았을 때,
		//루트를 가운데에 미리 세팅하기 위한 객체 설정
		root = {
					x:canvas.width/2 - 50,
					y:canvas.height/2,
					afterX:canvas.width/2 - 50,
					afterY:canvas.height/2,
					parent: 'root',
					id: 'Root Item',
					depth: 0,
					root:true
		};
		
		
		////확대, 축소
		$('#plusBtn').on('click', function(){
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			ctx.translate(100, 100);
			ctx.scale(0.5,0.5);
			
			
		});

		$('#minusBtn').on('click', function(){
			ctx.translate(x, y);
			ctx.scale(2,2);
			
			
		});

		

		$('#putBtn').on('click', function(){
						
			
			//flag 1 : 마인드맵 삽입
			flag = 1;
		
			//Input에서 값을 가져온다.
			var putContent = $('#putTxt').val();
			
			for(var i = 0; i < savedArray.length; i++){
				
				if(savedArray[i].id == putContent){
					alert('이미 존재하는 마인드입니다.');
					flag = 0;
					return;
				}
			}
			
			//Input에 대한 유효성 체크
			if(putContent.trim()!=''){
				checkPut = true;
				saveId = putContent; 
			} else {
				alert('제대로 입력하세요');
				
				//flag는 0으로 
				flag = 0;
			}
		});

		$('#deleteBtn').on('click', function(e){
			e.preventDefault();

			//flag2 세팅 : 삭제
			flag = 2;
			
		});

		$('#updateBtn').on('click', function(e){
			e.preventDefault();

			//flag3 로 설정
			flag = 3;

		});

		
		//캔버스 x값
/* 		function canvasX(clientX) {

		     var bound = canvas.getBoundingClientRect();
			console.log("x : " + (clientX - bound.left) * (canvas.width / bound.width));
		     return (clientX - bound.left) * (canvas.width / bound.width);

		}

		 
		//캔버스 y값
		function canvasY(clientY) {

		     var bound = canvas.getBoundingClientRect();
				console.log("y : " + (clientY - bound.top) * (canvas.height / bound.height));
		     return (clientY - bound.top) * (canvas.height / bound.height);

		} */
		
		function getElementRelativeMousePosition(e, elem) {
			  const rect = elem.getBoundingClientRect();
			  const css = getComputedStyle(document.body);
			  
			  return {
			    x: e.clientX / css.zoom - rect.left,
			    y: e.clientY / css.zoom - rect.top,
			  };
		}

		//회인 왈 : 여기 세줄은 패스하셔도 됩니다.
		//알고리즘을 다시 바꾸어야 한다.
		//먼저 저장할 때 알고리즘을 바꾸어야 한다.
		
		//마인드맵의 원리
		//화면을 클릭할 때 선이 아닌, 객체가 움직여야 한다.
		//자리에 놓였을 때 x, y값은 피타고라스에 의해 선택된 부모의 x,y값이 설정되어야 한다.
		//자리에 놓였을 때 부모의 id는 피타고라스에 의해 선택된 부모의 id가 설정되어야 한다.
		//afterX, afterY 값은 본인의 위치가 설정되어야 한다.
		
		//onMouseDown을 사용해야 할 때
		//0.마인드맵을 움직일 때마다 파이어베이스에 업데이트해야한다.
		//1.입력을 해야할 때 flag 1
		//2.삭제를 해야할 때 flag 2
		//3.수정을 해야할 때 flag 3
		canvas.onmousedown = function(e) {
			e.preventDefault();			
			

			// 시작 x, y좌표 구함
			sx = getElementRelativeMousePosition(e, canvas).x;
			sy = getElementRelativeMousePosition(e, canvas).y;
 						
			
			if(flag==0){
				
				//피타고라스 함수로 가장 가까운 객체를 선택
				pita(sx,sy);

				if(typeof(selectedObj.root) !== 'undefined'){
					chkRoot = true;
				}
								
				$('.searchTerm').val(selectedObj.id);
				$('.searchButton').trigger('click');
				
				//움직임을 boolean으로 설정
				draggable = true;
				
				//현재의 canvas에 그려진 객체들을 유지시킨다.
				backup = ctx.getImageData(0, 0, canvas.width, canvas.height);
				
				//버퍼 객체에 pita()로 선택된 객체를 담아둔다.
				bufObj = selectedObj;

			} else if(flag==1) {
			
				//피타고라스 함수로 가장 가까운 객체를 선택
				pita(sx, sy);

				//피타고라스 함수로 가장 가까운 객체를 선택
				backup = ctx.getImageData(0, 0, canvas.width, canvas.height);

				drawing = true;

				//유효성체크 합격 여부를 boolean으로 확인
				//실패시는 그냥 return
				if(!checkPut){
		    		return;
				}

			} else if(flag==2) {

				//피타고라스 함수로 가장 가까운 객체를 선택
				pita(sx, sy);
				
				//루트 객체는 root 필드를 갖는다.
				//루트 객체는 삭제할 수 없다.
				if(typeof(selectedObj.root) !== 'undefined'){

				 	alert('루트는 삭제할 수 없습니다.');
				 	flag = 0;
				 	return;
				 	
				}

				//피타고라스로 셀렉트된 객체를 삭제 관련 함수로 전달
				deleteMindMap(selectedObj);	
				
				//flag는 0으로 변경
				flag=0;
				return;

			} else if(flag==3) {
			
				//flag는 0으로
				flag = 0;

				
				//피타고라스로 가장 가까운 객체 선택
				pita(sx, sy);
				
				//수정할 내용을 입력받아 updateId에 저장
				var updateId =	prompt('수정할 내용을 입력하세요', selectedObj.id);					

				//유효성 체크 1: updateId가 값이 없으면 취소
				if(updateId==null){
					alert('취소하셨습니다.');
					return;
				}
				
				//유효성 체크 2: 수정하려는 것이 이미 있는 마인드맵의 이름이면 수정되면 안된다.
				for(var i = 0; i < savedArray.length; i++){

					if(savedArray[i].id == updateId){
						alert('이미 존재하는 아이디는 사용할 수 없습니다.');
						return;
					}
				}

				
				
				
				for(var i = 0; i < savedArray.length; i++){
					if(savedArray[i].parent == selectedObj.id){
						mindRef.child(savedArray[i].id).update({parent : updateId});
					}										
				}
				

				
				for(var i = 0; i < savedArray.length; i++){
					if(savedArray[i].id == selectedObj.id){
						
						mindRef.child(savedArray[i].id).once('value').then(function(snapshot) {
	
							mindRef.child(savedArray[i].id).remove();
							
							mindRef.child(updateId).set(snapshot.val());  
							mindRef.child(updateId).update({id:updateId});
	
						});
						break;
					}					
				}


			}

	
		}
			
			//마우스가 움직일 때
			//flag 0: 마인드맵의 위치를 변경
			//flag 1: 입력
			canvas.onmousemove = function(e) {
				e.preventDefault();

				
				if(flag==0){
						
					//루트 체크해서 이동 불가 처리
					if(chkRoot){
						
						chkRoot = false;
						draggable = false;
						selectedObj=null;
						return;
						
					}
					
					
					//1.1 onmousedown에서 draggable에 true가 되어 있다면
					if (draggable) {
						
						//1.2 onmousedown에서 백업뜬 위치에서 그리기를 시작한다.
						ctx.putImageData(backup, 0, 0);

						//1.3 마우스를 누른 순간 가장 가까운 아이를 선택한 상태에서 무브 메서드 발동
						//1.4 selectedObj에는 선택한 아이가 저장되어 있다.
						
						ex = getElementRelativeMousePosition(e, canvas).x;
						ey = getElementRelativeMousePosition(e, canvas).y;
						
 
						//1.5 선택된 객체를 제외한 아이들 중 부모 객체를 찾는 메서드 발동
						//결과로 selectedObj 에는 엄마 객체가 저장. 아이는 buf에 저장되어 있음.
						
						//bufObj에는 onmousedown에서 선택된 객체가 저장되어 있다.
						//해당 객체의 위치 변경후 좌표를 afterX, afterY에 저장
						bufObj.afterX = ex;
						bufObj.afterY = ey;

						
						//1. 버퍼에 저장되어 있는 id를 savedArray에서 찾아 bufObj로 대체
						//2. 해당 객체를 부모 객체로 갖는 자식들. 자식들이 갖고있는 부모 객체의 좌표 x,y 갱신
						for(var i = 0; i < savedArray.length; i++){

							//1.
							if(savedArray[i].id == bufObj.id){
								mindRef.child(savedArray[i].id).update(bufObj);								/* savedArray[i] = bufObj; */
							}

							//2.
							if(savedArray[i].parent==bufObj.id){		
								mindRef.child(savedArray[i].id).update({x:bufObj.afterX, y:bufObj.afterY});
							}
						}
					}
					
				} else if(flag==1){
				
					//유효성검사 통과여부 체크
					if(!checkPut){
						return;
					}

					ex = getElementRelativeMousePosition(e, canvas).x;
					ey = getElementRelativeMousePosition(e, canvas).y;

					// 백업한 상태에서 선 그림
					if (drawing) {
						ctx.putImageData(backup, 0, 0);
						ctx.beginPath();
						ctx.moveTo(sx, sy);
						ctx.lineTo(ex, ey);
						// ctx.stroke();
					}

				} else if(flag==3){
					
					// 작업이 필요없음.

				}
			}

			//마우스를 놓았을 때
			//flag 0: 마인드맵의 위치 변경을 마침(return)
			//flag 1: if문에서 유효성검사만 다시 체크. return 하지 않고 if 문 아래 삽입 작업
			//flag 2: flag를 0으로 세팅하고 마침(return)
			//flag 3: 작업중
			canvas.onmouseup = function(e) {
				
				ex = getElementRelativeMousePosition(e, canvas).x;
				ey = getElementRelativeMousePosition(e, canvas).y;

				drawing = false;
				draggable = false;
				
				if(flag==0){
					
					return;

				} else if(flag==1){

					flag=0;

					//유효성 체크 여부 확인
					if(!checkPut){
						return;
					}
					
					
					pita(ex, ey);

				} else if(flag==2){

					flag == 0;
					return;

				}else if(flag==3){

					return;
				}


				// 부모 아이디 설정
				// 피타고라스로 선택된 객체(selectedObj)가 있는지 없는지의 여부에 따라 부모의 id, x, y가 결정
				// 마인드맵이 루트 마인드맵만 존재하는 경우 루트 마인드맵의 값이 저장됨.
				var parentId = (typeof(selectedObj) == 'undefined'||selectedObj == null)? saveId : selectedObj.id;
				var parentX = (typeof(selectedObj) == 'undefined'||selectedObj == null)? ex : selectedObj.afterX;
				var parentY = (typeof(selectedObj) == 'undefined'||selectedObj == null)? ey : selectedObj.afterY;
				var newDepth = (typeof(selectedObj) == 'undefined'||selectedObj == null)? 0 : selectedObj.depth + 1;

				// Firebase에 저장할 객체
				// x      : 부모 객체의 x좌표
				// y      : 부모 객체의 y좌표
				// afterX : 본인의 x좌표
				// afterY : 본인의 y좌표
				// parent : 부모의 id
				// id     : 본인의 id
				var newObj={
						x:parentX,
						y:parentY,
						afterX:ex,
						afterY:ey,
						parent: parentId,
						id: saveId,
						depth: newDepth
					};
				
				// 새로 만든 객체를 savedArray에 추가한 후, Firebase에 저장
				savedArray.push(newObj);
				writeMindMap(savedArray);

				//유효성 체크를 닫는다.
				checkPut = false;
			}
		
			
			// 피타고라스를 적용하여 가장 가까운 객체를 savedArray에서 선택
			// cx, cy는 입력받는 x좌표와 y좌표(여기서는 마우스 클릭한 좌표)
			function pita(cx, cy){

				//선택하는 객체를 저장
				var selectOne;
	
				// 거리값 버퍼
				var buf = 0;

				//배열이 0일 경우 return
				if(savedArray.length==0){
					return; 
				}
	
				//배열을 돌며 거리 값을 비교
				for(var i = 0; i < savedArray.length; i++){
				
					//savedArray의 객체의 위치값(after)과 파라미터로 받은 마우스 위치값을 뺀다.
				 	var calX = savedArray[i].afterX - cx;
				 	var calY = savedArray[i].afterY - cy;
				 	
				 	//피타고라스 정의(a제곱 + b제곱으로 대각선 길이를 구한다.)
				 	var pitagoras = (calX * calX) + (calY * calY);
				  
	
				 	//i가 0일 경우에 selectOne에 첫번째 객체를 세팅해둔다.
				 	//buf 필드에 pitagoras 거리 값을 세팅
				 	//for문을 돌면서 거리값이 더 작은 객체를 selectOne에 세팅
				 	if(i==0){
				 		selectOne = savedArray[i];
				 		buf = pitagoras;
				 		continue;
				 	}
	
				 	//i가 0이 아닐 경우 + 현재 for문의 pitagoras 거리 값이 buf보다 작다면
				 	//buf에 더 작은 pitagoras 값을 세팅
				 	//selectedOne 객체에도 해당 for문의 객체를 저장
				 	if(pitagoras < buf){					
						buf = pitagoras;
				 		selectOne = savedArray[i];
				 	}
				};			
				
				//for문의 결과 selectedOne에 가장 가까운 객체가 세팅된다.
				//전역변수 selectedObj에 선택된 객체를 세팅해준다.
				selectedObj = selectOne;			
			} 

			
			
			
/* ---------------------------------파이어베이스 함수------------------------------------ */

			//Firebase에 값이 update(삽입, 삭제)될 때마다 실행되는 메서드
			mindRef.on('value', function(snapshot) {
	
				//결과값으로 Firebase의 JSON객체를 받는다.
				var key = snapshot;
				
				//화면을 클리어
				ctx.clearRect(0, 0, canvas.width, canvas.height);

				//루프 스테이션으로 snapshot을 전달한다.
				loopStation(snapshot);
			}); 
	
			 
			//받아온 JSON 객체를 하나하나 savedArray에 저장하면서, 화면에 그려준다.
			function loopStation(arrayOri){
				//JSON 객체를 script에서 읽어올 수 있는 작업을 한다.
				var jArrays=JSON.parse(JSON.stringify(arrayOri));
				
				//Firebase 받아와서 savedArray에 저장하기 전에, savedArray를 비워줘야 한다.
				savedArray = [];

				
				//받아올 객체가 없을 경우에는 그냥 return을 한다.
				if(jArrays==null){
					init();

				} else {
					
					//jArrays를 돌리면서 savedArray에 저장해줄 것.
					for (var key in jArrays) {
						var array=jArrays[key];
						savedArray.push(array); 				
											
						//canvas에 그려주는 작업
						//beginPath() : 그려주기 세팅 작업
						ctx.beginPath();
						
						//moveTo() : 그리기 시작할 점 값을 입력(부모의 x, y)
						ctx.moveTo(array.x, array.y);
						
						//lineTo() : 그리기 끝낼 점 값을 입력(본인의 afterX, afterY)
						ctx.lineTo(array.afterX, array.afterY);

						var trans = Math.pow(0.8, array.depth);

						var rgbRef = 'rgba(0, 180, 124, ' + trans + ')';

						ctx.strokeStyle = rgbRef;											
						
						

						//확대

						ctx.lineWidth = 3;

						//stroke() : 줄을 그려준다.
						ctx.stroke();
					}
				}
				
				
				for(var i = 0; i < savedArray.length; i++){

					var trans = Math.pow(0.8, savedArray[i].depth);

					var rgbRef = 'rgba(0, 180, 124, ' + trans + ')';

 					ctx.beginPath();
 					ctx.font = "15px Arial";
					ctx.lineWidth = 5;


  					ctx.strokeStyle = rgbRef;											


 					var txtWidth = ctx.measureText(savedArray[i].id).width;
 					var txtHeight = 50;
 					
 					var radius = 15;
 					
 					var leftX = savedArray[i].afterX - (txtWidth/2);
 					var rightX = savedArray[i].afterX + txtWidth + (txtWidth/2);
 					
 					var topY = savedArray[i].afterY - 40;
					var bottomY = savedArray[i].afterY + 30;
 					
					var leftRadiusX = leftX - 20;
					var rightRadiusX = rightX + 20;

					var topRadiusY = topY + 20;
					var bottomRadiusY = bottomY - 20;
						
 					ctx.moveTo(leftX - 5, topY);
 					ctx.lineTo(rightX, topY);
 					ctx.arcTo(rightRadiusX, topY, rightRadiusX, bottomRadiusY, radius);
 					ctx.lineTo(rightRadiusX, bottomRadiusY);
  					ctx.arcTo(rightRadiusX, bottomY, rightX, bottomY, radius); 
  					ctx.lineTo(leftX, bottomY);
  					ctx.arcTo(leftRadiusX, bottomY, leftRadiusX, topRadiusY, radius);
  					ctx.lineTo(leftRadiusX, topRadiusY);
  					ctx.arcTo(leftRadiusX, topY, leftX, topY, radius); 
  					
  					ctx.stroke();
					ctx.fillStyle = 'white';
					ctx.fill();
					ctx.restore();
					ctx.fillStyle = 'black';
 					
 					ctx.fillText(savedArray[i].id, savedArray[i].afterX, savedArray[i].afterY);
 					ctx.closePath();
 					 
 
 
				}
			}	

			
			//파이어베이스 저장 메서드(파라미터 : savedArray)
		  	function writeMindMap(mindObjs) {

				//savedArray를 for문으로 하나하나 객체를 선택하여 Firebase에 저장
				for(var i=0; i<mindObjs.length; i++){
					
					//if로 조건을 나눈다.
					//1.root 필드가 없는 객체는 root 필드 없이 저장
					//2.root값이 있는지 조사하여, root 필드가 있는 객체는 root 필드도 저장해준다.
					if(typeof(mindObjs[i].root) == "undefined"){
						//저장할 경로를 설정
						firebase.database().ref('users/' + userId + '/MapTree/' + groupName + '/' + mindObjs[i].id).set({
			    
				    	x: mindObjs[i].x,
				    	y: mindObjs[i].y,
				    	afterX:mindObjs[i].afterX,
				    	afterY:mindObjs[i].afterY,
				    	parent:mindObjs[i].parent,
				    	id:mindObjs[i].id,
				    	depth:mindObjs[i].depth
			    		
						});

					} else {
					
						firebase.database().ref('users/' + userId + '/MapTree/' + groupName + '/' + mindObjs[i].id).set({

						    x: mindObjs[i].x,
						    y: mindObjs[i].y,
				 		   	afterX:mindObjs[i].afterX,
				   			afterY:mindObjs[i].afterY,
				    		parent:mindObjs[i].parent,
				    		id:mindObjs[i].id,
							root:mindObjs[i].root,
					    	depth:mindObjs[i].depth

					    });
					}
					
				}
			};
			

/* ----------------------------------파이어베이스 함수-------------------------------------- */			
			
			
			//1. 해당 마인드맵의 아이디 번호를 받아서 삭제해야 한다.
			//2. 해당 아이디의 번호를 부모로 갖는 마인드맵들을 삭제해야 한다.
			//3. 그 마인드맵들의 번호를 부모를 갖는 마인드맵들을 삭제해야 한다.
			function deleteMindMap(obj) {

				//삭제할 객체의 id를 deleteChild로 보내준다.
				deleteChild(obj.id);	
				
				//피타고라스로 선택된 selectedObj를 null로 변경
				selectedObj = null;
				
			}
			
			//삭제 메서드
			//삭제할 대상 마인드맵 id를 바탕으로 삭제 작업
			//본인도 삭제되면서 자식 객체들도 삭제되어야 한다.
			function deleteChild(id){

				var count = 0;

				function filter(target){
		        let toDelete = [];

			        for(let i = 0; i < savedArray.length; i++){
							
						//target의 id와 array안의 id / parentid 값을 비교.
		     	    	if(savedArray[i].id == target || savedArray[i].parent == target){
	
							//같은 경우에 delete해야할 리스트에 추가
							toDelete.push(i);
	
							//target과 같지 않은 경우에는 if 문의 or 두번째 조건 : 객체의 부모id가 target과 같음을 의미한다.
		     	        	if(savedArray[i].id != target){					
		    	                toDelete = toDelete.concat(filter(savedArray[i].id).slice(1));
		   	             	}
		  	          	}
			        }					
	     	   		
			        return toDelete;
	    		}

	    		var targets = filter(id).sort();			

		    	for(var i = targets.length - 1; i >= 0; i--){								
		    		
		    		//그냥 파이어베이스에서 지우면 알아서 업데이트됨
		    		mindRef.child(savedArray[targets[i]].id).remove();
		    		
		    	}
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
                        <li class="scroll" style="margin-left:15%; font-size: 200%; font-family: 'Kosugi Maru', sans-serif;"><a href="goMindmap" style="font-size: 90%">MindMap</a></li>
                        <li class="scroll" style="margin-left:15%; font-size: 200%; font-family: 'Kosugi Maru', sans-serif;" ><a href="goScrap" style="font-size: 90%">Scrap</a></li>
                        <li class="scroll" style="margin-left:15%; font-size: 200%; font-family: 'Kosugi Maru', sans-serif;"><a href="goShare" style="font-size: 90%">Share</a></li>                        
						<c:if test="${sessionScope.loginId==null}">
                        <li class="scroll" style="margin-left:15%; font-size: 200%; font-family: 'Kosugi Maru', sans-serif;"><a href="login" style="font-size: 90%">Login</a></li>                        						
						</c:if>
						<c:if test="${sessionScope.loginId!=null}">
                        <li class="scroll" style="margin-left:15%; font-size: 200%; font-family: 'Kosugi Maru', sans-serif;"><a href="logout" style="font-size: 90%">Logout</a></li>                        						
						</c:if>
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
    </header><!--/header-->



    <section id="servicesMap" >
        <div class="container">
            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown idTitle" style="margin-top:100px; font-size:80px;">${sessionScope.loginId}'s MindMap</h2>
                <p class="text-center wow fadeInDown makeText">マインドヘヤ</p>
            </div>
            <div class="row">
                <div class="features" style="width: 110%; margin-left:5%;">
                </div>
            </div><!--/.row-->    
        </div><!--/.container-->
    </section><!--/#services-->
	
	<div class = "bar">
	<div id="options">
		<div id="mainFunc">
		
			<div class="keys">
				<input type="text" id="putTxt">
				<input type="button" id="putBtn" value="등록">
				<input type="button" id="updateBtn" value="수정">			
				<input type="button" id="deleteBtn" value="삭제">
				<input type="button" id="plusBtn" value="+">
				<input type="button" id="minusBtn" value="-">
				
			
			<input type="button" class="searchButton" value="Search"></input>
			<input type="text" class="searchTerm" placeholder="What are you looking for?">
			</div>
		</div>
	</div>
	<div id="searchResult" class="searchResult">
			<input type="text" id="resultBox" value="News List" disabled>
			<div class="newsListDiv">
				<div id="loadingDiv2">
					<h2>Click Your Mind</h2>
				</div>
			</div>
	</div>	
	<canvas id="canvas" width="1500px" height="1000px">; 
		이 브라우저는 캔버스를 지원하지 않습니다.
	</canvas>

		
	</div>
	<input type="hidden" id="gotSeq" name="gotSeq" value="${mindMap.gotSeq}">
	<input type="hidden" id="leader" name="leader" value="${mindMap.leader}">
	<input type="hidden" id="groupName" name="groupName" value="${mindMap.groupName}">
	<input type="hidden" id="numLimit" name="numLimit" value="${mindMap.numLimit}">

	<form id="goMap" action="goMap" method="GET">
      <input type="hidden" id="gotSeq" name="gotSeq">
      <input type="hidden" id="leader" name="leader">
      <input type="hidden" id="groupName" name="groupName">
      <input type="hidden" id="numLimit" name="numLimit">
   </form>

    <footer id="footer" style="width:100%; height:100px; float: left;">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2019 MarvelousMonday.
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