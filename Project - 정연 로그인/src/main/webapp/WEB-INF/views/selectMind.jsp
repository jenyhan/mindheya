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
    <title>HR Theme Two</title>
    <style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	@import url('https://fonts.googleapis.com/css?family=Gamja+Flower');
	@import url('https://fonts.googleapis.com/css?family=Kosugi+Maru');


		.mindMapMember {
		   font-family: 'Gamja Flower', cursive;
		   font-size: 15px;
		
		}
		.mindMapNumLimit {
		   font-family: 'Gamja Flower', cursive;
		   font-size: 15px;

		}
		
		.mindMapLeader {
		   font-family: 'Gamja Flower', cursive;
		   font-size: 15px;
		}

		.mindGroupName {
		   font-family: 'Gamja Flower', cursive;
		
		}


		.optionBtn{
		   text-align: center;
		}
		
		#createMindMap, #deleteMindMap, #shareMindMap{
		   font-family: 'Gamja Flower', cursive;
		   margin: 5% 8%;
		   color: white;
		   border-radius: 50%;
		   box-shadow: 0 5px 15px;
		   font-size: 40px;
		   float: center;
		   width: 150px;
		   height: 80px;
		
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
		
		.chooseText {
			font-size: 45px;
      		font-family: 'Gamja Flower', cursive;

		}
				
		.mindMapImg {
			width: 70px;
			height: 100px;
			margin-top: 5px;
		}
		
		.showDefault {
			
			width: 100%;
			height: 200px;
			margin-top: 50px;
			text-align: center;
			font-size: 50px;
      		font-family: 'Gamja Flower', cursive;
		
		}
			    
		.mindMapDiv {
			margin-left: 5.5%;
			margin-bottom: 5.5%;
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
</head><!--/head-->
<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>

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
     
     var sharedList = [];
     
/* --------------------------------------------------------------------------------------- */
   $(function(){
      //로그인한 UserId를 input hidden 태그에서 가져온다.
      var userId = $('#userId').val();   
      //파이어베이스에서 가져올 DB 경로 설정
      var mindRef = firebase.database().ref('/users/' + userId + '/mindMapList');
      
      var mapTreeRef = firebase.database().ref('/users/' + userId + '/MapTree');

      var notificationRef = firebase.database().ref('/users/' + userId + '/notification');
      
     

      var seq = 0;
      
      var selectFlag = 0;
      
      var numShare = 0;
            
      //파이어베이스 저장하기      
      function createMind(newMap){
         
    	  //생성하는 사람은 리더이자 멤버
			var member = [];
			member.push(userId);
			
            firebase.database().ref('users/' + userId + '/mindMapList/' + newMap.groupName).set({
               
               seq : newMap.seq,
               leader : newMap.leader,
               groupName : newMap.groupName,
               numLimit : newMap.numLimit,
               numShare : Number(1),
               member : member
            });
         
      }
      
      //파이어베이스 업데이트 값 불러오기
      mindRef.on('value', function(snapshot) {
         loadList(snapshot);
         
      }); 
      
      function loadList(snapshot){
         var mindMapList =JSON.parse(JSON.stringify(snapshot));
         //배열 초기화
         savedList = [];
         
         if(mindMapList==null){
            showDefault();
            return;
         }
         
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
      
      
      function showDefault(){
    	  
    	  var content = '';
    	  content += '<div class="showDefault">Add a New Mind';
          content += '</div>'
    	  
         $('.features').html(content);
			
      }
      
      function showMap(){
         
         if(savedList.length == 0){
            return;
         }
         
         var content = '';


         $.each(savedList, function(index, item){
             content += '<div class="col-md-4 col-sm-6 wow fadeInUp mindMapDiv" data-wow-duration="300ms" data-wow-delay="500ms" mind-value ="' + item.seq + '" style="width: 290px;">';
             content += 	'<div class="media service-box">';
             content +=			'<div class="pull-left">';
             content +=				'<img src="resources/images/mindMapImg2.png" class="mindMapImg">';
             content +=			'</div>';
             content += 		'<div class="media-body">';
            
             if(item.groupName.length<13){
	             content += 		'<h2 class="media-heading mindGroupName" name-value="' + item.groupName + '">' + item.groupName + '</h2>';
            	 
             } else if(item.groupName.length<19){
	             content += 		'<h3 class="media-heading mindGroupName" name-value="' + item.groupName + '">' + item.groupName + '</h3>';
            	 
             } else {
	             content += 		'<h6 class="media-heading mindGroupName" name-value="' + item.groupName + '">' + item.groupName + '</h6>';

             }
             

             content +=				'<h5 class="mindMapLeader" leader-value="' + item.leader + '">Leader : '  + item.leader + '</h5>';
             content +=				'<h5 class="mindMapNumLimit" limit-value="' + item.numLimit + '">Member : ' + item.numShare + ' / ' + item.numLimit + '</h5>';
             content += 			'<input type=hidden class="mindMapNumShare" numShare-value="' + item.numShare + '">';

			var memberJSON = item.member;

			var JSONString = JSON.stringify(item.member);

	        var memList = [];
		             
		    var memString = '';

			for(var key in memberJSON){
	      		memList.push(memberJSON[key]);
	            memString += memberJSON[key] + " ";
			}             

			 content += 			'<h5 class="mindMapMember" member-length="' + memList.length + '"member-value=' + JSONString + '>Member : ' + memString + '</h5>';																					
             content += 		'</div>';
             content += 	'</div>';
             content +=	'</div>';             
          });
                  
         $('.features').html(content);
         
         $('.mindMapDiv').on('click', function(){

         	var gotSeq = $(this).attr('mind-value');            
            var leader = $('.mindMapLeader', this).attr('leader-value');
            var groupName = $('.mindGroupName', this).attr('name-value');
            var numLimit = $('.mindMapNumLimit', this).attr('limit-value');
            var numShare = $('.mindMapNumShare', this).attr('numShare-value');
            
            
            //멤버를 가져오기(가져오거나, 없으면 0)
            var member_value = $('.mindMapMember', this).attr('member-value');

            var member_value_JSON = JSON.parse(member_value);

            var member = [];
            
            for(var key in member_value_JSON){
            	member.push(member_value_JSON[key]);	
            	
            }     
            
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
                            
                        	mapTreeRef.child(savedList[i].groupName).remove();
                            mindRef.child(savedList[i].groupName).remove();
                            
                        }
                     }
                     
                  }
                  
                  
               } else{
                  alert('삭제를 취소합니다.');               
               }
               
            } else if(selectFlag == 2){            

            	if(numShare==numLimit){
            		alert('허용 인원을 초과했습니다. 멤버를 정리해주세요');
            	}
            	
            	var shareId = prompt("공유할 아이디를 입력해주세요.");
               
               $.ajax({
                  url : "selectShare",
                  data : {shareId : shareId},
                  type : "get",
                  success : function(result) {

                     if(result=="fail"){
                        alert('존재하지 않는 아이디입니다, 다시 선택해주세요.');
                     
                     } else if(result=="same"){
                       alert('본인에게 공유할 수 없습니다.');
                       
                     } else {
                        selectFlag = 0;
                        var question = confirm('존재하는 아이디입니다. 공유 메세지를 보내시겠습니까?');
                        if(question){
                           
                           var messageObj = {
                                 seq : gotSeq,
                                 leader : leader,
                                 groupName : groupName,
                                 numLimit : numLimit,
                                 numShare : numShare,
                                 member : member
                           };                           
                           
   							

   	                       firebase.database().ref('users/' + shareId + '/notification/' +  messageObj.leader + '/' + messageObj.seq).set({
                                   
                                 seq : messageObj.seq,
                                 leader : messageObj.leader,
                                 groupName : messageObj.groupName,
                                 numLimit : messageObj.numLimit,
                                 numShare : messageObj.numShare,
     							 member : member
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
               numLimit : numLimit,

         }
         
         createMind(newMap);   

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
			<div class="optionBtn">
			   <button id="createMindMap">추가</button>
			   <button id="deleteMindMap">삭제</button>
			   <button id="shareMindMap">공유</button>
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