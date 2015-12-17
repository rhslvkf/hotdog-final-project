package org.hotdog.projectVer1.model;

import java.util.ArrayList;
import java.util.List;

public interface MemberService {
	
	public abstract void registerMember(MemberVO vo);

	public abstract void updateMember(MemberVO vo);

	public abstract void leaveMember(MemberVO vo);

	public abstract MemberVO login(MemberVO vo);

	public abstract MemberVO findMemberById(String id);

	public abstract String idCheck(String id);
	
	public abstract String nickNameCheck(String nickName);

	public abstract void certification(String memberId);

	public abstract MemberVO confirmGrade(String memberId);

	public abstract MemberVO searchPassword(MemberVO vo);

	public abstract void delete(MemberVO vo);

	public abstract void passwordok(MemberVO vo);

	public abstract void updateToSilver(String memberId);

	public abstract void updateToGold(String memberId);

	public abstract int getAttendance(String memberId);

	public abstract String getMemberId(String memberNickName);

	public abstract String getMemberNickName(String memberId);

	public abstract MemberListVO allMemberInfo(String pageNo);
	
}
