package org.hotdog.projectVer1.model;

import java.util.List;

public interface ChatService {

    public void insertChat(ChatVO chatVO);

    public List<ChatVO> readById(int lastChatId);

	public int getLastChatId();

	public List<ChatVO> getChatList(String loginTime);
}