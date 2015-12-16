package org.hotdog.projectVer1.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class ChatServiceImpl implements ChatService{
	
	@Resource
	private ChatDAO chatDAO;

	@Override
	public void insertChat(ChatVO chatVO) {
		chatDAO.insertChat(chatVO);
	}

	@Override
	public List<ChatVO> readById(int chatId) {
		return chatDAO.readById(chatId);
	}

	@Override
	public int getLastChatId() {
		return chatDAO.getLastChatId();
	}

	@Override
	public List<ChatVO> getChatList(String loginTime) {
		return chatDAO.getChatList(loginTime);
	}

}