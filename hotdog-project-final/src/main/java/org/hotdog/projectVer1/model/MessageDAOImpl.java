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
	
		return mvo;
	}


	@Override
	public void readUpdate(MessageVO mevo) {
		sqlSessionTemplate.update("readUpdate",mevo);
		
	}


	@Override
	public void deleteMessage(MessageVO mevo) {
		sqlSessionTemplate.update("message.deleteMessage",mevo);
		System.out.println("보낸 쪽지함 삭제 완료");
		sqlSessionTemplate.delete("message.ComDelete");
	}
	@Override
	public void redeleteMessage(MessageVO mevo) {
		sqlSessionTemplate.update("message.redeleteMessage",mevo);
		System.out.println("받은 쪽지함 삭제 완료");
		sqlSessionTemplate.delete("message.ComDelete");
	}


}
