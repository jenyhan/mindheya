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
	$("#addContentPlaceholderFX").on('click', addContent);
	$("#search").on('keyup', search);
	
});
function addContent(){
	var name = $("#name").val();
	var seq = $("#udtno").val();
	
	if(name.length == 0) {
		alert("데이터를 입력해 주세요");
		return;
	}else{
		output();	
	}
		$("#udtno").val("");
		$("#addContentPlaceholderFX").attr("value","등록");
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
		data += '	<td><input type="button" class="udtbtn" data-sno="'+item.seq +'"value="수정" /></td>';
		data += '	<td><input type="button" class="delbtn" data-sno="'+item.seq +'"value="삭제" /></td>';
		data += '</tr>';
	}); 
	
	$("#reviewDiv").html(data);
	$(".delbtn").on("click",del);
	$(".udtbtn").on("click",udt);
	
}

</script>
<body id="box" class="home intercom-off" _appid="rot1" _pageid="rot12">
<div id="fb-root" style="display:none"></div>
<div id="bridge" style="display:none"></div>
<div id="popupPart"></div>
<div id="quicklookFramePart"></div>
<div id="feedlySignPart" style="display:none"></div>
<div id="helpSignPart"></div>
<div id="feedlyUndoSign" style="display:none">Marked as read. <span data-app-action="askUndo" class="action">Undo</span></div>
<div id="quickGoto" class="quickGoto" style="transition-duration: 350ms; opacity: 0; display: none;">
<div class="container">
<input id="quickGotoInput" type="text" class="textEntry" behavior="Completion" model="0" data-b7="1">
<div id="gotoCategoriesCompletion" class="list"></div>
</div>
</div>
<div id="herculePanel" style="display:none"></div>
<div id="notifications"></div>
<div id="modal"></div>
<div id="feedlyPersona" class="light">
<div id="feedlyChrome" class="leftnav-open">
<div id="feedlyMessageBar" class="fixed-bar" style="display:none">
<span id="feedlyMessageBarClose" data-app-action="closeMessageBar"></span>
<div id="messageBarContent"></div>
</div>
<!-- New container for FX pages -->
<div id="barsFX" class="fx" style="display: block;">
<div id="searchBarFX" class="fixed-bar"><div class="container centered"><i class="icon icon-md icon-tertiary icon-fx-feedly-android-md-black feedly-logo"></i><button class="pro primary small" type="button">Upgrade</button><div class="search-bar-right-col"><div class="profile-bubble"><div class="button-dropdown"><button class="secondary" title="" type="button"><div class="picture placeholder">ì</div></button></div></div></div></div></div>
<div id="headerBarFX" class="fixed-bar">
<!-- This is the element that will render the docked, floating header -->
</div>
</div>
<!-- Old header bar bar -->
<div id="headerBar" class="fixed-bar" title="Back to top" data-app-action="backToTop" style="cursor: pointer; display: none;" data-active="no">
<div id="floatingPageActionBar" class="pageActionBar" style="display: block;">
<img id="floatingPageActionMarkAsRead" title="mark as read" class="pageAction requiresLogin" data-page-action="markAsRead" src="images/icon-action-markasread.png" width="18" height="18" border="0" style="display:none"><img id="floatingPageActionRefresh" title="Refresh" class="pageAction" data-app-action="refresh" src="images/icon-action-refresh.png" width="18" height="18" border="0" style="display: none;"><img id="floatingPageActionCustomize" title="Change layout and filtering" class="pageAction requiresLogin" data-page-action="showCustomizer" src="images/icon-action-customize.png" width="18" height="18" border="0" style="display:none"><img title="Back to top" class="pageAction" data-app-action="backToTop" src="images/icon-action-backtotop.png" width="18" height="18" border="0"><img title="Jump to next" class="pageAction requiresLogin" data-app-action="jumpToNext" src="images/icon-action-next.png" width="18" height="18" border="0" style="display:none">
</div>
<h1 id="floatingTitleBar"></h1>
</div>
<div id="feedlyTabsHolder">
<div id="feedlyTabs" class="dark-aware" data-b7="2">
<div style="height:26px">
<div id="feedlyTabsPin" class="pinButton" data-app-action="pinLeftNav">Pin</div><div id="feedlyTabsUnpin" data-app-action="unpinLeftNav" class="pinButton">Unpin</div>
</div>

<div style="margin-bottom:40px">
 <div class="separator" style="margin-top:60px">
Feeds
</div>

<div class="fx">
<div class="empty-state is-sidebar">
 <p>
 <i data-uri="forms/createPersonalCollection" class="icon icon-md empty-state-icon icon-fx-rss-ios-md-black"></i>
 </p>
 <p>
 <a data-uri="forms/createPersonalCollection" class="button small secondary m-t-1">Create your first feed</a>
 </p>
</div>
</div>
 </div>
