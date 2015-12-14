package org.hotdog.projectVer1.model;

public interface MemberDAO {

	public abstract void register(MemberVO vo);

	public abstract void update(MemberVO vo);

	public abstract void delete(MemberVO vo);

	public abstract MemberVO login(MemberVO vo);

	public abstract MemberVO findMemberById(String id);

	public abstract int idCheck(String id);

	public abstract int nickNameCheck(String nickName);

	public abstract void certification(String memberId);

	public abstract MemberVO confirmGrade(String memberId);

	public abstract MemberVO searchPassword(MemberVO vo);

	public abstract int passwordok(MemberVO vo);

	public abstract void updateAttendance(MemberVO mvo);

	public abstract int checkLatestDate(MemberVO mvo);

	public abstract void updateLatestDate(MemberVO mvo);

	public abstract void updateToSilver(String memberId);

	public abstract void updateToGold(String memberId);

	public abstract int getAttendance(String memberId);

	public abstract String getMemberId(String memberNickName);

	public abstract String getMemberNickName(String memberId);

}