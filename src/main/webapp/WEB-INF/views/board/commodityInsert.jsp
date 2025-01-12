<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.promotion{ position:absolute;top:32%;left:20%; }
	.promotion *{ margin:0 }
	.promotion h2{ font-size:48px; }
	.promotion h3{ font-size:32px; }
	.promotion button{ width:100px;height:40px;font-size:20px;border-radius:10px; }
	.video-class{ width:80%;min-width:510px;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.list-container{ width:80%;background-color:#f5f5f5; }
	.title{ display:inline-block;margin-left:5%; }
	.video-class .video-contents{ display:inline-block;padding:10px;margin:0;}
	.video-contents>img{ width:150px;height:100px; }
	.video-contents h4{ margin:5px 0 5px 0; }
	.video-contents p{ margin:0; }
	button{ border:1px solid #ff8a65;background-color:#ffccbd; }
	.container-header{display: flex; justify-content:space-between; align-items: center;}
	.board_list{;font-size:12px; margin-right: 5%;}
	.letter{}
	.div-group {
        margin-bottom: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .div-group label {
        font-size: 16px;
        font-weight: bold;
        color: #555;
        width: 150px;
    }

    .div-group input {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f9f9f9;
        transition: border-color 0.3s;
        text-align: left;
    }

    .div-group input:focus {
        border-color: #a2d485;
        outline: none;
    }
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
	<div style="display:flex;justify-content:center;align-items:center;">
		<div class="video-class">
			<div class="list-container">
				<div class="container-header">
					<h2 class="title">상품등록</h2>
					<button class="board_list" onclick="location.assign('${path}/commodity/board.do')">목록으로</button>
				</div>
				<div style="margin:auto;display:flex;justify-content:center;align-items:center;">
					<div class="video-contents">
						<form action="${path}/insertend/commodity/board.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="boaMemName" value="${loginMember.memName}">
							<div class="div-group">
								<label>게시글 제목</label><input type="text" id="" name="boaTitle" value="">
							</div>
							<div class="div-group">
								<label>게시글 내용</label><input type="text" id="" name="boaContent" value="">
							</div>
							<div class="div-group">
								<label>게시글 상품 이름</label><input type="text" id="" name="boaComName" value="">
							</div>
							<div class="div-group">
								<label>게시글 상품 가격</label><input type="text" id="" name="boaComPrice" value="">
							</div>
							<div class="div-group">
								<label>상품이미지</label><input type="file" id="" name="boaImgName" value="">
							</div>
							<div class="div-group">
								<label>게시글 첨부파일</label><input type="file" id="" name="boaFileName" value="">
							</div>
							<div style="display: flex; justify-content: center; align-items: center;">
								<button type="submit">상품 등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>