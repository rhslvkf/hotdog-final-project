
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 마우스 오버시 메뉴바 출력 -->
<script type="text/javascript">
$(document).ready(function(){
	$('.js-activated').dropdownHover().dropdown();
	if("${sessionScope.loginVo}" != null){
		$.ajax({
			type:"POST",
			url:"getCountOfPosting.do",
			data:"memberId=${sessionScope.loginVo.memberId}",
			success:function(result){ 
				$("#countOfMyPosting").text("작성한 게시글("+result+")");
			}
		});
		$.ajax({
			type:"POST",
			url:"getCountOfComment.do",
			data:"memberNickName=${sessionScope.loginVo.memberNickName}",
			success:function(result){ 
				$("#countOfMyComment").text("작성한 댓글("+result+")");
			}
		});
		$.ajax({
			type:"POST",
			url:"showMyScrapeList.do",
			data:"memberId=${sessionScope.loginVo.memberId}",
			success:function(result){ 
				var countOfMyScrape = result.board_abandoned.length + result.board_adoption.length + result.board_petInfo.length;
				$("#countOfMyScrape").text("스크랩한 게시글("+countOfMyScrape+")");
			}
		});
	}
}); 

$(function () {
	$('[data-toggle="tooltip"]').tooltip()
})
</script>
<!-- 마우스 오버시 메뉴바 출력 끝-->
<script type="text/javascript">

$(document).on("click","#pagingOfAbandoned", function(){
	var memberId = "${sessionScope.loginVo.memberId}";
	var pageNoOfAbandoned = $(this).text();
	if(pageNoOfAbandoned == "Next"){
		pageNoOfAbandoned = $("#endPageOfAbandoned").val();
	}else if(pageNoOfAbandoned == "Prev"){
		pageNoOfAbandoned = $("#startPageOfAbandoned").val();
	}
	var pageNoOfAdoption = $("#pageNoOfAdoption").val();
	var pageNoOfCommunity = $("#pageNoOfCommunity").val();
	var pageNoOfPetInfo = $("#pageNoOfPetInfo").val();
	var pageNoOfPetPicture = $("#pageNoOfPetPicture").val();
	showMyPostingList(memberId,pageNoOfAbandoned,pageNoOfAdoption,pageNoOfCommunity,pageNoOfPetInfo,pageNoOfPetPicture);
});

$(document).on("click","#pagingOfAdoption", function(){
	var memberId = "${sessionScope.loginVo.memberId}";
	var pageNoOfAdoption = $(this).text();
	if(pageNoOfAdoption == "Next"){
		pageNoOfAdoption = $("#endPageOfAdoption").val();
	}else if(pageNoOfAdoption == "Prev"){
		pageNoOfAdoption = $("#startPageOfAdoption").val();
	}
	var pageNoOfAbandoned = $("#pageNoOfAbandoned").val();
	var pageNoOfCommunity = $("#pageNoOfCommunity").val();
	var pageNoOfPetInfo = $("#pageNoOfPetInfo").val();
	var pageNoOfPetPicture = $("#pageNoOfPetPicture").val();
	showMyPostingList(memberId,pageNoOfAbandoned,pageNoOfAdoption,pageNoOfCommunity,pageNoOfPetInfo,pageNoOfPetPicture);
});

$(document).on("click","#pagingOfCommunity", function(){
	var memberId = "${sessionScope.loginVo.memberId}";
	var pageNoOfCommunity = $(this).text();
	if(pageNoOfCommunity == "Next"){
		pageNoOfCommunity = $("#endPageOfCommunity").val();
	}else if(pageNoOfCommunity == "Prev"){
		pageNoOfCommunity = $("#startPageOfCommunity").val();
	}
	var pageNoOfAdoption = $("#pageNoOfAdoption").val();
	var pageNoOfAbandoned = $("#pageNoOfAbandoned").val();
	var pageNoOfPetInfo = $("#pageNoOfPetInfo").val();
	var pageNoOfPetPicture = $("#pageNoOfPetPicture").val();
	showMyPostingList(memberId,pageNoOfAbandoned,pageNoOfAdoption,pageNoOfCommunity,pageNoOfPetInfo,pageNoOfPetPicture);
});

$(document).on("click","#pagingOfPetInfo", function(){
	var memberId = "${sessionScope.loginVo.memberId}";
	var pageNoOfPetInfo = $(this).text();
	if(pageNoOfPetInfo == "Next"){
		pageNoOfPetInfo = $("#endPageOfPetInfo").val();
	}else if(pageNoOfPetInfo == "Prev"){
		pageNoOfPetInfo = $("#startPageOfPetInfo").val();
	}
	var pageNoOfAdoption = $("#pageNoOfAdoption").val();
	var pageNoOfCommunity = $("#pageNoOfCommunity").val();
	var pageNoOfAbandoned = $("#pageNoOfAbandoned").val();
	var pageNoOfPetPicture = $("#pageNoOfPetPicture").val();
	showMyPostingList(memberId,pageNoOfAbandoned,pageNoOfAdoption,pageNoOfCommunity,pageNoOfPetInfo,pageNoOfPetPicture);
});

$(document).on("click","#pagingOfPetPicture", function(){
	var memberId = "${sessionScope.loginVo.memberId}";
	var pageNoOfPetPicture = $(this).text();
	if(pageNoOfPetPicture == "Next"){
		pageNoOfPetPicture = $("#endPageOfPetPicture").val();
	}else if(pageNoOfPetPicture == "Prev"){
		pageNoOfPetPicture = $("#startPageOfPetPicture").val();
	}
	var pageNoOfAdoption = $("#pageNoOfAdoption").val();
	var pageNoOfCommunity = $("#pageNoOfCommunity").val();
	var pageNoOfPetInfo = $("#pageNoOfPetInfo").val();
	var pageNoOfAbandoned = $("#pageNoOfAbandoned").val();
	showMyPostingList(memberId,pageNoOfAbandoned,pageNoOfAdoption,pageNoOfCommunity,pageNoOfPetInfo,pageNoOfPetPicture);
});

