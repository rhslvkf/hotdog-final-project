<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <script type="text/javascript">
    $(document).ready(function(){
    	$("#listImg").click(function(){    		
    		location.href = "${initParam.root}getPostingList.do?type=board_adoption";
    	});
    	$("#deleteImg").click(function(){ 
    		if(confirm("게시물을 삭제하시겠습니까?"))
    			location.href="auth_deletePosting.do?no=${requestScope.bvo.boardNumber}&type=board_adoption";
    	});
    	$("#updateImg").click(function(){  
    		if(confirm("게시물을 수정하시겠습니까?"))
    			location.href="updateView.do?no=${requestScope.bvo.boardNumber}&type=board_adoption";
    	});
    	$("#scrapeImg").click(function(){  
    		if(confirm("게시물을 스크랩하시겠습니까?")){
    			$.ajax({
					type:"POST",
					url:"scrape.do",
					data:"no=${requestScope.bvo.boardNumber}&type=board_adoption",
					success:function(result){ 
						if(result.isScrape == "exist"){
							alert("이미 스크랩하신 게시글입니다.");
						}else{
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
							title += "</table>";
							$("#title").text("스크랩한 게시글");
							$("#boardTitle").html(title);
							$("#showPostingList").modal();
						} //if else
					} //success
    			}); //ajax
    		} //if
    	}); //scrape
    }); //ready
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
			$("#title").text("작성한 게시글");
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

<script type="text/javascript">
  	$(document).ready(function() {
  		var indent="";
  		var comment="";
			$.ajax({
				type : "post",
				url : "commentList.do",
				data : "commentBoardNumber=${requestScope.bvo.boardNumber }&type=board_adoption",
				dataType : "json",
				success : function(data) {
					 $.each(data, function(i, value) {
						 
						indent=value.commentIndent;
						var attach="";
						for(var i = 0 ; i<indent;i++){
							attach+=" &nbsp; &nbsp; ";
						}
						if(indent!=0){
							attach+="<img src='${initParam.root }img/reply.jpg'></img>";
						}
						comment = attach + value.commentContent;
						 var commentParentText = 
										'<tr id="r1" name="commentParentCode">'+
										'<td colspan=2>'+
				                    	"<a style='display: none;' id='commentNumber'>"+value.commentNumber+"</a>"+
				                        '<strong>'+value.memberNickName+" "+value.commentDate+'</strong> '+' <a style="cursor:pointer;" name="pAdd">댓글</a> | <a style="cursor:pointer;" name="pDel">삭제</a><p>'+comment+'</p>'+
				                        '</td>'+
				                   		 '</tr>';
						 if($('#commentTable').contents().size()==0){
                              $('#commentTable').append(commentParentText);
                 		   }else{
                              $('#commentTable tr:last').after(commentParentText);
                 		   } 
						
						});
					}
				});

	
 		//댓글달기
	$("#commentParentSubmit").click(function(){
			var now = new Date();
			var nowAll = (now.getMonth()+1)+
			"/"+now.getDate()+" "+ 
			now.getHours()+":"+ 
			now.getMinutes()+
			":"+now.getSeconds()+" ";
			var cno="";
            var pName = $("#memberNickName");
            var pText = $("#PcommentContent");
            
			if($(":input[name=PcommentContent]").val() == ""){
				alert("댓글을 입력하세요");
				$(":input[name=PcommentContent]").focus();
			}else{
				$.ajax({
						type : "post",
						url : "postingComment.do",
						data : $("#commentForm").serialize()+"&commentBoardNumber=${requestScope.bvo.boardNumber }"+"&type=board_adoption",
						dataType :"json",
						success : function(data) {
							cno =data;
							}
					}).done(function(){
						 var commentParentText = '<tr id="r1" name="commentParentCode">'+
						 '<td colspan=2>'+"<a style='display: none;' id='commentNumber'>"+cno+"</a>"+
		                 '<strong>'+pName.val()+" "+nowAll+'</strong>'+' <a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer;" name="pDel">삭제</a><p>'+pText.val()+'</p>'+
		                 '</td>'+
		             	'</tr>';
		             	
						 if($('#commentTable').contents().size()==0){
		                     $('#commentTable').append(commentParentText);
		                 }else{
		                     $('#commentTable tr:last').after(commentParentText);
		                 }
							$("#PcommentContent").val("");		
					})
				}
		});	 
  	})
	
