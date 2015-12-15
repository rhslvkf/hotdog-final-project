package org.hotdog.projectVer1.model;

import java.util.ArrayList;

public class BoardVO {
	private int boardNumber;
	private MemberVO memberVO;
	private String boardTitle;
	private String boardDate;
	private int boardHits;
	private String boardContent;
	private boolean scrape;
	private String fileName;
	private ArrayList<String> fileNameList;
	private String boardType;
	private String residence;
	private PetVO petVO;
	private int ref;// 원 게시물 번호 , 글묶음 
	private int restep;// ref 글묶음내의 글순서 
	private int relevel;// 답변의 단계 
	
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardVO(int boardNumber, MemberVO memberVO, String boardTitle,
			String boardDate, int boardHits, String boardContent,
			boolean scrape, String fileName, ArrayList<String> fileNameList,
			String boardType, String residence, PetVO petVO, int ref,
			int restep, int relevel) {
		super();
		this.boardNumber = boardNumber;
		this.memberVO = memberVO;
		this.boardTitle = boardTitle;
		this.boardDate = boardDate;
		this.boardHits = boardHits;
		this.boardContent = boardContent;
		this.scrape = scrape;
		this.fileName = fileName;
		this.fileNameList = fileNameList;
		this.boardType = boardType;
		this.residence = residence;
		this.petVO = petVO;
		this.ref = ref;
		this.restep = restep;
		this.relevel = relevel;
	}

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardHits() {
		return boardHits;
	}

	public void setBoardHits(int boardHits) {
		this.boardHits = boardHits;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public boolean isScrape() {
		return scrape;
	}

	public void setScrape(boolean scrape) {
		this.scrape = scrape;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public ArrayList<String> getFileNameList() {
		return fileNameList;
	}

	public void setFileNameList(ArrayList<String> fileNameList) {
		this.fileNameList = fileNameList;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public PetVO getPetVO() {
		return petVO;
	}

	public void setPetVO(PetVO petVO) {
		this.petVO = petVO;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRestep() {
		return restep;
	}

	public void setRestep(int restep) {
		this.restep = restep;
	}

	public int getRelevel() {
		return relevel;
	}

	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNumber=" + boardNumber + ", memberVO=" + memberVO
				+ ", boardTitle=" + boardTitle + ", boardDate=" + boardDate
				+ ", boardHits=" + boardHits + ", boardContent=" + boardContent
				+ ", scrape=" + scrape + ", fileName=" + fileName
				+ ", fileNameList=" + fileNameList + ", boardType=" + boardType
				+ ", residence=" + residence + ", petVO=" + petVO + ", ref="
				+ ref + ", restep=" + restep + ", relevel=" + relevel + "]";
	}
	
}
