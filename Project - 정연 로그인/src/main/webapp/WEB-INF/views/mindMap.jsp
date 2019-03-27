<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>drawlines</title>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css?family=Bitter|Noto+Sans+KR');

.divHeader {
   font-size: 150%;
   text-align: center;
   font-family: 'Noto Sans KR', sans-serif;
   margin-top: 0.5%;
   margin-left: 0.5%;
}

.dropdown {
	text-align: right;
}

canvas {
	border: 5px solid #71C55D;
	float: center;
}

#menuBoard {
	float: left;
	width: 15%;
	height: 100%;
	border: 2px solid black;
	background-color: teal;
}

#menuBoard div {
	border: 1px solid yellowgreen;
	text-decoration-color: white;
	font-size: 100%;
	text-align: center;
	color: white;
	font-weight: bold;
	padding-top: 10%;
	padding-bottom: 10%;
}

#options {
	width: 15%;
	float: left;
	border: 2px solid black;
	margin: 0.5%
}

#mainFunc, #search {
	border: 1px solid black;
	margin: 5px;
}

#searchTxt {
	width: 84%;
}

#resultBox {
	width: 100%;
	text-align: center;
}

.newsListDiv td{
	border: 1px solid black;
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

<!-- 제이쿼리 사용 임포트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!--Optional JavaScript for Bootstrap: jQuery first, then Popper.js, then Bootstrap JS-->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
		$(function() {
			$('#logout').on("click", function() {
				alert('로그아웃합니다.');
				$('#hiddenlogout').submit();
			});
		});
</script>
<script>
	  // 파이어베이스 초기화 세팅
	  //80~86에 본인의 파이어베이스 변수 가져오기(파이어베이스 로그인 -> 프로젝트 선택 -> 좌측메뉴의 Authentication -> 우측 상단의 '웹 설정' 클릭 후 복사 붙이기)
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

	//파이어베이스에서 가져온 객체들을 저장.
	var savedArray=[];

	var root;	 // 루트 마인드맵을 저장
	var canvas;  // 캔버스 객체
	var ctx;     // 그리기 도구
	var sx, sy;  // 드래그 시작점
	var ex, ey;  // 드래그 끝점
	var drawing; // 그리고 있는 중인가
	var backup;  // 캔버스 객체 백업
		
	///////////////
	var area = Math.PI * 2; //파이 정보
	var flag = 0;

	//마인드맵 그릴 때의 네모 크기 프리셋
	var rect = {
		width: 70,
		height: 70};

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
			savedArray.push(root);
			writeMindMap(savedArray);
		}

		
		
		//로그인한 ID에 대해 아직 아무 마인드맵도 저장하지 않았을 때,
		//루트를 가운데에 미리 세팅하기 위한 객체 설정
		root = {
					x:canvas.width/2,
					y:canvas.height/2,
					afterX:canvas.width/2,
					afterY:canvas.height/2,
					parent: 1,
					id: 1,
					root:true
		};
		

		//init 관련된 작업을 시작
		init();


		$('#putBtn').on('click', function(){
						
			
			//flag 1 : 마인드맵 삽입
			flag = 1;
		
			//Input에서 값을 가져온다.
			var putContent = $('#putTxt').val();
			
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
			sx = e.clientX;
			sy = e.clientY;

			if(flag==0){

				//피타고라스 함수로 가장 가까운 객체를 선택
				pita(sx,sy);

				$('#searchTxt').val(selectedObj.id);
				
				
				
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
				if(typeof(selectedObj.root)!='undefined'){

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

				//갱신되어야 할 것 : 선택된 객체의 id, 해당 객체를 부모로 갖고있는 자식들의 부모 id
				for(var i = 0; i < savedArray.length; i++){

					//1. 업데이트 해야할 객체를 찾는다.
					if(savedArray[i].id == selectedObj.id){							

					//2. 업데이트 될 객체의 id를 자식들의 parent에도 업데이트 해야 한다.
					for(var j = 0; j < savedArray.length; j++){
						if(savedArray[j].parent == selectedObj.id){
							savedArray[j].parent = updateId;
						}
					}

					//배열에서 해당 객체를 지우고 다시 넣어주는 작업
					savedArray.splice(i,1);
					selectedObj.id = updateId;
					savedArray.push(selectedObj);

					//작업 완료이므로 break
					break;
					}					
				}
					//Firebase에 저장되어있는 정보 전부 삭제
					mindRef.remove();
					//다시 savedArray에 저장된 객체들을 Firebase에 write
					writeMindMap(savedArray);
					
				}
			}

			//마우스가 움직일 때
			//flag 0: 마인드맵의 위치를 변경
			//flag 1: 입력
			canvas.onmousemove = function(e) {
				e.preventDefault();

				if(flag==0){

					//1.1 onmousedown에서 draggable에 true가 되어 있다면
					if (draggable) {
						
						//1.2 onmousedown에서 백업뜬 위치에서 그리기를 시작한다.
						ctx.putImageData(backup, 0, 0);

						//1.3 마우스를 누른 순간 가장 가까운 아이를 선택한 상태에서 무브 메서드 발동
						//1.4 selectedObj에는 선택한 아이가 저장되어 있다.

						ex = e.clientX;
						ey = e.clientY;

						//아직 설명 부족하므로 참고만 하세요.
						//1.5 선택된 객체를 제외한 아이들 중 부모 객체를 찾는 메서드 발동
						//결과로 selectedObj 에는 엄마 객체가 저장. 아이는 buf에 저장되어 있음.
						
						//bufObj에는 onmousedown에서 선택된 객체가 저장되어 있다.
						//해당 객체의 위치 변경후 좌표를 afterX, afterY에 저장
						bufObj.afterX = e.clientX;
						bufObj.afterY = e.clientY;

						
						//1. 버퍼에 저장되어 있는 id를 savedArray에서 찾아 bufObj로 대체
						//2. 해당 객체를 부모 객체로 갖는 자식들. 자식들이 갖고있는 부모 객체의 좌표 x,y 갱신
						for(var i = 0; i < savedArray.length; i++){

							//1.
							if(savedArray[i].id == bufObj.id){
								savedArray[i] = bufObj;
							}

							//2.
							if(savedArray[i].parent==bufObj.id){
								savedArray[i].x = bufObj.afterX;
								savedArray[i].y = bufObj.afterY;
							}
						}
						
						//세팅된 savedArray로 Firebase에 저장
						writeMindMap(savedArray);

					}
					
				} else if(flag==1){
				
					//유효성검사 통과여부 체크
					if(!checkPut){
					return;
					}
				
					ex = e.clientX;
					ey = e.clientY;

					// 백업한 상태에서 선 그림
					if (drawing) {
						ctx.putImageData(backup, 0, 0);
						ctx.beginPath();
						ctx.moveTo(sx, sy);
						ctx.lineTo(ex, ey);
						// ctx.stroke();
					}

				} else if(flag==3){
					
					// 아직 남겨둠.

				}
			}

			//마우스를 놓았을 때
			//flag 0: 마인드맵의 위치 변경을 마침(return)
			//flag 1: if문에서 유효성검사만 다시 체크. return 하지 않고 if 문 아래 삽입 작업
			//flag 2: flag를 0으로 세팅하고 마침(return)
			//flag 3: 작업중
			canvas.onmouseup = function(e) {
				ex = e.clientX;
				ey = e.clientY;
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
						id: saveId
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

			//무시하시면 됩니다.			
			/* 		//자신을 제외하는 피타고라스
					function pita2(cx, cy, obj){
						//선택하는 애
						var selectOne;
			
						// 거리값 버퍼
						var buf = 0;
			
						//배열을 돌며 거리 값을 비교
						if(savedArray.length==0){
							return; 
						}
			
						//3.12새로운 피타고라스 : 자신의 값과 같은 녀석은 피타고라스 검사에서 제외해야 한다.			
			
						for(var i = 0; i < savedArray.length; i++){
							if(obj.id==savedArray[i].id){
								continue;
							}
						 	var calX = savedArray[i].afterX - cx;
						 	var calY = savedArray[i].afterY - cy;
						 	var pitagoras = (calX * calX) + (calY * calY);
			
						 	if(i==0){
						 		selectOne = savedArray[i];
						 		buf = pitagoras;
						 		continue;
						 	}
			
						 	if(pitagoras < buf){					
								buf = pitagoras;
						 		selectOne = savedArray[i];
						 	}
						};			
						selectedObj = selectOne;			
					} 
			 */

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
				
				//받아올 객체가 없을 경우에는 그냥 return을 한다.
				if(jArrays==null){
					return;
				}
				
				//Firebase 받아와서 savedArray에 저장하기 전에, savedArray를 비워줘야 한다.
				savedArray = [];
				
				//jArrays를 돌리면서 savedArray에 저장해줄 것.
				for (var key in jArrays) {
					var array=jArrays[key];
					savedArray.push(array); 				
					
					//savedArray에 객체가 없으면 init()을 돌린다.
					init();				
					
					//canvas에 그려주는 작업
					//beginPath() : 그려주기 세팅 작업
					ctx.beginPath();
					
					//moveTo() : 그리기 시작할 점 값을 입력(부모의 x, y)
					ctx.moveTo(array.x, array.y);
					
					//lineTo() : 그리기 끝낼 점 값을 입력(본인의 afterX, afterY)
					ctx.lineTo(array.afterX, array.afterY);
					
					//stroke() : 줄을 그려준다.
					ctx.stroke();
				}

				//마찬가지로 해당 위치에 네모를 그려줘야 한다.
				for (var key in jArrays) {
					var array=jArrays[key];
					ctx.strokeRect(array.afterX - (rect.width/2), array.afterY - (rect.height/2), rect.width, rect.height);
					ctx.clearRect(array.afterX - (rect.width/2), array.afterY - (rect.height/2), rect.width, rect.height);
	
					ctx.fillText('id : ' + array.id, array.afterX - 3, array.afterY + 3);
					ctx.fillText('parent : ' + array.parent, array.afterX - 3, array.afterY +13);
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
				    	id:mindObjs[i].id
			    		
						});

					} else {
					
						firebase.database().ref('users/' + userId + '/MapTree/' + groupName + '/' + mindObjs[i].id).set({

						    x: mindObjs[i].x,
						    y: mindObjs[i].y,
				 		   	afterX:mindObjs[i].afterX,
				   			afterY:mindObjs[i].afterY,
				    		parent:mindObjs[i].parent,
				    		id:mindObjs[i].id,
							root:mindObjs[i].root

					    });
					}
				}
			};
			

			//1. 해당 마인드맵의 아이디 번호를 받아서 삭제해야 한다.
			//2. 해당 아이디의 번호를 부모로 갖는 마인드맵들을 삭제해야 한다.
			//3. 그 마인드맵들의 번호를 부모를 갖는 마인드맵들을 삭제해야 한다.
			function deleteMindMap(obj) {

				//삭제할 객체의 id를 deleteChild로 보내준다.
				deleteChild(obj.id);	
				
				//피타고라스로 선택된 selectedObj를 null로 변경
				selectedObj = null;

				//Firebase DB를 삭제하고, 다시 savedArray를 저장해줘야 한다.
				mindRef.remove();

				//savedArray에 부모가 없으면 부모(root)를 넣어서 저장해준다.
				if(savedArray.length==0){
					savedArray.push(root);
				}
				
				writeMindMap(savedArray);			
			}

			//수정과 관련된 메서드
			//prompt에서 입력받은 수정 내용을 해당 객체 id에 전달
			function updateArray(updateObj){
				
				for(var i = 0; i < savedArray.length; i++){
					if(savedArray[i].id == updateObj.id){
						savedArray[i].id = updateObj.id;
					}
				}
			}

			//삭제 메서드
			//삭제할 대상 마인드맵 id를 바탕으로 삭제 작업
			//본인도 삭제되면서 자식 객체들도 삭제되어야 한다.
			function deleteChild(id){

				var count = 0;

				function filter(target){
		        let toDelete = [];
	     	   for(let i = 0; i < savedArray.length; i++){
						
							count++;
							
							if(count>100){
								alert('overFlow');
								alert('에러 발생 : 부모와 자식값을 확인');
								
								return;
							}

							//target의 id와 array안의 id / parentid 값을 비교.
	     	      if(savedArray[i].id == target || savedArray[i].parent == target){

									//같은 경우에 delete해야할 리스트에 추가
						       toDelete.push(i);

									 //target과 같지 않은 경우에는 if 문의 or 두번째 조건 : 객체의 부모id가 target과 같음을 의미한다.
	     	           if(savedArray[i].id != target){
												
												//1. 재귀 함수를 통해 해당 아이디를 가지고 toDelete 리스트를 작성
												//2. concat을 통해 계속적으로 기존 toDelete에 추가
												//3.

	    	                toDelete = toDelete.concat(filter(savedArray[i].id).slice(1));
	   	             }
	  	          }
		        }					
	     	   return toDelete;
	    	}

	    	var targets = filter(id).sort();			

	    	for(var i = targets.length - 1; i >= 0; i--){								
	    		savedArray.splice(targets[i],1);
	    	}
			}
			
			
			
 /* ----------------------------기사 테스트------------------------------ */
		$('#searchBtn').on("click", function(){
		
			var keyWord = $("#searchTxt").val();

			$.ajax({
				url : "selectContent",
				data : {title:keyWord},
				type : "get",
				success : function(result) {

				output(result); 
				}
			});
			
		});
		
 
		function output(result){			
			
			var content = '<tr>';
			content += '<th class="big">뉴스 제목</th>';				
			content += '</tr>';
			
			if(result != ""){
				$.each(result, function(index, item){
					content += '<tr>';
					content += '<td class="title">' + item.summary + '</td>';
					content += '</tr>';
				});
			}
			$(".newsListDiv").html(content);
		}
 
 
 
	}	

	//무시하시면 됩니다.
	/* 	//수정
		function updateLocation(obj){
			
			for(var i=0; i<savedArray.length; i++){
	
					if(savedArray[i].id==obj.id){
						firebase.database().ref('users/' + userId + '/' + savedArray[i].id).set({
						
						x: obj.x,
			    		y: obj.y,
			    		afterX: obj.afterX,
			   	 		afterY: obj.afterY,
			   	 		parent: obj.parent,
			   	 		id: obj.id
			   	 }); 
					}
				}
		}
	 */

	</script>
