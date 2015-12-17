<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
function showPostingList(memberId){
	var grade = "${sessionScope.loginVo.memberGrade}";
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
				if(grade !="BRONZE"){
					title += "<tr><td>"+result.board_abandoned[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_abandoned[i].boardNumber
							+"&type=board_abandoned'>"
							+result.board_abandoned[i].boardTitle+
							"</a></td><td>"+result.board_abandoned[i].memberVO.memberNickName
							+"</td><td>"+result.board_abandoned[i].boardDate
							+"</td><td>"+result.board_abandoned[i].boardHits+"</td></tr>";
				}else{
					title += "<tr><td>"+result.board_abandoned[i].boardNumber
					+"</td><td>"+result.board_abandoned[i].boardTitle+
					"</td><td>"+result.board_abandoned[i].memberVO.memberNickName
					+"</td><td>"+result.board_abandoned[i].boardDate
					+"</td><td>"+result.board_abandoned[i].boardHits+"</td></tr>";
					
					
				}
				}
			}
			if(result.board_adoption.length != 0){
				title += "<tr><td colspan='5'><h3>"+result.board_adoption[0].boardType+"</h3></td></tr>";
				title += "<tr><th>번호</th><th>제목</th><th>닉네임</th><th>작성일</th><th>조회수</th></tr>";
				for(var i=0;i<result.board_adoption.length;i++){
					if(grade !="BRONZE"){
					title += "<tr><td>"+result.board_adoption[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_adoption[i].boardNumber
							+"&type=board_adoption'>"
							+result.board_adoption[i].boardTitle+
							"</a></td><td>"+result.board_adoption[i].memberVO.memberNickName
							+"</td><td>"+result.board_adoption[i].boardDate
							+"</td><td>"+result.board_adoption[i].boardHits+"</td></tr>";
				}else{
					title += "<tr><td>"+result.board_adoption[i].boardNumber
					+"</td><td>"+result.board_adoption[i].boardTitle+
					"</td><td>"+result.board_adoption[i].memberVO.memberNickName
					+"</td><td>"+result.board_adoption[i].boardDate
					+"</td><td>"+result.board_adoption[i].boardHits+"</td></tr>";
				}
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
					if(grade !="BRONZE"){
					title += "<tr><td>"+result.board_petInfo[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_petInfo[i].boardNumber
							+"&type=board_petInfo'>"
							+result.board_petInfo[i].boardTitle+
							"</a></td><td>"+result.board_petInfo[i].memberVO.memberNickName
							+"</td><td>"+result.board_petInfo[i].boardDate
							+"</td><td>"+result.board_petInfo[i].boardHits+"</td></tr>";
				}else{
					title += "<tr><td>"+result.board_petInfo[i].boardNumber
					+"</td><td>"+result.board_petInfo[i].boardTitle+
					"</td><td>"+result.board_petInfo[i].memberVO.memberNickName
					+"</td><td>"+result.board_petInfo[i].boardDate
					+"</td><td>"+result.board_petInfo[i].boardHits+"</td></tr>";
					
				}
				}
			}
			if(result.board_petPicture.length != 0){
				title += "<tr><td colspan='5'><h3>"+result.board_petPicture[0].boardType+"</h3></td></tr>";
				title += "<tr><th>번호</th><th>제목</th><th>닉네임</th><th>작성일</th><th>조회수</th></tr>";
				for(var i=0;i<result.board_petPicture.length;i++){
					if(grade !="BRONZE"){
					title += "<tr><td>"+result.board_petPicture[i].boardNumber
							+"</td><td><a href = '${initParam.root}showContent.do?no="
							+result.board_petPicture[i].boardNumber
							+"&type=board_petPicture'>"
							+result.board_petPicture[i].boardTitle+
							"</a></td><td>"+result.board_petPicture[i].memberVO.memberNickName
							+"</td><td>"+result.board_petPicture[i].boardDate
							+"</td><td>"+result.board_petPicture[i].boardHits+"</td></tr>";
				}else{
					title += "<tr><td>"+result.board_petPicture[i].boardNumber
					+"</td><td>"+result.board_petPicture[i].boardTitle+
					"</td><td>"+result.board_petPicture[i].memberVO.memberNickName
					+"</td><td>"+result.board_petPicture[i].boardDate
					+"</td><td>"+result.board_petPicture[i].boardHits+"</td></tr>";
			
				}
				}
			}
			title += "</table>";
			$("#boardTitle").html(title);
			$("#showPostingList").modal();
		}
	});
}



