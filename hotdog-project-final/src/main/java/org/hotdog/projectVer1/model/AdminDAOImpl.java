package org.hotdog.projectVer1.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class AdminDAOImpl implements AdminDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void deleteMember(MemberVO vo){
		
	}
	
	@Override
	public void updateGrade(MemberVO vo){
		
	}


}