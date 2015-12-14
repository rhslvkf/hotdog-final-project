package org.hotdog.projectVer1.model;


public class MessageVO {
	private String sender;
	private String receiver;
	private String messageDate;
	private String messageTitle;
	private String messageContent;
	private String messageReaded;
	public MessageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MessageVO(String sender, String receiver, String messageDate,
			String messageTitle, String messageContent, String messageReaded) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.messageDate = messageDate;
		this.messageTitle = messageTitle;
		this.messageContent = messageContent;
		this.messageReaded = messageReaded;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}
	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getMessageReaded() {
		return messageReaded;
	}
	public void setMessageReaded(String messageReaded) {
		this.messageReaded = messageReaded;
	}
	
	@Override
	public String toString() {
		return "MessageVO [sender=" + sender + ", receiver=" + receiver
				+ ", messageDate=" + messageDate + ", messageTitle="
				+ messageTitle + ", messageContent=" + messageContent
				+ ", messageReaded=" + messageReaded + "]";
	}
	
	
}
