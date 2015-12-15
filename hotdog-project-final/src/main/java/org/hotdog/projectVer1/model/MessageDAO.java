
package org.hotdog.projectVer1.model;

import java.util.List;

public interface MessageDAO {

	public abstract void sendMessage(MessageVO mevo);

	public abstract List<MessageVO> showMessageList(String memberNickName);
	
	public abstract List<MessageVO> sendMessageList(String memberNickName);
	
	public abstract MessageVO messageContent(MessageVO mevo);

	public abstract void readUpdate(MessageVO mevo);

	public abstract void deleteMessage(MessageVO mevo);
	public abstract void redeleteMessage(MessageVO mevo);
	
}
