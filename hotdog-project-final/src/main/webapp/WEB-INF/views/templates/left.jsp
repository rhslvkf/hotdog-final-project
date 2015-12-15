<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
* {
    font-family: 'Malgun Gothic' !important;
}
</style>
        <h4 align="center">HotDog 채팅방</h4>
    <div id="messages" class="bs-callout" style="overflow-y:auto; height: 250px;"></div>
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
                    var messageTemplate = '<strong>:userName</strong><div class="alert alert-info"><strong>:message</strong>&nbsp;<span class="badge">:dateCreated</span></div>';
                    $('#messages').append(
                            messageTemplate.replace(':userName', oldMessage.userName).replace(':message', oldMessage.chatMessage).replace(':dateCreated', oldMessage.dateCreated));
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
    
        var getNewMessages = function() {
            if (typeof (EventSource) == 'undefined') {
                return;
            }
            var source = new EventSource("getNewMessages.do");
            source.onmessage = function(event) {
                var newMessageList = JSON.parse(event.data);
                newMessageList.forEach(function(newMessage) {
                            var messageTemplate = '<strong>:userName</strong><div class="alert alert-info"><strong>:message</strong>&nbsp;<span class="badge">:dateCreated</span></div>';
                            $('#messages').append(
                                    messageTemplate.replace(':userName', newMessage.userName).replace(':message', newMessage.chatMessage).replace(':dateCreated', newMessage.dateCreated));
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
    </script>
