<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
    $(document).ready(function(){
    	$("#writeBtn").click(function(){
    		if($("#boardTitle").val() == ""){
    			alert("글 제목을 입력하세요!");
    			$("#boardTitle").focus();
    			return;
    		}
    		if($("#boardContent").val() == ""){
    			alert("글 내용을 입력하세요!");
    			$("#boardContent").focus();
    			return;
    		}
    		for(var i=0;i<3;i++){
	    		if($("#file"+i).val() != ""){
		    		var fileExt = $("#file"+i).val().substring($("#file"+i).val().lastIndexOf('.')+1).toUpperCase();
		    		if(fileExt != "JPG" && fileExt != "GIF" && fileExt != "JPEG" && fileExt != "PNG"){
		    			alert("첨부파일은 jpg, gif, jpeg, png로 된 이미지만 가능합니다.");
		    			return;
		    		}
	    		}
    		}
    		for(var i=0;i<3;i++){
    			if($("#fileInfo"+i).text().search("용량") != -1){
    				alert("첨부파일의 용량이 초과되었습니다.");
    				return;
    			}
    		}
    		$("#write_form").submit();
    	});
    	$("#file0").change(function(){
    		checkFileSize(0);
    	});
    	$("#file1").change(function(){
    		checkFileSize(1);
    	});
    	$("#file2").change(function(){
    		checkFileSize(2);
    	});
    	function checkFileSize(index){
    		if($("#file"+index).val() == ""){
    			$("#fileInfo"+index).html(""); 
    		}else{
	    		var iSize = 0;
	    		if($.browser.msie){
	    			var objFSO = new ActiveXObject("Scripting.FileSystemObject");
	    			var sPath = $("#file"+index)[0].value;
	    			var objFile = objFSO.getFile(sPath);
	    			var iSize = objFile.size;
	    			iSize = iSize/ 1024;
	    		}else {
	    			iSize = ($("#file"+index)[0].files[0].size / 1024);
	    		}
	    		if (iSize / 1024 > 1) { 
	   				iSize = (Math.round((iSize / 1024) * 100) / 100)
	   				if(iSize >= 5){
	   					$("#fileInfo"+index).html("<font color='red'>"+ iSize + "Mb 용량이 초과되었습니다.</font>");
	   				}else{
	   					$("#fileInfo"+index).html("<font color='blue'>"+ iSize + "Mb</font>"); 
	   				}
	    		}else{
	    			iSize = (Math.round(iSize * 100) / 100)
	    			$("#fileInfo"+index).html("<font color='blue'>"+ iSize + "kb</font>"); 
	    		}
    		}
    	}
    	$("#resetBtn").click(function(){    		
    		if(confirm("글 작성을 취소하시겠습니까?")){
    			location.href = "getPostingList.do?type=board_QnA";
    		}
    	});
    });	
</script>
 <br>
  <form action="${initParam.root}reply.do?type=board_QnA" method="post" id="write_form" enctype="multipart/form-data">
   <table class="inputForm" >
    <caption>답변 글 쓰기</caption>
    <tbody>
    <tr>
     <td>제목</td>
     <td colspan="3">
     <input type="text" name=boardTitle size="48" id="boardTitle"
     value="RE:${requestScope.bvo.boardTitle }">
     </td>
    </tr>
    <tr>
     <td>닉네임</td>
     <td>${sessionScope.loginVo.memberNickName}</td>     
    </tr>
    <tr>
     <td colspan="4" align="left">
     &nbsp;&nbsp;
     <textarea cols="53" rows="15" name="boardContent" id="boardContent"></textarea>
                 <div class="form-group">
    <label for="exampleInputFile">파일 업로드</label>
    <input type="file" name="file[0]" id="file0"><div id="fileInfo0"></div><br>
    <input type="file" name="file[1]" id="file1"><div id="fileInfo1"></div><br>
    <input type="file" name="file[2]" id="file2"><div id="fileInfo2"></div><br>
    <font color="red">* 이미지 파일만 업로드 가능합니다.<br>
    * 용량 제한은 5MB입니다.</font> 
  </div>
     </td>
    </tr> 
    <tr>
     <td colspan="4" align="center" >
      <img id="writeBtn" class="action" src="${initParam.root}img/write_btn.jpg" alt="글입력"">
      <img id="resetBtn" class="action" src="${initParam.root}img/cancel.gif" onclick="cancel()">      
     </td>  
    </tr>
    </tbody>
   </table>
   <input type="hidden" name="ref" value="${requestScope.bvo.ref }">
 <input type="hidden" name="restep" value="${requestScope.bvo.restep }">
 <input type="hidden" name="relevel" value="${requestScope.bvo.relevel }">
 <input type="hidden" name="no" value="${requestScope.bvo.boardNumber}">
  </form>




