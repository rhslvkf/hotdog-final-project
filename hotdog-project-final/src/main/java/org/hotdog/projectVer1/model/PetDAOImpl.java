package org.hotdog.projectVer1.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class PetDAOImpl implements PetDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void registerPet(PetVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePet(PetVO vo) {
		// TODO Auto-generated method stub
		
	}
	
}