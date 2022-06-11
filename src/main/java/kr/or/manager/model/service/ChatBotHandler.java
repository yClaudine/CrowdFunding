package kr.or.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatBotHandler extends TextWebSocketHandler{

	@Autowired
	private ManagerService service;
	
	//접속 세션 저장
	private ArrayList<WebSocketSession> seeeionList;
	//접속 세션별 아이디 저장
	private HashMap<String, WebSocketSession> memberList;
	
	
	
}
