package org.hotdog.projectVer1.model;


import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	//회원가입
	public void register(MemberVO mvo){
		System.out.println(mvo);
		sqlSessionTemplate.insert("member.register", mvo);
	}
	//회원정보수정
	@Override
	public void update(MemberVO mvo){
		sqlSessionTemplate.update("member.update", mvo);
	}
	@Override
	public void delete(MemberVO mvo){
		sqlSessionTemplate.delete("member.delete", mvo);
	}
	@Override
	public int idCheck(String id) {
		return sqlSessionTemplate.selectOne("member.idCheck",id);
	}
	@Override
	public int nickNameCheck(String nickName) {
		return sqlSessionTemplate.selectOne("member.nickNameCheck",nickName);
	}
	@Override
	public MemberVO findMemberById(String id){
		return sqlSessionTemplate.selectOne("member.findMemberById",id);
	}
	@Override
	public MemberVO login(MemberVO vo){
		System.out.println(vo);
		return sqlSessionTemplate.selectOne("member.login",vo);
	}
	@Override
	public void certification(String memberId) {
		sqlSessionTemplate.update("member.certification",memberId);
	}
	@Override
	public MemberVO confirmGrade(String memberId) {
		return sqlSessionTemplate.selectOne("member.confirmGrade",memberId);
	}
	@Override
	public MemberVO searchPassword(MemberVO vo) {
		return sqlSessionTemplate.selectOne("member.searchPassword",vo);
	}
	@Override
	public int passwordok(MemberVO vo) {
		return sqlSessionTemplate.selectOne("member.passwordok",vo);
	}
	@Override
	public void updateAttendance(MemberVO mvo) {
		sqlSessionTemplate.update("member.updateAttendance",mvo);
	}
	@Override
	public int checkLatestDate(MemberVO mvo) {
		return sqlSessionTemplate.selectOne("member.checkLatestDate",mvo);
	}
	@Override
	public void updateLatestDate(MemberVO mvo) {
		sqlSessionTemplate.update("member.updateLatestDate",mvo);
	}
	@Override
	public void updateToSilver(String memberId) {
		sqlSessionTemplate.update("member.updateToSilver",memberId);
	}
	@Override
	public void updateToGold(String memberId) {
		sqlSessionTemplate.update("member.updateToGold",memberId);
	}
	@Override
	public int getAttendance(String memberId) {
		return sqlSessionTemplate.selectOne("member.getAttendance",memberId);
	}
	@Override
	public String getMemberId(String memberNickName) {
		return sqlSessionTemplate.selectOne("member.getMemberId",memberNickName);
	}
	@Override
	public String getMemberNickName(String memberId) {
		return sqlSessionTemplate.selectOne("member.getMemberNickName",memberId);
	}
	@Override
	public List<MemberVO> allMemberInfo(String pageNo) {
		List<MemberVO> list = sqlSessionTemplate.selectList("member.allMemberInfo", pageNo);
		return list;
		}
	@Override
	public int totalContent() {
		return sqlSessionTemplate.selectOne("member.totalContent");
	}

}
