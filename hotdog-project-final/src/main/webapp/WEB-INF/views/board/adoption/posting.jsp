<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

	$(document).ready(function() {
		var file0 = document.querySelector('#file0');
    	var file1 = document.querySelector('#file1');
    	var file2 = document.querySelector('#file2');
    	$("#boardContent").keyup(function(){
    		if(!($("#img0").length > 0)){
    			$("#file0").val("");
	    		$("#fileInfo0").html("");
    		}
    		if(!($("#img1").length > 0)){
    			$("#file1").val("");
	    		$("#fileInfo1").html("");
    		}
    		if(!($("#img2").length > 0)){
    			$("#file2").val("");
	    		$("#fileInfo2").html("");
    		}
    	});
    	$("#boardContent").keydown(function(e){
    		if (e.keyCode === 13) {
   		      document.execCommand('insertHTML', false, "<br><br>");
   		      return false;
   		    }
    	});
    	file0.onchange = function () { 
    	    var fileList = file0.files;
    	    var reader = new FileReader();
    	    if(fileList[0] instanceof Blob){
	    	    reader.readAsDataURL(fileList[0]);
	    	    reader.onload = function  () {
	    	    	$("#img0").remove();
	    	    	$("#boardContent").html($("#boardContent").html()+"<img class='hotdogimg' id='img0' width='300' src='"+reader.result+"'></img>");
	    	    }; 
    	    }else{
    	    	$("#img0").remove();
    	    }
    	};
    	file1.onchange = function () { 
    	    var fileList = file1.files;
    	    var reader = new FileReader();
    	    if(fileList[0] instanceof Blob){
	    	    reader.readAsDataURL(fileList[0]);
	    	    reader.onload = function  () {
	    	    	$("#img1").remove();
	    	    	$("#boardContent").html($("#boardContent").html()+"<img class='hotdogimg' id='img1' width='300' src='"+reader.result+"'></img>");
	    	    }; 
    	    }else{
    	    	$("#img1").remove();
    	    }
    	};
    	file2.onchange = function () { 
    	    var fileList = file2.files;
    	    var reader = new FileReader();
    	    if(fileList[0] instanceof Blob){
	    	    reader.readAsDataURL(fileList[0]);
	    	    reader.onload = function  () {
	    	    	$("#img2").remove();
	    	    	$("#boardContent").html($("#boardContent").html()+"<img class='hotdogimg' id='img2' width='300' src='"+reader.result+"'></img>");
	    	    }; 
    	    }else{
    	    	$("#img2").remove();
    	    }
    	};
		$("#writeBtn").click(	function() {
			if ($("#boardTitle").val() == "") {
				alert("글 제목을 입력하세요!");
				$("#boardTitle").focus();
				return;
			}
			
			if ($("#petGender").val() == "") {
				alert("성별을 선택해주세요!");
				return;
			}
			// 라디오버튼 유효성 검사(라디오버튼을 아무것도 선택하지 않을시 유효성검사)
			if ($(':radio[name="petGender"]:checked').length < 1){
				alert("성별을 선택해주세요!");
				return;
			}
			
			// 라디오버튼 유효성 검사(라디오버튼을 아무것도 선택하지 않을시 유효성검사)
			if ($(':radio[name="petNeutralInfo"]:checked').length < 1){
				alert("중성화여부를 선택해주세요!");
				return;
			}
			
			// 라디오버튼 유효성 검사(라디오버튼을 아무것도 선택하지 않을시 유효성검사)
			if ($(':radio[name="petSize"]:checked').length < 1){
				alert("애견크기를 선택해주세요!");
				return;
			}
			
			if ($("#boardContent").text() == "") {
				alert("글 내용을 입력하세요!");
				$("#boardContent").focus();
				return;
			}
			if($("#boardTitle").val().length > 30){
    			alert("글 제목이 너무 깁니다.\n30자 이내로 입력해주시기 바랍니다!");
    			$("#boardTitle").focus();
    			return;
    		}
			var fileExist = "";
			for (var i = 0; i < 3; i++) {
				fileExist += $("#file" + i).val();
				if ($("#file" + i).val() != "") {
					var fileExt = $("#file" + i).val().substring($("#file"	+ i)	.val().lastIndexOf('.') + 1).toUpperCase();
					if (fileExt != "JPG" && fileExt != "GIF" && fileExt != "JPEG" && fileExt != "PNG") {
						alert("첨부파일은 jpg, gif, jpeg, png로 된 이미지만 가능합니다.");
						return;
					}
				}
			}
			if (fileExist == "") {
				alert("이미지 파일을 첨부하셔야 글을 등록하실 수 있습니다.");
				return;
			}
			for (var i = 0; i < 3; i++) {
				if ($("#fileInfo" + i).text().search("용량") != -1) {
					alert("첨부파일의 용량이 초과되었습니다.");
					return;
				}
			}
			$("#boardContentHidden").val($("#boardContent").html());
    		$("#write_form").submit();
		});
		$("#file0").change(function() {
			checkFileSize(0);
		});
		$("#file1").change(function() {
			checkFileSize(1);
		});
		$("#file2").change(function() {
			checkFileSize(2);
		});
		function checkFileSize(index) {
			if ($("#file" + index).val() == "") {
				$("#fileInfo" + index).html("");
			} else {
				var iSize = 0;
				if ($.browser.msie) {
					var objFSO = new ActiveXObject("Scripting.FileSystemObject");
					var sPath = $("#file" + index)[0].value;
					var objFile = objFSO.getFile(sPath);
					var iSize = objFile.size;
					iSize = iSize / 1024;
				} else {
					iSize = ($("#file" + index)[0].files[0].size / 1024);
				}
				if (iSize / 1024 > 1) {
					iSize = (Math.round((iSize / 1024) * 100) / 100)
					if (iSize >= 5) {
						$("#fileInfo" + index).html("<font color='red'>"	+ iSize	 + "Mb 용량이 초과되었습니다.</font>");
					} else {
						$("#fileInfo" + index).html("<font color='blue'>" + iSize + "Mb</font>");
					}
				} else {
					iSize = (Math.round(iSize * 100) / 100)
					$("#fileInfo" + index).html("<font color='blue'>" + iSize + "kb</font>");
				}
			}
		}
		$("#resetBtn").click(function() {
			if (confirm("글 작성을 취소하시겠습니까?")) {
				location.href = "getPostingList.do?type=board_adoption";
			}
		});
	});
	
	

