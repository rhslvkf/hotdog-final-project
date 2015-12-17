<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<script type="text/javascript">
	var session="${sessionScope.loginVo}";
	var grade ="${sessionScope.loginVo.memberGrade}";
	$(document).ready(function(){
		// 최근 유기견 게시판
		$.ajax({
			   type:"post",
	            url:"latestPosting.do",
	            data:"type=board_abandoned",
	            success: function(data){
	            	var boardArray=data.list;
	            	var content="";
	                  for(var i=0; i<boardArray.length; i++){
	                  var no= boardArray[i].boardNumber;
	              
	                	 
	                     content +="<tr><td>" + boardArray[i].boardNumber + "</td>";
	                     
	                     if(session!="" && grade!="BRONZE"){	                
	                     content +="<td><a href = 'showContent.do?no="+no+"&type=board_abandoned'>" 
	                    		 																+ boardArray[i].boardTitle + "</a></td>";
	                     }else{
	                    	 content +="<td>"+boardArray[i].boardTitle+"</td>";
	                     }
	                     content +="<td>" + boardArray[i].memberVO.memberNickName + "</td>";
	                     content +="<td>" + boardArray[i].boardDate + "</td></tr>"; 
	                 
	                  } 
	                  $("#latestabandonedPostingView").html(content);
	          
	               }  
	
		});
		// 최근 자유 게시판 
		$.ajax({
			   type:"post",
	            url:"latestcommunityPosting.do",
	            data:"type=board_community",
	            success: function(data){
	            	var boardArray=data.list;
	            	var content="";
	                  for(var i=0; i<boardArray.length; i++){
	                  var no= boardArray[i].boardNumber;
	              
	                	 
	                     content +="<tr><td>" + boardArray[i].boardNumber + "</td>";
	                     if(session!="" ){	         
	                     content +="<td><a href = 'showContent.do?no="+no+"&type=board_community'>" 
	                    		 																+ boardArray[i].boardTitle + "</a></td>";
	                     }
	                     else{
	                    	 content +="<td>"+boardArray[i].boardTitle+"</td>";
	                     }
	                     content +="<td>" + boardArray[i].memberVO.memberNickName + "</td>";
	                     content +="<td>" + boardArray[i].boardDate + "</td></tr>"; 
	                 
	                  } 
	                  $("#latestcommunityPostingView").html(content);
	          
	               }  
	
		});
		//최근 공지사항 게시판 
		$.ajax({
			   type:"post",
	            url:"latestnoticePosting.do",
	            data:"type=board_notice",
	            success: function(data){
	            	var boardArray=data.list;
	            	var content="";
	                  for(var i=0; i<boardArray.length; i++){
	                  var no= boardArray[i].boardNumber;
	              
	                	 
	                     content +="<tr><td>" + boardArray[i].boardNumber + "</td>";
	                     if(session!="" && grade!="BRONZE"){	     
	                     content +="<td><a href = 'showContent.do?no="+no+"&type=board_notice'>" 
	                    		 																+ boardArray[i].boardTitle + "</a></td>";
	                     }else{
	                    	 content +="<td>"+boardArray[i].boardTitle+"</td>";
	                     }
	                     content +="<td>" + boardArray[i].memberVO.memberNickName + "</td>";
	                     content +="<td>" + boardArray[i].boardDate + "</td></tr>"; 
	                 
	                  } 
	                  $("#latestnoticePostingView").html(content);
	          
	               }  
	
		});
		//최근 애견정보 게시판   
		$.ajax({
			   type:"post",
	            url:"latestepetinfoPosting.do",
	            data:"type=board_petInfo",
	            success: function(data){
	            	var boardArray=data.list;
	            	var content="";
	                  for(var i=0; i<boardArray.length; i++){
	                  var no= boardArray[i].boardNumber;
	              
	                	 
	                     content +="<tr><td>" + boardArray[i].boardNumber + "</td>";
	                     if(session!="" && grade!="BRONZE"){	   
	                     content +="<td><a href = 'showContent.do?no="+no+"&type=board_petInfo'>" 
	                    		 																+ boardArray[i].boardTitle + "</a></td>";
	                     }else{
	                    	 content +="<td>"+boardArray[i].boardTitle+"</td>";
	                     }
	                     content +="<td>" + boardArray[i].memberVO.memberNickName + "</td>";
	                     content +="<td>" + boardArray[i].boardDate + "</td></tr>"; 
	                 
	                  } 
	                  $("#latestepetinfoPostingView1").html(content);
	          
	               }  
	
		});
		
		
	});
	
