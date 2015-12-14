<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <script type="text/javascript">
        $(document).ready(function(){
          	if(${requestScope.bvo.petVO.petGender=="수컷"}){
                $("input:radio[id='petGender1']").prop("checked", true);
        	}else{
        		$("input:radio[id='petGender2']").prop("checked", true);
        	}
          	if(${requestScope.bvo.petVO.petNeutralInfo=="예"}){
                $("input:radio[id='petNeutralInfo1']").prop("checked", true);
          	}else{
        		$("input:radio[id='petNeutralInfo2']").prop("checked", true);
          	}
          	if(${requestScope.bvo.petVO.petSize=="소형"}){
                $("input:radio[id='petSize1']").prop("checked", true);
          	}else if(${requestScope.bvo.petVO.petSize=="중형"}){
        		$("input:radio[id='petSize2']").prop("checked", true);
          	}else{
          		$("input:radio[id='petSize3']").prop("checked", true);
          	}
          	
          	
          	
          	
          	var file0 = document.querySelector('#file0');
        	var file1 = document.querySelector('#file1');
        	var file2 = document.querySelector('#file2');
        	var flag0 = true;
        	var flag1 = true;
        	var flag2 = true;
        	$("#boardContent").keyup(function(){
        		if(!($("#img3").length > 0)){
        			$("#file0").val("");
    	    		$("#fileInfo0").html("");
        		}
        		if(!($("#img4").length > 0)){
        			$("#file1").val("");
    	    		$("#fileInfo1").html("");
        		}
        		if(!($("#img5").length > 0)){
        			$("#file2").val("");
    	    		$("#fileInfo2").html("");
        		}
        	});
        	file0.onchange = function () { 
        	    var fileList = file0.files;
        	    var reader = new FileReader();
        	    if(fileList[0] instanceof Blob){
    	    	    reader.readAsDataURL(fileList[0]);
    	    	    reader.onload = function  () {
    	    	    	if(flag0){
    		    	    	if($(".hotdogimg").length > 2){
    		    	    		alert("이미지 파일은 3개까지 업로드 가능합니다.");
    		    	    		$("#file0").val("");
    		    	    		$("#fileInfo0").html("");
    		    	    	}else{
    		    	    		flag0 = false;
    		    	    		$("#boardContent").html($("#boardContent").html()+"<img class='hotdogimg' id='img3' width='300' src='"+reader.result+"'></img>");
    		    	    	}
    	    	    	}else{
    	    	    		$("#img3").remove();
    	    	    		$("#boardContent").html($("#boardContent").html()+"<img class='hotdogimg' id='img3' width='300' src='"+reader.result+"'></img>");
    	    	    	}
    	    	    }; 
        	    }else{
        	    	$("#img3").remove();
        	    	flag0 = true;
        	    }
        	};
        	file1.onchange = function () { 
        	    var fileList = file1.files;
        	    var reader = new FileReader();
        	    if(fileList[0] instanceof Blob){
    	    	    reader.readAsDataURL(fileList[0]);
    	    	    reader.onload = function  () {
    	    	    	if(flag1){
    	    	    		if($(".hotdogimg").length > 2){
    		    	    		alert("이미지 파일은 3개까지 업로드 가능합니다.");
    		    	    		$("#file1").val("");
    		    	    		$("#fileInfo1").html("");
    		    	    	}else{
    		    	    		flag1 = false;
    		    	    		$("#boardContent").html($("#boardContent").html()+"<img class='hotdogimg' id='img4' width='300' src='"+reader.result+"'></img>");
    		    	    	}
    	    	    	}else{
    	    	    		$("#img4").remove();
    	    	    		$("#boardContent").html($("#boardContent").html()+"<img class='hotdogimg' id='img4' width='300' src='"+reader.result+"'></img>");
    	    	    	}
    	    	    }; 
        	    }else{
        	    	$("#img4").remove();
        	    	flag1 = true;
        	    }
        	};
        	file2.onchange = function () { 
        	    var fileList = file2.files;
        	    var reader = new FileReader();
        	    if(fileList[0] instanceof Blob){
    	    	    reader.readAsDataURL(fileList[0]);
    	    	    reader.onload = function  () {
    	    	    	if(flag2){
    	    	    		if($(".hotdogimg").length > 2){
    		    	    		alert("이미지 파일은 3개까지 업로드 가능합니다.");
    		    	    		$("#file2").val("");
    		    	    		$("#fileInfo2").html("");
    		    	    	}else{
    		    	    		flag0 = false;
    		    	    		$("#boardContent").html($("#boardContent").html()+"<img class='hotdogimg' id='img5' width='300' src='"+reader.result+"'></img>");
    		    	    	}
    	    	    	}else{
    	    	    		$("#img5").remove();
    	    	    		$("#boardContent").html($("#boardContent").html()+"<img class='hotdogimg' id='img5' width='300' src='"+reader.result+"'></img>");
    	    	    	}
    	    	    }; 
        	    }else{
        	    	$("#img5").remove();
        	    	flag2 = true;
        	    }
        	};
        	
        	$("#updatePostingForm").submit(function(){
        		if($("#boardTitle").val() == ""){
    				alert("글 제목을 입력하세요!");
    				$("#boardTitle").focus();
    				return false;
    			}
    			if($("#boardContent").text() == ""){
    				alert("글 내용을 입력하세요!");
    				$("#boardContent").focus();
    				return false;
    			}
    			for(var i=0;i<3;i++){
    	    		if($("#file"+i).val() != ""){
    		    		var fileExt = $("#file"+i).val().substring($("#file"+i).val().lastIndexOf('.')+1).toUpperCase();
    		    		if(fileExt != "JPG" && fileExt != "GIF" && fileExt != "JPEG" && fileExt != "PNG"){
    		    			alert("첨부파일은 jpg, gif, jpeg, png로 된 이미지만 가능합니다.");
    		    			return false;
    		    		}
    	    		}
        		}
        		for(var i=0;i<3;i++){
        			if($("#fileInfo"+i).text().search("용량") != -1){
        				alert("첨부파일의 용량이 초과되었습니다.");
        				return false;
        			}
        		}
    			$("#boardContentHidden").val($("#boardContent").html());
    			$("#updatePostingForm").submit();
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
        		if(confirm("글 수정을 취소하시겠습니까?")){
        			location.href = "${initParam.root}showContent.do?no=${bvo.boardNumber}&type=board_community";
        		}
        	});

        });

        </script>

    
    
