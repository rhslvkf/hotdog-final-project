<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <h1>공지사항</h1>
    <div class="showListPosting">
      <div class="col-md-12">
        <table class="list">
          <thead>
            <tr>
              <th width="80">번 호</th>
              <th width="300">제 목</th>
              <th width="150">닉네임</th>
              <th width="150">작성일</th>
              <th width="100">조회수</th>
                <c:if test="${sessionScope.loginVo.memberGrade=='ADMIN'}">
              <th class="text-center" width="150">삭제</th>
            </c:if>
            </tr>
          </thead>
          		<c:forEach var="bvo" items="${requestScope.lvo.list}">				
          <tbody>
            <tr>
              <td>${bvo.boardNumber }</td>
              <td>
              <c:choose>        
				<c:when test="${sessionScope.loginVo !=null || sessionScope.loginVo.memberGrade=='ADMIN'}">
				<a href="${initParam.root}showContent.do?no=${bvo.boardNumber}&type=board_notice">
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
				
						<c:if test="${sessionScope.loginVo.memberGrade=='ADMIN'}">
						<td class="text-center">   
								<a
									href="auth_deletePosting.do?no=${bvo.boardNumber}&type=board_notice" onclick="return confirm('삭제하시겠습니까?')"
									class="btn btn-danger btn-xs"> <span
									class="glyphicon glyphicon-remove"></span> 삭제
								</a>
							</td>
                         </c:if>
							
					</tr>
          </tbody>
          </c:forEach>
        </table>
      </div>
    </div>
    <style>
      .custab{
          border: 1px solid #ccc;
          padding: 5px;
          margin: 5% 0;
          box-shadow: 3px 3px 2px #ccc;
          transition: 0.5s;
          }
      .custab:hover{
          box-shadow: 3px 3px 0px transparent;
          transition: 0.5s;
          }
    </style>
	<form class="navbar-form navbar-left" role="search"
		action="${initParam.root}searchPosting.do">
		<input type="hidden" name="type" value="board_notice">
		<br>
		<div class="form-group">
		<c:choose>
			<c:when test="${sessionScope.loginVo.memberGrade =='ADMIN'}">
			<a class="btn btn-default" href="${initParam.root}auth_write.do?type=board_notice">글쓰기</a>
			</c:when>
			<c:otherwise>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			</c:otherwise>
		</c:choose>
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
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
				href="searchPosting.do?pageNo=${pb.startPageOfPageGroup-1}&type=board_notice&word=${requestScope.lvo.word}&category=${requestScope.lvo.category}">Prev</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="searchPosting.do?pageNo=${i}&type=board_notice&word=${requestScope.lvo.word}&category=${requestScope.lvo.category}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a>${i}</a></li>
				</c:otherwise>
			</c:choose>
	&nbsp;
	</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a href="searchPosting.do?pageNo=${pb.endPageOfPageGroup+1}&type=board_notice&word=${requestScope.lvo.word}&category=${requestScope.lvo.category}">Next</a></li>
		</c:if>
	</ul>
</div>







