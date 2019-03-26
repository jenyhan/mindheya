<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$("#regist").on('click', regist);
	$("#search").on('keyup', search);
	
	var result = {
		name: 'name',
		seq: 'seq'
	};
		
});
function regist(){
	var name = $("#name").val();
	var seq = $("#udtno").val();
	result.(name, seq);
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
</head>
	검색 : <input type="text" id="search">
<form>  
	<input type="hidden" id="udtno">
	이름 : <input type="text" id="name" name="name" placeholder="이름" /> &nbsp;
		 <input type="button" id="regist" value="등록" />
</form>
<div id="reviewDiv">
</div>
</div>
</body>
</html>