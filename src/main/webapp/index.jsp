<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.promotion{ position:absolute;top:32%;left:20%; }
	.promotion *{ margin:0 }
	.promotion h2{ font-size:48px; }
	.promotion h3{ font-size:32px; }
	.promotion button{ width:100px;height:40px;font-size:20px;border-radius:10px; }
	.video-class{ width:80%;height:400px;min-width:510px;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.list-container{ width:80%;height:80%;background-color:#f5f5f5; }
	.title{ display:inline-block;margin-left:5%; }
	.video-class .video-contents{ display:inline-block;width:24%;padding:10px;margin:0; }
	.video-contents img{ width:150px;height:100px; }
	.video-contents h4{ margin:5px 0 5px 0; }
	.video-contents p{ margin:0; }
	button{ border:1px solid #ff8a65;background-color:#ffccbd; }
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
	<div style="display:flex;justify-content:center;align-items:flex-start;overflow:hidden;height:50%;">
		<img src="${pageContext.request.contextPath}/resources/images/community.png" width="1887px" style="opacity:70%;">
		<div class="promotion">
			<h2 style="color:#212121;">학습의 연장 교재 거래</h2>
 			<h3 style="color:#212121;">강사와 학생 간의 신뢰할 수 있는 중고 거래</h3>
		</div>
	</div>
	<div style="display:flex;justify-content:center;align-items:center;">
		<div class="video-class">
			<div class="list-container">
				<h2 class="title">인기 상품</h2><br>
				<div style="width:90%;margin:auto;display:flex;justify-content:flex-start;align-items:center;">
					<div class="video-contents">
						<img src="${pageContext.request.contextPath}/resources/images/class1.jpeg" alt="강의사진">
						<h4>튀김먹고싶다</h4>
						<div style="display:flex;">
							<p>튀김나라</p>
							<p>|</p>
							<p>날짜</p>
						</div>
					</div>
					<div class="video-contents">
						<img src="${pageContext.request.contextPath}/resources/images/class1.jpeg" alt="강의사진">
						<h4>C++ 파일</h4>
						<div style="display:flex;">
							<p>코딩백수</p>
							<p>|</p>
							<p>날짜</p>
						</div>
					</div>
					<div class="video-contents">
						<img src="${pageContext.request.contextPath}/resources/images/class1.jpeg" alt="강의사진">
						<h4>4년동안 코딩 공부</h4>
						<div style="display:flex;">
							<p>코딩안하면코손실</p>
							<p>|</p>
							<p>날짜</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>