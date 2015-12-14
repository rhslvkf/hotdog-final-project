package org.hotdog.projectVer1.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	private BoardVO boardVO;
	private List<MultipartFile> file;
	public FileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FileVO(BoardVO boardVO, List<MultipartFile> file) {
		super();
		this.boardVO = boardVO;
		this.file = file;
	}
	public BoardVO getBoardVO() {
		return boardVO;
	}
	public void setBoardVO(BoardVO boardVO) {
		this.boardVO = boardVO;
	}
	public List<MultipartFile> getFile() {
		return file;
	}
	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "FileVO [boardVO=" + boardVO + ", file=" + file + "]";
	}
	
}