<!-- 		/////////////////////////////////////////////////////////////////////////////////////////////////// -->

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
	<!-- 		/////////////////////////////////////////////////////////////////////////////////////////////////// -->
	



//절대좌표 구하기 (화면 스크롤 반영하기 위해서)
function getAbsPos(e) {
    this.x = e.clientX + (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft);
    this.y = e.clientY + (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
    return this;
}





<!-- 				/////////////////////////////////////////////////////////////////////////////////////////////////// -->

// 마우스 레이어 (show, hide)제어
function layerControl(event, idx, length, flag, nick){						/* idx=statuscount					123123123123 */
	$("#nickname").text(nick)
    var eventObj = document.getElementById('Layer' + idx+flag); //
    if(!event) event = window.Event;
    var position = getAbsPos(event);
    eventObj.style.left = (position.x + 10) + "px";
    eventObj.style.top = (position.y + 10) + "px";
    eventObj.style.display = eventObj.style.display =='none'?'':'none';
    allLayerClose(idx,length,flag);
}




<!-- 				/////////////////////////////////////////////////////////////////////////////////////////////////// -->
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
<!-- 				/////////////////////////////////////////////////////////////////////////////////////////////////// -->

//쪽지 보내기
function SendMessage(){
	var receiver=$("#nickname").text();
	var sender=$("#sender").text();
	var messageContent=$("#messageContents").val();
	var messageTitle=$("#title").val();
	if(messageTitle.length==0){
		alert("제목이 비었습니다.")
		return false;
	}
	else if(messageContent.length==0){
		alert("내용이 비었습니다.")
		return false;
	}else{
		$.ajax({
				type : "post",
				url : "sendMessage.do",
				data : "receiver="+receiver+"&sender="+sender+"&messageContent="+messageContent+"&messageTitle="+messageTitle,
				dataType :"json",
				success : function(data) {
				}
					})
	}
	
	}



</script>
    
    	      <h1>자유게시판</h1><br>
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
          				<c:forEach var="bvo" items="${requestScope.lvo.list}" varStatus="status">				
          <tbody>
			<tr>
			    <td>${bvo.boardNumber }</td>				
				<td>
				<c:choose>
				<c:when test="${sessionScope.loginVo !=null}">
				<a href="${initParam.root}showContent.do?no=${bvo.boardNumber }&type=board_community">
				${bvo.boardTitle }</a>
				</c:when>
				<c:otherwise>
				${bvo.boardTitle}
				</c:otherwise>
				</c:choose>
				</td>
				<c:choose>
				<c:when test="${sessionScope.loginVo ==null}">
				<td>${bvo.memberVO.memberNickName}</td>
				</c:when>
				<c:when test="${sessionScope.loginVo.memberId == bvo.memberVO.memberId}">
				

<!-- 				/////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
				<td><a href="#" onclick="layerControl(event, ${status.count},${fn:length(requestScope.lvo.list)},true,null)">
				${bvo.memberVO.memberNickName }</a></td>
				
				</c:when>
				<c:otherwise>
				<td><a href="#" onclick="layerControl(event, ${status.count},${fn:length(requestScope.lvo.list)},false,'${bvo.memberVO.memberNickName }');">
				${bvo.memberVO.memberNickName }</a></td>
				</c:otherwise>
				</c:choose>
<!-- 				/////////////////////////////////////////////////////////////////////////////////////////////////// -->
				
				
				<td>${bvo.boardDate }</td>
				<td>${bvo.boardHits }</td>
							<c:if test="${sessionScope.loginVo.memberGrade=='ADMIN'}">
							<td class="text-center">   

								<a
									href="auth_deletePosting.do?no=${bvo.boardNumber }&type=board_community" onclick="return confirm('삭제하시겠습니까?')"
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
    
    
    
    
    
    

    
    
    
    
    
    
    
    
	<form class="navbar-form navbar-left" role="search"
		action="${initParam.root}searchPosting.do">
		<input type="hidden" name="type" value="board_community">
		<div class="form-group">
		<c:choose>
			<c:when test="${sessionScope.loginVo !=null}">
			<a class="btn btn-default" href="${initParam.root}auth_write.do?type=board_community">글쓰기</a>
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
				href="getPostingList.do?pageNo=${pb.startPageOfPageGroup-1}&type=board_community">Prev</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="getPostingList.do?pageNo=${i}&type=board_community">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="">${i}</a></li>
				</c:otherwise>
			</c:choose>
	&nbsp;
	</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a href="getPostingList.do?pageNo=${pb.endPageOfPageGroup+1}&type=board_community">Next</a></li>
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
   <td><a data-toggle="modal" href= "#messagePostingList"><font color="blue">쪽지 보내기</font></a></td>
  </tr>
  
  <c:if test="${sessionScope.loginVo.memberGrade=='ADMIN'}">
        <tr>
   <td><a data-toggle="modal" href= "#mypagemodal"><font color="blue">회원정보보기</font></a></td>
  </tr>
  </c:if>

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



<!-- /////////////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- 쪽지보내기 모달 시작 -->
<div class="modal fade" id="messagePostingList">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">쪽지보내기</h4>
          </div>
          <div class="modal-body">
        	<a style='display: none;' id="sender">${sessionScope.loginVo.memberNickName}</a>
            <a id="nickname"><h5></h5></a>
         	<input type="text" class="form-control" id="title"  placeholder="제목"></input>
            <textarea class="form-control" id="messageContents" placeholder="내용" rows="7" style="resize: none;"></textarea>
          </div>
          
          <div class="modal-footer">
            <a class="btn btn-default" onclick="SendMessage()" 
            	href="">쪽지보내기</a>
            <a class="btn btn-default" data-dismiss="modal">닫기</a>
          </div>
        </div>
      </div>
    </div>
<!-- 쪽지보내기 모달 끝 -->
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////// -->



<!-- 관리자모드 회원정보보기 -->



<div class="modal fade" id="mypagemodal">
	<div class="modal-dialog">
				<form class="form-horizontal" role="form">
          <div class="panel panel-warning">
            <div class="panel-heading">
            <button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
              <h3 class="panel-title">회원정보보기</h3>
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
                        <td></td>
                      </tr>
                      <tr>
                        <td>이름</td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>별명</td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>전화번호</td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>회원등급</td>
                        <td></td>
                      </tr>
                      <tr>
                      <td>출석일수</td>
                        <td></td>
                        </tr>
                      <tr>
                        <td>작성한 게시글</td>
                       <td><a href="#" onclick="showMyPostingList('${sessionScope.loginVo.memberId}')" ><span id="countOfMyPosting"></span></a></td>
                      </tr>
                      <tr>
                        <td>작성한 댓글</td>
                       <td><a href="#" onclick="showMyCommentList('${sessionScope.loginVo.memberNickName}')" ><span id="countOfMyComment"></span></a></td>
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


				<li><a data-dismiss="modal">닫기</a></li>

				</ul>
			</div>
              </div>
            </div>
          </div>
				</form>

	</div>
</div>
<!--  관리자 정보 회원정보보기 끝 -->
