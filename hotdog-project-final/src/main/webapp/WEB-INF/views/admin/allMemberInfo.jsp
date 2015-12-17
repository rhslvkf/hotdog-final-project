<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>전체회원정보</h1>
<div class="showListPosting">
	<div class="col-md-12">
		<table class="table table-striped custab">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>회원등급</th>
					<th>접속날짜</th>
					<th>회원상태</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${requestScope.mvo.list}" var="allMember" varStatus="status">
				<c:if test="${allMember.memberId!=sessionScope.loginVo.memberId}">
				
				<tr>
						<td>${allMember.memberId}</td>
						<td>${allMember.memberName}</td>
						<td>${allMember.memberNickName}</td>
						<td>${allMember.memberGrade}</td>
						<td>${allMember.memberLatestdate}</td>
						<td>${allMember.memberStatus}</td>
					</tr>					
					</c:if>
				</c:forEach>				
				
			</tbody>
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
    
    
    <p class="paging">
	<c:set var="pb" value="${requestScope.mvo.pagingBean}"></c:set>
<div class="col-md-12 text-center">
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup}">
			<li><a
				href="allMemberInfo.do?pageNo=${pb.startPageOfPageGroup-1}">Prev</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="allMemberInfo.do?pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="">${i}</a></li>
				</c:otherwise>
			</c:choose>
	&nbsp;
	</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a href="allMemberInfo.do?pageNo=${pb.endPageOfPageGroup+1}">Next</a></li>
		</c:if>
	</ul>
</div>
              