</script>

    <section class="section-white">
      <div class="container">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"
        data-interval="2000">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          </ol>
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
              <img src="${initParam.root}image/iu1.jpg" alt="..." id="slideimg">
              <div class="carousel-caption">
                <h2>Heading</h2>
              </div>
            </div>
            <div class="item">
              <img src="${initParam.root}image/iu2.jpg" alt="..." id="slideimg">
              <div class="carousel-caption">
                <h2>Heading</h2>
              </div>
            </div>
            <div class="item">
              <img src="${initParam.root}image/iu3.png" alt="..." id="slideimg">
              <div class="carousel-caption">
                <h2>HotDog</h2>
              </div>
            </div>
          </div>
          <!-- Controls -->
        </div>
      </div>
    </section>



<div class="container">
	<div class="row">
		<div class="col-md-6">
			<h4>애견정보</h4>
			<br>
			<table class="table" id="listCenter">
				<thead>
					<tr class="active">
						<th>번호</th>
						<th>제목</th>
						<th>닉네임</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody id="latestepetinfoPostingView1">
				</tbody>
			</table>
		</div>
		<div class="col-md-6">
			<h4>공지사항</h4>
			<br>
			<table class="table" id="listCenter">
				<thead>
					<tr class="active">
						<th>번호</th>
						<th>제목</th>
						<th>닉네임</th>
						<th>날짜</th>

					</tr>
				</thead>
				<tbody id="latestnoticePostingView">
				</tbody>
			</table>
		</div>
	</div>
</div>



<div class="container">
	<div class="row">
		<div class="col-md-6">
			<h4>자유게시판</h4>
			<br>
			<table class="table" id="listCenter">
				<thead>
					<tr class="active">
						<th>번호</th>
						<th>제목</th>
						<th>닉네임</th>
						<th>날짜</th>

					</tr>
				</thead>
				<tbody id="latestcommunityPostingView">
				</tbody>
			</table>
		</div>
		<div class="col-md-6">
			<h4>유기견정보</h4>
			<br>
			<table class="table" id="listCenter">
				<thead>
					<tr class="active">
						<th>번호</th>
						<th>제목</th>
						<th>닉네임</th>
						<th>날짜</th>

					</tr>
				</thead>
				<tbody id="latestabandonedPostingView">
				</tbody>
			</table>
		</div>
	</div>
</div>



<div class="section">
	<div class="container">
		<div class="col-xs-12">
			<div class="page-header">
				<h3>애견사진</h3>
			</div>
			<div class="carousel slide" id="myCarousel">
				<div class="carousel-inner">
					<div class="item active">
						<ul class="thumbnails">
						<c:if test="${requestScope.result.petPictureList[0] != null}">
							<li class="col-sm-3">
								<div class="fff">
								<c:choose>
									<c:when test="${sessionScope.loginVo != null}">
									<div class="thumbnail">
										<a href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[0].boardNumber}&type=board_petPicture">
										<img src="${requestScope.result.petPictureList[0].fileName}"
											alt="" id="highlightimg"></a>
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[0].boardTitle}</h4>
										<a class="btn btn-mini" href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[0].boardNumber}&type=board_petPicture">
										» Read More</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="thumbnail">
										<img src="${requestScope.result.petPictureList[0].fileName}"
											alt="" id="highlightimg">
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[0].boardTitle}</h4>
										» Read More
									</div>
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:if>
						<c:if test="${requestScope.result.petPictureList[1] != null}">
							<li class="col-sm-3">
								<div class="fff">
									<c:choose>
									<c:when test="${sessionScope.loginVo != null}">
									<div class="thumbnail">
										<a href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[1].boardNumber}&type=board_petPicture">
										<img src="${requestScope.result.petPictureList[1].fileName}"
											alt="" id="highlightimg"></a>
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[1].boardTitle}</h4>
										<a class="btn btn-mini" href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[1].boardNumber}&type=board_petPicture">
										» Read More</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="thumbnail">
										<img src="${requestScope.result.petPictureList[1].fileName}"
											alt="" id="highlightimg">
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[1].boardTitle}</h4>
										» Read More
									</div>
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:if>
						<c:if test="${requestScope.result.petPictureList[2] != null}">
							<li class="col-sm-3">
								<div class="fff">
									<c:choose>
									<c:when test="${sessionScope.loginVo != null}">
									<div class="thumbnail">
										<a href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[2].boardNumber}&type=board_petPicture">
										<img src="${requestScope.result.petPictureList[2].fileName}"
											alt="" id="highlightimg"></a>
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[2].boardTitle}</h4>
										<a class="btn btn-mini" href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[2].boardNumber}&type=board_petPicture">
										» Read More</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="thumbnail">
										<img src="${requestScope.result.petPictureList[2].fileName}"
											alt="" id="highlightimg">
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[2].boardTitle}</h4>
										» Read More
									</div>
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:if>
						<c:if test="${requestScope.result.petPictureList[3] != null}">
							<li class="col-sm-3">
								<div class="fff">
									<c:choose>
									<c:when test="${sessionScope.loginVo != null}">
									<div class="thumbnail">
										<a href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[3].boardNumber}&type=board_petPicture">
										<img src="${requestScope.result.petPictureList[3].fileName}"
											alt="" id="highlightimg"></a>
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[3].boardTitle}</h4>
										<a class="btn btn-mini" href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[3].boardNumber}&type=board_petPicture">
										» Read More</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="thumbnail">
										<img src="${requestScope.result.petPictureList[3].fileName}"
											alt="" id="highlightimg">
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[3].boardTitle}</h4>
										» Read More
									</div>
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:if>
						</ul>
					</div>