<body>
<form id="updatePostingForm" method=post action="${initParam.root}auth_updatePosting.do?type=board_adoption" enctype="multipart/form-data">
<input type = "hidden" name = "boardNumber" value = "${bvo.boardNumber}">
	<table class="content">
	
		<tr>		
			<td>NO : ${requestScope.bvo.boardNumber } </td>
			<td colspan="2">제목 : <input type=text id="boardTitle" name="boardTitle" value="${requestScope.bvo.boardTitle}" size="40"></input>
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
			<td>날짜 : ${requestScope.bvo.boardDate }</td>
			<td>조회수 : ${requestScope.bvo.boardHits }</td>
		</tr>
		<tr>
		<td>전화번호 : ${requestScope.bvo.memberVO.memberTel}</td>
		<td>거주지역 : 
				<select class="selectpicker" data-style="btn-info" id="residence" name="residence">
				<option value="">-----</option>
				<option value="서울">서울</option>
				<option value="경기도">경기도</option>
				<option value="강원도">강원도</option>
				<option value="충청도">충청도</option>
				<option value="전라도">전라도</option>
				<option value="경상도">경상도</option>
			</select>
		</td>
		<td>애견종류 : 
				<select class="selectpicker" data-style="btn-info" name="petType">
				<option value="">-----</option>
				<option value="삽살개">삽살개</option>
				<option value="진돗개">진돗개</option>
				<option value="풍산개">풍산개</option>
				<option value="우리집개">우리집개</option>
			</select>
		</td>
		</tr>
				<tr>
		<td>애견나이 : 
				<select class="selectpicker" data-style="btn-info" name="petAge">
				<option value="">-----</option>		
				<c:forEach var="i" begin="1" end="15">
				<option value="${i}">${i}</option>
			    </c:forEach>
			    </select>
		
		</td>
		<td>
					성별 :
					<label class="radio-inline"> <input type="radio"
						name="petGender" id="petGender1" value="수컷">수컷
						 <label class="radio-inline"> <input type="radio"
						name="petGender" id="petGender2" value="암컷">암컷
					</label>
					</label>
		</td>
		<td>중성화여부 : 	<label class="radio-inline"> <input type="radio"
						name="petNeutralInfo" id="petNeutralInfo1" value="예">예
						<label class="radio-inline"> <input type="radio"
						name="petNeutralInfo" id="petNeutralInfo2" value="아니오">아니오
					</label>
					</label> 
		</td>
		</tr>
		<tr><td colspan="3">애견크기 : 
							<label class="radio-inline"> <input type="radio"
						name="petSize" id="petSize1" value="소형">소형
					</label> <label class="radio-inline"> <input type="radio"
						name="petSize" id="petSize2" value="중형">중형
					</label> <label class="radio-inline"> <input type="radio"
						name="petSize" id="petSize3" value="대형">대형
					</label><br><br>
					
					
					
					<input type = "hidden" name = "boardContent" id = "boardContentHidden" value = "">
     				<div id="boardContent" contenteditable="true">${bvo.boardContent}</div>
					<div class="form-group">
				    <label for="exampleInputFile">파일 업로드</label>
				    <input type="file" name="file[0]" id="file0" accept="image/*"><div id="fileInfo0"></div><br>
				    <input type="file" name="file[1]" id="file1" accept="image/*"><div id="fileInfo1"></div><br>
				    <input type="file" name="file[2]" id="file2" accept="image/*"><div id="fileInfo2"></div><br>
				    <font color="red">* 이미지 파일만 업로드 가능합니다.<br>
				    * 용량 제한은 5MB입니다.</font> 
				  </div>
		</td>
		
		</tr>
				



						<tr>
						
				<td valign="middle" colspan="3">						
					<input type="submit" value="수정하기" class="action"></input>
					<img id="resetBtn" class="action" src="${initParam.root}img/cancel.gif" onclick="cancel()">			
								
					</td>				
				</tr>
				

	</table>

</form>


</body>
</html>