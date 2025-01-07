<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>Welcome to the Chat!</h1>
    <!-- 채팅 UI 및 메시지 표시 공간 -->
    <div id="messages"></div>
    <input type="text" id="messageInput" placeholder="Type a message...">
    <button id="sendButton">Send</button>

	<script>
		const socket = new WebSocket("ws://${pageContext.request.contextPath}/chatting");
	
	    socket.onopen = () => {
	        console.log("WebSocket connection established");
	    };
	
	    socket.onmessage = (event) => {
	        const messageDiv = document.getElementById("messages");
	        messageDiv.innerHTML += `<p>${event.data}</p>`;
	    };
	
	    document.getElementById("sendButton").addEventListener("click", () => {
	        const message = document.getElementById("messageInput").value;
	        socket.send(message);
	        document.getElementById("messageInput").value = ""; // 입력 필드 초기화
	    });
	</script>

</body>
</html>