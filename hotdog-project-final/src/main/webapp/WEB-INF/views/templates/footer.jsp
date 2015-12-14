<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="container">
        <div class="row">
          <div class="col-sm-6">
            <h1>HotDog community</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
              <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
              <br>Ut enim ad minim veniam, quis nostrud</p>
          </div>


		<c:choose>
			<c:when test="${sessionScope.loginVo ==null && sessionScope.adminLoginVo==null}">
					<div class="col-sm-6">
                    <ul class="nav navbar-nav pull-right">
								<li class=""><a class="" id="adminLogin" data-toggle="modal"
									data-target="#adminLoginModal">관리자로그인</a></li>

							</ul>
            <p class="text-info text-right">
              <br>
              <br>
            </p>
            <div class="row">
              <div class="col-md-12 hidden-lg hidden-md hidden-sm text-left">
                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 hidden-xs text-right">
                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-success"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-info"></i></a>
                <a href="#"><i class="fa fa-3x fa-facebook fa-fw text-primary"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-github text-danger"></i></a>
              </div>
            </div>
          </div>
			</c:when>
			<c:otherwise>
			<div class="col-sm-6">

            <p class="text-info text-right">
              <br>
              <br>
            </p>
            <div class="row">
              <div class="col-md-12 hidden-lg hidden-md hidden-sm text-left">
                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 hidden-xs text-right">
                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-success"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-info"></i></a>
                <a href="#"><i class="fa fa-3x fa-facebook fa-fw text-primary"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-github text-danger"></i></a>
              </div>
            </div>
          </div>
			</c:otherwise>
		</c:choose>
		

		
        </div>
      </div>
      
      
      <!-- modal -->
<div class="modal fade" id="adminLoginModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">관리자로그인</h4>
			</div>
			<div class="modal-body">
			
			
				<!-- 로그인 폼 -->
				<form class="form-horizontal" role="form" action="adminLogin.do"
					name="loginForm" id="loginForm" method="post">
					              <img src="${initParam.root}image/글자로고.png" class="img-responsive" alt="">
					
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">아이디</label>
						</div>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="adminLoginMemId"
								placeholder="아이디" name="adminId" onfocus="this.select()"
								required><span id="loginIdCheckView"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputPassword3" class="control-label">비밀번호</label>
						</div>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="adminLoginMemPass"
								placeholder="비밀번호" name="adminPassword" onfocus="this.select()"
								required>
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-12">
				<input class="btn btn-lg btn-success btn-block" type="submit" value="로그인" id="loginBtn">
							<!-- <button type="submit" class="btn btn-success btn-block" id="loginBtn">로그인</button>	 -->
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
							<ul class="nav navbar-nav navbar-right">
					<li><a data-dismiss="modal">닫기</a></li>
				</ul>
			
			</div>
		</div>
	</div>
</div>
