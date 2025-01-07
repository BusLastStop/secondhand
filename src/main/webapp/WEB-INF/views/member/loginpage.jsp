<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/blue.png" type="image/x-icon"/>
<title>로그인</title>
<style>
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
		width:700px;
		height:400px;
		background-color:#E3F2FD;
	}
	#login{
		display:flex;
		flex-direction:column;
		width:300px;
	}
	#login input{
		margin-bottom:5px;
		height:30px;
		border:1px solid #BBDEFB;
	}
	.point *{
		cursor:pointer;
	}
</style>
</head>
<body>
	<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/blue.png" width="100" height="60"></a>
	<div id="login-container">
		<h1>로그인!</h1>
		<form id="login" class="point" action="${pageContext.request.contextPath}/member/login.do" method="post">
			<input type="text" name="userId">
			<input type="password" name="userPwd">
			<label style="display:flex;align-items:center;"><input type="checkbox" name="saveId">로그인 상태 유지</label>
			<input type="submit" value="로그인" style="background-color:#90CAF9">
		</form>
		<div class="point">
			<a href="#">아이디 찾기</a>
			<a href="#">비밀번호 찾기</a>
			<a href="#">회원가입</a>
		</div>
		<div class="point">
			<img src="" alt="소셜 로그인 아이콘">
			<img src="" alt="소셜 로그인 아이콘">
			<img src="" alt="소셜 로그인 아이콘">
		</div>
	</div>
</body>
</html>