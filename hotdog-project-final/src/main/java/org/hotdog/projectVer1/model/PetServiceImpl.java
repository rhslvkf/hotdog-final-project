package org.hotdog.projectVer1.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class PetServiceImpl implements PetService{
	@Resource
	private PetDAO adminDAO;

	@Override
	public void registerPet(PetVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePet(PetVO vo) {
		// TODO Auto-generated method stub
		
	}

}
