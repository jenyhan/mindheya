<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>drawlines</title>
<style>
canvas {
	border: 5px solid magenta;
	float: left;
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

<!-- 제이쿼리 사용 임포트 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	  // 파이어베이스 초기화 세팅
	  //80~86에 본인의 파이어베이스 변수 가져오기(파이어베이스 로그인 -> 프로젝트 선택 -> 좌측메뉴의 Authentication -> 우측 상단의 '웹 설정' 클릭 후 복사 붙이기)
	  var config = {
	    apiKey: "",
	    authDomain: "",
	    databaseURL: "",
	    projectId: "",
	    storageBucket: "",
	    messagingSenderId: ""
	  };
	
		

	  // Initialize the default app
	  var defaultApp = firebase.initializeApp(config);
	  
	  // You can retrieve services via the defaultApp variable...
	  var defaultStorage = defaultApp.storage();
	  var defaultDatabase = defaultApp.database();


		
		////////////////////////////////////////////////////////////////////////////////////////////////////////
		//첫 페이지에 루트 세팅(Init)

		

		//모든 노드를 배열에 저장.
		var savedArray=[];

		var root;
		var canvas;  // 캔버스 객체
		var ctx;     // 그리기 도구
		var sx, sy;  // 드래그 시작점
		var ex, ey;  // 드래그 끝점
		var drawing; // 그리고 있는 중인가
		var backup;  // 캔버스 객체 백업
		
		///////////////
		var area = Math.PI * 2; //파이 정보
		var flag = 0;

		//네모 객체 설정
		var rect = {
			width: 70,
			height: 70};

		//선택된 노드를 저장
 		var selectedObj;
		var bufObj;
		
		//입력버튼 관련 객체
		var checkPut = false; //입력버튼 클릭 여부
		var saveId;

		//업데이트 드래그 설정
		var draggable = false;

		window.onload = function() {

				
			var userId = $('#userId').val();
			//파이어베이스 로딩 인스턴스
		 	var mindRef = firebase.database().ref('/users/' + userId);

			
			function init(){
				if(savedArray.length!=0 ||!savedArray){
					return;
				}
				savedArray.push(root);
				writeMindMap(savedArray);
			}

			canvas = document.getElementById("canvas");
			if (canvas == null || canvas.getContext == null)
				return;
		
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

			ctx = canvas.getContext("2d");

			$('#putBtn').on('click', function(){
				//flag 1로 설정
				flag = 1;
				
				var putContent = $('#putTxt').val();
				
				if(putContent.trim()!=''){
					checkPut = true;
					saveId = putContent; 
				} else {
					alert('제대로 입력하세요');
					flag = 0;
				}
			});



			$('#deleteBtn').on('click', function(e){
				e.preventDefault();

        //flag2 로 설정
				flag = 2;
			});

			$('#updateBtn').on('click', function(e){
				e.preventDefault();

				//flag3 로 설정
				flag = 3;
			});

			//알고리즘을 다시 바꾸어야 한다.
			//먼저 저장할 때 알고리즘을 바꾸어야 한다.
			//화면을 클릭할 때 선이 아닌, 객체가 움직여야 한다.
			//자리에 놓였을 때 x, y값은 피타고라스에 의해 선택된 부모의 x,y값이 설정되어야 한다.
			//자리에 놓였을 때 부모의 id는 피타고라스에 의해 선택된 부모의 id가 설정되어야 한다.
			//afterX, afterY 값은 본인의 위치가 설정되어야 한다.
			//onMouseDown을 사용해야 할 때
			//0.디폴트는 0
			//1.입력을 해야할 때 flag 1
			//2.삭제를 해야할 때 flag 2
			//3.수정을 해야할 때 flag 3
			canvas.onmousedown = function(e) {

				e.preventDefault();
				
				// 시작 좌표 구함
				sx = e.clientX;
				sy = e.clientY;
				// 피타고라스로 가장 가까운 애를 구함

				if(flag==0){

					pita(sx,sy);
					draggable = true;
					backup = ctx.getImageData(0, 0, canvas.width, canvas.height);
					bufObj = selectedObj;

				} else if(flag==1) {
					// 백업 뜨고 그리기 시작
					pita(sx, sy);
					backup = ctx.getImageData(0, 0, canvas.width, canvas.height);
					drawing = true;

					if(!checkPut){
		    		return;
					}

				} else if(flag==2) {
					pita(sx, sy);

					if(typeof(selectedObj.root)!='undefined'){

					 	alert('루트는 삭제할 수 없습니다.');
					 	flag = 0;
				 		return;

					}
					
					deleteMindMap(selectedObj);	
					flag=0;
					return;

				} else if(flag==3) {
					flag = 0;
					pita(sx, sy);
					var updateId =	prompt('수정할 내용을 입력하세요', selectedObj.id);					

					if(updateId==null){
						alert('취소하셨습니다.');
						return;
					}
					
					//수정하려는 것이 이미 있는 아이디면 수정되면 안된다.
					for(var i = 0; i < savedArray.length; i++){

						if(savedArray[i].id == updateId){
							alert('이미 존재하는 아이디는 사용할 수 없습니다.');
							return;
						}
					}


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
							break;
						}
					}
					mindRef.remove();
					writeMindMap(savedArray);
				}
			}

			canvas.onmousemove = function(e) {
				e.preventDefault();
				if(flag==0){

					if (draggable) {
						ctx.putImageData(backup, 0, 0);

						//3. 마우스를 누른 순간 가장 가까운 아이를 선택한 상태에서 무브 메서드 발동
						//selectedObj에는 선택한 아이가 저장되어 있다.

						ex = e.clientX;
						ey = e.clientY;

						//4. 선택된 객체를 제외한 아이들 중 엄마를 찾는 메서드 발동
						// 결과로 selectedObj 에는 엄마 객체가 저장. 아이는 buf에 저장되어 있음.
						//pita2(ex, ey, bufObj);

						bufObj.afterX = e.clientX;
						bufObj.afterY = e.clientY;

						for(var i = 0; i < savedArray.length; i++){

							if(savedArray[i].id == bufObj.id){
								savedArray[i] = bufObj;
							}

							if(savedArray[i].parent==bufObj.id){
								savedArray[i].x = bufObj.afterX;
								savedArray[i].y = bufObj.afterY;
							}
						}
						writeMindMap(savedArray);

					}
				} else if(flag==1){
				
					if(!checkPut){
					return;
					}
				
					ex = e.clientX;
					ey = e.clientY;

					// 백업 복구하고 현재 선 그림
					if (drawing) {
						ctx.putImageData(backup, 0, 0);
						ctx.beginPath();
						ctx.moveTo(sx, sy);
						ctx.lineTo(ex, ey);
						// ctx.stroke();
					}

				} else if(flag==3){
					

				}
			}

			canvas.onmouseup = function(e) {
				ex = e.clientX;
				ey = e.clientY;
				drawing = false;
				draggable = false;

				if(flag==0){
					return;

				} else if(flag==1){
					flag=0;

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
				var parentId = (typeof(selectedObj) == 'undefined'||selectedObj == null)? saveId : selectedObj.id;
				var parentX = (typeof(selectedObj) == 'undefined'||selectedObj == null)? ex : selectedObj.afterX;
				var parentY = (typeof(selectedObj) == 'undefined'||selectedObj == null)? ey : selectedObj.afterY;


				var newObj={
						x:parentX,
						y:parentY,
						afterX:ex,
						afterY:ey,
						parent: parentId,
						id: saveId
					};
				
				savedArray.push(newObj);
				writeMindMap(savedArray);

				//입력 관련 작업
				checkPut = false;
			}
		
		function pita(cx, cy){
			//선택하는 애
			var selectOne;

			// 거리값 버퍼
			var buf = 0;

			//배열을 돌며 거리 값을 비교
			if(savedArray.length==0){
				return; 
			}

			for(var i = 0; i < savedArray.length; i++){
			
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

		//자신을 제외하는 피타고라스
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

		//파이어베이스 업데이트시 발생
		mindRef.on('value', function(snapshot) {

			var key = snapshot;
			
			//화면을 클리어
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			//루프 스테이션으로 이동
			loopStation(snapshot);
		}); 

		function loopStation(arrayOri){
			var jArrays=JSON.parse(JSON.stringify(arrayOri));
			if(jArrays==null){
				return;
			}
			
			savedArray = [];
			for (var key in jArrays) {
				var array=jArrays[key];
				savedArray.push(array); 				
				
				init();				
				
				ctx.beginPath();
				ctx.moveTo(array.x, array.y);
				ctx.lineTo(array.afterX, array.afterY);
				ctx.stroke();
			}

			for (var key in jArrays) {
				var array=jArrays[key];
				ctx.strokeRect(array.afterX - (rect.width/2), array.afterY - (rect.height/2), rect.width, rect.height);
				ctx.clearRect(array.afterX - (rect.width/2), array.afterY - (rect.height/2), rect.width, rect.height);

				ctx.fillText('id : ' + array.id, array.afterX - 3, array.afterY + 3);
				ctx.fillText('parent : ' + array.parent, array.afterX - 3, array.afterY +13);

			}
		}	
		
		//파이어베이스 저장 메서드
		  function writeMindMap(mindObjs) {

				for(var i=0; i<mindObjs.length; i++){
					
					if(typeof(mindObjs[i].root) == "undefined"){
						firebase.database().ref('users/' + userId + '/' + mindObjs[i].id).set({
			    
				    	x: mindObjs[i].x,
				    	y: mindObjs[i].y,
				    	afterX:mindObjs[i].afterX,
				    	afterY:mindObjs[i].afterY,
				    	parent:mindObjs[i].parent,
				    	id:mindObjs[i].id
			    });

					} else {
						firebase.database().ref('users/' + userId + '/' + mindObjs[i].id).set({
			    
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

				deleteChild(obj.id);	
				
				selectedObj = null;

				//덮어쓰기
				mindRef.remove();

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
			
	}	

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

	
	</script>
<body>
	<input type='hidden' id='userId' value='${sessionScope.loginId}'>
	<!-- <div id="menuBoard">
		<div>김회인님, 안녕하세요!</div>
		<div>마인드맵</div>
		<div>스크랩</div>
		<div>공동작업</div>
		<div>환경설정</div>
	</div>  -->
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
		</div>
		<div id="searchResult">
			<input type="text" id="resultBox" value="검색결과(최신 5개의 기사)" disabled>
		</div>
	</div>
</body>
</html>