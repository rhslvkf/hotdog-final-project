package org.hotdog.projectVer1.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class MessageDAOImpl implements MessageDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	
	@Override
	public void sendMessage(MessageVO mevo) {
		sqlSessionTemplate.insert("message.sendMessage",mevo);
	}


	@Override
	public List<MessageVO> showMessageList(String receiver) {
		List<MessageVO> list=sqlSessionTemplate.selectList("message.showMessageList",receiver);
		return list;
	}
	@Override
	public List<MessageVO> sendMessageList(String sender) {
		List<MessageVO> list=sqlSessionTemplate.selectList("message.sendMessageList",sender);
		return list;
	}

	@Override
	public MessageVO messageContent(MessageVO mevo) {
		MessageVO mvo=	sqlSessionTemplate.selectOne("message.messageContent",mevo);
		System.out.println(mvo);
		return mvo;
	}


	@Override
	public void readUpdate(MessageVO mevo) {
		sqlSessionTemplate.update("readUpdate",mevo);
		
	}


}
