<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${path}/resources/images/green.png" type="image/x-icon"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	*{
		font-family: "Noto Sans KR", serif;
		font-optical-sizing: auto;
		font-weight: 500;
		font-style: normal;
		border:1px solid #9ccc65;
		color:#212121;
	}
	body{ overflow-y:scroll;overflow-x:hidden; }
	header{display:flex;flex-direction:column;align-items:center;}
	div#headerUser{display:flex;justify-content:flex-end;align-items:center;width:80%;padding:3px}
	div#headerMenu{display:flex; justify-content:center;align-items:flex-start;width:80%}
	div#headerMenu h2{ margin:0; }
	div#headerMenu button{ background-color:f5f5f5;color:9ccc65;border:1px solid #9ccc65;margin-left:20px;font-size:16px;width:65px;height:32px; }
	div#footer{display:flex;justify-content:space-around;align-items:center}
	#headerUser a{ margin-right:10px; }
	#headerMenu>*{cursor:pointer;}
	#category{display:flex;padding:0;margin-right:5%;justify-contents:center;align-items:center;}
	#category>li{margin-left:10px;margin-right:10px}
	.writer-container{background-color:f5f5f5;}
	.writer-header{display:flex;justify-content:space-between;align-items:center;}
	ul>li{list-style-type:none;}
	a{ text-decoration:none; }
	.dropdown{ overflow:visible;max-height:21px;text-align:right;z-index:10; }
	.dropdown>ul{ padding:0;margin:10px 0 0 0;display:flex;flex-direction:column;justify-content:center;background-color:white; }
	.dropdown li{ padding:2px;text-align:center;width:90px;height:24px; }
	.dropdownList{ display:none;cursor:pointer; }
	button{ border:1px solid #ff8a65;background-color:#ffccbd; }
    /* 채팅 이모지 스타일 */
    .chat-emoji {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background-color: #f5f5f5;
        width: 70px;
        height: 70px;
        border-radius: 50%;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        transition: transform 0.3s ease;
        z-index: 1000;
    }

    .chat-emoji:hover {
        transform: scale(1.1);
    }

    .chat-emoji img {
        width: 40px;
        height: 40px;
    }

    /* 채팅창 스타일 */
    .chat-window {
        position: fixed;
        bottom: 100px;
        right: 20px;
        width: 300px;
        max-height: 400px;
        background-color: white;
        border: 1px solid #9ccc65;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        display: none;
        flex-direction: column;
        z-index: 1000;
    }

    .chat-header {
        background-color: #9ccc65;
        color: white;
        padding: 10px;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        font-weight: bold;
        text-align: center;
    }

    .chat-messages {
        flex: 1;
        padding: 10px;
        overflow-y: auto;
        font-size: 14px;
        color: #333;
    }

    .chat-input {
        display: flex;
        border-top: 1px solid #ccc;
    }

    .chat-input input {
        flex: 1;
        padding: 10px;
        border: none;
        outline: none;
        font-size: 14px;
    }

    .chat-input button {
        background-color: #9ccc65;
        border: none;
        color: white;
        padding: 10px 20px;
        cursor: pointer;
    }

    .chat-input button:hover {
        background-color: #7cb342;
    }
</style>
<title>온라인 강의 사이트</title>
</head>
<body>
<header>
	<div id="headerMenu">
		<a href="${path}"><img src="${path}/resources/images/green.png" width="100" height="60"></a>
		<div style="width:60%;">
			<form action="" method="get" style="display:flex;justify-content:center;align-items:center;height:60px;margin:0;font-size:16px;">
				<input type="text" name="search" placeholder="검색어 입력" style="width:70%;height:32px;">
				<button type="submit">검색</button>
			</form>
			<div style="display:flex;justify-content:center;align-items:center;">
				<h2 style="margin:5px 0 5px 0;"><a href="${path}/commodity/board.do">상품 목록</a></h2>
				<h2 style="margin:5px 0 5px 0;"><a href="${path}/commoditymap/board.do">지도, 상품</a></h2>
				<h2 style="margin:5px 0 5px 0;"><a href="${path}/commodity/report/board.do">상품 신고 관리</a></h2>
				<h2 style="margin:5px 0 5px 0;"><a href="${path}/member/report.do">회원 신고 관리</a></h2>
				<h2 style="margin:5px 0 5px 0;"><a href="${path}/member/reset/password.do">회원 잠금 해지 요청</a></h2>
			</div>
		</div>
		<div style="display:flex;justify-content:center;align-items:center;">
			<h2 style="margin:8px 0 0 10px;"><a href="${path}/insert/commodity/board.do">판매하기</a></h2>
				<h2 style="margin:8px 0 0 10px;"><a href="${path}/member/login.do">로그인</a></h2>
				<h2 style="margin:8px 0 0 10px;"><a href="${path}/info/member.do">마이페이지</a></h2>
		</div>
	</div>
	<!-- 채팅 이모지 -->
	<div class="chat-emoji" id="chatEmoji">
	    <img src="${path}/resources/images/chat-icon.png" alt="Chat Icon">
	</div>
	
	<script>
		const dropdownList=()=>{
			document.querySelectorAll(".dropdownList").forEach(v=>{
				console.log(v.style.display);
				if(v.style.display=="none" || v.style.display=="") v.style.display="block";
				else v.style.display="none";
			})
		}
		
		document.getElementById("chatEmoji").addEventListener("click", () => {
		    // 새 창 열기
		    const chatWindow = window.open(
		        "${path}/chattingwindow", // 새 창에 연결할 URL
		        "_blank",
		        "width=400,height=600,scrollbars=no,resizable=no"
		    );
		});
		
	</script>
</header>