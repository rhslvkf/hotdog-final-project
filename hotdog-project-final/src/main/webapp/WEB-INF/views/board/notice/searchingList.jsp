<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">공지사항</div>
      <!-- Table -->
      <table class="list">
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>닉네임</th>
            <th>작성일</th>
            <th>조회수</th>
          </tr>
        </thead>
        <c:forEach var="bvo" items="${requestScope.lvo.list}">				
			<tr>
			    <td>${bvo.boardNumber }</td>				
				<td>
				<c:choose>
				<c:when test="${sessionScope.loginVo!=null}">
				<a href="${initParam.root}showContent.do?no=${bvo.boardNumber }&type=board_notice">
				${bvo.boardTitle }</a>
				</c:when>
				<c:otherwise>
				${bvo.boardTitle}
				</c:otherwise>
				</c:choose>
				</td>
				<td>${bvo.memberVO.memberNickName }</td>
				<td>${bvo.boardDate }</td>
				<td>${bvo.boardHits }</td>
			</tr>	
			</c:forEach>
		</tbody>
      </table>
    </div>
	<form class="navbar-form navbar-left" role="search"
		action="${initParam.root}searchPosting.do">
		<input type="hidden" name="type" value="board_notice">
		<div class="form-group">
		<c:choose>
			<c:when test="${sessionScope.loginVo!=null}">
			<a class="btn btn-default" href="${initParam.root}write.do?type=board_notice">글쓰기</a>
			</c:when>
			<c:otherwise>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			</c:otherwise>
		</c:choose>
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<select class="selectpicker" data-style="btn-info" name="category">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="nickname">닉네임</option>
			</select>
			<input type="text" class="form-control" placeholder="Search" name="word">
		</div>
		<button type="submit" class="btn btn-default">검색</button>
	</form>
	<br><br>
<p class="paging">
	<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
<div class="col-md-12 text-center">
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup}">
			<li><a
				href="searchBoardPosting.do?pageNo=${pb.startPageOfPageGroup-1}&type=board_notice&word=${requestScope.lvo.word}">Prev</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="searchBoardPosting.do?pageNo=${i}&type=board_notice&word=${requestScope.lvo.word}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a>${i}</a></li>
				</c:otherwise>
			</c:choose>
	&nbsp;
	</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a href="searchBoardPosting.do?pageNo=${pb.endPageOfPageGroup+1}&type=board_notice&word=${requestScope.lvo.word}">Next</a></li>
		</c:if>
	</ul>
</div>







