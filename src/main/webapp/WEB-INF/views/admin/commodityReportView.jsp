<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	.video-class{ width:80%;min-width:510px;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.list-container{ width:80%;background-color:#f5f5f5; }
	.title{ display:inline-block;margin-left:5%; }
	.video-class .video-contents{ display:flex;width:100%; padding:10px;margin:0; justify-content: center;}
	.video-contents img{ width:300px;height:300px; }
	button{ border:1px solid #ff8a65;background-color:#ffccbd; }
	.container-header{display: flex; justify-content:space-between; align-items: center;}
	.board-report .board-reply .board-delete{margin:1px;font-size:16px;}
	.board-report{background-color: #CFD8DC; border: 1px solid #CFD8DC;}
	.board-reply{background-color: #aeea00; border: 1px solid #aeea00;}
	.board-delete{background-color: #ff3d00;}
	.buttons{margin-right:5%;}
	
</style>
<section>
	<div style="display:flex;justify-content:center;align-items:center;">
		<div class="video-class">
			<div class="list-container">
				<div class="container-header">
					<h2 class="title">상품 상세</h2>
					<div class="buttons">
						<button class="board-report" onclick="location.assign('${path}/commodity/report/board.do')">목록</button>
						<button class="board-reply" onclick="showReasonPopup('반려');">반려</button>
						<button class="board-delete" onclick="showReasonPopup('삭제');">삭제</button>
					</div>
				</div>
				<br>
				<div style="width:90%;margin:auto;display:flex;justify-content:center;align-items:center;">
					<div class="video-contents">
						<div>
							<img src="${path}/resources/images/class1.jpeg" alt="강의사진"><br>
							제목 : <input type="text" name="" value="${report.boaTitle}"> <br>
							내용 : <input type="text" name="" value="${report.boaContent}"> <br>
							카테고리 : <input type="text" name="" value="${report.comCatName}"> <br>
							작성자 : <input type="text" name="" value="${report.memName}"> <br>
							파일 : <input type="text" name="" value="${report.boaFilePath}"> <br>
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
			<form id="reason-form" method="POST" action="${path}/commodity/report/board.do">
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