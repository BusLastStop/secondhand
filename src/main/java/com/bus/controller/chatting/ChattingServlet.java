package com.bus.controller.chatting;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

@ServerEndpoint("/chatting")
public class ChattingServlet {
	
	@OnOpen
	public void open(Session session, EndpointConfig config) {
		System.out.println("손님접속!");
		try {
			// 클라이언트에게 메세지를 전송
			session.getBasicRemote().sendText("채팅접속을 환영합니다.");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@OnMessage
	public void message(Session session, String data) {
		
		System.out.println(data);
		
		Message m = new Gson().fromJson(data, Message.class);
		
		// session에 접속한 회원에 대한 정보를 저장 관리
		session.getUserProperties().put("info", m);
		
		Set<Session> clients = session.getOpenSessions();
		
		switch(m.getType()) {
			// 새로운 클라이언트가 접속했을때
			case "open" : initAlram(clients,m); break;
			// 접속한 회원이 메세지를 전달했을때
			case "msg" : sendChattingMessage(clients,m); break;
		}
		
	}
	
	private void initAlram(Set<Session> clients, Message m) {
		
		// 000님이 접속했습니다. -> 알람
		Message msg = Message.builder().type("alram").data(m.getSender()+"접속했습니다.").build();
		clients.forEach(client -> sendMessage(client, new Gson().toJson(msg)));
		// 현재 접속한 회원을 전송
		List<String> users = new ArrayList<>();
		clients.forEach(client ->{
			Message info = (Message)client.getUserProperties().get("info");
			users.add(info.getSender());
		});
		Message msg2 = Message.builder().type("users").data(new Gson().toJson(users)).build();
		clients.forEach(client -> {
			sendMessage(client, new Gson().toJson(msg2));
		});
		
	}
	
	private void sendChattingMessage(Set<Session> clients, Message m) {
		
		// room, receiver의 값에 따라 분기처리해서 메세지를 전달
		if(!m.getRoom().equals("") && m.getReceiver().equals("")) {
			
		}else if(!m.getReceiver().equals("")) {
			
		}else {
			// 전체 전송
			clients.forEach(client -> sendMessage(client,new Gson().toJson(m)));
		}
		
	}
	
	private void sendMessage(Session session, String m) {
		try {
			session.getBasicRemote().sendText(m);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
