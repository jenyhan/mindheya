<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
//하이하이하이하이
	<style>
		#train {
      position: relative;
      cursor: pointer;
   		 }
	</style>
	
<title>Firebase Realtime Database Web</title>

<!-- Firebase App is always required and must be first -->
<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-app.js"></script>

<!-- Add additional services that you want to use -->
<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-firestore.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-messaging.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-functions.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.2/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyDbP5rLbpe6JFedjvFxaI3gM2jm1REFrJ8",
    authDomain: "web-crawling-6562b.firebaseapp.com",
    databaseURL: "https://web-crawling-6562b.firebaseio.com",
    projectId: "web-crawling-6562b",
    storageBucket: "web-crawling-6562b.appspot.com",
    messagingSenderId: "407695243177"
  };
</script>
<!-- 파이어베이스 문법 사용 -->	
<script>
	
	// Initialize the default app
	var defaultApp = firebase.initializeApp(config);
	console.log(defaultApp.name);  // "[DEFAULT]"

	// You can retrieve services via the defaultApp variable...
	var defaultStorage = defaultApp.storage();
	var defaultDatabase = defaultApp.database();

	// ... or you can use the equivalent shorthand notation
	defaultStorage = firebase.storage();
	defaultDatabase = firebase.database();
	
	
	

	
	/* function writeUserData(userId, name, email, imageUrl) {
		  firebase.database().ref('users/' + userId).set({
		    username: name,
		    email: email,
		    profile_picture : imageUrl
		  });
		} */

		
	var memoRef = firebase.database().ref('memos/');
	memoRef.on('value', function(snapshot) {
		var dbResult = snapshot.val(); 
 		var str = dbResult["content"];
 		var txtbox = document.getElementById("memo");
		txtbox.value = str;
	});
	
	var naverRef = firebase.database().ref('navers/');
	naverRef.on('value', function(snapshot) {
		var dbResult = snapshot.val();
		if(!dbResult){
			return;
		}
 		var str = dbResult["word"];
 
		var content = "";

		var index = 0;
		for(var i = 0; i < str.length; i++){
 			content+= ++index + "위 : " +  JSON.stringify(str[i]) + "<br>"; 
		}
		
		document.getElementById("naverKeyWord").innerHTML = content;
	});

	function saveNaver(data){
		writeNaver(data);
	}
	
	function writeNaver(data){
		firebase.database().ref('navers/').set({
			word: data
		});		
	}
	
	function saveMemo(){
		var message = document.getElementById("memo").value;
		
		writeMemo(message);
	}
	function writeMemo(message){
		firebase.database().ref('memos/').set({
			content: message
		});
	}
		
	</script>
	
	<!-- script for animation -->

</head>
<body>
------------------------------요 기 는 실 시 간 동 시 작 업 이 가 능 한 부 분 ----------------------------------<br><br>

	<input type="text" id="memo" onkeyup="saveMemo()"><br><br>

-------------------------------------------------------------------------------------------------------------------<br><br>


------------------------------요 기 는 ajax로 파이어베이스와 연동하는 부분 ----------------------------------<br><br>
		<h1>네이버 검색순위!!</h1>
	
		<div id="naverKeyWord"></div>
------------------------------------------------------------------------------------------------------------------- <br><br>

	<c:forEach var="resultValue" items="${result}">
		${resultValue}<br>
	</c:forEach>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	
	function ajaxTest(){
		$.ajax({
			/* data는 성공하고 받은 data로, json객체 */
			/* url은 액션 */			
			/* data : 클라이언트가 서버로 보내는 파라미터 */
			
			url : "selectNaver",
			data : "",
			type : "get",
			success :  function(data){
				saveNaver(data);
			}
		});		
	}
	
	//가져와본 자동 ajax
	$(function() {
		timer = setInterval( function () {
			//----------------------------------------------------------------------------------
			$.ajax ({
				url : "selectNaver",
				data : "",
				type : "get",
				success :  function(data){
					saveNaver(data);
				}
			});
			//----------------------------------------------------------------------------------
		}, 10000); // 10초에 한번씩 받아온다.
	});


	</script>



</body>
</html>