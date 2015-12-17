
package org.hotdog.projectVer1.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {
	@Resource
	private MessageDAO MessageDAO;
	
	@Override
	public void sendMessage(MessageVO mevo) {
		MessageDAO.sendMessage(mevo);
	}

	@Override
	public List<MessageVO> showMessageList(String receiver) {
		return MessageDAO.showMessageList(receiver);
	}


	@Override
	public List<MessageVO> sendMessageList(String sender) {
		return MessageDAO.sendMessageList(sender);
	}
	
	
	@Override
	public MessageVO messageContent(MessageVO mevo,String type) {
		if(type.equals("받은쪽지함")){
			MessageDAO.readUpdate(mevo);
			System.out.println("받은메시지 update완료");
		}
		return MessageDAO.messageContent(mevo);
	}

	@Override
	public void deleteMessage(MessageVO mevo) {
			MessageDAO.deleteMessage(mevo);
		
	}
	@Override
	public void redeleteMessage(MessageVO mevo) {
			MessageDAO.redeleteMessage(mevo);
		
	}

}
