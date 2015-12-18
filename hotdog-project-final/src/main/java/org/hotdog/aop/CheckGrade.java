package org.hotdog.aop;

import javax.annotation.Resource;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.hotdog.projectVer1.model.BoardService;
import org.hotdog.projectVer1.model.BoardVO;
import org.hotdog.projectVer1.model.CommentVO;
import org.hotdog.projectVer1.model.MemberService;
import org.hotdog.projectVer1.model.MemberVO;
import org.springframework.stereotype.Component;
@Component
@Aspect
public class CheckGrade {
	@Resource
	private BoardService boardService;
	@Resource
	private MemberService memberService;
	
	//로그인할때 등급 업 조건 검사
	@Around("execution(public * org.hotdog..MemberServiceImpl.login(..))")
	public Object checkAttendance(ProceedingJoinPoint point) throws Throwable{
		System.out.println("로그인");
		MemberVO retValue = (MemberVO) point.proceed();
		if(retValue != null){
			String memberId = retValue.getMemberId();
			String grade = memberService.confirmGrade(memberId).getMemberGrade();
			System.out.println("등급"+grade);
			if(grade.equals("ADMIN")){
				return retValue;
			}
			if(!grade.equals("GOLD")){
				int attendance = retValue.getMemberAttendance();
				System.out.println("attendance : "+attendance);
				int countOfPosting = 0;
				int countOfComment = 0;
				String memberNickName = memberService.getMemberNickName(memberId);
				if(attendance < 3){
					return retValue;
				}else if(attendance >= 3 && attendance < 10){
					countOfPosting = boardService.totalContentById(memberId);
					System.out.println("countOfPosting : "+countOfPosting);
					if(countOfPosting < 5){
						return retValue;
					}else if(countOfPosting >= 5){
						countOfComment = boardService.getCountOfComment(memberNickName);
						System.out.println("countOfComment : "+countOfComment);
						if(countOfComment < 10){
							return retValue;
						}else if(countOfComment >= 10){
							if(!grade.equals("SILVER")){
								memberService.updateToSilver(memberId);
								System.out.println("SILVER로 등급업");
								retValue = memberService.login(retValue);
								retValue.setUpdateGrade("SILVER");
							}
							return retValue;
						}
					}
				}else{
					countOfPosting = boardService.totalContentById(memberId);
					System.out.println("countOfPosting : "+countOfPosting);
					if(countOfPosting < 5){
						return retValue;
					}else if(countOfPosting >= 5 && countOfPosting < 15){
						countOfComment = boardService.getCountOfComment(memberNickName);
						System.out.println("countOfComment : "+countOfComment);
						if(countOfComment < 10){
							return retValue;
						}else{
							if(!grade.equals("SILVER")){
								memberService.updateToSilver(memberId);
								System.out.println("SILVER로 등급업");
								retValue = memberService.login(retValue);
								retValue.setUpdateGrade("SILVER");
							}
							return retValue;
						}
					}else{
						countOfComment = boardService.getCountOfComment(memberNickName);
						System.out.println("countOfComment : "+countOfComment);
						if(countOfComment < 10){
							return retValue;
						}else if(countOfComment >= 10 && countOfComment < 30){
							if(!grade.equals("SILVER")){
								memberService.updateToSilver(memberId);
								System.out.println("SILVER로 등급업");
								retValue = memberService.login(retValue);
								retValue.setUpdateGrade("SILVER");
							}
							return retValue;
						}else{
							if(!grade.equals("GOLD")){
								memberService.updateToGold(memberId);
								System.out.println("GOLD로 등급업");
								retValue = memberService.login(retValue);
								retValue.setUpdateGrade("GOLD");
							}
							return retValue;
						}
					}
				}
			}
		}
		return retValue;
	}
	
