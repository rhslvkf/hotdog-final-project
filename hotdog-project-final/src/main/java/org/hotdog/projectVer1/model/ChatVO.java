package org.hotdog.projectVer1.model;


public class ChatVO {
	private int chatId;
    private String userName;
    private String chatMessage;
    private String dateCreated;
	public ChatVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatVO(int chatId, String userName, String chatMessage,
			String dateCreated) {
		super();
		this.chatId = chatId;
		this.userName = userName;
		this.chatMessage = chatMessage;
		this.dateCreated = dateCreated;
	}
	public int getChatId() {
		return chatId;
	}
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getChatMessage() {
		return chatMessage;
	}
	public void setChatMessage(String chatMessage) {
		this.chatMessage = chatMessage;
	}
	public String getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
	@Override
	public String toString() {
		return "ChatVO [chatId=" + chatId + ", userName=" + userName
				+ ", chatMessage=" + chatMessage + ", dateCreated="
				+ dateCreated + "]";
	}
    
}