package org.hotdog.projectVer1.model;

public class CommentVO {
	private int commentNumber;
	private String memberNickName;
	private String commentDate;
	private String commentContent;
	private int commentGroup;
	private int commentStep;
	private int commentIndent;
	private int commentBoardNumber;
	
	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentVO(int commentNumber, String memberNickName, String commentDate,
			String commentContent, int commentGroup, int commentStep,
			int commentIndent,int commentBoardNumber) {
		super();
		this.commentNumber = commentNumber;
		this.memberNickName = memberNickName;
		this.commentDate = commentDate;
		this.commentContent = commentContent;
		this.commentGroup = commentGroup;
		this.commentStep = commentStep;
		this.commentIndent = commentIndent;
		this.commentBoardNumber=commentBoardNumber;
	}
	public int getCommentNumber() {
		return commentNumber;
	}
	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setmemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public int getCommentGroup() {
		return commentGroup;
	}
	public void setCommentGroup(int commentGroup) {
		this.commentGroup = commentGroup;
	}
	public int getCommentStep() {
		return commentStep;
	}
	public void setCommentStep(int commentStep) {
		this.commentStep = commentStep;
	}
	public int getCommentIndent() {
		return commentIndent;
	}
	public void setCommentIndent(int commentIndent) {
		this.commentIndent = commentIndent;
	}
	public int getCommentBoardNumber() {
		return commentBoardNumber;
	}
	public void setCommentBoardNumber(int commentBoardNumber) {
		this.commentBoardNumber = commentBoardNumber;
	}
	@Override
	public String toString() {
		return "CommentVO [commentNumber=" + commentNumber + ", memberNickName="
				+ memberNickName + ", commentDate=" + commentDate
				+ ", commentContent=" + commentContent + ", commentGroup="
				+ commentGroup + ", commentStep=" + commentStep
				+ ", commentIndent=" + commentIndent + ", commentBoardNumber="
				+ commentBoardNumber + "]";
	}

	
}