<a style="display:block; opacity:0.38; margin-top:20px; text-align: center" href="http://blog.feedly.com/2014/11/29/the-right-login/" target="new">Missing your feeds?</a>
</div>
<div id="addContentPlaceholderFX" class="fx" data-dot="sidebar-add-content"><div><div class="menu" style="top: 5px;"><div class="item"><i class="icon icon-sm icon-tertiary icon-fx-rss-ios-sm-black"></i>Add Website</div><div class="item"><i class="icon icon-sm icon-tertiary icon-fx-google-plus-ios-sm-black"></i>Add Keyword Alert</div></div><button class="full-width primary button-icon-left" type="button" style=""><i class="icon icon-sm icon-fx-add-ios-sm-white"></i><span class="button--label">Add Content</span></button></div><div class="fx"></div></div>
</div>
<div id="feedlyFrame" style="min-height: 739px; display: block;">
<!-- New container for FX pages -->
<div id="feedlyPageHolderFX" class="fx" style="display: block; min-height: 641px;">
<div id="feedlyPageFX" class="container centered"><div class="discover"><div class="tabs"><a class="active item"><i class="icon icon-md icon-fx-rss-ios-md-accent"></i>Websites</a><a class="item"><i class="icon icon-md icon-tertiary icon-fx-google-plus-ios-md-black"></i>Keyword alerts</a></div><div class="m-t-2"><div><p class="description">Discover the best sources for any topic</p><div class="form" style="position: relative;"><div class="discover-search with-language"><div class="fx-input button-right icon-left"><input id="" placeholder="Search by topic, website or RSS link" type="text" value=""><i class="icon icon-sm icon-secondary icon-fx-search-ios-sm-black"></i></div><div class="language-select">한국어<i class="icon icon-sm icon-tertiary icon-fx-arrowhead-down-ios-sm-black"></i></div></div></div><div class="results"><h4>Explore</h4><div><div class="list-card"><div class="row"><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#tech</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/KWupBD_i1HVHER28yf1hJlnVf3njo_iUwPNuadAOHok_svisual-16874ac7130&quot;);"></div><div>Featuring<br>전체 - 테크잇</div></div></div></div><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#news</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/Vr4BqOnWVJgAqGmieeFH6f15corQbht_i-KhVw30QxA_svisual-162022746ec&quot;);"></div><div>Featuring<br>자그니 블로그 : 거리로 나가자, 키스를 하자</div></div></div></div><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#business</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/HmmLyNLIK0s9NIoz4OV-LCOsuQ2eMbB_Wf6iXCjtIXg_svisual-15428f25037&quot;);"></div><div>Featuring<br>Business &amp; Trends</div></div></div></div><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#gaming</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/Ev1fCmzgZE03GJr8h3YQ2ArXcxwuOtapmCe1DLhDTQ4_visual-1601e2f8802&quot;);"></div><div>Featuring<br>Gaming &amp; Culture – Ars Technica</div></div></div></div><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#photography</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/qPoDiEbOw9HYhzp5mbYKj548WbXoflkHn8sT31sZcCY_visual-16661f2a51a&quot;);"></div><div>Featuring<br>National Geographic Photo of the Day</div></div></div></div><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#design</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/fSN7Xi7W7gtrxkpJEvOg3TRpywt2q8pI7QiiIgJlSx8_svisual-154283695ba&quot;);"></div><div>Featuring<br>Design Note</div></div></div></div><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#fashion</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/3TI5E5Eq515KB6ZoEXnvYaJXpNX2qXzZwsM_0VlDZoo_visual-162113fc91e&quot;);"></div><div>Featuring<br>패션비즈 | Today's News</div></div></div></div><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#cooking</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/Eu0O8pmYA6ELLnXA62TfzRGaKaXLoEh1wF6ut1oy_Ic_visual-15cf9088800&quot;);"></div><div>Featuring<br>A Couple Cooks</div></div></div></div><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#do it yourself</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/py-5EAfRjVXfkB3cJ9mrhk82Sof99Pgv-S6OP7XMNCA_visual-15e89a148b4&quot;);"></div><div>Featuring<br>Vert Cerise – Blog DIY – Do It Yourself – lifestyle et créatif</div></div></div></div><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#sport</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/iFDShc4kbVE49zTpbHyDQPx_4IuBL74D5hfX5yhQdlg_visual-16375fc5bbf&quot;);"></div><div>Featuring<br>동아닷컴 : 스포츠동아 야구 뉴스</div></div></div></div><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#cinema</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/y7nE6k6LYxjrH59CtMyTo9ZPK2Yt6dPeqvaUFEvo3lo_svisual-1542e9e0cf3&quot;);"></div><div>Featuring<br>Cinema Blues</div></div></div></div><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#youtube</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/SwidTYgx0H2BBhwmW5jMKaN5Ma5v5iWSTKeBRZgK7is_svisual-161d5cc5d72&quot;);"></div><div>Featuring<br>SMTOWN</div></div></div></div><div class="col-xs-12 col-md-3 m-b-1"><div class="card topic-card"><div class="card-header">#vimeo</div><div class="card-footer"><div class="topic-visual" style="background-image: url(&quot;//storage.googleapis.com/site-assets/wTfISbavTwZvyGeXLjPQvbVpktzFXgCmEf_fGRw9ZKo_svisual-163f6ab2d5e&quot;);"></div><div>Featuring<br>Vimeo / Independent Filmmakers</div></div></div></div></div></div></div></div></div></div></div></div>
</div>
<div id="mainBar" style="width: 321px; display: none;" class="fx">
<div>
<div id="feedlyPart0" class="area" tabindex="-1" style="min-height: 739px;">
<div id="feedlyPageHeader" style="display:none">
<div class="pageActionBar">
<span id="pageActionLayouts" style="display:none">
<img id="pageActionLayout0" title="Title Only View (Google Reader)" class="pageLayoutAction" data-page-action="changeOverviewSize" data-page-action-input="0" src="images/icon-action-overview-0@2x.png" width="24" height="24" border="0"><img id="pageActionLayout4" title="Magazine View" class="pageLayoutAction" data-page-action="changeOverviewSize" data-page-action-input="4" src="images/icon-action-overview-4@2x.png" width="24" height="24" border="0"><img id="pageActionLayout6" title="Cards View" class="pageLayoutAction" data-page-action="changeOverviewSize" data-page-action-input="6" src="images/icon-action-overview-6@2x.png" width="24" height="24" border="0" style="margin-right:12px"><img id="pageActionLayout100" title="Full Article" class="pageLayoutAction" data-page-action="changeOverviewSize" data-page-action-input="100" src="images/icon-action-overview-100@2x.png" width="24" height="24" border="0" style="margin-right:12px; display:none">
</span>
<img id="pageActionMarkAsRead" title="mark as read" class="pageAction requiresLogin" data-page-action="markAsRead" src="images/icon-action-markasread.png" width="24" height="24" border="0" style="display:none"><img id="pageActionRefresh" title="Refresh" class="pageAction" data-app-action="refresh" src="images/icon-action-refresh.png" width="24" height="24" border="0" style="display: none;"><img id="pageActionCustomize" title="Change layout and filtering" class="pageAction requiresLogin" data-page-action="showCustomizer" src="images/icon-action-customize.png" width="24" height="24" border="0" style="display:none"><img title="Jump to next" class="pageAction requiresLogin" data-app-action="jumpToNext" src="images/icon-action-next.png" width="24" height="24" border="0" style="display:none"><div id="searchBoxPlaceholder" class="fx"><div id="hercule" style="display:none"></div></div>
</div>
<h1 id="feedlyTitleBar"></h1>
</div>
<div id="feedlyPart" _controllerid="rot12">
<div id="feedlyPage" style="width: 253px;"></div>
</div>
<div id="sideArea" style="display:none"> <div id="memesModule_part" class="sideAreaModule" style="display:none"></div> 
 <div id="sourcesModule_part" class="sideAreaModule" style="display:none"></div> 
 <div id="discoverModule_part" class="sideAreaModule" style="display:none"></div> 
 <div id="helpSearchModule_part" class="sideAreaModule" style="display:none"></div> 
 <div id="topicsSearchModule_part" class="sideAreaModule" style="display:none"></div> 
 <div id="feedsSearchModule_part" class="sideAreaModule" style="display:none"></div> 
 <div id="proAdModule_part" class="sideAreaModule" style="display:none"></div> 
