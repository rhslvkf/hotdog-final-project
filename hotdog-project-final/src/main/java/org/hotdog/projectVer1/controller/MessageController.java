package org.hotdog.projectVer1.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;



import org.hotdog.projectVer1.model.BoardVO;
import org.hotdog.projectVer1.model.MessageService;
import org.hotdog.projectVer1.model.MessageVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MessageController {
	@Resource
	private MessageService messageService;
	
	
		@ResponseBody
		@RequestMapping("sendMessage.do")
		public void sendMessage(MessageVO mevo) {
			System.out.println(mevo);
			messageService.sendMessage(mevo);
			System.out.println("전송완료");
		}
		
		@ResponseBody//받은 메시지함 	
		@RequestMapping("showMessageList.do")
		public List<MessageVO> showMessageList(String receiver){
			return messageService.showMessageList(receiver);
		}
		
		@ResponseBody
		@RequestMapping("sendMessageList.do")
		public List<MessageVO> sendMessageList(String sender){
			return messageService.sendMessageList(sender);
		}
		
		@ResponseBody
		@RequestMapping("messageContent.do")
		public MessageVO messageContent(MessageVO mevo,String type){
			System.out.println(mevo);
			return messageService.messageContent(mevo,type);
		}
		
}
