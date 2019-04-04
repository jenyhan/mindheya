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
				alert(resultData);
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
                <div class="features" style="width: 110%; margin-left:5%;">
                	<div class="news">
                		<div class="news-body">
							<!-- <div class="news-body-title">
								
							</div>
							<div class="news-body-summary">
							
							</div>
							<div class="news-body-press">
							
							</div>
							<div class="news-body-address">
							
							</div> -->
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