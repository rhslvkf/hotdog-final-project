package org.hotdog.projectVer1.model;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Resource
	private MemberDAO memberDAO;
	@Override
	public void registerMember(MemberVO mvo) {
		memberDAO.register(mvo);
	}
	
	//회원정보수정
	@Override
	public void updateMember(MemberVO mvo) {
		memberDAO.update(mvo);
	}

	@Override
	public void leaveMember(MemberVO mvo) {
		memberDAO.delete(mvo);
	}

	@Override
	public MemberVO findMemberById(String id) {
		return memberDAO.findMemberById(id);
	}
	
	@Override
	public String idCheck(String id) {
		int count=memberDAO.idCheck(id);
		return (count==0) ? "ok":"fail"; 
	}
	
	@Override
	public String nickNameCheck(String nickName) {
		int count=memberDAO.nickNameCheck(nickName);
		return (count==0) ? "ok":"fail"; 
	}

	@Override
	public MemberVO login(MemberVO vo) {
		MemberVO mvo = memberDAO.login(vo);
		if(mvo != null){
			int checkLatestDate = memberDAO.checkLatestDate(mvo);
			if(checkLatestDate == 1){
				memberDAO.updateAttendance(mvo);
				memberDAO.updateLatestDate(mvo);
				mvo = memberDAO.login(mvo);
			}
		}
		return mvo;
	}

	@Override
	public void certification(String memberId) {
		memberDAO.certification(memberId);
	}

	@Override
	public MemberVO confirmGrade(String memberId) {
		return memberDAO.confirmGrade(memberId);
	}

	@Override
	public MemberVO searchPassword(MemberVO vo) {
		return memberDAO.searchPassword(vo);
	}

	@Override
	public void delete(MemberVO vo) {
		memberDAO.delete(vo);
	}

	@Override
	public void passwordok(MemberVO vo) {
		memberDAO.passwordok(vo);
	}

	@Override
	public void updateToSilver(String memberId) {
		memberDAO.updateToSilver(memberId);
	}

	@Override
	public void updateToGold(String memberId) {
		memberDAO.updateToGold(memberId);
	}

	@Override
	public int getAttendance(String memberId) {
		return memberDAO.getAttendance(memberId);
	}

	@Override
	public String getMemberId(String memberNickName) {
		return memberDAO.getMemberId(memberNickName);
	}

	@Override
	public String getMemberNickName(String memberId) {
		return memberDAO.getMemberNickName(memberId);
	}

	@Override
	public MemberListVO allMemberInfo(String pageNo) {
		if(pageNo==null||pageNo=="")
			pageNo="1";
			List<MemberVO> list = memberDAO.allMemberInfo(pageNo);
			int total=memberDAO.totalContent();
			PagingBean paging=new PagingBean(total,Integer.parseInt(pageNo));
			MemberListVO lvo= new MemberListVO(list,paging);
			return lvo;
			
	}








}
