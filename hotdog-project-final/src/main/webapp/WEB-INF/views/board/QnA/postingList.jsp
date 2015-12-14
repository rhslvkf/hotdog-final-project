<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
	<div class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">Q&A</div>
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
				<c:choose>
				<c:when test="${sessionScope.loginVo!=null}">
					<td class="titleView">
					<c:if test="${bvo.relevel!=0}">
					<c:forEach begin="0" end="${bvo.relevel}" step="1">&nbsp;&nbsp;</c:forEach>
					<img src="${initParam.root }img/reply.jpg">
					</c:if>
					<a href="${initParam.root}showContent.do?no=${bvo.boardNumber }&type=board_QnA">${bvo.boardTitle }</a>
				</td>	
				</c:when>
				<c:otherwise>
				<td class="titleViewNoSession">
				<c:if test="${bvo.relevel!=0}">
				<c:forEach begin="0" end="${bvo.relevel}" step="1">&nbsp;&nbsp;</c:forEach>
				<img src="${initParam.root }img/reply.jpg">
				</c:if>
				${bvo.boardTitle}
				</td>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${sessionScope.loginVo == null }">
				<td>${bvo.memberVO.memberNickName}</td>
				</c:when>
				<c:when test="${sessionScope.loginVo.memberId == bvo.memberVO.memberId }">
				<td><a href="#" onclick="layerControl(event, ${status.count},${fn:length(requestScope.lvo.list)},true);">
				${bvo.memberVO.memberNickName }</a></td>
				</c:when>
				<c:otherwise>
				<td><a href="#" onclick="layerControl(event, ${status.count},${fn:length(requestScope.lvo.list)},false);">
				${bvo.memberVO.memberNickName }</a></td>
				</c:otherwise>
				</c:choose>
				<td>${bvo.boardDate }</td>
				<td>${bvo.boardHits }</td>
			</tr>	
			</c:forEach>
		</tbody>
      </table>
    </div>
	<form class="navbar-form navbar-left" role="search"
		action="${initParam.root}searchPosting.do">
		<input type="hidden" name="type" value="board_QnA">
		<div class="form-group">
		<c:choose>
			<c:when test="${sessionScope.loginVo!=null}">
			<a class="btn btn-default" href="${initParam.root}auth_write.do?type=board_QnA">글쓰기</a>
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
				href="getPostingList.do?pageNo=${pb.startPageOfPageGroup-1}&type=board_QnA">Prev</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="getPostingList.do?pageNo=${i}&type=board_QnA">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="">${i}</a></li>
				</c:otherwise>
			</c:choose>
	&nbsp;
	</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a href="getPostingList.do?pageNo=${pb.endPageOfPageGroup+1}&type=board_QnA">Next</a></li>
		</c:if>
	</ul>
</div>







