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
	<title>Insert title here</title>
	<style>
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
		
		.notiSubject {
			width: 1200px;
			border: 1px solid black;
			margin-bottom: 50px;
		}

		.manageSubject {
			width: 1200px;
			border: 1px solid black;
			margin-bottom: 50px;
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
	  
	  //관리자 리스트 만들기
	  var managementList = [];

	  
	  var bufferManagementList = [];
	  
	  //확정된 shareList를 만들어야 한다.
	  var sharedList = [];
	  
	  var leader;	  // 공유하는 사람 id
	  var seq;		  // 공유 맵 시퀀스
	  var groupName;  // 공유 맵 이름
	  var numLimit;	  // 총 공유 인원
	  var numShare;	  //현재 공유 인원

	  $(function(){
		  
	 	  // 로그인한 UserId를 input hidden 태그에서 가져온다.
		  var userId = $('#userId').val();

	      var notificationRef = firebase.database().ref('/users/' + userId + '/notification');
	 	  
		  var manageRef = firebase.database().ref('/users/' + userId + '/mindMapList');
	 	  
		  var sharedRef = firebase.database().ref('/users/' + userId + '/sharedList');
		  
		  
/* ------------------------------------------------------------------------------------------------- */		  
//메시지 리스트		  
		  
		  notificationRef.on('value', function(snapshot){
			  loadNotification(snapshot);
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

				}
	
				showNotification(notificationArray);
		  }		
		  

		  
		  
		  
		  function showNotification(notificationArray){
				
			var contents = '<h2>공유 메세지 관리</h2>';								
			contents += '<table class="notiSubject">';
			contents += '<tr>';
			contents += '<th>공유하는 사람</th>';
			contents += '<th>마인드맵 이름</th>';
			contents += '<th>허용 인원</th>';			
			contents += '<th>현재 인원</th>';			
			contents += '<th>참여 멤버</th>';
			contents += '<th>수락</th>';
     		contents += '<th>삭제</th>';
     		contents += '</tr>';
		
			$.each(notificationArray, function(index, item){
					
				for(var i in item){
					contents += '<tr class="mindMapSeq" seq-value="' + item[i].seq + '">';
					contents += 	'<td class="mindMapLeader" leader-value="'+item[i].leader+'">'+item[i].leader+'</td>';
					contents += 	'<td class="mindMapGroup" groupName-value="'+item[i].groupName+'">'+item[i].groupName+'</td>';										
					contents += 	'<td class="mindMapNumLimit" numLimit-value="'+item[i].numLimit+'">'+item[i].numLimit+'</td>';										
					contents += 	'<td class="mindMapNumShare" numShare-value="'+item[i].numShare+'">'+item[i].numShare+'</td>';										


		            var memberJSON = JSON.parse(JSON.stringify(item[i].member));

					var JSONString = JSON.stringify(item[i].member);

		            
		            var memList = [];
		             
					var memString = '';

					for(var key in memberJSON){
		            	memList.push(memberJSON[key]);
		            	memString += memberJSON[key] + " ";
					}             
		            
					contents += 	'<td class="mindMapMember" member-length="' + memList.length + '"member-value=' + JSONString + '>' + memString + '</td>';																
			
					contents += 	'<td><button class="acceptMessage">수락</td>';
					contents += 	'<td><button class="deleteMessage">취소</td>';

					contents += '</tr>';
						
					}
				});
			
			contents += '</table>';
			
				$('.notificationList').html(contents);

				//메시지 수락 버튼
				$('.acceptMessage').on('click', function(){


		            var check = confirm('공유마인드맵에 추가하시겠습니까?');
					if(!check){
						alert('취소합니다.');
						return;
					}
					
		            var gotSeq = $(this).closest('tr').attr('seq-value');		         	
		            var leader = $(this).closest('tr').children('.mindMapLeader').attr('leader-value');
		            var groupName = $(this).closest('tr').children('.mindMapGroup').attr('groupName-value');
		            var numLimit = $(this).closest('tr').children('.mindMapNumLimit').attr('numLimit-value');
		            var numShare = Number($(this).closest('tr').children('.mindMapNumShare').attr('numShare-value'));
		            		            
		            
		            //멤버를 가져오기(가져오거나, 없으면 0)
		            var member_value = $(this).closest('tr').children('.mindMapMember').attr('member-value');

		            var member_value_JSON = JSON.parse(member_value);
	
		            var member = [];
		            
		            for(var key in member_value_JSON){
		            	member.push(member_value_JSON[key]);	
		            	
		            }

		            member.push(userId);
		            
		            var tobeShared = {
		            		seq: gotSeq,
		            		leader: leader,
		            		groupName: groupName,
		            		numLimit: numLimit,
		            		numShare: numShare + 1,
		            		member : member
		            };		            

				    var mindRef = firebase.database().ref('/users/' + tobeShared.leader + '/mindMapList');

		            
					mindRef.child(tobeShared.groupName).once('value').then(function(snapshot) {

						
						//JSON 멤버 배열을 script 배열화 시키는 작업						
/* 					----------------------------------------------------------------- */
						var snapResult = JSON.parse(JSON.stringify(snapshot));
												
						var gotMember = snapResult.member;
						
						var memberArray = [];
						
						for(var key in gotMember){
						
							memberArray.push(gotMember[key]);
							
						}

						//tobeShared랑 memberArray에서 같은 것은 없애고 아니면 추가한다.
						var MergedMember = member.concat(memberArray);
	
						
 						var filteredMember = MergedMember.filter((value, idx, arr) => MergedMember.indexOf(value) === idx);
						
/* 					----------------------------------------------------------------- */
/* 					----------------------------------------------------------------- */

						var gotNumShare = snapResult.numShare + 1;
						alert(gotNumShare);


/* 					----------------------------------------------------------------- */

						//sharedList에 추가		            					
						firebase.database().ref('users/' + userId + '/sharedList/' +  tobeShared.leader + '/' + tobeShared.seq).set({                        
	                        seq : tobeShared.seq,
	                        leader : tobeShared.leader,
	                        groupName : tobeShared.groupName,
	                        numLimit : tobeShared.numLimit,
	                        numShare : gotNumShare,
							member : filteredMember
	                    });
			            
			            
			            //멤버들에게도 전달해주어야 한다.
			            for(var k = 0; k < filteredMember.length; k++){
			            
			            	if(filteredMember[k]==tobeShared.leader){
			            		continue;

			            		alert('==leader' + filteredMember[k]);
			            	} else{
			            		alert('else' + filteredMember[k]);

			            		firebase.database().ref('users/' + filteredMember[k] + '/sharedList/' + tobeShared.leader).child(tobeShared.seq).update({member:filteredMember});
	
				            	firebase.database().ref('users/' + filteredMember[k] + '/sharedList/' + tobeShared.leader).child(tobeShared.seq).update({numShare:gotNumShare});

			            	}
			            	
			            }

			            //mapList에 멤버 업데이트		            
			            firebase.database().ref('users/' + tobeShared.leader + '/mindMapList').child(groupName).update({member:filteredMember});

			            //공유 인원 수
						firebase.database().ref('users/' + tobeShared.leader + '/mindMapList').child(tobeShared.groupName).update({numShare:gotNumShare});


					});
					
                	notificationRef.child(tobeShared.leader + '/' + tobeShared.seq).remove();
		            
				});

				
				$('.deleteMessage').on('click', function(){
					
					var check = confirm('삭제하시겠습니까?');
					
					if(check){
			            var gotSeq = $(this).closest('tr').attr('seq-value');		         	
			            var leader = $(this).closest('tr').children('.mindMapLeader').attr('leader-value');
			            var groupName = $(this).closest('tr').children('.mindMapGroup').attr('groupName-value');
			            var numLimit = $(this).closest('tr').children('.mindMapNumLimit').attr('numLimit-value');
			            var numShare = Number($(this).closest('tr').children('.mindMapNumShare').attr('numShare-value'));

	                	notificationRef.child(tobeShared.leader + '/' + tobeShared.seq).remove();
												
					} else {
						alert('취소합니다.');
						return;
					};
					
				});
		    }

		  
/* ------------------------------------------------------------------------------------------------- */		  
//매니지먼트 리스트

		  manageRef.on('value', function(snapshot){

			loadManageList(snapshot);
		
		  });

		  function loadManageList(snapshot){
			  
			//JSON 객체로 리스트 저장
			var manageArray = JSON.parse(JSON.stringify(snapshot));
				
			//배열 초기화
			bufferManagementList = [];
				
			for(var key in manageArray){
						
				var leader = manageArray[key];
				
				bufferManagementList.push(leader);

			}
	
			filterManageList(bufferManagementList);
			  
		  }
		  
		  function filterManageList(bufferList){

			  managementList = [];

			  $.each(bufferList, function(index, item){

					if(item.numShare > 1){

						managementList.push(item);
					}
				  
			  });
			  
			  showManageList(managementList);
			  
		  }

		  
		  function showManageList(manageList){

				var contents = '<h2>나의 공유 관리</h2>';								
				contents += '<table class="manageSubject">';
				contents += '<tr>';
				contents += '<th>마인드맵 이름</th>';
				contents += '<th>허용 인원</th>';			
				contents += '<th>현재 인원</th>';			
				contents += '<th>멤버</th>';
				contents += '<th>이동</th>';
				contents += '<th>멤버삭제</th>';				
	     		contents += '</tr>';
			  
				  $.each(manageList, function(index, item){
						contents += '<tr class="mindMapSeq" seq-value="' + item.seq + '">';
						contents += 	'<td class="mindMapGroup" groupName-value="'+item.groupName+'">'+item.groupName+'</td>';										
						contents += 	'<td class="mindMapNumLimit" numLimit-value="'+item.numLimit+'">'+item.numLimit+'</td>';										
						contents += 	'<td class="mindMapNumShare" numShare-value="'+item.numShare+'">'+item.numShare+'</td>';										

						
						
						var memberJSON = item.member;

						var JSONString = JSON.stringify(item.member);

				            
				        var memList = [];
				             
					    var memString = '';

						for(var key in memberJSON){
				      		memList.push(memberJSON[key]);
				            memString += memberJSON[key] + " ";
						}             
				            
						contents += 	'<td class="mindMapMember" member-length="' + memList.length + '"member-value=' + JSONString + '>' + memString + '</td>';																					
						
						contents += 	'<td><button class="goManage">이동</td>';
						contents += 	'<td><button class="deleteManage">멤버삭제</td>';
						contents += '</tr>';
				  
				  });
			  
				  contents += '</table>';
			  
				  $('.managementList').html(contents);

				  
				  $('.goManage').on('click', function(){
					    var gotSeq = $(this).closest('tr').attr('seq-value');		         	
			            var leader = userId;
			            var groupName = $(this).closest('tr').children('.mindMapGroup').attr('groupName-value');
			            var numLimit = $(this).closest('tr').children('.mindMapNumLimit').attr('numLimit-value');
			            var numShare = Number($(this).closest('tr').children('.mindMapNumShare').attr('numShare-value'));


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
				  
				  $('.deleteManage').on('click', function(){

 						var gotSeq = $(this).closest('tr').attr('seq-value');		         	
			            var leader = userId;
			            var groupName = $(this).closest('tr').children('.mindMapGroup').attr('groupName-value');
			            var numLimit = $(this).closest('tr').children('.mindMapNumLimit').attr('numLimit-value');
			            var numShare = Number($(this).closest('tr').children('.mindMapNumShare').attr('numShare-value'));

			            //멤버를 가져오기(가져오거나, 없으면 0)
			            var member_value = $(this).closest('tr').children('.mindMapMember').attr('member-value');

			            var member_value_JSON = JSON.parse(member_value);
		
			            var member = [];
			            
			            for(var key in member_value_JSON){
			            	member.push(member_value_JSON[key]);	
			            	
			            }

			            var toDel = prompt('삭제할 멤버를 입력하세요');

			            if(toDel == userId){
			            	alert('본인은 삭제할 수 없습니다.');
			            	return;
			            }
			            
			            if(toDel === null){
			            	alert('취소합니다.');
			            } else {
			            	
							var flag = 0;
							
							for(var i = 0; i < member.length; i++){
								
								if(member[i] === toDel){
									member.splice(i,1);
									flag = 1;
								}
								
							}

							if(flag == 0){
								
								alert('해당 아이디는 공유 멤버가 아닙니다.');
					
							} else {
								
								//먼저 최상위 mapList에서 멤버를 제거해야 한다.
					            firebase.database().ref('users/' + leader + '/mindMapList/').child(groupName).update({member:member});
								
								//numShare를 줄어야 한다.
					            firebase.database().ref('users/' + leader + '/mindMapList/').child(groupName).update({numShare:numShare - 1});

								
								//업데이트해야할 것
								//업데이트된 멤버를 다른 멤버들에게 해주어야 한다.
								//업데이트될 numshare를 다른 멤버들에게 해주어야 한다.
								//멤버들의 sharedList에도 전달해주어야 한다.
								for(var i = 0; i < member.length; i++){
									
									if(member[i]!=leader){
										
						            	firebase.database().ref('users/' + member[i] + '/sharedList/' + leader).child(gotSeq).update({member:member});
	
						            	firebase.database().ref('users/' + member[i] + '/sharedList/' + leader).child(gotSeq).update({numShare:numShare - 1});

									}
									
								}
								
								//해당 toDel의 shareList에서 삭제해야 한다.
								
				            	firebase.database().ref('users/' + toDel + '/sharedList/' +  leader + '/' + gotSeq).remove();

								flag = 0;
								alert('삭제되었습니다.');

							}
							
			            	
			            }
			            
					  
				  });
				  
				  
		  }
		  
/* ------------------------------------------------------------------------------------------------- */		  
//공유맵 리스트
		  
		  sharedRef.on('value', function(snapshot){
			  
			  loadSharedList(snapshot);
			  
		  });
		  
		  function loadSharedList(snapshot){
			  
			var sharedList = [];
			  
			//JSON 객체로 리스트 저장
			var sharedArray = JSON.parse(JSON.stringify(snapshot));
			
			for(key in sharedArray){
				var leader = sharedArray[key];
				
				sharedList.push(leader);
				
			}

			showSharedList(sharedList);
		  }
		  
		  function showSharedList(sharedList){
			
			  
			var contents = '<h2>공유 마인드 리스트</h2>';								
				contents += '<table class="notiSubject">';
				contents += '<tr>';
				contents += '<th>리더</th>';
				contents += '<th>마인드맵 이름</th>';
				contents += '<th>허용 인원</th>';			
				contents += '<th>현재 인원</th>';			
				contents += '<th>참여 멤버</th>';
				contents += '<th>이동</th>';
	     		contents += '<th>삭제</th>';
	     		contents += '</tr>';

			  
			  
			  $.each(sharedList, function(index, item){
				  
				  for(var i in item){
					  
					contents += '<tr class="mindMapSeq" seq-value="' + item[i].seq + '">';
					contents += 	'<td class="mindMapLeader" leader-value="'+item[i].leader+'">'+item[i].leader+'</td>';
					contents += 	'<td class="mindMapGroup" groupName-value="'+item[i].groupName+'">'+item[i].groupName+'</td>';										
					contents += 	'<td class="mindMapNumLimit" numLimit-value="'+item[i].numLimit+'">'+item[i].numLimit+'</td>';										
					contents += 	'<td class="mindMapNumShare" numShare-value="'+item[i].numShare+'">'+item[i].numShare+'</td>';										

					var memberJSON = JSON.parse(JSON.stringify(item[i].member));

					var JSONString = JSON.stringify(item[i].member);

			            
			        var memList = [];
			             
					var memString = '';

					for(var key in memberJSON){
		            	memList.push(memberJSON[key]);
		            	memString += memberJSON[key] + " ";
					}             
			            
					contents += 	'<td class="mindMapMember" member-length="' + memList.length + '"member-value=' + JSONString + '>' + memString + '</td>';																
					
					contents += 	'<td><button class="goShared">이동</td>';
					contents += 	'<td><button class="deleteShared">삭제</td>';					
					contents += '</tr>';
					  
				  }
				  
			  });
			  
				
			  contents += '</table>';
			  
			  $('.sharedList').html(contents);
			  
			  $('.goShared').on('click', function(){
				  
				    var gotSeq = $(this).closest('tr').attr('seq-value');		         	
		            var leader = $(this).closest('tr').children('.mindMapLeader').attr('leader-value');
		            var groupName = $(this).closest('tr').children('.mindMapGroup').attr('groupName-value');
		            var numLimit = $(this).closest('tr').children('.mindMapNumLimit').attr('numLimit-value');
		            var numShare = Number($(this).closest('tr').children('.mindMapNumShare').attr('numShare-value'));
		            		            
		            
		            //멤버를 가져오기(가져오거나, 없으면 0)
		            var member_value = $(this).closest('tr').children('.mindMapMember').attr('member-value');

		            var member_value_JSON = JSON.parse(member_value);
	
		            var member = [];
		            
		            for(var key in member_value_JSON){
		            	member.push(member_value_JSON[key]);	
		            	
		            }
		            
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
			  
			  $(".deleteShared").on('click', function(){
				    var gotSeq = $(this).closest('tr').attr('seq-value');		         	
		            var leader = $(this).closest('tr').children('.mindMapLeader').attr('leader-value');
		            var groupName = $(this).closest('tr').children('.mindMapGroup').attr('groupName-value');
		            var numLimit = $(this).closest('tr').children('.mindMapNumLimit').attr('numLimit-value');
		            var numShare = Number($(this).closest('tr').children('.mindMapNumShare').attr('numShare-value'));

		            var check = confirm('공유 목록에서 삭제하겠습니까?');
				  
		            if(check){
						
		            	//sharedList에서 삭제
		            	firebase.database().ref('users/' + userId + '/sharedList/' +  leader + '/' + gotSeq).remove();

					    var mindRef = firebase.database().ref('/users/' + leader + '/mindMapList');

						//mapList에서 member에서 삭제
						mindRef.child(groupName).once('value').then(function(snapshot) {

							var snapResult = JSON.parse(JSON.stringify(snapshot));
														
							var gotMember = snapResult.member;
							
							var memberArray = [];
							
							for(var key in gotMember){
							
								memberArray.push(gotMember[key]);
								
							}

							for(var i = 0; i < memberArray.length; i++){
								
								if(memberArray[i]==userId){
									memberArray.splice(i,1);
									break;
								}
								
							}
														
				            //mapList에 멤버 업데이트		            
				            firebase.database().ref('users/' + leader + '/mindMapList/').child(groupName).update({member:memberArray});

				            //공유 인원 수 줄이기
							firebase.database().ref('users/' + leader + '/mindMapList').child(groupName).update({numShare:numShare - 1});

				            //멤버들에게도 업데이트 해주어야 한다.
							for(var j = 0; j < memberArray.length; j++){
						
								
								if(memberArray[j]!=leader){
									
									alert(JSON.stringify('array : ' + memberArray));
									alert(JSON.stringify('j : ' + memberArray[j]));
									
									firebase.database().ref('users/' + memberArray[j] + '/sharedList/' + leader).child(gotSeq).update({member:memberArray});
	
					            	firebase.database().ref('users/' + memberArray[j] + '/sharedList/' + leader).child(gotSeq).update({numShare:numShare - 1});

								}

								
							}
				            
				            
						});

						alert('삭제되었습니다.');
		            	
		            } else {
		            	alert('취소합니다.');
		            	return;
		            }
		            
		            
		            
			  });

		  }
	  
		  
		  
		  
		  
 	});

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
                <h2 class="section-title text-center wow fadeInDown idTitle" style="font-size: 65px;">${sessionScope.loginId}'s Share</h2>
                <p class="text-center wow fadeInDown chooseText">マインドヘヤ</p>
            </div>
			<div class="notificationList">
			</div>
			<div class="managementList">
			</div>
			<div class="sharedList">
			</div>
            <div class="row">
                <div class="features" style="width: 100%;">
                </div>
            </div><!--/.row-->    
        </div><!--/.container-->
    </section><!--/#services-->

	<form id="goMap" action="goMap" method="GET">
      <input type="hidden" id="gotSeq" name="gotSeq">
      <input type="hidden" id="leader" name="leader">
      <input type="hidden" id="groupName" name="groupName">
      <input type="hidden" id="numLimit" name="numLimit">
   </form>

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