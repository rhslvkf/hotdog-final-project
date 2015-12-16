<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
		<h4>* 검색된 게시판 리스트(${fn:length(requestScope.lvo.map.allList)}개의 게시판,  ${requestScope.lvo.map.allNum}개의게시글)</h4><br><br> 
	
<c:if test="${fn:length(requestScope.lvo.map.abandonedList)!=0}">
<a href="${initParam.root}searchBoardPosting.do?type=board_abandoned&word=${requestScope.lvo.map.word}">유기견정보</a>(${fn:length(requestScope.lvo.map.abandonedList)})<br><br>
</c:if>
<c:if test="${fn:length(requestScope.lvo.map.adoptionList)!=0}">
<a href="${initParam.root}searchBoardPosting.do?type=board_adoption&word=${requestScope.lvo.map.word}">분양게시판</a>(${fn:length(requestScope.lvo.map.adoptionList)})<br><br>
</c:if>

<c:if test="${fn:length(requestScope.lvo.map.communityList)!=0}">
<a href="${initParam.root}searchBoardPosting.do?type=board_community&word=${requestScope.lvo.map.word}">자유게시판</a>(${fn:length(requestScope.lvo.map.communityList)})<br><br>
</c:if>

<c:if test="${fn:length(requestScope.lvo.map.noticeList)!=0}">
<a href="${initParam.root}searchBoardPosting.do?type=board_notice&word=${requestScope.lvo.map.word}">공지사항</a>(${fn:length(requestScope.lvo.map.noticeList)})<br><br>
</c:if>

<c:if test="${fn:length(requestScope.lvo.map.petInfoList)!=0}">
<a href="${initParam.root}searchBoardPosting.do?type=board_petInfo&word=${requestScope.lvo.map.word}">애견정보</a>(${fn:length(requestScope.lvo.map.petInfoList)})<br><br>
</c:if>

<c:if test="${fn:length(requestScope.lvo.map.petPictureList)!=0}">
<a href="${initParam.root}searchBoardPosting.do?type=board_petPicture&word=${requestScope.lvo.map.word}">애견사진</a>(${fn:length(requestScope.lvo.map.petPictureList)})<br><br>
</c:if>

<c:if test="${fn:length(requestScope.lvo.map.qnAList)!=0}">
<a href="${initParam.root}searchBoardPosting.do?type=board_QnA&word=${requestScope.lvo.map.word}">Q&A</a>(${fn:length(requestScope.lvo.map.qnAList)})<br><br>
</c:if>

