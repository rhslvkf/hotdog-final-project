package org.hotdog.projectVer1.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminDAO adminDAO;
	
	@Override
	public void deleteMember(MemberVO vo){
		
	}

	@Override
	public void updateGrade(MemberVO vo){
		
	}


}