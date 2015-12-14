package org.hotdog.projectVer1.model;

public class PetVO {
	private String petType;
	private String petGender;
	private String petNeutralInfo;
	private String petAge;
	private String petSize;
	public PetVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PetVO(String petType, String petGender, String petNeutralInfo,
			String petAge, String petSize) {
		super();
		this.petType = petType;
		this.petGender = petGender;
		this.petNeutralInfo = petNeutralInfo;
		this.petAge = petAge;
		this.petSize = petSize;
	}
	public String getPetType() {
		return petType;
	}
	public void setPetType(String petType) {
		this.petType = petType;
	}
	public String getPetGender() {
		return petGender;
	}
	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}
	public String getPetNeutralInfo() {
		return petNeutralInfo;
	}
	public void setPetNeutralInfo(String petNeutralInfo) {
		this.petNeutralInfo = petNeutralInfo;
	}
	public String getPetAge() {
		return petAge;
	}
	public void setPetAge(String petAge) {
		this.petAge = petAge;
	}
	public String getPetSize() {
		return petSize;
	}
	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}
	@Override
	public String toString() {
		return "PetVO [petType=" + petType + ", petGender=" + petGender
				+ ", petNeutralInfo=" + petNeutralInfo + ", petAge=" + petAge
				+ ", petSize=" + petSize + "]";
	}
	
}