$(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식      
	 var cno=$(this).prev().prev().text();
		  if($(this).attr("name")=="pDel"||$(this).attr("name") == "cDel"){
					if (confirm("정말 삭제하시겠습니까??") == true) { //확인
						cno=$(this).prev().prev().prev().text();
						$.ajax({
							type : "post",
							url : "deleteComment.do",
							data : "commentNumber="+cno+"&type=board_adoption",
						});
					 if($('#commentTable').contents().size()!=0)
						$(this).parent().parent().remove();
				 	}else{ //취소
						return;
					}
			} else {
				//댓글달기 창을 없앤다.
				$("#commentEditor").remove();
				//자기 부모의 tr을 알아낸다
				var parentElement = $(this).parent().parent();                                    
				//부모의 하단에 댓글달기 창을 삽입
				var commentEditor = '<tr id="commentEditor">'
				    		          + '<td style="width:1%"> </td>'
								      + '<td>'
									  + '<span class="form-inline" role="form">'
									  + '<p>'
								      + '<div class="form-group">'
								      + '<input type="hidden" id="commentGroup" name="commentGroup" value='+cno+'>'
									  + '<input type="text" id="memberNickName" value="${sessionScope.loginVo.memberNickName }" readonly name="memberNickName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10">'
									  + '</div>'
									  + '<div class="form-group">'
									  + '<button type="button" id="commentChildSubmit" class="btn btn-default">확인</button>'
									  + '</div>'
									  + '</p>'
									  + '<textarea id="commentContent" name="commentContent" class="form-control" style="width:98%" rows="4"></textarea>'
									  + '</span>' + '</td>' + '</tr>';
									parentElement.after(commentEditor);
				} 

	});	   
		                 
  	//댓글의 댓글을 다는 이벤트
  $(document).on("click","#commentChildSubmit", function(){
       var cName=$("#memberNickName");
       var cText = $("#commentContent");   
       var cgroup=$("#commentGroup");

       var replyForm=$("this").parent().parent().parent()
       if($.trim(cText.val())==""){
           alert("내용을 입력하세요.");
           cText.focus();   
           return;
          }
    $("#commentTable td").remove();  
 
		   	$.ajax({
				type : "post",
				url : "commentReply.do",
				data : "memberNickName="+cName.val()+"&commentContent="+cText.val()+ "&commentGroup="+cgroup.val()+ "&commentBoardNumber=${requestScope.bvo.boardNumber }"+"&commentDate='0'&type=board_adoption",
				dataType : "json",
				success : function(data) {
					 $.each(data, function(i, value) {
						 
						indent=value.commentIndent;
						var attach="";
						for(var i = 0 ; i<indent;i++){
							attach+=" &nbsp; &nbsp; ";
						}
						if(indent!=0){
							attach+="<img src='${initParam.root }img/reply.jpg'></img>";
						}
						comment = attach + value.commentContent;
						 var commentParentText = 
										'<tr id="r1" name="commentParentCode">'+
										'<td colspan=2>'+
				                    	"<a style='display: none;' id='commentNumber'>"+value.commentNumber+"</a>"+
				                        '<strong>'+value.memberNickName+" "+value.commentDate+'</strong> '+' <a style="cursor:pointer;" name="pAdd">댓글</a> | <a style="cursor:pointer;" name="pDel">삭제</a><p>'+comment+'</p>'+
				                        '</td>'+
				                   		 '</tr>';
						 if($('#commentTable').contents().size()==0){
                              $('#commentTable').append(commentParentText);
                 		   }else{
                              $('#commentTable tr:last').after(commentParentText);
                 		   }
						});
					
					}
		   	})
		});
 

</script>




</head>
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
		<td>전화번호 : ${requestScope.bvo.memberVO.memberTel}</td>
		<td>거주지역 : ${requestScope.bvo.residence}</td>
		<td>애견종류 : ${requestScope.bvo.petVO.petType}</td>
		</tr>
				<tr>
		<td>애견나이 : ${requestScope.bvo.petVO.petAge}</td>
		<td> 				
				성별 : ${requestScope.bvo.petVO.petGender}</td>
		<td>중성화여부 : ${requestScope.bvo.petVO.petNeutralInfo}</td>
		</tr>
		<tr><td colspan="3">애견크기 : ${requestScope.bvo.petVO.petSize}</td></tr>
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
			 </c:if>
			 <c:if test="${requestScope.bvo.memberVO.memberId!=sessionScope.loginVo.memberId}">
			 <img id="scrapeImg" class="action"  onclick="scrapeBoard()" src="${initParam.root}img/scrapbutn.gif" >
			 </c:if>
			 <br><br>				
			 </td>
		</tr>
	</table>
	
			 <table id="commentTable" class="table table-condensed"></table>
				 <form id="commentForm">
					<input type="hidden" name="commentBoardNumber" value="${requestScope.bvo.boardNumber }">
					<input type="hidden" name="commentDate" value="0">
                    <table id="cc"class="table table-condensed">    	
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                    <p>
                                        <div class="form-group">
                                            <input type="text" id="memberNickName" value="${sessionScope.loginVo.memberNickName }" readonly name="memberNickName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10">
                                        </div>
                                        
                                        <div class="form-group">
                                            <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">확인</button>
                                        </div>
                                    </p>
                                        <textarea id="PcommentContent" name="PcommentContent" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
                                </span>
                            </td>
                        </tr>
                    </table>
                    </form>
	
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
            <h4 class="modal-title" id="title"></h4>
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
