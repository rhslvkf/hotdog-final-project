<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
function showPostingList(memberId){
	$.ajax({
		type:"POST",
		url:"showPostingList.do",
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
			if(result.board_community.length != 0){
				title += "<tr><td colspan='5'><h3>"+result.board_community[0].boardType+"</h3></td></tr>";
				title += "<tr><th>번호</th><th>제목</th><th>닉네임</th><th>작성일</th><th>조회수</th></tr>";
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
			if(result.board_petPicture.length != 0){
				title += "<tr><td colspan='5'><h3>"+result.board_petPicture[0].boardType+"</h3></td></tr>";
				title += "<tr><th>번호</th><th>제목</th><th>닉네임</th><th>작성일</th><th>조회수</th></tr>";
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
			$("#boardTitle").html(title);
			$("#showPostingList").modal();
		}
	});
}

//마우스 다른곳 클릭시 레이어 닫기
$(document).mousedown(function(e){
	$('._popup').each(function(){
	        if( $(this).css('display') == 'block' )
	        {
	            var l_position = $(this).offset();
	            l_position.right = parseInt(l_position.left) + ($(this).width());
	            l_position.bottom = parseInt(l_position.top) + parseInt($(this).height());

	            if( ( l_position.left <= e.pageX && e.pageX <= l_position.right )
	                && ( l_position.top <= e.pageY && e.pageY <= l_position.bottom ) )
	            {
	            }
	            else
	            {
	                $(this).hide("fast");
	            }
	        }
	    });		
});
	
//절대좌표 구하기 (화면 스크롤 반영하기 위해서)
function getAbsPos(e) {
    this.x = e.clientX + (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft);
    this.y = e.clientY + (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
    return this;
}

// 마우스 레이어 (show, hide)제어
function layerControl(event, idx, length, flag){
    var eventObj = document.getElementById('Layer' + idx+flag);
    if(!event) event = window.Event;
    var position = getAbsPos(event);
    eventObj.style.left = (position.x + 10) + "px";
    eventObj.style.top = (position.y + 10) + "px";
    eventObj.style.display = eventObj.style.display =='none'?'':'none';
    allLayerClose(idx,length,flag);
}

// 기존 레이어 지우기
function allLayerClose(idx,length,flag) {
 var eventObj = "";
 for(var i = 1; i < length+1; i++) {
	  if(i == idx) {
	   continue;
	  } else {
	   	eventObj = document.getElementById('Layer' + i+flag);
	   	eventObj.style.display = 'none';
	  }
 }
}

</script>
	
	<div class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">유기견정보</div>
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
        <c:forEach var="bvo" items="${requestScope.lvo.list}" varStatus="status">			
        <c:choose>
        	<c:when test="${sessionScope.loginVo.memberGrade !='BRONZE'  }">
					<tr>
					    <td>${bvo.boardNumber }</td>				
						<td>
						<c:choose>
						<c:when test="${sessionScope.loginVo!=null && sessionScope.loginVo.memberGrade !='BRONZE'}">
						<a href="${initParam.root}showContent.do?no=${bvo.boardNumber }&type=board_abandoned">
						${bvo.boardTitle }</a>
						</c:when>
						<c:otherwise>
						${bvo.boardTitle}
						</c:otherwise>
						</c:choose>
						</td>
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
			</c:when>
			<c:otherwise>
					<tr>
					    <td>${bvo.boardNumber }</td>				
						<td>${bvo.boardTitle}</td>
						<td>${bvo.memberVO.memberNickName}</td>
						<td>${bvo.boardDate }</td>
						<td>${bvo.boardHits }</td>
					</tr>
			
			</c:otherwise>		
		</c:choose>			
			</c:forEach>
		</tbody>
      </table>
    </div>
	<form class="navbar-form navbar-left" role="search"
		action="${initParam.root}searchPosting.do">
		<input type="hidden" name="type" value="board_abandoned">
		<div class="form-group">
		<c:choose>
			<c:when test="${sessionScope.loginVo!=null && sessionScope.loginVo.memberGrade!='BRONZE'}">
			<a class="btn btn-default" href="${initParam.root}auth_write.do?type=board_abandoned">글쓰기</a>
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
				href="getPostingList.do?pageNo=${pb.startPageOfPageGroup-1}&type=board_abandoned">Prev</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="getPostingList.do?pageNo=${i}&type=board_abandoned">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="">${i}</a></li>
				</c:otherwise>
			</c:choose>
	&nbsp;
	</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a href="getPostingList.do?pageNo=${pb.endPageOfPageGroup+1}&type=board_abandoned">Next</a></li>
		</c:if>
	</ul>
</div>

<c:forEach begin="1" end="${fn:length(requestScope.lvo.list)}" var="i">
<div class="_popup" id="Layer${i}true" style="position:absolute; display:none;">
<table class="memberInfo">
  <tr>
   <td><a href = "#" onclick="showPostingList('${requestScope.lvo.list[i-1].memberVO.memberId}')"><font color="blue">게시글 보기</font></a></td>
  </tr>
</table>
</div>
</c:forEach>

<c:forEach begin="1" end="${fn:length(requestScope.lvo.list)}" var="i">
<div class="_popup" id="Layer${i}false" style="position:absolute; display:none;">
<table class="memberInfo">
  <tr>
   <td><a href = "#" onclick="showPostingList('${requestScope.lvo.list[i-1].memberVO.memberId}')"><font color="blue">게시글 보기</font></a></td>
  </tr>
  <tr>
   <td><a href = "#"><font color="blue">쪽지 보내기</font></a></td>
  </tr>
</table>
</div>
</c:forEach>

<!-- 게시글보기 모달 시작 -->
    <div class="modal fade" id="showPostingList">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">게시글보기</h4>
          </div>
			<div class="modal-body">
            <div id="boardTitle"></div>
          </div>
          <div class="modal-footer">
            <a class="btn btn-default" data-dismiss="modal">Close</a>
          </div>
        </div>
      </div>
    </div>
<!--  게시글보기 모달 끝 -->

<!-- 쪽지보내기 모달 시작 -->
<div class="modal fade" id="messagePostingList">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">쪽지보내기</h4>
          </div>
          <div class="modal-body">
            <h5>도르에게쪽지보내기</h5>
            <textarea class="form-control" rows="7" style="resize: none;"></textarea>
          </div>
          <div class="modal-footer">
            <a class="btn btn-default" href="">쪽지보내기</a>
            <a class="btn btn-default" data-dismiss="modal">닫기</a>
          </div>
        </div>
      </div>
    </div>
<!-- 쪽지보내기 모달 끝 -->



