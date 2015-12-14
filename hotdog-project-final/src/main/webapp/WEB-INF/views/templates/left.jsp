<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
* {
    font-family: 'Malgun Gothic' !important;
}
</style>
    <div id="messages" class="bs-callout">
        <h3>Server-Sent Events 기반 미니 채팅방</h3>
        <p>&nbsp;</p>
    </div>
    <div class="bs-callout">
        <form>
            <div class="form-group">
                <input id="userName" class="form-control" type="text" placeholder="이름">
            </div>
            <div class="form-group">
                <textarea id="message" class="form-control" rows="3" placeholder="메시지"></textarea>
            </div>
            <div class="form-group">
                <button id="sendMessage" class="btn btn-primary btn-lg btn-block" type="button">메시지 전송</button>
            </div>
        </form>
    </div>
    <script>
        var contextpath = '${pageContext.request.contextPath}';
        var getNewMessages = function() {
            if (typeof (EventSource) == 'undefined') {
                return;
            }
            var source = new EventSource(contextpath + '/message?action=getNewMessages');
            source.onmessage = function(event) {
                var newMessageList = JSON.parse(event.data);
                newMessageList
                        .forEach(function(newMessage) {
                            var messageTemplate = '<h4><strong>:userName</strong></h4><div class="alert alert-info"><strong>:message</strong>&nbsp;<span class="badge">:dateCreated</span></div>';
                            $('#messages').append(
                                    messageTemplate.replace(':userName', newMessage.userName).replace(':message', newMessage.message).replace(':dateCreated',
                                            Date.create(newMessage.dateCreated.iMillis).utc().format('{HH}:{mm}')));
                            window.scrollTo(0, document.body.scrollHeight);
                        });
            }
        };

        $('#sendMessage').click(function() {
            var message = {};
            message.userName = $('#userName').val();
            message.message = $('#message').val();
            $.ajax({
                type : 'post',
                url : contextpath + '/message',
                data : JSON.stringify({
                    action : 'create',
                    data : message
                }),
                contentType : 'application/json;charset=UTF-8'
            });
            $('#message').val('');
            $('#message').focus();
        });
        getNewMessages();
    </script>
