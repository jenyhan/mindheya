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
		   height: 70px;
		
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
		
		#searchNews::placeholder {
			color: #1AAB8A;
			font-style: bold;
			font-size: 17px;
			text-align: center;
			
			/* 선명도 조절  0 ~ 1 */
			opacity: 0.7;
		}
		
		#searchNews {
			width: 22%; 
			height: 40px;
			border: 2px solid #1AAB8A;
			border-bottom: none;
			font-style: bold;
			font-size: 17px;
		}
		
		.news-body {
			border: 2px solid #1AAB8A;
		}
		
		.news-temp {
			width : 98%;
			
			display: flex;
			flex-wrap: wrap;
			
			margin: 5% auto;
			padding: 3px;
		}
		
		.news-body-seq {
			/* width: 30%; */ 
			width: 330px;
			height: 250px;
			border: 2px solid #e6e6e6;
			margin: 4% auto;
			background-color:#fffff4;
			/* border-radius: 10px; */
		}
		
	 	.news-body-titleDiv {
			text-align: center;
			width: 90%;
			border: 2px solid #1AAB8A;
			margin: 5px auto;
			box-shadow: 4px 4px gray;
		}

		.news-body-title {
			width: 300px;
			height: 70px;
			padding: 7px;
			margin: auto;
			display: table-cell;
			vertical-align: middle;
			text-align: center;
		}
		
		.news-body-summary {
			height: 38%; 
			padding: 5px;
			color: #333333;
		}
		
		.news-body-press {
			height: 16%;
			text-align: right;
			padding: 5px;
			color: #999999;
			
		}
		
		.news-body-btnDiv{
			content:'';
			display:inline-block;
			text-align: right;
			height: 7%;
			width: 100%;
		}
		
		.selectBm {
			background:#1AAB8A;
  			color:#fff;
  			border:none;
  			/* position:relative; */
  			height:30px;
 			font-size:1.2em;
  			cursor:pointer;
  			transition:800ms ease all;
  			outline:none;
			text-align: center;
			width: 105px; 
			border-radius: 4px;
		}
		
		.bmDelete {
			background: #1AAB8A;
  			color: #fff;
  			border: none;
  			position: relative;
  			height: 30px;
 			font-size: 1.2em;
  			cursor: pointer;
  			transition: 800ms ease all;
  			outline: none;
			text-align: center;
			width: 40px; 
			border-radius: 4px;
		}
		
		.selectBm:hover {
		  background:#fff;
		  color:#1AAB8A;
		}
		
		.bmDelete:hover {
		  background:#fff;
		  color:#1AAB8A;
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
<script   src="https://www.gstatic.com/firebasejs/5.7.1/firebase-firestore.js"></script>
<script   src="https://www.gstatic.com/firebasejs/5.7.1/firebase-messaging.js"></script>
<script   src="https://www.gstatic.com/firebasejs/5.7.1/firebase-functions.js"></script>

<!-- Comment out (or don't include) services that you don't want to use -->
<!-- <script src="https://www.gstatic.com/firebasejs/5.7.1/firebase-storage.js"></script> -->
<script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
<!-- Firebase App is always required and must be first -->

<script>

$(function(){
	init();
	
	function init(){
		$.ajax({
			url:"selectAllBM",
			type:"get",
			success:function(resultData){
				
				output(resultData);
			}
		});
	}
	
	function output(resultData){
		
		var content = '';
		
		$.each(resultData, function(index, item){
			content += '<div class="news-body-seq" data-wow-duration="300ms" data-wow-delay="500ms" news-value="' + item.bmSeq + '">';
			content +=		'<div class="news-body-titleDiv">';
			content += 			'<div class="news-body-title" news-title="'+ item.title +'"><h4>'+ item.title +'</h4></div>';
			content +=		'</div>';
			content += 		'<div class="news-body-summary" news-summary="'+ item.summary +'"><h5 style="line-height: 140%;">&nbsp&nbsp' + item.summary + '</h5></div>';
			content += 		'<div class="news-body-press" news-press="'+ item.press +'"><h5>' + item.press + '</h5></div>';
			content +=		'<div class="news-body-btnDiv">';
			content += 			'<button class="selectBm" news-value="' + item.bmSeq + '">READ MORE</button>&nbsp<button class="bmDelete" news-value="' + item.bmSeq + '">DEL</button>';
			content +=		'</div>';
			content += '</div>';
		});
		
		$('.news-temp').html(content);
		
		/* bookmark 삭제  */
		$('.bmDelete').on("click", function(){
			var deleteSeq = $(this).attr('news-value');
			
			$.ajax({
				url : "deleteBM",
				data : {bmSeq:deleteSeq},
				type : "post",
				success : function(resultData){
					init();
				}
			});
		});
		
		/* 기사 원문보기 */
		$('.selectBm').on("click", function(){
			var newsLinkSeq = $(this).attr('news-value');
			
			$.ajax({
				url: "selectLink",
				data: {bmSeq:newsLinkSeq},
				type: "get",
				success : eventSuccess
			});
		});
		
		/* 기사를 새 창으로 띄워봅시다 */
		function eventSuccess(data){
			var newsLink = data;
			
			window.open(newsLink);
		}
	}
	
	$('#searchNews').keyup(function(){
		var search = $('#searchNews').val();
		
		searchNews(search);
	});
	
	function searchNews(search){
		
		$.ajax({
			url: "searchArticle",
			data: {
				title:search
				},
			type: "get",
			success: function(res){
				output(res);
			}
		});
		
	}
	
	
});
</script>
<body id="home" class="homepage">

    <header id="header">
        <nav id="main-menu" class="navbar navbar-default navbar-fixed-top" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="home.jsp"><img src="resources/images/marvelousmonday.png" alt="logo" width="200px" height="70px"></a>
                </div>
                <div class="collapse navbar-collapse navbar-right" style="width: 80%;">
                    <ul class="nav navbar-nav" style="width: 100%;">
                        <li class="scroll" style="margin-left:10%; font-size: 140%;"><a href="#home">About</a></li>
                        <li class="scroll" style="margin-left:10%; font-size: 140%;"><a href="goMindmap">MindMap</a></li>
                        <li class="scroll" style="margin-left:10%; font-size: 140%;"><a href="">Scrap</a></li>
                        <li class="scroll" style="margin-left:10%; font-size: 140%;"><a href="goMindmap">Share</a></li>                        
						<c:if test="${sessionScope.loginId==null}">
                        <li class="scroll" style="margin-left:10%; font-size: 140%;"><a href="login">Login</a></li>                        						
						</c:if>
						<c:if test="${sessionScope.loginId!=null}">
                        <li class="scroll" style="margin-left:10%; font-size: 140%;"><a href="logout">Logout</a></li>                        						
						</c:if>
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
    </header><!--/header-->

    <section id="services" >
        <div class="container">

            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown">${sessionScope.loginId}'s MindMap</h2>
                <p class="text-center wow fadeInDown"> Choose Your Mind</p>
            </div>
	
	
<!-- -------------------------------- 스크랩한 리스트 뿌려주기 --------------------------------------- -->	
			

            <div class="row">
                <div class="features">
                	<!--  style="width: 110%; margin-left:5%;" -->
                	
                	<!-- 북마크 내에서 검색어로 제목 찾기 -->
                	
                
                	<div class="news">
						<div class="searchDiv">
               				<input type="text" id="searchNews" name="searchNews" placeholder="키워드로 검색하기">
               			</div>
                		<div class="news-body">
                			<div class="news-temp">
                			</div>
                		</div>
					</div>
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
                    <!-- <ul class="social-icons">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                        <li><a href="#"><i class="fa fa-flickr"></i></a></li>
                        <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    </ul> -->
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