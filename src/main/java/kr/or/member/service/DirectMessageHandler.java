package kr.or.member.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.member.vo.Dm;
import kr.or.member.vo.Member;

//소켓용 객체입니다.
@Service
public class DirectMessageHandler extends TextWebSocketHandler{
	
	@Autowired
	private DmService service;
	//쪽지함에 접속한 회원정보를 저장하는 객체(key:id, value:웹소켓 세션)
	private HashMap<String,WebSocketSession> connectMembers;
	
	public DirectMessageHandler() {
		super();
		connectMembers= new HashMap<String,WebSocketSession>();
	}
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
	}
	@Override
	public void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception{
		JsonParser parser = new JsonParser();
		//전송한 메시지 꺼내기 
		JsonElement element = parser.parse(message.getPayload());
		//전송데이터 구분을 위한 값인 type값 확인 
		String type = element.getAsJsonObject().get("type").getAsString();
		if(type.equals("enter") || type.equals("read")) { //최초접속이면 map에 데이터 저장
			String memberId = element.getAsJsonObject().get("memberId").getAsString();
			
			
			
			if(type.equals("enter")) {
				connectMembers.put(memberId, session);
				//최초 접속인 경우 읽지않은 쪽지수 저장
			}
			
			
			int dmCount = service.dmCount(memberId);
				WebSocketSession s = connectMembers.get(memberId);
				if(s !=null) {
					TextMessage tm = new TextMessage(String.valueOf(dmCount));
					session.sendMessage(tm);
				}
				
			
			
		}else if(type.equals("dmSend")) {
			//type이 dmsend였을때 데이터 베이스를 보내주기 위함 
			String sendMemId = element.getAsJsonObject().get("sendMemId").getAsString(); 
			String recvMemId = element.getAsJsonObject().get("recvMemId").getAsString();
			String mContent = element.getAsJsonObject().get("mContent").getAsString();
			String mTitle = element.getAsJsonObject().get("mTitle").getAsString();
			int category = element.getAsJsonObject().get("category").getAsInt();
			Dm dm = new Dm();
			dm.setSendMemId(sendMemId);
			dm.setRecvMemId(recvMemId);
			dm.setMContent(mContent);
			dm.setCategory(category);
			dm.setMTitle(mTitle);
			int result = service.insertDm(dm); //받은 쪽지가 몇개인지 들어와있는 상태 sender에 session에 알림이 receiver에게 가야합니다. 
			if(result!= -1) {
				WebSocketSession receiverSession = connectMembers.get(recvMemId);
				if(receiverSession != null) {
					TextMessage tm = new TextMessage(String.valueOf(result));
					receiverSession.sendMessage(tm);
				}
			}
		}
		
		
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
	}

}