<hr>
<c:forEach items="${requestScope.lvo.list}" var="bvo">
<c:set var="changeWord">
<font color="red">${requestScope.lvo.map.word}</font>
</c:set>
<c:choose>
<c:when test="${bvo.boardType =='유기견정보'}">
	<strong>${bvo.boardType}</strong><br>
	<c:choose>
	<c:when test="${sessionScope.loginVo!=null}">
	<u><a href="${initParam.root}showContent.do?no=${bvo.boardNumber}&type=board_abandoned">${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</a></u><br>
	</c:when>
	<c:otherwise>
	<u>${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</u><br>
	</c:otherwise>
	</c:choose>
     ${fn:replace(bvo.boardContent,requestScope.lvo.map.word,changeWord)}<br><br>
	${bvo.boardDate} &nbsp <b>${bvo.memberVO.memberNickName}</b><hr>	
</c:when>

<c:when test="${bvo.boardType =='분양게시판'}">
<strong>${bvo.boardType}</strong><br>
	<c:choose>
	<c:when test="${sessionScope.loginVo!=null}">
	<u><a href="${initParam.root}showContent.do?no=${bvo.boardNumber}&type=board_adoption">${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</a></u><br>
	</c:when>
	<c:otherwise>
	<u>${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</u><br>
	</c:otherwise>
	</c:choose>
     ${fn:replace(bvo.boardContent,requestScope.lvo.map.word,changeWord)}<br><br>
	${bvo.boardDate} &nbsp <b>${bvo.memberVO.memberNickName}</b><hr>
</c:when>

<c:when test="${bvo.boardType =='자유게시판'}">
<strong>${bvo.boardType}</strong><br>
	<c:choose>
	<c:when test="${sessionScope.loginVo!=null}">
	<u><a href="${initParam.root}showContent.do?no=${bvo.boardNumber}&type=board_community">${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</a></u><br>
	</c:when>
	<c:otherwise>
	<u>${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</u><br>
	</c:otherwise>
	</c:choose>
     ${fn:replace(bvo.boardContent,requestScope.lvo.map.word,changeWord)}<br><br>
	${bvo.boardDate} &nbsp <b>${bvo.memberVO.memberNickName}</b><hr>
</c:when>

<c:when test="${bvo.boardType =='공지사항'}">
<strong>${bvo.boardType}</strong><br>
	<c:choose>
	<c:when test="${sessionScope.loginVo!=null}">
	<u><a href="${initParam.root}showContent.do?no=${bvo.boardNumber}&type=board_notice">${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</a></u><br>
	</c:when>
	<c:otherwise>
	<u>${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</u><br>
	</c:otherwise>
	</c:choose>
     ${fn:replace(bvo.boardContent,requestScope.lvo.map.word,changeWord)}<br><br>
	${bvo.boardDate} &nbsp <b>${bvo.memberVO.memberNickName}</b><hr>
</c:when>

<c:when test="${bvo.boardType =='애견정보'}">
<strong>${bvo.boardType}</strong><br>
	<c:choose>
	<c:when test="${sessionScope.loginVo!=null}">
	<u><a href="${initParam.root}showContent.do?no=${bvo.boardNumber}&type=board_petInfo">${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</a></u><br>
	</c:when>
	<c:otherwise>
	<u>${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</u><br>
	</c:otherwise>
	</c:choose>
     ${fn:replace(bvo.boardContent,requestScope.lvo.map.word,changeWord)}<br><br>
	${bvo.boardDate} &nbsp <b>${bvo.memberVO.memberNickName}</b><hr>
</c:when>

<c:when test="${bvo.boardType =='애견사진'}">
<strong>${bvo.boardType}</strong><br>
	<c:choose>
	<c:when test="${sessionScope.loginVo!=null}">
	<u><a href="${initParam.root}showContent.do?no=${bvo.boardNumber}&type=board_petPicture">${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</a></u><br>
	</c:when>
	<c:otherwise>
	<u>${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</u><br>
	</c:otherwise>
	</c:choose>
     ${fn:replace(bvo.boardContent,requestScope.lvo.map.word,changeWord)}<br><br>
	${bvo.boardDate} &nbsp <b>${bvo.memberVO.memberNickName}</b><hr>
</c:when>

<c:when test="${bvo.boardType =='Q&A'}">
<strong>${bvo.boardType}</strong><br>
	<c:choose>
	<c:when test="${sessionScope.loginVo!=null}">
	<u><a href="${initParam.root}showContent.do?no=${bvo.boardNumber}&type=board_QnA">${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</a></u><br>
	</c:when>
	<c:otherwise>
	<u>${fn:replace(bvo.boardTitle,requestScope.lvo.map.word,changeWord)}</u><br>
	</c:otherwise>
	</c:choose>
     ${fn:replace(bvo.boardContent,requestScope.lvo.map.word,changeWord)}<br><br>
	${bvo.boardDate} &nbsp <b>${bvo.memberVO.memberNickName}</b><hr>
</c:when>
</c:choose>
</c:forEach>



<p class="paging">
	<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
<div class="col-md-12 text-center">
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup}">
			<li><a
				href="searchBoard.do?pageNo=${pb.startPageOfPageGroup-1}&word=${requestScope.lvo.map.word}">Prev</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="searchBoard.do?pageNo=${i}&word=${requestScope.lvo.map.word}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a>${i}</a></li>
				</c:otherwise>
			</c:choose>
	&nbsp;
	</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a href="searchBoard.do?pageNo=${pb.endPageOfPageGroup+1}&word=${requestScope.lvo.map.word}">Next</a></li>
		</c:if>
	</ul>
</div>


 