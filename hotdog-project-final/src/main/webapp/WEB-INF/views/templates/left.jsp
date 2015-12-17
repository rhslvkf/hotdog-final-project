<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
* {
    font-family: 'Malgun Gothic' !important;
}
</style>
        <h4 align="center">HotDog 채팅방</h4>
    <div id="messages" class="bs-callout" style="overflow-y:auto; height: 330px;"></div>
    <div class="bs-callout">
        <form>
            <div class="form-group">
                <input id="userName" class="form-control" type="text" placeholder="닉네임" value="${sessionScope.loginVo.memberNickName}" readonly="readonly">
            </div>
            <div class="form-group">
            	<c:choose>
            	<c:when test="${sessionScope.loginVo != null }">
                <textarea id="message" class="form-control" rows="3" placeholder="메시지" maxlength="200" style="resize:none;"></textarea>
                </c:when>
                <c:otherwise>
                <textarea id="message" class="form-control" rows="3" placeholder="메시지" readonly="readonly" style="resize:none;"></textarea>
                </c:otherwise>
                </c:choose>
            </div>
            <div class="form-group">
            <c:choose>
            <c:when test="${sessionScope.loginVo != null }">
                <button id="sendMessage" class="btn btn-primary btn-lg btn-block" type="button">메시지 전송</button>
            </c:when>
            <c:otherwise>
            	<button id="sendMessage" class="btn btn-primary btn-lg btn-block" type="button" disabled="disabled">메시지 전송</button>
            </c:otherwise>
            </c:choose>
            </div>
        </form>
        <div style="height: 10px;"></div>
    </div>
    <script>
    
    $(document).ready(function(){
		$.ajax({
			type:"POST",
			url:"getChatList.do",
			data:"loginTime=${sessionScope.loginVo.loginTime}",
			success:function(oldMessageList){ 
				oldMessageList.forEach(function(oldMessage) {
					if("${sessionScope.loginVo.memberNickName}" == oldMessage.userName){
                    	var messageTemplate = '<p align="right"><strong>:userName</strong></p><div class="alert alert-info"><strong>:message</strong>&nbsp;<span class="badge">:dateCreated</span></div>';
					}else{
						var messageTemplate = '<p align="left"><strong>:userName</strong></a></p><div class="alert alert-info"><strong>:message</strong>&nbsp;<span class="badge">:dateCreated</span></div>';
					}
                    $('#messages').append(messageTemplate.replace(':userName', oldMessage.userName).replace(':message', oldMessage.chatMessage).replace(':dateCreated', oldMessage.dateCreated));
				    var objDiv = document.getElementById("messages");
				    objDiv.scrollTop = objDiv.scrollHeight;
				});
			}
		});
	});
    
    $("#message").keydown(function(e){
    	if(e.keyCode == 13){
            e.cancelBubble = true;
            $("#sendMessage").click();
            return false;
        }
    });
    var memberId = "";
        var getNewMessages = function() {
            if (typeof (EventSource) == 'undefined') {
                return;
            }
            var source = new EventSource("getNewMessages.do");
            source.onmessage = function(event) {
                var newMessageList = JSON.parse(event.data);
                newMessageList.forEach(function(newMessage) {
                	if("${sessionScope.loginVo.memberNickName}" == newMessage.userName){
                    	var messageTemplate = '<p align="right"><strong>:userName</strong></p><div class="alert alert-info"><strong>:message</strong>&nbsp;<span class="badge">:dateCreated</span></div>';
					}else{
						memberId = newMessage.userName;
						var messageTemplate = "<p align='left'><strong>:userName</strong></a></p><div class='alert alert-info'><strong>:message</strong>&nbsp;<span class='badge'>:dateCreated</span></div>";
					}
                    $('#messages').append(messageTemplate.replace(':userName', newMessage.userName).replace(':message', newMessage.chatMessage).replace(':dateCreated', newMessage.dateCreated));
					var objDiv = document.getElementById("messages");
					objDiv.scrollTop = objDiv.scrollHeight;
                });
            }
        };

        $("#sendMessage").click(function() {
        	if($("#message").val() == ""){
        		$("#message").focus();
        		return;
        	}
        	$.ajax({
            	type:"POST",
        		url:"insertChat.do",
        		data:"userName="+$("#userName").val()+"&chatMessage="+$("#message").val(),
            });
            $("#message").val("");
            $("#message").focus();
        });
        getNewMessages();
     
        
     /* // 마우스 레이어 (show, hide)제어
        function layerControlFromLeft(event){	
    	 alert(memberId);
            var eventObj = document.getElementById('Layer');
            if(!event) event = window.Event;
            var position = getAbsPos(event);
            eventObj.style.left = (position.x + 10) + "px";
            eventObj.style.top = (position.y + 10) + "px";
            eventObj.style.display = eventObj.style.display =='none'?'':'none';
            //allLayerClose();
        }
     
     // 기존 레이어 지우기
		function allLayerClose() {
			var eventObj = document.getElementById('Layer');
			eventObj.style.display = 'none';
		}
     
		//절대좌표 구하기 (화면 스크롤 반영하기 위해서)
		function getAbsPos(e) {
		    this.x = e.clientX + (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft);
		    this.y = e.clientY + (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
		    return this;
		}
		
		//마우스 다른곳 클릭시 감춰줌
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
		}); */
     
		/* function showPostingList(memberId){
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
		} */
     
</script>

<!-- <div class="_popup" id="Layer" style="position:absolute; display:none;">
<table class="memberInfo">
  <tr>
   <td><a href = "#" onclick="showPostingList('')"><font color="blue">게시글 보기</font></a></td>
  </tr>
  <tr>
   <td><a data-toggle="modal" href= "#messagePostingList"><font color="blue">쪽지 보내기</font></a></td>
  </tr>
</table>
</div> -->