//작성한 글 목록 불러오기
function showMyPostingList(memberId,pageNoOfAbandoned,pageNoOfAdoption,pageNoOfCommunity,pageNoOfPetInfo,pageNoOfPetPicture){
	$.ajax({
		type:"POST",
		url:"showPostingList.do",
		data:"memberId="+memberId+"&pageNoOfAbandoned="+pageNoOfAbandoned+"&pageNoOfAdoption="+pageNoOfAdoption
		+"&pageNoOfCommunity="+pageNoOfCommunity+"&pageNoOfPetInfo="+pageNoOfPetInfo+"&pageNoOfPetPicture="+pageNoOfPetPicture,
		success:function(result){ 
			var title = "<input type='hidden' id='pageNoOfAbandoned' value='"+pageNoOfAbandoned+"'>";
			title += "<input type='hidden' id='pageNoOfAdoption' value='"+pageNoOfAdoption+"'>";
			title += "<input type='hidden' id='pageNoOfCommunity' value='"+pageNoOfCommunity+"'>";
			title += "<input type='hidden' id='pageNoOfPetInfo' value='"+pageNoOfPetInfo+"'>";
			title += "<input type='hidden' id='pageNoOfPetPicture' value='"+pageNoOfPetPicture+"'>";
			title += "<input type='hidden' id='endPageOfAbandoned' value='"+(result.board_abandoned_paging.endPageOfPageGroup+1)+"'>";
			title += "<input type='hidden' id='startPageOfAbandoned' value='"+(result.board_abandoned_paging.startPageOfPageGroup-1)+"'>";
			title += "<input type='hidden' id='endPageOfAdoption' value='"+(result.board_adoption_paging.endPageOfPageGroup+1)+"'>";
			title += "<input type='hidden' id='startPageOfAdoption' value='"+(result.board_adoption_paging.startPageOfPageGroup-1)+"'>";
			title += "<input type='hidden' id='endPageOfCommunity' value='"+(result.board_community_paging.endPageOfPageGroup+1)+"'>";
			title += "<input type='hidden' id='startPageOfCommunity' value='"+(result.board_community_paging.startPageOfPageGroup-1)+"'>";
			title += "<input type='hidden' id='endPageOfPetInfo' value='"+(result.board_petInfo_paging.endPageOfPageGroup+1)+"'>";
			title += "<input type='hidden' id='startPageOfPetInfo' value='"+(result.board_petInfo_paging.startPageOfPageGroup-1)+"'>";
			title += "<input type='hidden' id='endPageOfPetPicture' value='"+(result.board_petPicture_paging.endPageOfPageGroup+1)+"'>";
			title += "<input type='hidden' id='startPageOfPetPicture' value='"+(result.board_petPicture_paging.startPageOfPageGroup-1)+"'>";
			title += "<table class='showListPosting'>";
			if(result.board_abandoned.length != 0){
				title += "<tr><td colspan='5' align='left'><h3>"+result.board_abandoned[0].boardType+"</h3></td></tr>";
				title += "<tr><th width='15%'>번호</th><th width='30%'>제목</th><th width='15%'>닉네임</th><th width='10%'>작성일</th><th width='10%'>조회수</th></tr>";
				for(var i=0;i<result.board_abandoned.length;i++){
					title += "<tr><td>"+result.board_abandoned[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_abandoned[i].boardNumber
							+"&type=board_abandoned'>"
							+result.board_abandoned[i].boardTitle+
							"</a></td><td>"+result.board_abandoned[i].memberVO.memberNickName
							+"</td><td>"+result.board_abandoned[i].boardDate
							+"</td><td>"+result.board_abandoned[i].boardHits+"</td></tr>";
				}
				title += "</table>";
				title += "<p class='paging'>";
				title += "<div class='col-md-12 text-center'>";
				title += "<ul class='pagination'>";
				if(result.board_abandoned_paging.previousPageGroup){
					title += "<li><a href='#' id='pagingOfAbandoned'>Prev</a></li>";
				}
				for(var i=result.board_abandoned_paging.startPageOfPageGroup;i<=result.board_abandoned_paging.endPageOfPageGroup;i++){
					if(result.board_abandoned_paging.nowPage != i){
						title += "<li><a href='#' id='pagingOfAbandoned'>"+i+"</a></li>";
					}else{
						title += "<li class='active'><a>"+i+"</a></li>";
					}
				}
				if(result.board_abandoned_paging.nextPageGroup){
					title += "<li><a href='#' id='pagingOfAbandoned'>Next</a></li>";
				}
				title += "</ul>";
				title += "</div>";
			}
			if(result.board_adoption.length != 0){
				title += "<table class='showListPosting'><tr align='left'><td colspan='5'><h3>"+result.board_adoption[0].boardType+"</h3></td></tr>";
				title += "<tr><th width='15%'>번호</th><th width='30%'>제목</th><th width='15%'>닉네임</th><th width='10%'>작성일</th><th width='10%'>조회수</th></tr>";
				for(var i=0;i<result.board_adoption.length;i++){
					title += "<tr><td>"+result.board_adoption[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_adoption[i].boardNumber
							+"&type=board_adoption'>"
							+result.board_adoption[i].boardTitle+
							"</a></td><td>"+result.board_adoption[i].memberVO.memberNickName
							+"</td><td>"+result.board_adoption[i].boardDate
							+"</td><td>"+result.board_adoption[i].boardHits+"</td></tr>";
				}
				title += "</table>";
				title += "<p class='paging'>";
				title += "<div class='col-md-12 text-center'>";
				title += "<ul class='pagination'>";
				if(result.board_adoption_paging.previousPageGroup){
					title += "<li><a href='#' id='pagingOfAdoption'>Prev</a></li>";
				}
				for(var i=result.board_adoption_paging.startPageOfPageGroup;i<=result.board_adoption_paging.endPageOfPageGroup;i++){
					if(result.board_adoption_paging.nowPage != i){
						title += "<li><a href='#' id='pagingOfAdoption'>"+i+"</a></li>";
					}else{
						title += "<li class='active'><a>"+i+"</a></li>";
					}
				}
				if(result.board_adoption_paging.nextPageGroup){
					title += "<li><a href='#' id='pagingOfAdoption'>Next</a></li>";
				}
				title += "</ul>";
				title += "</div>";
			}
			if(result.board_community.length != 0){
				title += "<table class='showListPosting'><tr align='left'><td colspan='5'><h3>"+result.board_community[0].boardType+"</h3></td></tr>";
				title += "<tr><th width='15%'>번호</th><th width='30%'>제목</th><th width='15%'>닉네임</th><th width='10%'>작성일</th><th width='10%'>조회수</th></tr>";
				for(var i=0;i<result.board_community.length;i++){
					title += "<tr><td>"+result.board_community[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_community[i].boardNumber
							+"&type=board_community'>"
							+result.board_community[i].boardTitle+
							"</a></td><td>"+result.board_community[i].memberVO.memberNickName
							+"</td><td>"+result.board_community[i].boardDate
							+"</td><td>"+result.board_community[i].boardHits+"</td></tr>";
				}
				title += "</table>";
				title += "<p class='paging'>";
				title += "<div class='col-md-12 text-center'>";
				title += "<ul class='pagination'>";
				if(result.board_community_paging.previousPageGroup){
					title += "<li><a href='#' id='pagingOfCommunity'>Prev</a></li>";
				}
				for(var i=result.board_community_paging.startPageOfPageGroup;i<=result.board_community_paging.endPageOfPageGroup;i++){
					if(result.board_community_paging.nowPage != i){
						title += "<li><a href='#' id='pagingOfCommunity'>"+i+"</a></li>";
					}else{
						title += "<li class='active'><a>"+i+"</a></li>";
					}
				}
				if(result.board_community_paging.nextPageGroup){
					title += "<li><a href='#' id='pagingOfCommunity'>Next</a></li>";
				}
				title += "</ul>";
				title += "</div>";
			}
			if(result.board_petInfo.length != 0){
				title += "<table class='showListPosting'><tr align='left'><td colspan='5'><h3>"+result.board_petInfo[0].boardType+"</h3></td></tr>";
				title += "<tr><th width='15%'>번호</th><th width='30%'>제목</th><th width='15%'>닉네임</th><th width='10%'>작성일</th><th width='10%'>조회수</th></tr>";
				for(var i=0;i<result.board_petInfo.length;i++){
					title += "<tr><td>"+result.board_petInfo[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_petInfo[i].boardNumber
							+"&type=board_petInfo'>"
							+result.board_petInfo[i].boardTitle+
							"</a></td><td>"+result.board_petInfo[i].memberVO.memberNickName
							+"</td><td>"+result.board_petInfo[i].boardDate
							+"</td><td>"+result.board_petInfo[i].boardHits+"</td></tr>";
				}
				title += "</table>";
				title += "<p class='paging'>";
				title += "<div class='col-md-12 text-center'>";
				title += "<ul class='pagination'>";
				if(result.board_petInfo_paging.previousPageGroup){
					title += "<li><a href='#' id='pagingOfPetInfo'>Prev</a></li>";
				}
				for(var i=result.board_petInfo_paging.startPageOfPageGroup;i<=result.board_petInfo_paging.endPageOfPageGroup;i++){
					if(result.board_petInfo_paging.nowPage != i){
						title += "<li><a href='#' id='pagingOfPetInfo'>"+i+"</a></li>";
					}else{
						title += "<li class='active'><a>"+i+"</a></li>";
					}
				}
				if(result.board_petInfo_paging.nextPageGroup){
					title += "<li><a href='#' id='pagingOfPetInfo'>Next</a></li>";
				}
				title += "</ul>";
				title += "</div>";
			}
			if(result.board_petPicture.length != 0){
				title += "<table class='showListPosting'><tr align='left'><td colspan='5'><h3>"+result.board_petPicture[0].boardType+"</h3></td></tr>";
				title += "<tr><th width='15%'>번호</th><th width='30%'>제목</th><th width='15%'>닉네임</th><th width='10%'>작성일</th><th width='10%'>조회수</th></tr>";
				for(var i=0;i<result.board_petPicture.length;i++){
					title += "<tr><td>"+result.board_petPicture[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_petPicture[i].boardNumber
							+"&type=board_petPicture'>"
							+result.board_petPicture[i].boardTitle+
							"</a></td><td>"+result.board_petPicture[i].memberVO.memberNickName
							+"</td><td>"+result.board_petPicture[i].boardDate
							+"</td><td>"+result.board_petPicture[i].boardHits+"</td></tr>";
				}
			}
			title += "</table>";
			title += "<p class='paging'>";
			title += "<div class='col-md-12 text-center'>";
			title += "<ul class='pagination'>";
			if(result.board_petPicture_paging.previousPageGroup){
				title += "<li><a href='#' id='pagingOfPetPicture'>Prev</a></li>";
			}
			for(var i=result.board_petPicture_paging.startPageOfPageGroup;i<=result.board_petPicture_paging.endPageOfPageGroup;i++){
				if(result.board_petPicture_paging.nowPage != i){
					title += "<li><a href='#' id='pagingOfPetPicture'>"+i+"</a></li>";
				}else{
					title += "<li class='active'><a>"+i+"</a></li>";
				}
			}
			if(result.board_petPicture_paging.nextPageGroup){
				title += "<li><a href='#' id='pagingOfPetPicture'>Next</a></li>";
			}
			title += "</ul>";
			title += "</div>";
			$("#boardList").html(title);
			$("#showMyPostingList").modal();
		}
	});
}

//스크랩 리스트
function showMyScrapeList(memberId){
	$.ajax({
		type:"POST",
		url:"showMyScrapeList.do",
		data:"memberId="+memberId,
		success:function(result){ 
			var title = "<table class='showListPosting'>";
			if(result.board_abandoned.length != 0){
				title += "<tr><td colspan='5'><h3>"+result.board_abandoned[0].boardType+"</h3></td></tr>";
				title += "<tr><th>번호</th><th>제목</th><th>닉네임</th><th>작성일</th><th>조회수</th></tr>";
				for(var i=0;i<result.board_abandoned.length;i++){
					title += "<tr><td>"+result.board_abandoned[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_abandoned[i].boardNumber
							+"&type=board_abandoned'>"
							+result.board_abandoned[i].boardTitle+
							"</a></td><td>"+result.board_abandoned[i].memberVO.memberNickName
							+"</td><td>"+result.board_abandoned[i].boardDate
							+"</td><td>"+result.board_abandoned[i].boardHits+"</td></tr>";
				}
			}
			if(result.board_adoption.length != 0){
				title += "<tr><td colspan='5'><h3>"+result.board_adoption[0].boardType+"</h3></td></tr>";
				title += "<tr><th>번호</th><th>제목</th><th>닉네임</th><th>작성일</th><th>조회수</th></tr>";
				for(var i=0;i<result.board_adoption.length;i++){
					title += "<tr><td>"+result.board_adoption[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_adoption[i].boardNumber
							+"&type=board_adoption'>"
							+result.board_adoption[i].boardTitle+
							"</a></td><td>"+result.board_adoption[i].memberVO.memberNickName
							+"</td><td>"+result.board_adoption[i].boardDate
							+"</td><td>"+result.board_adoption[i].boardHits+"</td></tr>";
				}
			}
			if(result.board_petInfo.length != 0){
				title += "<tr><td colspan='5'><h3>"+result.board_petInfo[0].boardType+"</h3></td></tr>";
				title += "<tr><th>번호</th><th>제목</th><th>닉네임</th><th>작성일</th><th>조회수</th></tr>";
				for(var i=0;i<result.board_petInfo.length;i++){
					title += "<tr><td>"+result.board_petInfo[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_petInfo[i].boardNumber
							+"&type=board_petInfo'>"
							+result.board_petInfo[i].boardTitle+
							"</a></td><td>"+result.board_petInfo[i].memberVO.memberNickName
							+"</td><td>"+result.board_petInfo[i].boardDate
							+"</td><td>"+result.board_petInfo[i].boardHits+"</td></tr>";
				}
			}
			title += "</table>";
			$("#scrapeTitle").html(title);
			$("#showScrapeList").modal();
		}
	});
}

$(document).on("click","#pagingOfAbandonedComment", function(){
	var memberNickName = "${sessionScope.loginVo.memberNickName}";
	var pageNoOfAbandoned = $(this).text();
	if(pageNoOfAbandoned == "Next"){
		pageNoOfAbandoned = $("#endPageOfAbandonedComment").val();
	}else if(pageNoOfAbandoned == "Prev"){
		pageNoOfAbandoned = $("#startPageOfAbandonedComment").val();
	}
	var pageNoOfAdoption = $("#pageNoOfAdoptionComment").val();
	var pageNoOfCommunity = $("#pageNoOfCommunityComment").val();
	var pageNoOfPetInfo = $("#pageNoOfPetInfoComment").val();
	var pageNoOfPetPicture = $("#pageNoOfPetPictureComment").val();
	showMyCommentList(memberNickName,pageNoOfAbandoned,pageNoOfAdoption,pageNoOfCommunity,pageNoOfPetInfo,pageNoOfPetPicture);
});

$(document).on("click","#pagingOfAdoptionComment", function(){
	var memberNickName = "${sessionScope.loginVo.memberNickName}";
	var pageNoOfAdoption = $(this).text();
	if(pageNoOfAdoption == "Next"){
		pageNoOfAdoption = $("#endPageOfAdoptionComment").val();
	}else if(pageNoOfAdoption == "Prev"){
		pageNoOfAdoption = $("#startPageOfAdoptionComment").val();
	}
	var pageNoOfAbandoned = $("#pageNoOfAbandonedComment").val();
	var pageNoOfCommunity = $("#pageNoOfCommunityComment").val();
	var pageNoOfPetInfo = $("#pageNoOfPetInfoComment").val();
	var pageNoOfPetPicture = $("#pageNoOfPetPictureComment").val();
	showMyCommentList(memberNickName,pageNoOfAbandoned,pageNoOfAdoption,pageNoOfCommunity,pageNoOfPetInfo,pageNoOfPetPicture);
});

$(document).on("click","#pagingOfCommunityComment", function(){
	var memberNickName = "${sessionScope.loginVo.memberNickName}";
	var pageNoOfCommunity = $(this).text();
	if(pageNoOfCommunity == "Next"){
		pageNoOfCommunity = $("#endPageOfCommunityComment").val();
	}else if(pageNoOfCommunity == "Prev"){
		pageNoOfCommunity = $("#startPageOfCommunityComment").val();
	}
	var pageNoOfAdoption = $("#pageNoOfAdoptionComment").val();
	var pageNoOfAbandoned = $("#pageNoOfAbandonedComment").val();
	var pageNoOfPetInfo = $("#pageNoOfPetInfoComment").val();
	var pageNoOfPetPicture = $("#pageNoOfPetPictureComment").val();
	showMyCommentList(memberNickName,pageNoOfAbandoned,pageNoOfAdoption,pageNoOfCommunity,pageNoOfPetInfo,pageNoOfPetPicture);
});

$(document).on("click","#pagingOfPetInfoComment", function(){
	var memberNickName = "${sessionScope.loginVo.memberNickName}";
	var pageNoOfPetInfo = $(this).text();
	if(pageNoOfPetInfo == "Next"){
		pageNoOfPetInfo = $("#endPageOfPetInfoComment").val();
	}else if(pageNoOfPetInfo == "Prev"){
		pageNoOfPetInfo = $("#startPageOfPetInfoComment").val();
	}
	var pageNoOfAdoption = $("#pageNoOfAdoptionComment").val();
	var pageNoOfCommunity = $("#pageNoOfCommunityComment").val();
	var pageNoOfAbandoned = $("#pageNoOfAbandonedComment").val();
	var pageNoOfPetPicture = $("#pageNoOfPetPictureComment").val();
	showMyCommentList(memberNickName,pageNoOfAbandoned,pageNoOfAdoption,pageNoOfCommunity,pageNoOfPetInfo,pageNoOfPetPicture);
});

$(document).on("click","#pagingOfPetPictureComment", function(){
	var memberNickName = "${sessionScope.loginVo.memberNickName}";
	var pageNoOfPetPicture = $(this).text();
	if(pageNoOfPetPicture == "Next"){
		pageNoOfPetPicture = $("#endPageOfPetPictureComment").val();
	}else if(pageNoOfPetPicture == "Prev"){
		pageNoOfPetPicture = $("#startPageOfPetPictureComment").val();
	}
	var pageNoOfAdoption = $("#pageNoOfAdoptionComment").val();
	var pageNoOfCommunity = $("#pageNoOfCommunityComment").val();
	var pageNoOfPetInfo = $("#pageNoOfPetInfoComment").val();
	var pageNoOfAbandoned = $("#pageNoOfAbandonedComment").val();
	showMyCommentList(memberNickName,pageNoOfAbandoned,pageNoOfAdoption,pageNoOfCommunity,pageNoOfPetInfo,pageNoOfPetPicture);
});

//댓글 리스트
function showMyCommentList(memberNickName,pageNoOfAbandoned,pageNoOfAdoption,pageNoOfCommunity,pageNoOfPetInfo,pageNoOfPetPicture){
	$.ajax({
		type:"POST",
		url:"getCommentListByNickName.do",
		data:"memberNickName="+memberNickName+"&pageNoOfAbandoned="+pageNoOfAbandoned+"&pageNoOfAdoption="+pageNoOfAdoption
		+"&pageNoOfCommunity="+pageNoOfCommunity+"&pageNoOfPetInfo="+pageNoOfPetInfo+"&pageNoOfPetPicture="+pageNoOfPetPicture,
		success:function(result){ 
			var title = "<input type='hidden' id='pageNoOfAbandonedComment' value='"+pageNoOfAbandoned+"'>";
			title += "<input type='hidden' id='pageNoOfAdoptionComment' value='"+pageNoOfAdoption+"'>";
			title += "<input type='hidden' id='pageNoOfCommunityComment' value='"+pageNoOfCommunity+"'>";
			title += "<input type='hidden' id='pageNoOfPetInfoComment' value='"+pageNoOfPetInfo+"'>";
			title += "<input type='hidden' id='pageNoOfPetPictureComment' value='"+pageNoOfPetPicture+"'>";
			title += "<input type='hidden' id='endPageOfAbandonedComment' value='"+(result.board_abandoned_paging.endPageOfPageGroup+1)+"'>";
			title += "<input type='hidden' id='startPageOfAbandonedComment' value='"+(result.board_abandoned_paging.startPageOfPageGroup-1)+"'>";
			title += "<input type='hidden' id='endPageOfAdoptionComment' value='"+(result.board_adoption_paging.endPageOfPageGroup+1)+"'>";
			title += "<input type='hidden' id='startPageOfAdoptionComment' value='"+(result.board_adoption_paging.startPageOfPageGroup-1)+"'>";
			title += "<input type='hidden' id='endPageOfCommunityComment' value='"+(result.board_community_paging.endPageOfPageGroup+1)+"'>";
			title += "<input type='hidden' id='startPageOfCommunityComment' value='"+(result.board_community_paging.startPageOfPageGroup-1)+"'>";
			title += "<input type='hidden' id='endPageOfPetInfoComment' value='"+(result.board_petInfo_paging.endPageOfPageGroup+1)+"'>";
			title += "<input type='hidden' id='startPageOfPetInfoComment' value='"+(result.board_petInfo_paging.startPageOfPageGroup-1)+"'>";
			title += "<input type='hidden' id='endPageOfPetPictureComment' value='"+(result.board_petPicture_paging.endPageOfPageGroup+1)+"'>";
			title += "<input type='hidden' id='startPageOfPetPictureComment' value='"+(result.board_petPicture_paging.startPageOfPageGroup-1)+"'>";
			title += "<table class='showListPosting'>";
			if(result.board_abandoned.length != 0){
				title += "<tr><td colspan='5' align='left'><h3>"+result.board_abandoned[0].boardType+"</h3></td></tr>";
				title += "<tr><th width='15%'>번호</th><th width='30%'>제목</th><th width='15%'>닉네임</th><th width='10%'>작성일</th><th width='10%'>조회수</th></tr>";
				for(var i=0;i<result.board_abandoned.length;i++){
					title += "<tr><td>"+result.board_abandoned[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_abandoned[i].boardNumber
							+"&type=board_abandoned'>"
							+result.board_abandoned[i].boardTitle+
							"</a></td><td>"+result.board_abandoned[i].memberVO.memberNickName
							+"</td><td>"+result.board_abandoned[i].boardDate
							+"</td><td>"+result.board_abandoned[i].boardHits+"</td></tr>";
				}
				title += "</table>";
				title += "<p class='paging'>";
				title += "<div class='col-md-12 text-center'>";
				title += "<ul class='pagination'>";
				if(result.board_abandoned_paging.previousPageGroup){
					title += "<li><a href='#' id='pagingOfAbandonedComment'>Prev</a></li>";
				}
				for(var i=result.board_abandoned_paging.startPageOfPageGroup;i<=result.board_abandoned_paging.endPageOfPageGroup;i++){
					if(result.board_abandoned_paging.nowPage != i){
						title += "<li><a href='#' id='pagingOfAbandonedComment'>"+i+"</a></li>";
					}else{
						title += "<li class='active'><a>"+i+"</a></li>";
					}
				}
				if(result.board_abandoned_paging.nextPageGroup){
					title += "<li><a href='#' id='pagingOfAbandonedComment'>Next</a></li>";
				}
				title += "</ul>";
				title += "</div>";
			}
			if(result.board_adoption.length != 0){
				title += "<table class='showListPosting'><tr align='left'><td colspan='5'><h3>"+result.board_adoption[0].boardType+"</h3></td></tr>";
				title += "<tr><th width='15%'>번호</th><th width='30%'>제목</th><th width='15%'>닉네임</th><th width='10%'>작성일</th><th width='10%'>조회수</th></tr>";
				for(var i=0;i<result.board_adoption.length;i++){
					title += "<tr><td>"+result.board_adoption[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_adoption[i].boardNumber
							+"&type=board_adoption'>"
							+result.board_adoption[i].boardTitle+
							"</a></td><td>"+result.board_adoption[i].memberVO.memberNickName
							+"</td><td>"+result.board_adoption[i].boardDate
							+"</td><td>"+result.board_adoption[i].boardHits+"</td></tr>";
				}
				title += "</table>";
				title += "<p class='paging'>";
				title += "<div class='col-md-12 text-center'>";
				title += "<ul class='pagination'>";
				if(result.board_adoption_paging.previousPageGroup){
					title += "<li><a href='#' id='pagingOfAdoptionComment'>Prev</a></li>";
				}
				for(var i=result.board_adoption_paging.startPageOfPageGroup;i<=result.board_adoption_paging.endPageOfPageGroup;i++){
					if(result.board_adoption_paging.nowPage != i){
						title += "<li><a href='#' id='pagingOfAdoptionComment'>"+i+"</a></li>";
					}else{
						title += "<li class='active'><a>"+i+"</a></li>";
					}
				}
				if(result.board_adoption_paging.nextPageGroup){
					title += "<li><a href='#' id='pagingOfAdoptionComment'>Next</a></li>";
				}
				title += "</ul>";
				title += "</div>";
			}
			if(result.board_community.length != 0){
				title += "<table class='showListPosting'><tr align='left'><td colspan='5'><h3>"+result.board_community[0].boardType+"</h3></td></tr>";
				title += "<tr><th width='15%'>번호</th><th width='30%'>제목</th><th width='15%'>닉네임</th><th width='10%'>작성일</th><th width='10%'>조회수</th></tr>";
				for(var i=0;i<result.board_community.length;i++){
					title += "<tr><td>"+result.board_community[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_community[i].boardNumber
							+"&type=board_community'>"
							+result.board_community[i].boardTitle+
							"</a></td><td>"+result.board_community[i].memberVO.memberNickName
							+"</td><td>"+result.board_community[i].boardDate
							+"</td><td>"+result.board_community[i].boardHits+"</td></tr>";
				}
				title += "</table>";
				title += "<p class='paging'>";
				title += "<div class='col-md-12 text-center'>";
				title += "<ul class='pagination'>";
				if(result.board_community_paging.previousPageGroup){
					title += "<li><a href='#' id='pagingOfCommunityComment'>Prev</a></li>";
				}
				for(var i=result.board_community_paging.startPageOfPageGroup;i<=result.board_community_paging.endPageOfPageGroup;i++){
					if(result.board_community_paging.nowPage != i){
						title += "<li><a href='#' id='pagingOfCommunityComment'>"+i+"</a></li>";
					}else{
						title += "<li class='active'><a>"+i+"</a></li>";
					}
				}
				if(result.board_community_paging.nextPageGroup){
					title += "<li><a href='#' id='pagingOfCommunityComment'>Next</a></li>";
				}
				title += "</ul>";
				title += "</div>";
			}
			if(result.board_petInfo.length != 0){
				title += "<table class='showListPosting'><tr align='left'><td colspan='5'><h3>"+result.board_petInfo[0].boardType+"</h3></td></tr>";
				title += "<tr><th width='15%'>번호</th><th width='30%'>제목</th><th width='15%'>닉네임</th><th width='10%'>작성일</th><th width='10%'>조회수</th></tr>";
				for(var i=0;i<result.board_petInfo.length;i++){
					title += "<tr><td>"+result.board_petInfo[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_petInfo[i].boardNumber
							+"&type=board_petInfo'>"
							+result.board_petInfo[i].boardTitle+
							"</a></td><td>"+result.board_petInfo[i].memberVO.memberNickName
							+"</td><td>"+result.board_petInfo[i].boardDate
							+"</td><td>"+result.board_petInfo[i].boardHits+"</td></tr>";
				}
				title += "</table>";
				title += "<p class='paging'>";
				title += "<div class='col-md-12 text-center'>";
				title += "<ul class='pagination'>";
				if(result.board_petInfo_paging.previousPageGroup){
					title += "<li><a href='#' id='pagingOfPetInfoComment'>Prev</a></li>";
				}
				for(var i=result.board_petInfo_paging.startPageOfPageGroup;i<=result.board_petInfo_paging.endPageOfPageGroup;i++){
					if(result.board_petInfo_paging.nowPage != i){
						title += "<li><a href='#' id='pagingOfPetInfoComment'>"+i+"</a></li>";
					}else{
						title += "<li class='active'><a>"+i+"</a></li>";
					}
				}
				if(result.board_petInfo_paging.nextPageGroup){
					title += "<li><a href='#' id='pagingOfPetInfoComment'>Next</a></li>";
				}
				title += "</ul>";
				title += "</div>";
			}
			if(result.board_petPicture.length != 0){
				title += "<table class='showListPosting'><tr align='left'><td colspan='5'><h3>"+result.board_petPicture[0].boardType+"</h3></td></tr>";
				title += "<tr><th width='15%'>번호</th><th width='30%'>제목</th><th width='15%'>닉네임</th><th width='10%'>작성일</th><th width='10%'>조회수</th></tr>";
				for(var i=0;i<result.board_petPicture.length;i++){
					title += "<tr><td>"+result.board_petPicture[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_petPicture[i].boardNumber
							+"&type=board_petPicture'>"
							+result.board_petPicture[i].boardTitle+
							"</a></td><td>"+result.board_petPicture[i].memberVO.memberNickName
							+"</td><td>"+result.board_petPicture[i].boardDate
							+"</td><td>"+result.board_petPicture[i].boardHits+"</td></tr>";
				}
			}
			title += "</table>";
			title += "<p class='paging'>";
			title += "<div class='col-md-12 text-center'>";
			title += "<ul class='pagination'>";
			if(result.board_petPicture_paging.previousPageGroup){
				title += "<li><a href='#' id='pagingOfPetPictureComment'>Prev</a></li>";
			}
			for(var i=result.board_petPicture_paging.startPageOfPageGroup;i<=result.board_petPicture_paging.endPageOfPageGroup;i++){
				if(result.board_petPicture_paging.nowPage != i){
					title += "<li><a href='#' id='pagingOfPetPictureComment'>"+i+"</a></li>";
				}else{
					title += "<li class='active'><a>"+i+"</a></li>";
				}
			}
			if(result.board_petPicture_paging.nextPageGroup){
				title += "<li><a href='#' id='pagingOfPetPictureComment'>Next</a></li>";
			}
			title += "</ul>";
			title += "</div>";
			$("#commentTitle").html(title);
			$("#showCommentList").modal();
		}
	});
}
//받은 메시지 함
function showMessageList(){
	$.ajax({
		type:"POST",
		url:"showMessageList.do",
		data:"receiver=${sessionScope.loginVo.memberNickName}",
		success:function(result){ 
			var readed="";
			var title = "<table class='messageList'>";
			if(result.length != 0){
				title += "<tr><th></th><th>보낸이</th><th>제목</th><th>작성일</th><th> 받는이</th></tr>";
				for(var i=0;i<result.length;i++){
					if(result[i].messageReaded==1){
						readed="<img src='${initParam.root }image/unread.jpg'></img>";
					}else{
						readed="<img src=${initParam.root }image/read.jpg></img>";
					}
					title +="<tr><td>"+readed
					+"</td><td>"+result[i].sender		
					+"</td><td><a id='pickRe' href='#'>"+result[i].messageTitle+"</a>"
					+"</td><td>"+result[i].messageDate
					+"</td><td>"+result[i].receiver
					+"</td></tr>";
				}
			}
			title += "</table>";
			$("#listMessage").html(title);
			$("#messageList").modal();
			$("#ListName").html("<h3>받은쪽지함</h3>");
		} //success
	}); //ajax
} //function



//보낸 쪽지함
function sendMessageList(){
	$.ajax({
		type:"POST",
		url:"sendMessageList.do",
		data:"sender=${sessionScope.loginVo.memberNickName}",
		success:function(result){ 
			var readed="";
			var title = "<table class='messageList'>";
			if(result.length != 0){
				title += "<tr><th></th><th>보낸이</th><th>제목</th><th>작성일</th><th> 받는이</th></tr>";
				for(var i=0;i<result.length;i++){
					if(result[i].messageReaded==1){
						readed="<img src='${initParam.root }image/unread.jpg'></img>";
					}else{
						readed="<img src=${initParam.root }image/read.jpg></img>";
					}
					title +="<tr><td>"+readed
					+"</td><td>"+result[i].sender		
					+"</td><td><a id='pick' href='#'>"+result[i].messageTitle+"</a>"
					+"</td><td>"+result[i].messageDate
					+"</td><td>"+result[i].receiver
					+"</td></tr>";
				}
			}
			title += "</table>";
			$("#listMessage").html(title);
			$("#messageList").modal();
			$("#ListName").html("<h3>보낸쪽지함</h3>");
		} //success
	}); //ajax
} //function



///////////////////////////////////////////////////////////////////////////////////////////////////////
 $(document).on("click","#pickRe", function(){    //받은 메시지함 상세 보기
		var sender=$(this).parent().prev().text();
		var messageDate=$(this).parent().next().text();
		var receiver=$(this).parent().next().next().text();
		var messageTitle=$(this).text();
		var type="received";
		var flag="받은쪽지함"
		if($("#ListName").text()=="보낸쪽지함")
			flag="보낸쪽지함";
		$.ajax({
			type:"POST",
			url:"messageContent.do",
			data:"receiver="+receiver+"&sender="+sender+"&messageDate="+messageDate+"&type="+flag,
			success:function(result){ 
				var title="<a id='replyMesssage' href='#'><h3>답장하기</h3></a>";
				 title+="<table class='messageList1'>";
				if(result.length != 0){
					title+="<tr><td>보낸사람:</td><td>"+result.sender+"</td>";
					title+="<td>받는사람:</td><td>"+result.receiver+"</td>";
					title+="<td>날짜:</td><td>"+result.messageDate+"</td></tr>";
					title+="<tr><td>제목:</td><td>"+result.messageTitle+"</td></tr>";
					title+="<tr><td>내용:"+result.messageContent+"</td></tr>";		
				}
				title += "</table>";
				title+="<button type='button' class='close' id='redelBtn' data-dismiss='modal' aria-hidden='true' onclick='UpdateSendMessageList()'>끄지라</button>";	
				$("#showContentMessage").html(title);
				$("#messageContent").modal();
			} 
		}).done(function(){
			$.ajax({
				type:"POST",
				url:"showMessageList.do",
				data:"receiver=${sessionScope.loginVo.memberNickName}",
				success:function(result){ 
					var readed="";
					var title = "<table class='messageList'>";
					if(result.length != 0){
						title += "<tr><th></th><th>보낸이</th><th>제목</th><th>작성일</th><th> 받는이</th></tr>";
						for(var i=0;i<result.length;i++){
							if(result[i].messageReaded==1){
								readed="<img src='${initParam.root }image/unread.jpg'></img>";
							}else{
								readed="<img src=${initParam.root }image/read.jpg></img>";
							}
							title +="<tr><td>"+readed
							+"</td><td>"+result[i].sender		
							+"</td><td><a id='pickRe' href='#'>"+result[i].messageTitle+"</a>"
							+"</td><td>"+result[i].messageDate
							+"</td><td>"+result[i].receiver
							+"</td></tr>";
						}
					}
					title += "</table>";
					$("#listMessage").html(title);
				} //success
			});
		})
	});	   
	
 $(document).on("click","#pick", function(){//보낸 메시지 함 상세보기    
		var sender=$(this).parent().prev().text();
		var messageDate=$(this).parent().next().text();
		var receiver=$(this).parent().next().next().text();
		var messageTitle=$(this).text();
	
		var flag="받은쪽지함"
		if($("#ListName").text()=="보낸쪽지함")
			flag="보낸쪽지함";
			
		$.ajax({
			type:"POST",
			url:"messageContent.do",
			data:"receiver="+receiver+"&sender="+sender+"&messageDate="+messageDate+"&type="+flag,
			success:function(result){ 
				var title = "<table class='messageList1'>";
				if(result.length != 0){
					title+="<tr><td>보낸사람:</td><td>"+result.sender+"</td>";
					title+="<td>받는사람:</td><td>"+result.receiver+"</td>";
					title+="<td>날짜:</td><td>"+result.messageDate+"</td></tr>";
					title+="<tr><td>제목:</td><td>"+result.messageTitle+"</td></tr>";
					title+="<tr><td>내용:"+result.messageContent+"</td></tr>";			
				}
				title += "</table>";
				title+="<tr><td><button type='button' class='close' id='delBtn' data-dismiss='modal' aria-hidden='true' onclick='UpdateShowMessageList()'>끄지라</button></td></tr>"
				$("#showContentMessage").html(title);
				$("#messageContent").modal();
			} 
		}); 
	});	   
 
 
 $(document).on("click","#delBtn", function(){ //보낸 메시지함 삭제  
		receiver=$(".messageList1").children().children().children().eq(1).text();
		sender=$(".messageList1").children().children().children().eq(3).text();
		messageDate=$(".messageList1").children().children().children().eq(5).text();
		 $.ajax({
				type : "post",
				url : "deleteMessage.do",
				data : "sender="+receiver+"&receiver="+sender+"&messageDate="+messageDate,
				dataType :"json"
				}).done(function(){
					$.ajax({
						type:"POST",
						url:"sendMessageList.do",
						data:"sender=${sessionScope.loginVo.memberNickName}",
						success:function(result){ 
							var readed="";
							var title = "<table class='messageList'>";
							if(result.length != 0){
								title += "<tr><th></th><th>보낸이</th><th>제목</th><th>작성일</th><th> 받는이</th></tr>";
								for(var i=0;i<result.length;i++){
									if(result[i].messageReaded==1){
										readed="<img src='${initParam.root }image/unread.jpg'></img>";
									}else{
										readed="<img src=${initParam.root }image/read.jpg></img>";
									}
									title +="<tr><td>"+readed
									+"</td><td>"+result[i].sender		
									+"</td><td><a id='pick' href='#'>"+result[i].messageTitle+"</a>"
									+"</td><td>"+result[i].messageDate
									+"</td><td>"+result[i].receiver
									+"</td></tr>";
								}
							}
							title += "</table>"; 
							$("#listMessage").html(title); 
						} //success
					}); //ajax
				

				})  
 });
 
 $(document).on("click","#redelBtn", function(){//받은 메시지함 삭제     
		receiver=$(".messageList1").children().children().children().eq(1).text();
		sender=$(".messageList1").children().children().children().eq(3).text();
		messageDate=$(".messageList1").children().children().children().eq(5).text();
		
		 $.ajax({
				type : "post",
				url : "redeleteMessage.do",
				data : "sender="+receiver+"&receiver="+sender+"&messageDate="+messageDate,
				dataType :"json"
			}).done(function(){
				$.ajax({
					type:"POST",
					url:"showMessageList.do",
					data:"receiver=${sessionScope.loginVo.memberNickName}",
					success:function(result){ 
						var readed="";
						var title = "<table class='messageList'>";
						if(result.length != 0){
							title += "<tr><th></th><th>보낸이</th><th>제목</th><th>작성일</th><th> 받는이</th></tr>";
							for(var i=0;i<result.length;i++){
								if(result[i].messageReaded==1){
									readed="<img src='${initParam.root }image/unread.jpg'></img>";
								}else{
									readed="<img src=${initParam.root }image/read.jpg></img>";
								}
								title +="<tr><td>"+readed
								+"</td><td>"+result[i].sender		
								+"</td><td><a id='pickRe' href='#'>"+result[i].messageTitle+"</a>"
								+"</td><td>"+result[i].messageDate
								+"</td><td>"+result[i].receiver
								+"</td></tr>";
							}
						}
						title += "</table>"; 
						$("#listMessage").html(title); 
					} //success
				}); //ajax
				
				
			})
 });
 
 $(document).on("click","#replyMesssage", function(){ //답장 모달    
		var receiver=$(this).next().children().children().children().eq(1).text();
 		var sender=$(this).next().children().children().children().eq(3).text();
 		$("#Resender").text(sender)
 		$("#Rereceiver").text(receiver)
 		$("#messageReply").modal();
	});	   
 
 
 $(document).on("click","#replyClick", function(){//     답장 보내기
	 	var receiver=$(this).parent().prev().children().eq(0).text()
		var sender=$(this).parent().prev().children().eq(2).text() 
		var messageContent=$("#replyMessageContent").val();
		var messageTitle=$("#replyTitle").val();	
		if(messageTitle.length==0){
			alert("제목이 비었습니다.")
			return false;
		}
		else if(messageContent.length==0){
			alert("내용이 비었습니다.")
			return false;
		}else{$.ajax({
			type : "post",
			url : "sendMessage.do",
			data : "sender="+receiver+"&receiver="+sender+"&messageContent="+messageContent+"&messageTitle="+messageTitle,
			dataType :"json",
			success : function(data) {
				}
			}).done(function(){
				$("#replyTitle").val("");
				$("#replyMessageContent").val("");
				
			})  
		}
	});
 


//개인정보 이용약관 txt 파일 읽어오기
function loadRegAgreement()
{
  if (window.XMLHttpRequest)
  {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  }
  else
  {
    // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.onreadystatechange=function()
  {
    if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
      document.getElementById("regAgreeArea").innerHTML=xmlhttp.responseText;
    }
  }
  
  //regAgreement.txt 파일 위치 : webapp > text > regAgreement.txt
  xmlhttp.open("GET","${initParam.root}text/regAgreement.txt",true);
  xmlhttp.send();
}

//별명 글자 수 제한 - 한글 10자, 영문 20자
$(function () {
    $('.remaining').each(function () {
        var $maxcount = $('.maxcount', this);
        var $count = $('.count', this);
        var $input = $("#regMemNick");

        var maximumByte = $maxcount.text() * 1;
        var update = function () {
            var before = $count.text() * 1;
            var str_len = $input.val().length;
            var cbyte = 0;
            var li_len = 0;
            for (i = 0; i < str_len; i++) {
                var ls_one_char = $input.val().charAt(i);
                if (escape(ls_one_char).length > 4) {
                    cbyte += 2;
                } else {
                    cbyte++;
                }
                if (cbyte <= maximumByte) {
                    li_len = i + 1;
                }
            }
          
            if (parseInt(cbyte) > parseInt(maximumByte)) {
            	$("form").each(function() {  
                    if(this.id == "regMemForm"){
                    	$("#nickCheckView").html("별명은 한글 10자, 영어 20자까지만 입력 가능합니다.").css("color","red");
                    }else if(this.id=="updateMemForm"){
                    	$("#updateNickCheckView").html("별명은 한글 10자, 영어 20자까지만 입력 가능합니다.").css("color","red");
                    }
            	});
                var str = $input.val();
                var str2 = $input.val().substr(0, li_len);
                $input.val(str2);
                var cbyte = 0;
                for (i = 0; i < $input.val().length; i++) {
                    var ls_one_char = $input.val().charAt(i);
                    if (escape(ls_one_char).length > 4) {
                        cbyte += 2;
                    } else {
                        cbyte++; 
                    }
                }
            }
            $count.text(cbyte);
        };
        
        $input.bind('input keyup keydown paste change', function () {
            setTimeout(update, 0)
        });
        update();
    });
});

function findAllTheEmailAddresses(StrObj) {
	var separateEmailsBy = ", ";
	var email = "<none e-mail present>";
	var emailsArray = StrObj.match(/(@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);
	if (emailsArray) {
	email = "";
	for (var i = 0; i < emailsArray.length; i++) {
	if (i != 0) email += separateEmailsBy;
	email += emailsArray[i];
	      }
	   }
	return email;
	}

    $(document).ready(function(){
    	var checkResultId="";
    	var checkResultNick="";
    	var checkResultPassConfirm="";
    	var myNickName="";
  
    	
    	//로그인 - Id 저장 쿠키 생성
    	//escape(cValue) : 한글 깨짐 방지
    	setCookie=function(cName, cValue, cDay){
    	    var expire = new Date();
    	    expire.setDate(expire.getDate() + cDay);
    	    cookies = cName + '=' + escape(cValue) + '; path=/ ';
    	    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    	    document.cookie = cookies;
    	}
    	

    	//로그인 - Id 저장 쿠키 가져오기
    	getCookie=function(cName) {
    	    cName = cName + '=';
    	    var cookieData = document.cookie;
    	    var start = cookieData.indexOf(cName);
    	    var cValue = '';
    	    if(start != -1){
    	        start += cName.length;
    	        var end = cookieData.indexOf(';', start);
    	        if(end == -1)end = cookieData.length;
    	        cValue = cookieData.substring(start, end);
    	    }
    	    
    	    return unescape(cValue);
    	}
    	
    	
      	//home - login버튼 클릭시 쿠키 유무에 따라 input 값, id 저장 체크박스 설정
    	$("#login").click(function(){
         		    if(getCookie("loginMemId")=="") {
         		        $("#rememberId").prop("checked",false);
         		       $("#loginMemId").val("");
         		      $("#loginIdCheckView").html("");
         		        $("#loginMemPass").val("");
         		    }else{
         		    	  $("#loginMemId").val(getCookie("loginMemId"));
         		    	 $("#rememberId").prop("checked",true);
         		    	$("#loginIdCheckView").html("");
         		    	 $("#loginMemPass").val("");
         		    } 
         		     
         		    //로그인폼 - 이메일 - 형식 확인 후 checkView 출력
         		   	$("#loginMemId").blur(function(){
         		   	var id=$(this).val();
         		   	if(id==""){
         		   	$("#loginIdCheckView").html("");
         		   	}else if(!id.match(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i)){
     				$("#loginIdCheckView").html("이메일 형식이 맞지 않습니다. ex)test@test.com").css("color","red");
     		    	}else{
     		    		$("#loginIdCheckView").html("");
     		    	}
         		   	});
         		    
         		    //login폼 - 로그인 버튼 클릭 - id 저장 체크박스 체크상태에 따라 쿠키 저장/삭제
         		    $("#loginForm").on('submit',function(dmf){
         		    	var id=$("#loginMemId").val().trim();
         		    	var password=$("#loginMemPass").val().trim();
         		    	 if($("#rememberId").prop("checked")) {
      		            	setCookie("loginMemId", $("#loginMemId").val(), 365);
      		            } else {
      		            	setCookie("loginMemId","",-1);
      		            }
         		    	 //아이디나 비밀번호가 틀렸을 경우 alert 띄우고 모달창 유지, 그 외의 경우에는 controller에서 return되는 web 페이지로 이동
         		    	 //controller path에 redirect 삭제함. 문제시 원복!
         		    	 dmf.preventDefault();
         		    	if($("#loginMemId").val()!=null&&$("#loginMemPass").val()!=null){
         		    	$.ajax({
            				type:"get",
            				url:"idCheck.do",				
            				data:"memberId="+id,
            				success:function(data){	
              					if(data=="ok"){
            					alert("등록되지 않은 아이디입니다!");
            					$("#loginMemId").focus();
              					}else{
              	                	$.ajax({
                        				type:"POST",
                        				url:"login.do",				
                        				data:"memberId="+id+"&memberPassword="+password,
                        				success:function(data){
                        					if(data=="passfail"){
                        					alert("비밀번호가 일치하지 않습니다.");
                        					$("#loginMemPass").focus();
                        					}else{
                        						location.replace(data);
                        					}
                           				}			
		                  			});
              	                }
               				}			
            			});
         		    	}
         		    });
    	});
      	
      	
     		//home - 회원가입버튼 선택시 form내의 모든 값 초기화, 개인정보이용약관 읽어옴
        	$("#homeSignUp").click(function(){
        		$("form").each(function() {  
                    if(this.id == "regMemForm"){
                    	this.reset();  
                    	loadRegAgreement();
                    	$("#idCheckView").html("");
                		$("#passCheckView").html("");
                		$("#passConfirmCheckView").html("");
                		$("#nickCheckView").html("");
                		$(".remaining").hide();
                    }
        		});  
        		});
        	
       	//home - 회원정보수정버튼 선택시 form내의 모든 값 초기화
        	$("#updateMemBtn").click(function(){
        		$("form").each(function() {  
                    if(this.id == "updateMemForm"){
                    	this.reset();  
        		$("#updatePassCheckView").html("");
        		$("#updatePassConfirmCheckView").html("");
        		$("#updateNickCheckView").html("");
        		$(".remaining").hide();
                    }
        		});
        	});
        	

     	//회원가입 - 비밀번호 - check 우선순위 : 1. 길이(5~15)  2. 특수문자포함여부 3. 동일문자, 연속문자	
        		$("#regMemPass").blur(function(){
        			var password=$("#regMemPass").val().trim();
        			if(password==""){
        			$("#passCheckView").html("");
        			}else{
        			if(password.length<5 || password.length>15){
        				$("#passCheckView").html("비밀번호는 5자 이상 15자 이하만 가능합니다.").css("color","red");
        			}else{ 
        				
        				//비밀번호 허용 가능 조합 : 특수문자 + 숫자, 특수문자 + 영문, 특수문자+숫자+영문
        				if(!password.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,),+,=,(,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
            				$("#passCheckView").html("비밀번호는 특수문자, 숫자, 영문을 조합하여야 합니다.").css("color","red");
            				return false; 
        				}
        			
        				var SamePass_0 = 0; //동일문자 카운트
             			  var SamePass_1 = 0; //연속성(+) 카운드
             			  var SamePass_2 = 0; //연속성(-) 카운드
             			 
             			  for(var i=0; i < password.length; i++) {
             			    var chr_pass_0 = password.charAt(i);
             			    var chr_pass_1 = password.charAt(i+1);
             			    
             			    //동일문자 카운트
             			    if(chr_pass_0 == chr_pass_1) {
             			      SamePass_0 = SamePass_0 + 1
             			    }
             			    
             			    var chr_pass_2 = password.charAt(i+2);

             			    //연속성(+) 카운드
             			    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
             			      SamePass_1 = SamePass_1 + 1
             			    }
             			    
             			    //연속성(-) 카운드
             			    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
             			      SamePass_2 = SamePass_2 + 1
             			    }
             			  }
             			  
             			  if(SamePass_0 > 1) {
             				  $("#passCheckView").html("비밀번호는 동일한 문자를 연속적으로 사용할 수 없습니다.").css("color","red");
             			  }
             			
             			  if(SamePass_1 > 1 || SamePass_2 > 1 ) {
             				  $("#passCheckView").html("연속된 문자열(123 또는 321, abc, cba 등)을 4자 이상 사용할 수 없습니다.").css("color","red");

             			}
             			  if(password==""){
             				$("#passCheckView").html("");
             			}
        			}
        			}
        		
        		});
      
        			//회원가입 - 비밀번호 input에 focus가 오면 CheckView 삭제
            		$("#regMemPass").focus(function(){
        					$("#passCheckView").html("");
            		});
        		
        			//회원가입 - 비밀번호확인 값이 비밀번호와 동일한지 확인 후 CheckView 출력
            		$("#regMemPassConfirm").blur(function(){
            			if($("#regMemPassConfirm").val()==""){
            				$("#passConfirmCheckView").html("");
            			}else if($("#regMemPass").val()!=$("#regMemPassConfirm").val()){
            				$("#passConfirmCheckView").html("패스워드가 일치하지 않습니다.").css("color","red");
                 			checkResultPassConfirm="";
                 			
                 		}else{
                 			checkResultPassConfirm="ok";
                 		}
            		});
        			
            		//회원가입 - 비밀번호확인 값에 focus가 오면 CheckView 삭제
            		$("#regMemPassConfirm").focus(function(){
            				$("#passConfirmCheckView").html("");
            		});
        	
    		// 회원가입 - ID 중복확인, 이메일 형식 확인
    		$("#regMemId").blur(function(){
    			var id=$(this).val();
    			if($("#regMemId").val()==""){
					$("#idCheckView").html("");
				}else{
    			$.ajax({
    				type:"POST",
    				url:"idCheck.do",      	
    				data:"memberId="+id,	
    				success:function(data){	
    					if(data=="fail"){
    					$("#idCheckView").html(id+" 사용중인 이메일입니다.").css("color","red");
    						checkResultId="";
    					}else{
    						if(id.length>=50){
    							$("#idCheckView").html("이메일은 도메인을 포함하여 최대 50자까지만 입력 가능합니다").css("color","red");
    							checkResultId="";
    					}else if(!id.match(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i)){
							$("#idCheckView").html("이메일 형식이 맞지 않습니다. ex)test@test.com").css("color","red");
							checkResultId="";
						}else{ 
    						$("#idCheckView").html(id+" 사용가능합니다.").css("color","blue");
    						checkResultId=id;
    						}
    					}
    				}
    			});
				} 
    		});
    		
    		//회원가입 - 이메일 input에 focus가 오면 CheckView 삭제
    		$("#regMemId").focus(function(){
					$("#idCheckView").html("");
    		});
    		
    		//회원가입 - NickName 중복 확인
    		$("#regMemNick").blur(function(){
    			var nickName=$(this).val();
    			if($("#regMemNick").val()==""){
					$("#nickCheckView").html("");
				}else{
    			$.ajax({
    				type:"POST",
    				url:"nickNameCheck.do",				
    				data:"memberNickName="+nickName,	
    				success:function(data){	
    					if(data=="fail"){
    					$("#nickCheckView").html(nickName+" 사용중인 닉네임입니다.").css("color","red");
    					checkResultNick="";
    					}else{						
    						$("#nickCheckView").html(nickName+" 사용가능합니다.").css("color","blue");
    						checkResultNick=nickName;
    					}					
    				}		
    			});
				}
    		});
    		
    		//회원가입 - 닉네임 input에 focus가 오면 CheckView 삭제
    		$("#regMemNick").focus(function(){
					$("#nickCheckView").html("");
    		});
    		
    		//회원가입 - 전화번호 input시 숫자만 입력 가능
    		   $("#regMemTel").css('imeMode','disabled').keypress(function(event) {
    		        if(event.which && (event.which < 48 || event.which > 57) ) {
    		            event.preventDefault();
    		        }
    		    }).keyup(function(){
    		        if( $(this).val() != null && $(this).val() != '' ) {
    		            $(this).val( $(this).val().replace(/[^0-9]/g, '') );
    		        }
    		    });
    		
    		//회원가입 submit -  약관동의 확인, 패스워드 확인, 아이디 중복 확인, 닉네임 중복 확인
    		$("#regMemForm").submit(function(){
    			if($("#regMemPass").val()!=$("#regMemPassConfirm").val()){
    				$("#regMemPass").val("");
     					$("#regMemPassConfirm").val("");
     				return false;
     			 } // submit시 password와 confirm 값을 다시 한번 체크
         		if($("input:checkbox[name='agree']").is(":checked")==false){
         			alert("약관에 동의하셔야 회원가입 가능합니다.");
         			return false;
         		}
           		if(checkResultPassConfirm==""){
         			$("#regMemPassConfirm").focus();
         			return false;
         		}
         		if(checkResultId==""){
         			$("#regMemId").focus();
         			return false;
         		}
         		if(checkResultNick==""){
         			$("#regMemNick").focus();
         			return false;
         		}
        	});//regMemform
        	
        	
        	//회원정보수정 - 비밀번호 - check 우선순위 : 1. 길이(5~15)  2. 특수문자포함여부 3. 동일문자, 연속문자
        	$("#updateMemPass").blur(function(){
    			var password=$("#updateMemPass").val().trim();
    			
    			if(password.length<5 || password.length>15){
    				$("#updatePassCheckView").html("비밀번호는 5자 이상 15자 이하만 가능합니다.").css("color","red");
    			}else{ 
    				
    				//비밀번호 허용 가능 조합 : 특수문자 + 숫자, 특수문자 + 영문, 특수문자+숫자+영문
    				if(!password.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,),+,=,(,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
        				$("#updatePassCheckView").html("비밀번호는 특수문자, 숫자, 영문을 조합하여야 합니다.").css("color","red");
        				return false; 
    				}
    			
    				var SamePass_0 = 0; //동일문자 카운트
         			  var SamePass_1 = 0; //연속성(+) 카운드
         			  var SamePass_2 = 0; //연속성(-) 카운드
         			 
         			  for(var i=0; i < password.length; i++) {
         			    var chr_pass_0 = password.charAt(i);
         			    var chr_pass_1 = password.charAt(i+1);
         			    
         			    //동일문자 카운트
         			    if(chr_pass_0 == chr_pass_1) {
         			      SamePass_0 = SamePass_0 + 1
         			    }
         			    
         			    var chr_pass_2 = password.charAt(i+2);

         			    //연속성(+) 카운드
         			    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
         			      SamePass_1 = SamePass_1 + 1
         			    }
         			    
         			    //연속성(-) 카운드
         			    if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
         			      SamePass_2 = SamePass_2 + 1
         			    }
         			  }
         			  
         			  if(SamePass_0 > 1) {
         				  $("#updatePassCheckView").html("비밀번호는 동일한 문자를 연속적으로 사용할 수 없습니다.").css("color","red");
         			  }
         			
         			  if(SamePass_1 > 1 || SamePass_2 > 1 ) {
         				  $("#updatePassCheckView").html("연속된 문자열(123 또는 321, abc, cba 등)을 4자 이상 사용할 수 없습니다.").css("color","red");

         			}
         			  if(password==""){
         				$("#updatePassCheckView").html("");
         			}
    			}
    		
    		});
  
    			//회원정보수정 - 비밀번호 input에 focus가 오면 CheckView 삭제
        		$("#updateMemPass").focus(function(){
    					$("#updatePassCheckView").html("");
        		});
    		
    			//회원정보수정 - 비밀번호확인 값이 비밀번호와 동일한지 확인 후 CheckView 출력
        		$("#updateMemPassConfirm").blur(function(){
        			if($("#updateMemPassConfirm").val()==""){
        				$("#updatePassConfirmCheckView").html("");
        			}else if($("#updateMemPass").val()!=$("#updateMemPassConfirm").val()){
        				$("#updatePassConfirmCheckView").html("패스워드가 일치하지 않습니다!").css("color","red");
             			checkResultPassConfirm="";
             		}else{
             			checkResultPassConfirm="ok";
             		}
        		});
    			
        		//회원정보수정 - 비밀번호확인 값에 focus가 오면 CheckView 삭제
        		$("#updateMemPassConfirm").focus(function(){
        				$("#updatePassConfirmCheckView").html("");
        		});	
        		
        		//회원정보수정 - NickName 중복 확인
        		$("#updateMemNick").blur(function(){
        			var nickName=$(this).val();
        			if($("#updateMemNick").val()==""){
    					$("#updateNickCheckView").html("");
    				}else{
        			$.ajax({
        				type:"POST",
        				url:"nickNameCheck.do",				
        				data:"memberNickName="+nickName,	
        				success:function(data){	
        					if(data=="fail"){
        						if(nickName==$("input[name='myNick']").val()){
        							$("#updateNickCheckView").html(nickName+" 현재 사용중인 닉네임입니다.").css("color","blue");
        							checkResultNick=nickName;
        						}else{
        					$("#updateNickCheckView").html(nickName+" 사용중인 닉네임입니다.").css("color","red");
        					checkResultNick="";
        						}
        					}else{						
        						$("#updateNickCheckView").html(nickName+" 사용가능합니다.").css("color","blue");
        						checkResultNick=nickName;
        					}					
        				}			
        			});
    				}
        		});
        		//회원정보수정 - 닉네임 input에 focus가 오면 CheckView 삭제
        		$("#updateMemNick").focus(function(){
    					$("#updateNickCheckView").html("");
        		});
        		
        		//회원정보수정 - 전화번호 input시 숫자만 입력 가능
        		   $('#updateMemTel').css('imeMode','disabled').keypress(function(event) {
        		        if(event.which && (event.which < 48 || event.which > 57) ) {
        		            event.preventDefault();
        		        }
        		    }).keyup(function(){
        		        if( $(this).val() != null && $(this).val() != '' ) {
        		            $(this).val( $(this).val().replace(/[^0-9]/g, '') );
        		        }
        		    });
        		
        		//회원정보수정 submit -  패스워드 확인, 닉네임 중복 확인
        		$("#updateMemForm").submit(function(){
        			if($("#updateMemPass").val()!=$("#updateMemPassConfirm").val()){
        				$("#updateMemPass").val("");
         					$("#updateMemPassConfirm").val("");
         				return false;
         			 }
        			if(checkResultPassConfirm==""){
             			$("#updateMemPassConfirm").focus();
             			return false;
             		}
             		if(checkResultNick==""){
             			$("#updateMemNick").focus();
             			return false;
             		}
            	});//updateMemForm
            	
            	
            	//회원탈퇴 버튼 선택시 폼 초기화
            	$("#deleteMemBtn").click(function(){
            		$("#deleteMemPass").val("");
            		$("#deleteMemPassConfirm").val("");
            		$("#deleteMemPassCheckView").html("");
            	});
            	
            	
            	//회원탈퇴 - 비밀번호확인 값이 비밀번호와 동일한지 확인 후 CheckView 출력
            	$("#deleteMemPassConfirm").blur(function(){
        			if($("#deleteMemPassConfirm").val()==""){
        				$("#deleteMemPassCheckView").html("");
        			}else if($("#deleteMemPass").val()!=$("#deleteMemPassConfirm").val()){
        				$("#deleteMemPassCheckView").html("패스워드가 일치하지 않습니다!").css("color","red");
             			checkResultPassConfirm="";
             		}else{
             			checkResultPassConfirm="ok";
             		}
        		});
    			
        		//회원탈퇴 - 비밀번호확인 값에 focus가 오면 CheckView 삭제
        		$("#deleteMemPassConfirm").focus(function(){
        				$("#deleteMemPassCheckView").html("");
        		});	       	
            	
        		
        		//회원탈퇴 submit -  패스워드 확인, 닉네임 중복 확인
        		$("#deleteMemForm").on('submit',function(dmf){
        			dmf.preventDefault();
        			var password=$("#deleteMemPass").val();
        			var id=$("#deleteMemId").val();
        			var status=$("#deleteMemStatus").val();
        			if($("#deleteMemPass").val()!=$("#deleteMemPassConfirm").val()){
        				$("#deleteMemPass").val("");
         					$("#deleteMemPassConfirm").val("");
         				return false;
         			 }else{
         				$.ajax({
            				type:"POST",
            				url:"passCheck.do",				
            				data:"memberId="+id+"&memberPassword="+password,
            				success:function(data){	
              					if(data==false){
            					alert("비밀번호가 틀립니다. 비밀번호를 다시 입력해주세요!");
            					$("#deleteMemPass").focus();
            					checkResultPassConfirm=="";
              	                }else{
              	                	$.ajax({
                        				type:"POST",
                        				url:"auth_delete.do",				
                        				data:"memberId="+id+"&memberPassword="+password+"&memberStatus="+status,
                        				success:function(data){
                        					if(data=="deleteok"){
                        					location.replace("home.do?deleteVO=success");//회원 탈퇴 후 뒤로가기 버튼 이용해 이전페이지로 이동할 수 없도록 함
                          	                	checkResultPassConfirm=="ok";
                        					}
                           				}			
		                  			});
              	                }
               				}			
            			});
         				if(checkResultPassConfirm==""){
                 			$("#deleteMemPassConfirm").focus();
                 			return false;
                 		}
         			 }
        			if(checkResultPassConfirm==""){
             			$("#deleteMemPassConfirm").focus();
             			return false;
             		}
        		});
        	});//document
</script>
<script type="text/javascript">
//통합검색 공란 및 글자수 제한
$(document).ready(function(){
	$("#searchWordForm").submit(function(){
		var searchword=$("#searchWord").val();
		if(searchword==""){
			alert("검색어를 입력하세요");	
			return false;
		}else if(searchword.length<2){
			alert("검색어를 2자이상 입력하세요");
			return false;
		}
	});
	$("#searchLogWordForm").submit(function(){
		var searchword=$("#searchLogWord").val();
		if(searchword==""){
			alert("검색어를 입력하세요");	
			return false;
		}else if(searchword.length<2){
			alert("검색어를 2자이상 입력하세요");
			return false;
		}
	});
	
});//document
</script>
<div class="navbar-wrapper">
	<div class="container-fluid">
		<nav class="navbar navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>


					<a class="navbar-brand" href="home.do" data-toggle="tooltip"
						data-placement="bottom" title="HotDog"><img height="30"
						width="40" alt="Brand" src="image/로고.jpg"></a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="home.do" class="">Home</a></li>
						<li class=" dropdown"><a href="#" class="dropdown-toggle js-activated"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">유기견 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li style="background-color: white;"><a href="getPostingList.do?type=board_abandoned">유기견정보</a></li>
							<li style="background-color: white;"><a href="getPostingList.do?type=board_adoption">유기견분양</a></li>
							</ul></li>

						<li class=" dropdown"><a href="#" class="dropdown-toggle js-activated"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">커뮤니티 <span class="caret"></span></a>
							<ul class="dropdown-menu">
							<li style="background-color: white;"><a href="getPostingList.do?type=board_notice">공지사항</a></li>
							<li style="background-color: white;"><a href="getPostingList.do?type=board_petInfo">애견정보</a></li>
							<li style="background-color: white;"><a href="getPostingList.do?type=board_community">자유게시판</a></li>
							</ul></li>

					<li><a href="getPostingList.do?type=board_petPicture">애견사진</a></li>
					<li><a href="getPostingList.do?type=board_QnA">Q&amp;A</a></li>

					</ul>
					
					<c:choose>
						<c:when test="${sessionScope.loginVo ==null && sessionScope.adminLoginVo==null}">
							<ul class="nav navbar-nav pull-right">
								<li class=""><a class="" id="login" data-toggle="modal"
									data-target="#loginModal">로그인</a></li>
								<li class=""><a class="" data-toggle="modal"
									data-target="#findPassmodal" id="findPassBtn">비밀번호찾기</a></li>
								<li class=""><a class="" data-toggle="modal"
									data-target="#signupmodal" id="homeSignUp">회원가입</a></li>
							</ul>
							<form class="navbar-form navbar-right text-left" role="search" action="searchBoard.do" id="searchWordForm">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search" name="word" id="searchWord">
						</div>
						<button type="submit" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="검색">검색</button>
					</form>
						</c:when>
						<c:otherwise>
        	


							<ul class="nav navbar-nav pull-right">
							
								<li class=""><a href="logout.do" class="">로그아웃</a></li>

							</ul>
							<form class="navbar-form navbar-right text-left" role="search" action="searchBoard.do" id="searchLogWordForm">
					          <div class="form-group">
						       <input type="text" class="form-control" placeholder="검색"  name="word"
								id="searchLogWord">
								</div>
								<button type="submit" class="btn btn-default">검색</button>
								<div class="form-group" data-toggle="modal"
									data-target="#idmodal">
									&nbsp;&nbsp;<a href="#idmodal" data-toggle="tooltip"
										data-placement="bottom" id="myPageBtn" title="마이페이지로 이동">${sessionScope.loginVo.memberNickName} ${sessionScope.adminLoginVo.adminNickName }</a>님
								</div>

 								

								<a href="#messageList" data-toggle="modal" 
								onclick="showMessageList()">
								<span	class="glyphicon glyphicon-envelope"></span></a>
							</form>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
		</nav>
	</div>
</div>
<style>
body {
	background: white;
}

.navbar, .dropdown-menu {
	background: rgba(255, 255, 255, 0.25);
	border: none;
}

.nav>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover,
	.dropdown-menu>li>a, .dropdown-menu>li {
	border-bottom: 3px solid transparent;
}

.nav>li>a:focus, .nav>li>a:hover, .nav .open>a, .nav .open>a:focus, .nav .open>a:hover,
	.dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover {
	border-bottom: 3px solid transparent;
	background: none;
}

.navbar a, .dropdown-menu>li>a, .dropdown-menu>li>a:focus,
	.dropdown-menu>li>a:hover {
	color: black;
}

.dropdown-menu {
	-webkit-box-shadow: none;
	box-shadow: none;
}

.nav li:hover:nth-child(8n+1), .nav li.active:nth-child(8n+1) {
	border-bottom: #C4E17F 3px solid;
}

.nav li:hover:nth-child(8n+2), .nav li.active:nth-child(8n+2) {
	border-bottom: #F7FDCA 3px solid;
}

.nav li:hover:nth-child(8n+3), .nav li.active:nth-child(8n+3) {
	border-bottom: #FECF71 3px solid;
}

.nav li:hover:nth-child(8n+4), .nav li.active:nth-child(8n+4) {
	border-bottom: #F0776C 3px solid;
}

.nav li:hover:nth-child(8n+5), .nav li.active:nth-child(8n+5) {
	border-bottom: #DB9DBE 3px solid;
}

.nav li:hover:nth-child(8n+6), .nav li.active:nth-child(8n+6) {
	border-bottom: #C49CDE 3px solid;
}

.nav li:hover:nth-child(8n+7), .nav li.active:nth-child(8n+7) {
	border-bottom: #669AE1 3px solid;
}

.nav li:hover:nth-child(8n+8), .nav li.active:nth-child(8n+8) {
	border-bottom: #62C2E4 3px solid;
}
</style>

<!-- modal -->
<div class="modal fade" id="loginModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">로그인</h4>
			</div>
			<div class="modal-body">
			
			
				<!-- 로그인 폼 -->
				<form class="form-horizontal" role="form" action="login.do"
					name="loginForm" id="loginForm" method="post">
					              <img src="${initParam.root}image/글자로고.png" class="img-responsive" alt="">
					
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">아이디</label>
						</div>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="loginMemId"
								placeholder="아이디" name="memberId" onfocus="this.select()"
								required maxlength="50"><span id="loginIdCheckView"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputPassword3" class="control-label">비밀번호</label>
						</div>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="loginMemPass"
								placeholder="비밀번호" name="memberPassword" onfocus="this.select()"
								required>
						</div>
					</div>
										<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label> <input type="checkbox" name="rememberId"
									id="rememberId">ID 저장
								</label>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-12">
				<input class="btn btn-lg btn-success btn-block" type="submit" value="로그인" id="loginBtn">
							<!-- <button type="submit" class="btn btn-success btn-block" id="loginBtn">로그인</button>	 -->
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
							<ul class="nav navbar-nav navbar-right">
					<li><a data-dismiss="modal">닫기</a></li>
				</ul>
			
			</div>
		</div>
	</div>
</div>


<!-- 회원가입 폼 -->
<div class="modal fade" id="signupmodal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">회원가입</h4>
			</div>
			<div class="modal-header">
				<h4 class="modal-title">개인정보이용약관</h4>
				<div class="modal-body">
					<form class="form-horizontal" role="form" id="regMemForm"
						action="member_register.do">
						<div class="form-group">
							<pre>
<textarea id="regAgreeArea" style="resize: none; wrap: hard;" rows="5"
									cols="75" readonly>
</textarea>
</pre>

							&nbsp; &nbsp;<input type="checkbox" name="agree">개인정보이용약관에
							동의합니다. <br> <br>


							<div class="col-sm-2">
								<label for="inputEmail3" class="control-label">아이디</label>
							</div>
							<div class="col-sm-10">
								<input type="email" class="form-control" name="memberId"
									id="regMemId" placeholder="인증가능한 이메일을 입력하세요"
									onfocus="this.select()" required maxlength="50"><span id="idCheckView"></span>
									
							</div>
						</div>
						<input type="hidden" name="memberStatus" value="active">
						<input type="hidden" name="memberGrade" value="NULL">

						<div class="form-group">
							<div class="col-sm-2">
								<label for="inputPassword3" class="control-label">비밀번호</label>
							</div>
							<div class="col-sm-10">
								<input type="password" class="form-control"
									name="memberPassword" id="regMemPass" placeholder="패스워드를 입력하세요"
									onfocus="this.select()" required maxlength="15"><span
									id="passCheckView"></span>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-2">
								<label for="inputPassword3" class="control-label"></label>
							</div>
							<div class="col-sm-10">
								<input type="password" class="form-control"
									name="memberPasswordConfirm" id="regMemPassConfirm"
									placeholder="패스워드를 확인하세요." onfocus="this.select()" required maxlength="15"><span
									id="passConfirmCheckView"></span>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-2">
								<label for="inputEmail3" class="control-label">이름</label>
							</div>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="memberName"
									id="regMemName" placeholder="이름을 입력하세요."
									onfocus="this.select()" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="inputEmail3" class="control-label">별명</label>
							</div>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="memberNickName"
									id="regMemNick" placeholder="닉네임을 입력하세요."
									onfocus="this.select()" required><span
									id="nickCheckView"></span><span class="remaining"> <span
									class="count">0</span>/<span class="maxcount">20</span>byte(한글
									10자, 영어 20자)<span id="nickCheckView"></span>
								</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="inputEmail3" class="control-label">전화번호</label>
							</div>
							<div class="col-sm-10">
								<input type="tel" class="form-control" name="memberTel"
									id="regMemTel" placeholder="'-'을 제외한 전화번호를 입력하세요."
									onfocus="this.select()" required maxlength="11">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default" id="signupBtn">회원가입</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<ul class="nav navbar-nav navbar-right">
						<li><a data-dismiss="modal">닫기</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 패스워드 찾기 -->
<div class="modal fade" id="findPassmodal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">비밀번호찾기</h4>
			</div>
			<div class="modal-body">

				<!-- 이름&아이디 체크 폼 -->
				<form class="form-horizontal" role="form" action="searchPassword.do"
					name="loginForm" method="post">
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">아이디</label>
						</div>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="loginMemId"
								placeholder="아이디를입력하세요" name="memberId" required maxlength="50">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputPassword3" class="control-label">이름</label>
						</div>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="loginMemPass"
								placeholder="이름을입력하세요" name="memberName" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10"></div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default" id="loginBtn">비밀번호찾기</button>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<ul class="nav navbar-nav navbar-right">
					<li><a data-dismiss="modal">닫기</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 패스워드 찾기 끝 -->


<!-- 회원수정 -->
<div class="modal fade" id="updatemodal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">회원정보수정</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" action="auth_update.do"
					method="post" id="updateMemForm">
					<!-- 아이디 -->
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">아이디</label>
						</div>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputEmail3"
								name="memberId" readonly="readonly"
								value="${sessionScope.loginVo.memberId}" placeholder="Email">
						</div>
					</div>

					<!-- 비밀번호  -->
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputPassword3" class="control-label">비밀번호</label>
						</div>
						<div class="col-sm-10">
							<input type="password" name="memberPassword" class="form-control"
								id="updateMemPass" placeholder="패스워드를 입력하세요"
								onfocus="this.select()" required maxlength="15"><span
								id="updatePassCheckView"></span>
						</div>
					</div>

					<!-- 비밀번호확인 -->
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputPassword3" class="control-label"></label>
						</div>
						<div class="col-sm-10">
							<input type="password" class="form-control"
								id="updateMemPassConfirm" placeholder="패스워드를 확인하세요."
								onfocus="this.select()" required maxlength="15"><span
								id="updatePassConfirmCheckView"></span>
						</div>
					</div>

					<!-- 이름 -->
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">이름</label>
						</div>
						<div class="col-sm-10">
							<input type="text" name="memberName" class="form-control"
								id="updateMemName" placeholder="이름을 입력하세요."
								onfocus="this.select()" maxlength="40" required>
						</div>
					</div>


					<input type="hidden" name="myNick" value="${sessionScope.loginVo.memberNickName}">
					<input type="hidden" name="memberGrade" value="${sessionScope.loginVo.memberGrade}">

					<!-- 별명 -->
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">별명</label>
						</div>
						<div class="col-sm-10">
							<input type="text" name="memberNickName" class="form-control"
								id="updateMemNick" placeholder="닉네임을 입력하세요."
								onfocus="this.select()" required><span
								id="updateNickCheckView"></span><span class="remaining">
								<span class="count">0</span>/<span class="maxcount">20</span>byte(한글
								10자, 영어 20자)
							</span>
						</div>
					</div>


					<!-- 전화번호 -->
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">전화번호</label>
						</div>
						<div class="col-sm-10">
							<input type="text" name="memberTel" class="form-control"
								id="updateMemTel" placeholder="'-'을 제외한 전화번호를 입력하세요."
								onfocus="this.select()" required maxlength="11">
						</div>
					</div>


					<!--  수정하기 버튼  -->
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">회원정보수정</button>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<ul class="nav navbar-nav navbar-right">
					<li><a data-toggle="modal" data-dismiss="modal"
						href="#idmodal">마이페이지</a></li>
					<li><a data-dismiss="modal">닫기</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 회원수정끝부분  -->

<!-- 회원탈퇴 -->
<div class="modal fade" id="deletemodal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">회원탈퇴</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" action="auth_delete.do"
					method="post" id="deleteMemForm">
					<!-- 아이디 -->
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">아이디</label>
						</div>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="deleteMemId"
								name="memberId" readonly="readonly"
								value="${sessionScope.loginVo.memberId}" placeholder="Email">
						</div>
					</div>

					<!-- 비밀번호  -->
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputPassword3" class="control-label">비밀번호</label>
						</div>
						<div class="col-sm-10">
							<input type="password" name="memberPassword" class="form-control"
								id="deleteMemPass" placeholder="패스워드를 입력하세요"
								onfocus="this.select()" required maxlength="15">
						</div>
					</div>

					<!-- 비밀번호확인 -->
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputPassword3" class="control-label"></label>
						</div>
						<div class="col-sm-10">
							<input type="password" class="form-control"
								id="deleteMemPassConfirm" placeholder="패스워드를 확인하세요."
								onfocus="this.select()" required maxlength="15"><span
								id="deleteMemPassCheckView"></span>
						</div>
					</div>
					
					<!-- member status 변경 -->
					<input type="hidden" name="memberStatus" id="deleteMemStatus" value="deactive">


					<!--  회원탈퇴하기 버튼  -->
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">회원탈퇴</button>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<ul class="nav navbar-nav navbar-right">
					<li><a data-toggle="modal" data-dismiss="modal"
						href="#idmodal">마이페이지</a></li>
					<li><a data-dismiss="modal">닫기</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 회원탈퇴끝부분  -->

<!-- 마이페이지보기(로그인시 이름 클릭시)모달 -->

<div class="modal fade" id="idmodal">
	<div class="modal-dialog">
				<form class="form-horizontal" role="form">
          <div class="panel panel-warning">
            <div class="panel-heading">
            <button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
              <h3 class="panel-title">마이페이지</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center">
                  <img alt="User Pic" src="${initParam.root}image/dog1.jpg" width="140px" height="180px">
                </div>
                <div class=" col-md-9 col-lg-9 ">
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>아이디</td>
                        <td>${sessionScope.loginVo.memberId}</td>
                      </tr>
                      <tr>
                        <td>이름</td>
                        <td>${sessionScope.loginVo.memberName}</td>
                      </tr>
                      <tr>
                        <td>별명</td>
                        <td>${sessionScope.loginVo.memberNickName}</td>
                      </tr>
                      <tr>
                        <td>전화번호</td>
                        <td>${sessionScope.loginVo.memberTel}</td>
                      </tr>
                      <tr>
                        <td>회원등급</td>
                        <td>${sessionScope.loginVo.memberGrade}</td>
                      </tr>
                      <tr>
                      <td>출석일수</td>
                        <td>${sessionScope.loginVo.memberAttendance}</td>
                        </tr>
                      <tr>
                        <td>작성한 게시글</td>
                       <td><a href="#" onclick="showMyPostingList('${sessionScope.loginVo.memberId}',1,1,1,1,1)" ><span id="countOfMyPosting"></span></a></td>
                      </tr>
                      <tr>
                        <td>작성한 댓글</td>
                       <td><a href="#" onclick="showMyCommentList('${sessionScope.loginVo.memberNickName}',1,1,1,1,1)" ><span id="countOfMyComment"></span></a></td>
                      </tr>
                      <tr>
                        <td>스크랩한 게시글</td>
                        <td><a href="#" onclick="showMyScrapeList('${sessionScope.loginVo.memberId}')"><span id="countOfMyScrape"></span></a></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                			<div class="modal-footer">
				<ul class="nav navbar-nav navbar-right">

				<c:choose>
				<c:when test="${sessionScope.loginVo.memberGrade=='ADMIN' }">

				<li><a href="allMemberInfo.do">전체회원목록보기</a></li>
				<li><a data-dismiss="modal">닫기</a></li>
				</c:when>
				<c:otherwise>
					<li><a data-toggle="modal" data-target="#deletemodal"
						id="deleteMemBtn" data-dismiss="modal">회원탈퇴</a></li>
					<li><a data-toggle="modal" data-target="#updatemodal"
						id="updateMemBtn" data-dismiss="modal">회원정보수정</a></li>
					<li><a data-dismiss="modal">닫기</a></li>
				</c:otherwise>
				</c:choose>
				</ul>
			</div>
              </div>
            </div>
          </div>
				</form>
	</div>
</div>
<!--  마이페이지 모달 끝 -->

<!-- 작성한글수 모달 시작 -->
    <div class="modal fade" id="showMyPostingList">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">작성한 게시글</h4>
          </div>
			<div class="modal-body">
            <div id="boardList"></div>
          </div>
          <div class="modal-footer">
            <a class="btn btn-default" data-dismiss="modal">Close</a>
          </div>
        </div>
      </div>
    </div>
<!-- 작성한글수 모달 끝-->

<!--  작성한 댓글 모달 시작 -->
    <div class="modal fade" id="showCommentList">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">작성한 댓글</h4>
          </div>
			<div class="modal-body">
            <div id="commentTitle"></div>
          </div>
          <div class="modal-footer">
            <a class="btn btn-default" data-dismiss="modal">Close</a>
          </div>
        </div>
      </div>
    </div>
<!--  작성한 댓글 모달 끝 -->

<!-- 찜한게시물 모달 시작 -->
    <div class="modal fade" id="showScrapeList">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">스크랩한 게시글</h4>
          </div>
			<div class="modal-body">
            <div id="scrapeTitle"></div>
          </div>
          <div class="modal-footer">
            <a class="btn btn-default" data-dismiss="modal">Close</a>
          </div>
        </div>
      </div>
    </div>
<!--  찜한게시물 모달 끝 -->

<!-- 쪽지리스트 모달 시작 -->
<div class="modal fade" id="messageList">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title"><input type="button" value="받은쪽지함" onclick="showMessageList()"> | 
				<input type="button" value="보낸쪽지함" onclick="sendMessageList()"></h4>
			</div>
			<div class="modal-body">
				<div id="ListName"><h1></h1></div>
				
				<div id="listMessage"></div>
			<!-- 	<ul class="list-group">
					<li class="list-group-item">도리도르</li>
				</ul> -->
			</div>
			<div class="modal-footer">
				<ul class="nav navbar-nav navbar-right">
					<li><a data-dismiss="modal">닫기</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- 쪽지리스트 모달 끝-->


<!-- 보낸쪽지상세보기 모달 시작 -->
<div class="modal fade" id="messageContent">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">쪽지함</h4>
			</div>
			<div class="modal-body">
				<h1>상세 보기</h1>
				
				<div id="showContentMessage"></div>
			</div>
			<div class="modal-footer">
				<ul class="nav navbar-nav navbar-right">
					<li><a data-dismiss="modal">닫기</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 쪽지상세보기 모달 끝-->


<!-- 쪽지보내기 모달 시작 -->
<div class="modal fade" id="messageReply">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">쪽지보내기</h4>
          </div>
          <div class="modal-body">
            <a id="Resender"><h5></h5></a>
            <a>-></a>
            <a id="Rereceiver"><h5></h5></a>
         	<input type="text" class="form-control" id="replyTitle" placeholder="제목"></input>
            <textarea class="form-control" id="replyMessageContent"  placeholder="내용" rows="7" style="resize: none;"></textarea>
          </div>
          
          <div class="modal-footer">
            <a class="btn btn-default" id="replyClick" 
            	href="">쪽지보내기</a>
            <a class="btn btn-default" data-dismiss="modal">닫기</a>
          </div>
        </div>
      </div>
    </div>
<!-- 쪽지보내기 모달 끝 -->


    
    
    <!-- 전체회원보기 -->
     <div class="modal fade" id="allMemberInfo">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">전체회원</h4>
          </div>
          <div class="modal-body">
          <div id="allMemberList"></div>
          </div>
          <div class="modal-footer">
            <a class="btn btn-default" data-dismiss="modal">닫기</a>
          </div>
        </div>
      </div>
    </div>
    <!-- 전체회원보기 끝 -->
