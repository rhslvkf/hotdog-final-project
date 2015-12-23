<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 아이콘 -->
    <link rel="icon" href="css/ico.ico">
    <!-- script -->
    <script type="text/javascript" src="${initParam.root}js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${initParam.root}js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${initParam.root}bootstrap-hover-dropdown-master/bootstrap-hover-dropdown.min.js"></script>
	<script type="text/javascript" src="${initParam.root}js/jquery-migrate-1.2.1.min.js"></script>
	<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/sugar/1.4.1/sugar.min.js"></script>
    <!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
    <script src="http://getbootstrap.com/assets/js/docs.min.js"></script>
	<!-- css -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${initParam.root}css/bootstrap.min.css">
	<link rel="stylesheet" href="${initParam.root}css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="${initParam.root}css/hotdog.css">
	<link rel="stylesheet" type="text/css" href="${initParam.root}css/home.css">
	<link rel="stylesheet" type="text/css" href="${initParam.root}css/board1.css">
	<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" /> -->
	<link href="http://getbootstrap.com/assets/css/docs.min.css" rel="stylesheet" />
<script type="text/javascript">

//회원 가입 완료시 controller에서 보내준 request 값을 받아오기 위한 javascript
function Request(){
	var requestParam ="";
        this.getParameter = function(param){
    	var url = unescape(location.href); //현재 주소를 decoding
        var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&"); //파라미터만 잘라서 배열에 넣음 
        
        for(var i = 0 ; i < paramArr.length ; i++){
            var temp = paramArr[i].split("="); //파라미터 변수명을 담음
            
            if(temp[0].toUpperCase() == param.toUpperCase()){
            	requestParam = paramArr[i].split("=")[1]; // 변수명과 일치할 경우 데이터 삽입
                break;
            }
        }
        return requestParam;
    }
}

var request = new Request();
var passfailcount=0;
	if("${requestScope.result.certification}" == "ok"){
		alert("이메일 인증 완료");
		location.href = "home.do";
	}else if("${requestScope.result.certification}" == "already"){
		alert("이미 이메일 인증을 완료하셨습니다.");
		location.href = "home.do";
	}else if("${requestScope.result.certification}" == "no"){
		if(confirm("이메일 인증을 하셔야 로그인하실 수 있습니다."+
				"\n이메일 인증을 위해 해당 도메인으로 이동하시겠습니까?"+
				"\n(이동시 인증 이메일이 재전송됩니다.)")){
			location.href="http://"+request.getParameter("domain");
		}else{
			location.href = "home.do";	
		}
	}else if("${requestScope.result.password}" == "success"){
		alert("이메일로 패스워드 전송하였습니다.\n확인하시기바랍니다.");
		location.href = "home.do";
	}else if("${requestScope.result.password}" == "fail"){
		alert("해당하는 아이디가 없거나 아이디와 이름이 일치하지 않습니다.");
		location.href = "home.do";
	}else if("${requestScope.result.register}" == "success"){
		if(confirm("회원가입이 완료되었습니다.\n\n이메일 인증을 하셔야 로그인 가능합니다."+
				"\n이메일 인증 페이지로 이동하시겠습니까?")){
			location.href="http://"+request.getParameter("domain");
		}else{
			location.href="home.do";
		}
		//회원 가입 완료 팝업에서 ok시 입력한 이메일 홈페이지로 이동
	}else if("${requestScope.result.update}" == "success"){
		alert("회원 정보 수정되었습니다.");
		location.href = "home.do";
	}else if("${requestScope.result.login}" == "success"){
		location.href = "home.do";
	}else if("${requestScope.result.deleteVO}" == "success"){
		alert("회원탈퇴 되셨습니다.");
		location.href="home.do";
	}else if("${requestScope.result.login}" =="passPeriod"){
		alert("비밀번호 유지기간이 90일을 초과하였습니다. \n개인정보 보안을 위해 마이페이지 > 회원정보수정에서 비밀번호를 변경해주세요.");
		location.href="home.do";
	}else if("${requestScope.result.updateGrade}" == "SILVER"){
		alert("등급이 SILVER가 되었습니다.");
		location.href="home.do";
	}else if("${requestScope.result.updateGrade}" == "GOLD"){
		alert("등급이 GOLD가 되었습니다.");
		location.href="home.do";
	}else if("${requestScope.result.login}"=="deactive"){
		alert("탈퇴한 계정입니다.");
		location.href="home.do";
	}
</script>
</head>
<body>
<div id="container">
	<div id="header"><tiles:insertAttribute name="header"/></div>
	<div id="left"><tiles:insertAttribute name="left"/></div>
	<div id="main"><tiles:insertAttribute name="main"/></div>
	<div id="footer"><tiles:insertAttribute name="footer"/></div>
</div>
</body>
</html>
