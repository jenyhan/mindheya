<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

	<style>
		.box {
		  background-color: #218D9B;
		  height: 100px;
		  width: 100px;
		}
		
		.transform {
		  -webkit-transition: all 2s ease;  
		  -moz-transition: all 2s ease;  
		  -o-transition: all 2s ease;  
		  -ms-transition: all 2s ease;  
		  transition: all 2s ease;
		}
		
		.transform-active {
		  background-color: #45CEE0;
		  height: 200px;
		  width: 200px;
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
	
	
	var starCountRef = firebase.database().ref('users/');
	starCountRef.on('value', function(snapshot) {
	 alert(JSON.stringify(snapshot.val()));
	});
	
	
	function saveData(){
		var id=document.getElementById("user_id").value;
		var name=document.getElementById("user_name").value;
		
		writeUserData(id,name,null,null);
	}
	
	function writeUserData(userId, name, email, imageUrl) {
		  firebase.database().ref('users/' + userId).set({
		    username: name,
		    email: email,
		    profile_picture : imageUrl
		  });
		}
	</script>
	

</head>
<body>
	<table>
	<tr>
	<td>Id</td>
	<td><input type="text" name="id" id="user_id"/></td>
	</tr>
	<tr>
	<td>User Name : </td>
	<td><input type="text" name="user_name" id="user_name"/></td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="button" value="Save" onclick="saveData()"/>
	</table>
	

</body>
</html>