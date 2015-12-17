package org.hotdog.projectVer1.model;

public class MemberVO {
	private String memberId;
	private String memberName;
	private String memberPassword;
	private String memberNickName;
	private String memberGrade;
	private int memberAttendance;
	private String updateGrade;
	private String memberTel; //0으로 시작되는 전화번호 입력을 위해 tel 데이터 타입을 String으로 변경-1208
	private String memberStatus; //회원의 상태(active/deactive)
	private String memberLatestdate;
	private String passPeriod;
	private String loginTime;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String memberId, String memberName, String memberPassword,
			String memberNickName, String memberGrade, int memberAttendance,
			String updateGrade, String memberTel, String memberStatus,
			String memberLatestdate, String passPeriod, String loginTime) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPassword = memberPassword;
		this.memberNickName = memberNickName;
		this.memberGrade = memberGrade;
		this.memberAttendance = memberAttendance;
		this.updateGrade = updateGrade;
		this.memberTel = memberTel;
		this.memberStatus = memberStatus;
		this.memberLatestdate = memberLatestdate;
		this.passPeriod = passPeriod;
		this.loginTime = loginTime;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}
	public int getMemberAttendance() {
		return memberAttendance;
	}
	public void setMemberAttendance(int memberAttendance) {
		this.memberAttendance = memberAttendance;
	}
	public String getUpdateGrade() {
		return updateGrade;
	}
	public void setUpdateGrade(String updateGrade) {
		this.updateGrade = updateGrade;
	}
	public String getMemberTel() {
		return memberTel;
	}
	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	public String getMemberLatestdate() {
		return memberLatestdate;
	}
	public void setMemberLatestdate(String memberLatestdate) {
		this.memberLatestdate = memberLatestdate;
	}
	public String getPassPeriod() {
		return passPeriod;
	}
	public void setPassPeriod(String passPeriod) {
		this.passPeriod = passPeriod;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberName=" + memberName
				+ ", memberPassword=" + memberPassword + ", memberNickName="
				+ memberNickName + ", memberGrade=" + memberGrade
				+ ", memberAttendance=" + memberAttendance + ", updateGrade="
				+ updateGrade + ", memberTel=" + memberTel + ", memberStatus="
				+ memberStatus + ", memberLatestdate=" + memberLatestdate
				+ ", passPeriod=" + passPeriod + ", loginTime=" + loginTime
				+ "]";
	}
	
}
