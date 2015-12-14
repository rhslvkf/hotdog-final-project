package com.jsonobject.minichat.model;

import org.joda.time.DateTime;

public class Message {
    private Long messageId;
    private String userName;
    private String message;
    private DateTime dateCreated;

    public Message() {
        super();
    }

    public Long getMessageId() {
        return messageId;
    }

    public void setMessageId(Long messageId) {
        this.messageId = messageId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public DateTime getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(DateTime dateCreated) {
        this.dateCreated = dateCreated;
    }

    @Override
    public String toString() {
        return "Message [messageId=" + messageId + ", userName=" + userName + ", message=" + message + ", dateCreated=" + dateCreated + "]";
    }
}
