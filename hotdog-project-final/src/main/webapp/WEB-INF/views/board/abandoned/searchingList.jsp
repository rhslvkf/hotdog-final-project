<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
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
			<tr>
			    <td>${bvo.boardNumber }</td>				
				<td>
				<c:choose>
				<c:when test="${sessionScope.loginVo!=null}">
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
			</c:forEach>
		</tbody>
      </table>
    </div>
	<form class="navbar-form navbar-left" role="search"
		action="${initParam.root}searchPosting.do">
		<input type="hidden" name="type" value="board_abandoned">
		<div class="form-group">
		<c:choose>
			<c:when test="${sessionScope.loginVo!=null}">
			<a class="btn btn-default" href="${initParam.root}write.do?type=board_abandoned">글쓰기</a>
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
				href="searchBoardPosting.do?pageNo=${pb.startPageOfPageGroup-1}&type=board_abandoned&word=${requestScope.lvo.word}">Prev</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="searchBoardPosting.do?pageNo=${i}&type=board_abandoned&word=${requestScope.lvo.word}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a>${i}</a></li>
				</c:otherwise>
			</c:choose>
	&nbsp;
	</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a href="searchBoardPosting.do?pageNo=${pb.endPageOfPageGroup+1}&type=board_abandoned&word=${requestScope.lvo.word}">Next</a></li>
		</c:if>
	</ul>
</div>

<c:forEach begin="1" end="${fn:length(requestScope.lvo.list)}" var="i">
<div class="_popup" id="Layer${i}true" style="position:absolute; display:none;">
<table class="memberInfo">
  <tr>
   <td><a href = ""><font color="blue">게시글 보기</font></a></td>
  </tr>
</table>
</div>
</c:forEach>

<c:forEach begin="1" end="${fn:length(requestScope.lvo.list)}" var="i">
<div class="_popup" id="Layer${i}false" style="position:absolute; display:none;">
<table class="memberInfo">
  <tr>
   <td><a href = ""><font color="blue">게시글 보기</font></a></td>
  </tr>
  <tr>
   <td><a href = ""><font color="blue">쪽지 보내기</font></a></td>
  </tr>
</table>
</div>
</c:forEach>