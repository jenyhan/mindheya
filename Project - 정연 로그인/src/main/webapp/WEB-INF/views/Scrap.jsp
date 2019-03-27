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
.optionBtn{
   text-align: center;
}
#regist{
	color: white;
   border-radius: 50%;
   box-shadow: 0 5px 15px;
   font-size: 25px;
   float: center;
   width: 300px;
   height: 100px;
   margin: 50px;
}
#regist {
   border: 2px solid #40BBB4;
   background-color: #40BBB4;
}
</style>
</head>
<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$("#regist").on('click', regist);
	
	
	var result = [];
		
});
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
		$("#udtno").val("");
		$("#regist").attr("value","등록");
	}


function search(){
	var word=$("#search").val();
	};
	 
function output(resp) {
	var data = '<table>';

	$.each(resp, function(index, item){
		data += '<tr class="reviewtr" data-sno="'+ item.seq +'" >';
		data += '	<td class="seq">' + item.seq + '</td>';
		data += '	<td class="name">' + item.name + '</td>';
		data += '</tr>';
	}); 
	
	$("#reviewDiv").html(data);
	
	
}

</script>

<!-- 	검색 : <input type="text" id="search"> -->
<!-- <form>   -->
<!-- 	<input type="hidden" id="udtno"> -->
<!-- 	이름 : <input type="text" id="name" name="name" placeholder="이름" /> &nbsp; -->
<!-- 		 <input type="button" id="regist" value="등록" /> -->
<!-- </form> -->
<!-- <div id="reviewDiv"> -->
<!-- </div> -->
<!-- </div> -->
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
	
	</div>
<form>  
	<input type="hidden" id="udtno">
	이름 : <input type="text" id="name" name="name" placeholder="이름" /> &nbsp;
	<input type="button" id="regist" value="등록" />
</form>
</body>
</html>