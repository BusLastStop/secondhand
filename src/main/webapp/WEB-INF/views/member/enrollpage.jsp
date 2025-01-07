<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
	body{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
		min-height:100vh;
 		overflow:hidden;
 		margin:0;
	}
	#login-container{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
		width:40%;
		height:100vh;
		min-width:500px;
		background-color:#E3F2FD;
	}
	#login{
		display:flex;
		flex-direction:column;
		width:300px;
	}
	#login p{
		padding:0;
		margin:0;
		margin-bottom:3px;
	}
	#login input{
		margin-bottom:5px;
		height:30px;
		border:1px solid #BBDEFB;
	}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="login-container">
		<a href="${path}"><img src="${path}/resources/images/blue.png" width="100" height="60"></a>
		<h1>회원가입! 환영합니다!</h1>
		<form id="enroll" action="${path}/member/enrollEnd.do" method="post">
			<input type="hidden" name="memCode" value="mem-">
			<input type="hidden" id="memLatitude" name="memLatitude" value="">
			<input type="hidden" id="memLongitude" name="memLongitude" value="">
			<p>아이디</p>
			<input type="text" name="memId">
			<p>비밀번호</p>
			<input type="password" name="memPw">
			<p>비밀번호 확인</p>
			<input type="password" name="memPwCheck">
			<p>이름</p>
			<input type="text" name="memName">
			<p>성별</p>
			<input type="text" name="memGender">
			<p>연락처</p>
			<input type="text" name="memPhone">
			<p>이메일</p>
			<div style="display: flex; justify-content: space-between;">
				<input type="email" name="memEmail">
				<button style="background-color:#90CAF9; border: 1px solid #90CAF9;">인증번호 전송</button>
			</div>
			<p>이메일 인증</p>
			<div style="display: flex; justify-content: space-between;">
				<input type="text" name="memEmailCheck">
				<button style="background-color:#90CAF9; border: 1px solid #90CAF9;">이메일 인증</button>
			</div>
			<p>생년월일</p>
			<input type="date" name="memBirthDate">
			<p>거주지</p>
			<div style="display: flex; justify-content: space-between;">
				<input type="text" id="address-input" name="memAddress" value="">
  				<button type="button" id="search-address-btn" style="background-color:#90CAF9; border: 1px solid #90CAF9;">주소명 검색</button>
			</div>
			<label style="display:flex;align-items:center;"><input type="checkbox" name="saveId">로그인 상태 유지</label>
			<input type="submit" value="회원가입" style="background-color:#90CAF9">
		</form>
	</div>
	<script>
		document.getElementById('search-address-btn').addEventListener('click', () => {
		    // 새 창 열기
		    window.open('${path}/member/addressSearch.do', '주소 검색', `width=400px,height=400px`);
		});
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>