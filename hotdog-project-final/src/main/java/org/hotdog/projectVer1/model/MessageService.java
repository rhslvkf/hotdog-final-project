package org.hotdog.projectVer1.model;

import java.util.List;

public interface MessageService {
	
	public abstract void sendMessage(MessageVO mevo);

	public abstract List<MessageVO> showMessageList(String memberNickName);
	public abstract List<MessageVO> sendMessageList(String memberNickName);
	
	
	public abstract MessageVO messageContent(MessageVO mevo,String type);

}
