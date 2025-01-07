<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	.promotion{ position:absolute;top:32%;left:20%; }
	.promotion *{ margin:0 }
	.promotion h2{ font-size:48px; }
	.promotion h3{ font-size:32px; }
	.promotion button{ width:100px;height:40px;font-size:20px;border-radius:10px; }
	.video-class{ width:80%;height:400px;min-width:510px;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.list-container{ width:80%;height:80%;background-color:#f5f5f5; }
	.title{ display:inline-block;margin-left:5%; }
	.video-class .video-contents{ display:inline-block;padding:10px;margin:0; }
	.video-contents img{ width:150px;height:100px; }
	.video-contents h4{ margin:5px 0 5px 0; }
	.video-contents p{ margin:0; }
	button{ border:1px solid #ff8a65;background-color:#ffccbd; }
	.container-header{display: flex; justify-content:center; align-items: center;}
	.board_insert{margin-right:5%;font-size:16px;width:75px;height:32px;}
</style>
<section>
	<div style="display:flex;justify-content:center;align-items:center;">
		<div class="video-class">
			<div class="list-container">
				<div class="container-header">
					<h2 class="title">회원 신고 상세</h2>
				</div>
				<br>
				<div style="width:90%;margin:auto;display:flex;justify-content:flex-start;align-items:center;">
					<div class="video-contents">
					    <div class="video-contents">
						    <table style="width: 100%; border-collapse: collapse; text-align: center; background-color: #fff; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); border-radius: 8px; overflow: hidden;">
						        <thead style="background-color: #ff8a65; color: #fff;">
						            <tr>
						                <th style="border: 1px solid #ddd; padding: 12px; font-size: 16px;">번호</th>
						                <th style="border: 1px solid #ddd; padding: 12px; font-size: 16px;">아이디</th>
						                <th style="border: 1px solid #ddd; padding: 12px; font-size: 16px;">이름</th>
						                <th style="border: 1px solid #ddd; padding: 12px; font-size: 16px;">등록날짜(댓글,대댓글)</th>
						                <th style="border: 1px solid #ddd; padding: 12px; font-size: 16px;">(댓글,대댓글) 내용</th>
						                <th style="border: 1px solid #ddd; padding: 12px; font-size: 16px;">비고</th>
						            </tr>
						        </thead>
						        <tbody>
						            <!-- 예시 데이터 -->
						            <tr style="background-color: #f9f9f9; transition: background-color 0.3s;">
						                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">1</td>
						                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">아이디 예시</td>
						                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">이름 예시</td>
						                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">2024-12-24</td>
						                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">댓글, 대댓글 내용 예시</td>
						                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">
						                    <button style="border: 1px solid #ffc107; color: #ffffff; background-color: #ffcc00; border-radius: 8px; padding: 6px 12px; cursor: pointer;" onclick="showReasonPopup('비활성화');">비활성화</button>
						                    <button style="border: 1px solid #e57373; color: #ffffff; background-color: #ffcdd2; border-radius: 8px; padding: 6px 12px; cursor: pointer;" onclick="showReasonPopup('정지');">정지</button>
						                    <button style="border: 1px solid #f44336; color: #ffffff; background-color: #ff0000; border-radius: 8px; padding: 6px 12px; cursor: pointer;" onclick="showReasonPopup('삭제');">삭제</button>
						                </td>
						            </tr>
						        </tbody>
						    </table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 사유 입력 팝업 -->
	<div id="reason-popup" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 400px; padding: 20px; background: white; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);">
		<h3 id="popup-title" style="margin-top: 0;"></h3>
		<textarea id="reason-input" name="reason" rows="5" style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;" placeholder="사유를 입력하세요..."></textarea>
		<div style="margin-top: 20px; text-align: right;">
			<form id="reason-form" method="POST" action="${path}">
				<input type="hidden" name="action" id="action">
				<button id="submit-reason" type="submit" style="padding: 5px 15px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer;">확인</button>
				<button id="cancel-reason" type="button" style="padding: 5px 15px; background-color: #f44336; color: white; border: none; border-radius: 5px; cursor: pointer;" onclick="closePopup()">취소</button>
			</form>
		</div>
	</div>
</section>
<script>
	function showReasonPopup(actionType) {
		// Set action type and title in the popup
		document.getElementById('popup-title').textContent = actionType;
		document.getElementById('action').value = actionType;
		
		// Show the popup
		document.getElementById('reason-popup').style.display = 'block';
	}
	
	function closePopup() {
		document.getElementById('reason-popup').style.display = 'none';
	}
	
	document.getElementById('reason-form').onsubmit = function(event) {
		event.preventDefault(); // Prevent default form submission
		var reason = document.getElementById('reason-input').value;
		
		// Validate if the reason is entered
		if (reason.trim() === '') {
			alert('사유를 입력하세요.');
			return false;
		}
		
		// If valid, submit the form
		this.submit();
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>