package org.hotdog.projectVer1.model;

public interface PetDAO {
	
	public abstract void registerPet(PetVO vo);
	
	public abstract void updatePet(PetVO vo);

}