<body>
	<div class="divHeader">${sessionScope.loginId}님의 마인드맵</div>
	<br>
		<div class="dropdown">
		<button class="btn btn-secondary dropdown-toggle" type="button"
			id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false">메뉴</button>
		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			<a class="dropdown-item" href="#">Home</a>
			<a class="dropdown-item" href="#">스크랩</a>
			<a class="dropdown-item" href="#">공유</a>
			<a class="dropdown-item" href="#">환경설정</a>
		<div class="dropdown-divider"></div>
   			<a class="dropdown-item" href="logout" id="logout">로그아웃</a>
		</div>
	</div>
	
	<input type='hidden' id='userId' value='${sessionScope.loginId}'>
	<canvas id="canvas" width="1000px" height="700px">;
		이 브라우저는 캔버스를 지원하지 않습니다.
	</canvas>
	<div id="options">
		<div id="mainFunc">
			<input type="text" id="putTxt">
			<button id="putBtn">입력</button>
			<button id="deleteBtn">삭제</button>
			<button id="updateBtn">수정</button>
		</div>
		<div id="search">
			<input type="text" id="searchTxt">
			<button id="searchBtn">검색</button>
			<div class="newsListDiv">
			</div>
		</div>
		<div id="searchResult">
			<input type="text" id="resultBox" value="검색결과(최신 5개의 기사)" disabled>
		</div>
	</div>
	<input type="hidden" id="gotSeq" name="gotSeq" value="${mindMap.gotSeq}">
	<input type="hidden" id="leader" name="leader" value="${mindMap.leader}">
	<input type="hidden" id="groupName" name="groupName" value="${mindMap.groupName}">
	<input type="hidden" id="numLimit" name="numLimit" value="${mindMap.numLimit}">
	<form id="hiddenlogout" action="logout" method="get"></form>
</body>