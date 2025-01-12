<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.promotion{ position:absolute;top:32%;left:20%; }
	.promotion *{ margin:0 }
	.promotion h2{ font-size:48px; }
	.promotion h3{ font-size:32px; }
	.promotion button{ width:100px;height:40px;font-size:20px;border-radius:10px; }
	.video-class{ width:80%;min-width:510px;display:flex;flex-direction:column;justify-content:center;align-items:center; }
	.list-container{ width:80%;height:80%;background-color:#f5f5f5; }
	.title{ display:inline-block;margin-left:5%; }
	.video-class .video-contents{ display:inline-block;padding:10px;margin:0;width: 100%; }
	.video-contents>img{ width:150px;height:100px; }
	.video-contents h4{ margin:5px 0 5px 0; }
	.video-contents p{ margin:0; }
	button{ border:1px solid #ff8a65;background-color:#ffccbd; }
	.container-header{display: flex; justify-content:space-between; align-items: center;}
	.board_list{font-size:14px;}
	.letter{}
	#comment-container {
	    width: 100%;
	    max-width: 800px;
	    margin: 0 auto;
	    padding: 20px;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    background-color: #f9f9f9;
	    font-family: Arial, sans-serif;
	}
	
	.comment-editor {
	    margin-bottom: 20px;
	}
	
	.comment-editor textarea {
	    width: 100%;
	    height: 80px;
	    padding: 10px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    font-size: 14px;
	    resize: none;
	}
	
	.comment-editor button {
	    margin-top: 10px;
	    padding: 10px 20px;
	    background-color: #007bff;
	    color: #fff;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    font-size: 14px;
	}
	
	.comment-editor button:hover {
	    background-color: #0056b3;
	}
	
	#tbl-comment {
	    width: 100%;
	    border-spacing: 0;
	    margin-top: 10px;
	}
	
	#tbl-comment tr {
	    border-bottom: 1px solid #ddd;
	}
	
	.level1 {
	    padding: 10px 0;
	}
	
	.level1 td {
	    padding: 10px;
	    vertical-align: top;
	}
	
	.comment-writer {
	    font-weight: bold;
	    color: #333;
	    margin-right: 10px;
	}
	
	.comment-date {
	    font-size: 12px;
	    color: #888;
	}
	
	.comment-date::before {
	    content: "• ";
	}
	
	.level1 td br {
	    margin-bottom: 10px;
	}
	
	.level1 td {
	    background-color: #fff;
	    border-radius: 6px;
	    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
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
					<h2 class="title">상품 상세</h2>
					<div style="display: flex; justify-content: space-between; margin-right: 1%; width: 17%">
						<button class="board_list" onclick="location.assign('${path}/commodity/board.do')">목록으로</button>
						<c:if test="${board.memName != loginMember.memName}">
							<button class="board_list" onclick="location.assign('${path}/commodity/board.do')">상품신고</button>
						</c:if>
					</div>
				</div>
				<div style="margin:auto;display:flex;justify-content:flex-start;align-items:center;">
					<div class="video-contents" id="boardView">
						<div class="div-group">
							<label>게시글 제목</label><input type="text" id="" name="boaTitle" value="" readonly>
						</div>
						<div class="div-group">
							<label>게시글 내용</label><input type="text" id="" name="boaContent" value="" readonly>
						</div>
						<div class="div-group">
							<label>게시글 상품 이름</label><input type="text" id="" name="boaComName" value="" readonly>
						</div>
						<div class="div-group">
							<label>게시글 상품 가격</label><input type="text" id="" name="boaComPrice" value="" readonly>
						</div>
						<div class="div-group">
							<label>상품이미지</label><img src="">
						</div>
						<div class="div-group">
							<label>게시글 첨부파일</label>
							<a href="javascript:fn_filedownload('${board.boardOriginalFileName }','${board.boardRenamedFileName }');">
					 			<span>${board.boardOriginalFileName }</span>
				 			</a>
				 			<div style="display: flex; justify-content: center;">
					 			<button style="margin-right:1%;">장바구니</button>
					 			<button>결제하기</button>
				 			</div>
						</div>
					</div>
				</div>
				<div id="comment-container">
					<div class="comment-editor">
						<form action="${path }/board/insertcomment.do" method="post">
							<input type="hidden" name="boaCode" value="${board.boaCode}"/>
							<input type="hidden" name="memCode" value="${loginMember.memCode}"/>
							<input type="hidden" name="memName" value="${loginMember.memName}"/>
							<input type="hidden" name="boardCommentRef" value="0"/>
							<textarea name="content"></textarea>
							<button type="submit" id="btn-insert">등록</button>
						</form>
					</div>
					<table id="tbl-comment">
					<c:if test="${not empty comments }">
						<c:forEach var="comment" items="${comments }">
							<c:if test="${comment.level==1}">
								<tr class="level1">
									<td>
										<sub class="comment-writer">
											${comment.boardCommentWriter }
										</sub>
										<sub class="comment-date">
											${comment.boardCommentDate }
										</sub>
										<br>
										${comment.boardCommentContent }
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	const fn_filedownload=(oriname,rename)=>{
		location.assign(`${path}/board/filedownload.do?oriname=\${oriname}&rename=\${rename}`)
	}
	
	document.querySelector(".comment-editor textarea[name='content']")
	.addEventListener("focus",e=>{
		if(${sessionScope.loginMember==null}){
			alert("로그인 후 이용할 수 있습니다!");
			$("#userId").focus();
		}
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>