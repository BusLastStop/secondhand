<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<h2 class="title">회원 잠금 해지 요청</h2>
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
						                <th style="border: 1px solid #ddd; padding: 12px; font-size: 16px;">생년월일</th>
						                <th style="border: 1px solid #ddd; padding: 12px; font-size: 16px;">이메일</th>
						                <th style="border: 1px solid #ddd; padding: 12px; font-size: 16px;">전화번호</th>
						                <th style="border: 1px solid #ddd; padding: 12px; font-size: 16px;">신청날짜</th>
						                <th style="border: 1px solid #ddd; padding: 12px; font-size: 16px;">해지신청</th>
						                <th style="border: 1px solid #ddd; padding: 12px; font-size: 16px;">비고</th>
						            </tr>
						        </thead>
						        <tbody>
						            <c:forEach var="resetPwList" items="${resetPwList}">
							            <tr style="background-color: #f9f9f9; transition: background-color 0.3s;">
							                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">${resetPwList}</td>
							                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">${resetPwList.memId}</td>
							                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">${resetPwList.memName}</td>
							                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">${resetPwList.memBirthDate}</td>
							                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">${resetPwList.memEmail}</td>
							                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">${resetPwList.memPhone}</td>
							                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">
							                	<fmt:formatDate value="${resetPwList.repCreate }"pattern="yyyy년 MM월 dd일"/>
							                </td>
							                <c:if test="${resetPwList.memState == 'n' && resetPwList.memState == 'N'}">
							                	<td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">신청</td>
							                </c:if>
							                <c:if test="${resetPwList.memState == 'y' && resetPwList.memState == 'Y'}">
							                	<td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">처리완료</td>
							                </c:if>
							                <td style="border: 1px solid #ddd; padding: 12px; font-size: 14px;">
							                    <button style="border: 1px solid #ffc107; color: #ffffff; background-color: #6699ff; border-radius: 8px; padding: 6px 12px; cursor: pointer;">비밀번호 초기화</button>
							                </td>
							            </tr>
						            </c:forEach>
						        </tbody>
						    </table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>