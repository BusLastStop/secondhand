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
	.video-contents>img{ width:150px;height:100px; }
	.video-contents h4{ margin:5px 0 5px 0; }
	.video-contents p{ margin:0; }
	button{ border:1px solid #ff8a65;background-color:#ffccbd; }
	.container-header{display: flex; justify-content:space-between; align-items: center;}
	.board_list{margin-right:5%;font-size:16px;}
	.letter{}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
	<div style="display:flex;justify-content:center;align-items:center;">
		<div class="video-class">
			<div class="list-container">
				<div class="container-header">
					<h2 class="title">상품목록</h2>
					<c:if test="${sessionScope.loginMember != null}">
						<button class="board_list" onclick="location.assign('${path}/insert/commodity/board.do')">상품등록</button>
					</c:if>
				</div>
				<div style="width:90%;margin:auto;display:flex;justify-content:flex-start;align-items:center;">
					<div class="video-contents" id="boardView">
						<img src="${path}/resources/images/class1.jpeg" alt="강의사진">
						<h4>튀김먹고싶다</h4>
						<div style="display:flex;">
							<p>튀김나라</p>
							<p>|</p>
							<div style="display: flex; align-items: center;">
							  <img src="https://img.freepik.com/premium-vector/comment-icon_414847-476.jpg" alt="댓글수" style="width: 30px; height: 30px;">
							  <span style="font-size: 16px; height: 30px; line-height: 30px;">5</span>
							</div>
							<p>|</p>
							<p>날짜</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	$("#boardView").click(e=>{
		location.assign("${path}/commodity/board/view.do");
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>