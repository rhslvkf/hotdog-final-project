package org.hotdog.projectVer1.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAOImpl implements ChatDAO{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertChat(ChatVO chatVO) {
		sqlSessionTemplate.insert("chat.insertChat",chatVO);
	}

	@Override
	public int getLastChatId() {
		return sqlSessionTemplate.selectOne("chat.getLastChatId");
	}

	@Override
	public List<ChatVO> readById(int lastChatId) {
		return sqlSessionTemplate.selectList("chat.readById",lastChatId);
	}

	@Override
	public List<ChatVO> getChatList(String loginTime) {
		return sqlSessionTemplate.selectList("chat.getChatList",loginTime);
	}
	
}