</div>
<div style="clear:both"></div>
</div>
<div id="aboutArea" class="area secondaryArea" style="display:none"></div>
</div>
</div>
</div>
</div>
</div>
<div id="floatingEntry"><div><span></span><span></span></div></div>

<div id="feedlySignPart" style="display: none;"></div><div id="feedlyHelpSignPart" style="display: none;"></div><div id="feedlyDialogFrameParent"><div id="feedlyDialogFramePart"></div><div id="feedlyBacksplashPart"></div></div><div id="feedlyBackPart" title="click to minimize"></div><div id="dragableCategoryTab"></div><div id="hs-beacon"><div data-reactroot=""><iframe style="border: none; bottom: 0px; height: 0px; position: fixed; right: 0px; top: 0px; width: 0px; z-index: 1050; left: 0px; background: rgba(0, 0, 0, 0.5);"></iframe></div></div><iframe frameborder="0" allowtransparency="true" scrolling="no" name="__privateStripeMetricsController0" allowpaymentrequest="true" src="https://js.stripe.com/v2/m/outer.html#url=https%3A%2F%2Ffeedly.com%2F&amp;title=Feedly.%20Read%20more%2C%20know%20more.&amp;referrer=&amp;muid=db612d68-5c54-4778-84fd-61bb0de2ad1b&amp;sid=94dd67e5-278f-4885-be3f-eae1ef62b062&amp;preview=false" aria-hidden="true" tabindex="-1" style="border: none !important; margin: 0px !important; padding: 0px !important; width: 1px !important; min-width: 100% !important; overflow: hidden !important; display: block !important; visibility: hidden !important; position: fixed !important; height: 1px !important; pointer-events: none !important;"></iframe></body>
</body>
</html>