<c:if test="${fn:length(requestScope.result.petPictureList) > 4 }">					
					<!-- /Slide1 -->
					<div class="item">
						<ul class="thumbnails">
							<c:if test="${requestScope.result.petPictureList[4] != null}">
							<li class="col-sm-3">
								<div class="fff">
								<c:choose>
									<c:when test="${sessionScope.loginVo != null}">
									<div class="thumbnail">
										<a href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[4].boardNumber}&type=board_petPicture">
										<img src="${requestScope.result.petPictureList[4].fileName}"
											alt="" id="highlightimg"></a>
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[4].boardTitle}</h4>
										<a class="btn btn-mini" href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[4].boardNumber}&type=board_petPicture">
										» Read More</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="thumbnail">
										<img src="${requestScope.result.petPictureList[4].fileName}"
											alt="" id="highlightimg">
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[4].boardTitle}</h4>
										» Read More
									</div>
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:if>
						<c:if test="${requestScope.result.petPictureList[5] != null}">
							<li class="col-sm-3">
								<div class="fff">
									<c:choose>
									<c:when test="${sessionScope.loginVo != null}">
									<div class="thumbnail">
										<a href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[5].boardNumber}&type=board_petPicture">
										<img src="${requestScope.result.petPictureList[5].fileName}"
											alt="" id="highlightimg"></a>
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[5].boardTitle}</h4>
										<a class="btn btn-mini" href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[5].boardNumber}&type=board_petPicture">
										» Read More</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="thumbnail">
										<img src="${requestScope.result.petPictureList[5].fileName}"
											alt="" id="highlightimg">
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[5].boardTitle}</h4>
										» Read More
									</div>
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:if>
						<c:if test="${requestScope.result.petPictureList[6] != null}">
							<li class="col-sm-3">
								<div class="fff">
									<c:choose>
									<c:when test="${sessionScope.loginVo != null}">
									<div class="thumbnail">
										<a href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[6].boardNumber}&type=board_petPicture">
										<img src="${requestScope.result.petPictureList[6].fileName}"
											alt="" id="highlightimg"></a>
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[6].boardTitle}</h4>
										<a class="btn btn-mini" href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[6].boardNumber}&type=board_petPicture">
										» Read More</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="thumbnail">
										<img src="${requestScope.result.petPictureList[6].fileName}"
											alt="" id="highlightimg">
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[6].boardTitle}</h4>
										» Read More
									</div>
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:if>
						<c:if test="${requestScope.result.petPictureList[7] != null}">
							<li class="col-sm-3">
								<div class="fff">
									<c:choose>
									<c:when test="${sessionScope.loginVo != null}">
									<div class="thumbnail">
										<a href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[7].boardNumber}&type=board_petPicture">
										<img src="${requestScope.result.petPictureList[7].fileName}"
											alt="" id="highlightimg"></a>
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[7].boardTitle}</h4>
										<a class="btn btn-mini" href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[7].boardNumber}&type=board_petPicture">
										» Read More</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="thumbnail">
										<img src="${requestScope.result.petPictureList[7].fileName}"
											alt="" id="highlightimg">
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[7].boardTitle}</h4>
										» Read More
									</div>
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:if>
						</ul>
					</div>
