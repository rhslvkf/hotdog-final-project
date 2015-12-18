package org.hotdog.projectVer1.controller;

/**
 * sysout test 후에 꼭 지워주삼 -웅
 */



import java.util.ArrayList;
import java.util.Collection;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hotdog.projectVer1.model.LoginManager;
import org.hotdog.projectVer1.model.MemberService;
import org.hotdog.projectVer1.model.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@Resource
	private MemberService memberService;
	
	
	
	
	/**
	 * 회원 탈퇴 
	 */
	@RequestMapping(value = "auth_delete.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteMember(HttpServletRequest request,MemberVO vo){
		HttpSession session=request.getSession(false);
		MemberVO loginVo=memberService.login(vo);
		if(loginVo!=null){
		memberService.delete(vo);
		if(session!=null)
			session.invalidate();
		return "deleteok";
		}else{
			return "deletefail";
		}
	}
	
	//전체회원보기
	@RequestMapping("allMemberInfo.do")
	public ModelAndView allMemberInfo(String pageNo) {
		return new ModelAndView("admin_allMemberInfo","mvo",memberService.allMemberInfo(pageNo));
	}
	
	//회원 탈퇴시 비밀번호 확인 ajax - login 활용
	@RequestMapping("passCheck.do") 
	@ResponseBody
	public boolean passCheck(HttpServletRequest request,MemberVO vo){
		boolean flag;
		if(memberService.login(vo)!=null){
			flag=true;
		}else{
			flag=false;
		}
		return flag;
	}
	
	public ModelAndView updateGrade(){
		return null;
	}
	
	//이메일 인증 후 등급 업
	@RequestMapping("certification.do")
	public String certification(String memberId) {
		String grade = memberService.confirmGrade(memberId).getMemberGrade();
		if(grade.equals("NULL")){
			memberService.certification(memberId);
			return "redirect:home.do?certification=ok";
		}else
			return "redirect:home.do?certification=already";
	}
	
	// 회원가입 - redirect 리턴시 파일 형식까지 입력
	@RequestMapping("member_register.do")
	public ModelAndView registerMember(MemberVO vo) throws MessagingException {
		memberService.registerMember(vo);
		EmailController e = new EmailController();
		Thread t = new Thread(e,vo.getMemberId());
		t.start();
		String domain=vo.getMemberId().substring(vo.getMemberId().indexOf('@'));
		return new ModelAndView("redirect:home.do?register=success&domain="+domain);
	}
	
	// 회원가입시 id 중복check ajax
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(HttpServletRequest request,String memberId) {
		return memberService.idCheck(memberId);
	}
	
	// 회원가입, 회원정보수정시 nickName 중복 check ajax
	@RequestMapping("nickNameCheck.do")
	@ResponseBody
	public String nickNameCheck(HttpServletRequest request) {
		String memberNickName = request.getParameter("memberNickName");
		return memberService.nickNameCheck(memberNickName);
	}
	

	/**
	 * 회원수정 완료 뿌잉뿌잉
	 */ 
	@RequestMapping(value = "auth_update.do", method = RequestMethod.POST)
	public String updateMember(HttpServletRequest request,MemberVO vo){
		memberService.updateMember(vo);
		HttpSession session = request.getSession(false);
		if(session!=null)
			session.setAttribute("loginVo", vo);
		return "redirect:home.do?update=success";
	}
	

	
	
	/** 
	 * 로그인
	 * 로그인 성공시 home 으로 보내고 실패시 layout에서 parameter 값 확인 후 해당하는 alert 출력
	 * 로그인 실패시 중복되는 id값이 없으면 idfail, 있으면 passfail 
	 * @return
	 */
	@RequestMapping(value ="login.do", method = RequestMethod.POST)
	@ResponseBody
	public String login(HttpServletRequest request,MemberVO vo){
		MemberVO loginVo=memberService.login(vo);	
		String path="";
		String domain=vo.getMemberId().substring(vo.getMemberId().indexOf('@'));
		
		
				//중복 로그인
				HttpSession session=request.getSession(false);
				ArrayList beforeLogin=new ArrayList();
				//HttpSessionBindingListener
		        LoginManager loginM=LoginManager.getInstance();
		        //접속 중인 사용자 목록
		        Collection allUser=loginM.getUsers();
		        //중복 확인, 초기값 false
		        boolean dupl=false;
		        //로그인 전 접속 중인 사용자 목록
		        for(int i=0;i<allUser.size();i++){
		        	beforeLogin.add(allUser);
		        }
		        
		if(loginVo!=null){
			if(loginVo.getMemberStatus().equals("deactive")){
				path="home.do?login=deactive";	//탈퇴한 계정이면 로그인 불가
			}else if(loginVo.getMemberGrade().equals("NULL")){
				//네트워크 상태가 불안정할 경우 인증 이메일이 발송되지 않는 경우가 있음. 인증 이메일 재전송 추가
				EmailController e = new EmailController();
				Thread t = new Thread(e,vo.getMemberId());
				t.start();
				path="home.do?certification=no&domain="+domain; //이메일 인증 안한 계정이면 로그인 불가
			}else{
				//로그인 성공시 세션에 정보 저장
				request.getSession().setAttribute("loginVo", loginVo);
				//중복 로그인 체크
		        request.getSession().setAttribute(loginVo.getMemberId(), loginM);
		            for(int j=0;j<beforeLogin.size();j++){
			        	//로그인 전 접속자 목록에 현재 로그인한 id가 포함되어 있으면 중복 true 
			        	if(beforeLogin.get(j).toString().contains(loginM.getUserID(session))){
			        			dupl=true;
				        	}
			        }  
				
				
				  //로그인 확인 우선순위 : 중복 로그인, 등급, 비밀번호90일
	            if(dupl==true){      	
	        		loginM.removeSession(loginM.getUserID(session));
	        		path="duplicate";
	            }else if(loginVo.getUpdateGrade() != null){
					if(loginVo.getUpdateGrade().equals("x")){
						path = "home.do?updateGrade=SILVER";
					}
					else{
						path="home.do?updateGrade=GOLD";
					}
				}else if(Integer.parseInt(loginVo.getPassPeriod())>90){
					request.getSession().setAttribute("loginVo", loginVo);
					path="home.do?login=passPeriod";
				}//비밀번호를 변경하지 않은지 90일 경과시 경고 alert 출력후 로그인 가능
				else{
					path="home.do?login=success";
				}
			}
		}
		else {
			if(memberService.idCheck(vo.getMemberId())!="ok"){
				path="passfail";
			}
		}
		return path;
	}


	//로그아웃
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response){
		
		HttpSession session=request.getSession(false);
		if(session!=null)
			session.invalidate();
		return new ModelAndView("redirect:home.do");
	}	
	
	// 패스워드 찾기
	@RequestMapping("searchPassword.do")
	public String searchPassword(MemberVO vo) throws MessagingException {
		MemberVO mvo = memberService.searchPassword(vo);
		String path = "";
		if(mvo != null){
			path = "redirect:home.do?password=success";
			EmailController e = new EmailController();
			Thread t = new Thread(e,vo.getMemberId()+" "+mvo.getMemberPassword());
			t.start();
		}else{
			path = "redirect:home.do?password=fail";
		}
		return path;
	}
	
}