	//게시글 등록할때 등급 업 조건 검사
	@Around("execution(public * org.hotdog..BoardServiceImpl.posting(..))")
	public String checkPosting(ProceedingJoinPoint point) throws Throwable{
		System.out.println("게시글 등록");
		String retValue = (String) point.proceed();
		Object[] args = point.getArgs();
		String memberId = null;
		for(int i=0;i<args.length;i++){
			if(args[i] instanceof BoardVO){
				memberId = ((BoardVO)args[i]).getMemberVO().getMemberId();
			}
		}
		String grade = memberService.confirmGrade(memberId).getMemberGrade();
		System.out.println(grade);
		if(grade.equals("ADMIN")){
			return retValue;
		}
		if(!grade.equals("GOLD")){
			int attendance = 0;
			int countOfPosting = 0;
			int countOfComment = 0;
			countOfPosting = boardService.totalContentById(memberId);
			System.out.println("countOfPosting : "+countOfPosting);
			String memberNickName = memberService.getMemberNickName(memberId);
			if(countOfPosting < 5){
				return retValue;
			}else if(countOfPosting >= 5 && countOfPosting < 15){
				attendance = memberService.getAttendance(memberId);
				System.out.println("attendance : "+attendance);
				if(attendance < 3){
					return retValue;
				}else if(attendance >= 3){
					countOfComment = boardService.getCountOfComment(memberNickName);
					System.out.println("countOfComment : "+countOfComment);
					if(countOfComment < 10){
						return retValue;
					}else if(countOfComment >= 10){
						if(!grade.equals("SILVER")){
							memberService.updateToSilver(memberId);
							System.out.println("SILVER로 등급업");
							retValue = "SILVER";
							return retValue;
						}
					}
				}
			}else{
				attendance = memberService.getAttendance(memberId);
				System.out.println("attendance : "+attendance);
				if(attendance < 3){
					return retValue;
				}else if(attendance >= 3 && attendance < 10){
					countOfComment = boardService.getCountOfComment(memberNickName);
					System.out.println("countOfComment : "+countOfComment);
					if(countOfComment < 10){
						return retValue;
					}else{
						if(!grade.equals("SILVER")){
							memberService.updateToSilver(memberId);
							System.out.println("SILVER로 등급업");
							retValue = "SILVER";
							return retValue;
						}
					}
				}else{
					countOfComment = boardService.getCountOfComment(memberNickName);
					System.out.println("countOfComment : "+countOfComment);
					if(countOfComment < 10){
						return retValue;
					}else if(countOfComment >= 10 && countOfComment < 30){
						if(!grade.equals("SILVER")){
							memberService.updateToSilver(memberId);
							System.out.println("SILVER로 등급업");
							retValue = "SILVER";
							return retValue;
						}
					}else{
						if(!grade.equals("GOLD")){
							memberService.updateToGold(memberId);
							System.out.println("GOLD로 등급업");
							retValue = "GOLD";
							return retValue;
						}
					}
				}
			}
		}
		return retValue;
	}
	
	//댓글 등록할때 등급 업 조건 검사
	@Around("execution(public * org.hotdog..BoardServiceImpl.postingComment(..))")
	public String checkComment(ProceedingJoinPoint point) throws Throwable{
		System.out.println("댓글 등록");
		String retValue = (String) point.proceed();
		Object[] args = point.getArgs();
		String memberId = null;
		String memberNickName = null;
		for(int i=0;i<args.length;i++){
			if(args[i] instanceof CommentVO){
				memberNickName = ((CommentVO)args[i]).getMemberNickName();
				memberId = memberService.getMemberId(memberNickName);
			}
		}
		String grade = memberService.confirmGrade(memberId).getMemberGrade();
		System.out.println(grade);
		if(grade.equals("ADMIN")){
			return retValue;
		}
		if(!grade.equals("GOLD")){
			int attendance = 0;
			int countOfPosting = 0;
			int countOfComment = 0;
			countOfComment = boardService.getCountOfComment(memberNickName);
			System.out.println("countOfComment : "+countOfComment);
			if(countOfComment < 10){
				return retValue;
			}else if(countOfComment >= 10 && countOfComment < 30){
				attendance = memberService.getAttendance(memberId);
				System.out.println("attendance : "+attendance);
				if(attendance < 3){
					return retValue;
				}else if(attendance >= 3){
					countOfPosting = boardService.totalContentById(memberId);
					System.out.println("countOfPosting : "+countOfPosting);
					if(countOfPosting < 5){
						return retValue;
					}else if(countOfComment >= 5){
						if(!grade.equals("SILVER")){
							memberService.updateToSilver(memberId);
							System.out.println("SILVER로 등급업");
							retValue = "SILVER";
							return retValue;
						}
					}
				}
			}else{
				attendance = memberService.getAttendance(memberId);
				System.out.println("attendance : "+attendance);
				if(attendance < 3){
					return retValue;
				}else if(attendance >= 3 && attendance < 10){
					countOfPosting = boardService.totalContentById(memberId);
					System.out.println("countOfPosting : "+countOfPosting);
					if(countOfPosting < 5){
						return retValue;
					}else{
						if(!grade.equals("SILVER")){
							memberService.updateToSilver(memberId);
							System.out.println("SILVER로 등급업");
							retValue = "SILVER";
							return retValue;
						}
					}
				}else{
					countOfPosting = boardService.totalContentById(memberId);
					System.out.println("countOfPosting : "+countOfPosting);
					if(countOfPosting < 5){
						return retValue;
					}else if(countOfPosting >= 5 && countOfPosting < 15){
						if(!grade.equals("SILVER")){
							memberService.updateToSilver(memberId);
							System.out.println("SILVER로 등급업");
							retValue = "SILVER";
							return retValue;
						}
					}else{
						if(!grade.equals("GOLD")){
							memberService.updateToGold(memberId);
							System.out.println("GOLD로 등급업");
							retValue = "GOLD";
							return retValue;
						}
					}
				}
			}
		}
		return retValue;
	}
	
}