</c:if>
<c:if test="${fn:length(requestScope.result.petPictureList) > 8 }">
					<!-- /Slide2 -->
					<div class="item">
						<ul class="thumbnails">
							<c:if test="${requestScope.result.petPictureList[8] != null}">
							<li class="col-sm-3">
								<div class="fff">
								<c:choose>
									<c:when test="${sessionScope.loginVo != null}">
									<div class="thumbnail">
										<a href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[8].boardNumber}&type=board_petPicture">
										<img src="${requestScope.result.petPictureList[8].fileName}"
											alt="" id="highlightimg"></a>
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[8].boardTitle}</h4>
										<a class="btn btn-mini" href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[8].boardNumber}&type=board_petPicture">
										» Read More</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="thumbnail">
										<img src="${requestScope.result.petPictureList[8].fileName}"
											alt="" id="highlightimg">
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[8].boardTitle}</h4>
										» Read More
									</div>
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:if>
						<c:if test="${requestScope.result.petPictureList[9] != null}">
							<li class="col-sm-3">
								<div class="fff">
									<c:choose>
									<c:when test="${sessionScope.loginVo != null}">
									<div class="thumbnail">
										<a href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[9].boardNumber}&type=board_petPicture">
										<img src="${requestScope.result.petPictureList[9].fileName}"
											alt="" id="highlightimg"></a>
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[9].boardTitle}</h4>
										<a class="btn btn-mini" href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[9].boardNumber}&type=board_petPicture">
										» Read More</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="thumbnail">
										<img src="${requestScope.result.petPictureList[9].fileName}"
											alt="" id="highlightimg">
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[9].boardTitle}</h4>
										» Read More
									</div>
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:if>
						<c:if test="${requestScope.result.petPictureList[10] != null}">
							<li class="col-sm-3">
								<div class="fff">
									<c:choose>
									<c:when test="${sessionScope.loginVo != null}">
									<div class="thumbnail">
										<a href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[10].boardNumber}&type=board_petPicture">
										<img src="${requestScope.result.petPictureList[10].fileName}"
											alt="" id="highlightimg"></a>
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[10].boardTitle}</h4>
										<a class="btn btn-mini" href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[10].boardNumber}&type=board_petPicture">
										» Read More</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="thumbnail">
										<img src="${requestScope.result.petPictureList[10].fileName}"
											alt="" id="highlightimg">
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[10].boardTitle}</h4>
										» Read More
									</div>
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:if>
						<c:if test="${requestScope.result.petPictureList[11] != null}">
							<li class="col-sm-3">
								<div class="fff">
									<c:choose>
									<c:when test="${sessionScope.loginVo != null}">
									<div class="thumbnail">
										<a href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[11].boardNumber}&type=board_petPicture">
										<img src="${requestScope.result.petPictureList[11].fileName}"
											alt="" id="highlightimg"></a>
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[11].boardTitle}</h4>
										<a class="btn btn-mini" href="${initParam.root}showContent.do?no=${requestScope.result.petPictureList[11].boardNumber}&type=board_petPicture">
										» Read More</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="thumbnail">
										<img src="${requestScope.result.petPictureList[11].fileName}"
											alt="" id="highlightimg">
									</div>
									<div class="caption">
										<h4>${requestScope.result.petPictureList[11].boardTitle}</h4>
										» Read More
									</div>
									</c:otherwise>
								</c:choose>
								</div>
							</li>
						</c:if>
						</ul>
					</div> 
</c:if>
					<!-- /Slide3 -->
				</div> 


				<nav>
					<ul class="control-box pager">
						<li><a data-slide="prev" href="#myCarousel" class=""><i
								>◀</i></a></li>
						<li><a data-slide="next" href="#myCarousel" class=""><i
								>▶</i></a></li>
					</ul>
				</nav>
				<!-- /.control-box -->

			</div>
			<!-- /#myCarousel -->

		</div>
		<!-- /.col-xs-12 -->

	</div>
	<!-- /.container -->
</div>





