package org.hotdog.projectVer1.model;

import java.util.List;

public interface ChatDAO {

	void insertChat(ChatVO chatVO);

	int getLastChatId();

	List<ChatVO> readById(int chatId);

	List<ChatVO> getChatList(String loginTime);
	
}