</script>
<br>


<form id="write_form" method=post action="${initParam.root}auth_posting.do?type=board_adoption" enctype="multipart/form-data">
 <div class="section text-left">
      <div class="container">
        <div class="row">
            <div class="panel panel-success text-left">
              <div class="panel-heading">
                <h2 class="panel-title">유기견분양</h2>
              </div>
              <div class="panel-body">
                <div class="row">
                   
                    <table class="table table-user-information">
                        <tr>
			<td colspan="2">제목 : <input type=text id="boardTitle" name="boardTitle" size="60"></input>
			 </td>
                          <td colspan="2">작성자 : ${sessionScope.loginVo.memberNickName}</td>
                        </tr>
                        <tr >
                        <td colspan="1">거주지역 : 			
				<select class="selectpicker" data-style="btn-info" name="residence" id="residence">
				<option value="서울">서울</option>
				<option value="경기도">경기도</option>
				<option value="강원도">강원도</option>
				<option value="충청도">충청도</option>
				<option value="전라도">전라도</option>
				<option value="경상도">경상도</option>
			</select>

				</td>
                        <td colspan="1">애견종류 : 
                <select class="selectpicker" data-style="btn-info" name="petType" id="petType">
				<option value="삽살개">삽살개</option>
				<option value="진돗개">진돗개</option>
				<option value="풍산개">풍산개</option>
				<option value="우리집개">우리집개</option>
			</select>
                        </td>
                        <td colspan="1">애견나이 :
                 <select class="selectpicker" data-style="btn-info" name="petAge" id="petAge">
				<c:forEach var="i" begin="1" end="15">
				<option value="${i}">${i}</option>
			    </c:forEach>
			    </select></td>
				
				
                        </tr>
                        <tr><td>성별 : 
                        					<label class="radio-inline"> <input type="radio"
						name="petGender" id="petGender" value="수컷">수컷
					</label> <label class="radio-inline"> <input type="radio"
						name="petGender" id="petGender" value="암컷">암컷
					</label>
                        </td>
                        <td>중성화 : 
                        <label class="radio-inline"> <input type="radio"
						name="petNeutralInfo" id="petNeutralInfo" value="예">예&nbsp;&nbsp;
					</label> <label class="radio-inline"> <input type="radio"
						name="petNeutralInfo" id="petNeutralInfo" value="아니오">아니오
					</label>
					</td>
                        <td colspan="2">애견크기 : 
                     <label class="radio-inline"> <input type="radio"
						name="petSize" id="petSize" value="소형">소형
					</label> <label class="radio-inline"> <input type="radio"
						name="petSize" id="petSize" value="중형">중형
					</label> <label class="radio-inline"> <input type="radio"
						name="petSize" id="petSize" value="대형">대형
					</label>
					</td>
                    </tr>
					<tr><td colspan="4">
								<div class="form-group">

				<div class="col-sm-4">
					<input type = "hidden" name = "boardContent" id = "boardContentHidden">
     				<div id="boardContent" contenteditable="true" style="width: 950px"></div>
				</div>
			</div></td></tr>
            

                    </table>
                  </div>
                <div class="col-md-12 text-center">
                <br>
                 	<div class="form-group text-left">
				    <label for="exampleInputFile">파일 업로드</label>
				    <input type="file" name="file[0]" id="file0" accept="image/*"><div id="fileInfo0"></div><br>
				    <input type="file" name="file[1]" id="file1" accept="image/*"><div id="fileInfo1"></div><br>
				    <input type="file" name="file[2]" id="file2" accept="image/*"><div id="fileInfo2"></div><br>
				    <font color="red">* 이미지 파일만 업로드 가능합니다.<br>
				    * 용량 제한은 5MB입니다.</font> 
				  </div>
                </div>                

			<div class="modal-footer">
				<ul class="nav navbar-nav navbar-left">
					<li>
					
					<a id="writeBtn" class="action">글쓰기</a></li>
										<li><a id="resetBtn" class="action">닫기</a></li>
				</ul>
			</div>
			</div>
            </div>
        </div>
      </div>
     </div>
</form>
