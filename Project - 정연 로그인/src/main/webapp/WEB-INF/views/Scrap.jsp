<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scrap</title>



<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--Import materialize.css-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
<!--Let browser know website is optimized for mobile-->
   <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');




#regist{
   color: white;
   box-shadow: 0 5px 15px;
   font-size: 25px;
   float: center;
   width: 80px;
   height: 50px;
   margin: 50px;
   border: 2px solid #ED0043; 
   background-color: #ED0043;
}

td { 
	border-bottom : 1px solid black; 
border-top : 1px solid black;
}
seq {
	width : 50px;
}
name {
	width : 50px;
}

table {
	box-shadow: 0 5px 15px;
   font-size: 25px;
   float: center;
   width: 300px;
   height: 100px;
   margin: 50px;
	color: black;
    width : 100px;
	margin : 0 auto;
	border-collapse : collapse;
	border-bottom : 1px solid black;
	border-top : 1px solid black;
}


</style>
</head>
<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$("#regist").on('click', regist);
	
	
	var result = [];
	
	function regist(){
		var name = $("#name").val();
		var seq = $("#udtno").val();
		
		var scrapObject = {
				name: name,
				seq: seq
		};
		result.push(scrapObject);
		if(name.length == 0) {
			alert("데이터를 입력해 주세요");
			return;
		}else{
			output(result);	
		}
	}
		
});
	



	 
function output(resp) {
	
	var data = '<table>';
	$.each(resp, function(index, item){
		data += '<tr class="regist" data-sno="'+ item.seq +'" >';
		data += '	<td class="seq">' + item.seq + '</td>';
		data += '	<td class="name">' + item.name + '</td>';
		data += '</tr>';
		
	}); 
	data += '</table>';
	
	$("#reviewDiv").html(data);
	
	
}

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
	</div>
<form>  
	<input type="hidden" id="udtno">
	이름 : <input type="text" id="name" name="name" placeholder="이름" /> &nbsp;
	<input type="button" id="regist" value="등록" />
</form>
<div id="reviewDiv">
</body>
</html>