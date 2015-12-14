<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <script type="text/javascript">
    $(document).ready(function(){
    	$("#listImg").click(function(){    		
    		location.href = "${initParam.root}getPostingList.do?type=board_QnA";
    	});
    	$("#deleteImg").click(function(){ 
    		if(confirm("게시물을 삭제하시겠습니까?"))
    		location.href="auth_deletePosting.do?no=${requestScope.bvo.boardNumber }&type=board_QnA";
    	});
    	$("#updateImg").click(function(){  
    		if(confirm("게시물을 수정하시겠습니까?"))
    		location.href="updateView.do?no=${requestScope.bvo.boardNumber}&type=board_QnA";
    	});
    	$("#answerImg").click(function(){  
    		if(confirm("게시물에 답글을 다시겠습니까?"))
    			location.href="replyView.do?no=${requestScope.bvo.boardNumber}&type=board_QnA";
    	});
    });	
</script>
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

//마우스 레이어 (show, hide)제어
function layerControl(event, flag){
	var eventObj = document.getElementById('Layer'+flag);
	if(!event) event = window.Event;
	var position = getAbsPos(event);
	eventObj.style.left = (position.x + 10) + "px";
	eventObj.style.top = (position.y + 10) + "px";
	eventObj.style.display = eventObj.style.display =='none'?'':'none';
	allLayerClose(flag);
}
</script>

<body>
	<table class="content">
		<tr>		
			<td>NO : ${requestScope.bvo.boardNumber } </td>
			<td colspan="2">${requestScope.bvo.boardTitle}
			 </td>
			
			
		</tr>
		<tr>
		<c:choose>
				<c:when test="${sessionScope.loginVo == null }">
				<td>작성자 : ${requestScope.bvo.memberVO.memberNickName }</td>
				</c:when>
				<c:when test="${sessionScope.loginVo.memberId == requestScope.bvo.memberVO.memberId }">
				<td>작성자 : <a href="#" onclick="layerControl(event,true);">
				${requestScope.bvo.memberVO.memberNickName }</a></td>
				</c:when>
				<c:otherwise>
				<td>작성자 : <a href="#" onclick="layerControl(event,false);">
				${requestScope.bvo.memberVO.memberNickName }</a></td>
				</c:otherwise>
				</c:choose>
			<td> ${requestScope.bvo.boardDate }</td>
			<td>조회수 : ${requestScope.bvo.boardHits }</td>
		</tr>
		<tr>
			<td colspan="3">
			<pre style="white-space: pre-wrap;">${requestScope.bvo.boardContent}
			<c:if test="${fn:length(requestScope.bvo.fileNameList) != 0 }">
			<c:forEach begin="1" end="${fn:length(requestScope.bvo.fileNameList)}" var="i">
			<img src="${initParam.root}upload/${requestScope.bvo.fileNameList[i-1]}" width="300px" height="200px">
			</c:forEach>
			</c:if>
			</pre>
			</td>
		</tr>
		<tr>
			<td valign="middle" align="center" colspan="3">
			 <img id="listImg" class="action" src="${initParam.root}img/list_btn.jpg">
			 <c:if test="${requestScope.bvo.memberVO.memberId==sessionScope.loginVo.memberId}">
			 <img id="deleteImg" class="action"  onclick="deleteBoard()" src="${initParam.root}img/delete_btn.jpg" > 
			 <img id="updateImg" class="action"  onclick="updateBoard()" src="${initParam.root}img/modify_btn.jpg" >
			 <img id="answerImg" class="action"  onclick="answerBoard()" src="${initParam.root}img/answer_btn.jpg">
			 </c:if>
			 <c:if test="${requestScope.bvo.memberVO.memberId!=sessionScope.loginVo.memberId}">
			 <img id="scrapeImg" class="action"  onclick="scrapeBoard()" src="${initParam.root}img/scrapbutn.gif" >
			 <img id="answerImg" class="action"  onclick="answerBoard()" src="${initParam.root}img/answer_btn.jpg">
			 </c:if>
			 <br><br>				
			 </td>
		</tr>
	</table>
	
</body>
</html>

<div class="_popup" id="Layertrue" style="position:absolute; display:none;">
<table class="memberInfo">
  <tr>
   <td><a href = "#" onclick="showPostingList('${requestScope.bvo.memberVO.memberId}')"><font color="blue">게시글 보기</font></a></td>
  </tr>
</table>
</div>

<div class="_popup" id="Layerfalse" style="position:absolute; display:none;">
<table class="memberInfo">
  <tr>
   <td><a href = "#" onclick="showPostingList('${requestScope.bvo.memberVO.memberId}')"><font color="blue">게시글 보기</font></a></td>
  </tr>
  <tr>
   <td><a href = "#"><font color="blue">쪽지 보내기</font></a></td>
  </tr>
</table>
</div>

<!-- 게시글보기 모달 시작 -->
    <div class="modal fade" id="showPostingList">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">작성한 게시글</h4>
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
