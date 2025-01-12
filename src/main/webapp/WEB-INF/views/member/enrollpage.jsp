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
		<form id="enroll" action="${path}/member/enrollEnd.do" method="post" accept-charset="UTF-8" onsubmit="return fn_invalidate();">
			<input type="hidden" id="memLatitude" name="memLatitude" value="">
			<input type="hidden" id="memLongitude" name="memLongitude" value="">
			<p>아이디</p>
			<div style="display: flex; justify-content: space-between;">
				<input type="text" id="memId" name="memId">
				<button type="button" style="background-color:#90CAF9; border: 1px solid #90CAF9;" onclick="checkDuplicate();">중복 확인</button>
				<span id="idresult"></span>
			</div>
			<p>비밀번호</p>
			<input type="password" id="memPw" name="memPw">
			<p>비밀번호 확인</p>
			<div style="display: flex; justify-content: space-between;">
				<input type="password" id="memPwCheck" name="memPwCheck">
				<span id="checkResult"></span>
			</div>
			<p>이름</p>
			<input type="text" id="memName" name="memName">
			<p>성별</p>
			<input type="radio" name="memGender" value="남">남
			<input type="radio" name="memGender" value="여">여
			<p>연락처</p>
			<input type="text" id="memPhone" name="memPhone">
			<p>이메일</p>
			<div style="display: flex; justify-content: space-between;">
				<input type="email" id="memEmail" name="memEmail" value="">
				<button type="button" onclick="sendVerificationEmail();" style="background-color:#90CAF9; border: 1px solid #90CAF9;">인증번호 전송</button>
			</div>
			<p>이메일 인증</p>
			<div style="display: flex; justify-content: space-between;">
				<input type="text" id="memEmailCheck" name="memEmailCheck" value="">
				<button type="button" onclick="verifyEmail();" style="background-color:#90CAF9; border: 1px solid #90CAF9;">이메일 인증</button>
			</div>
			<p>생년월일</p>
			<input type="date" id="memBirthDate" name="memBirthDate">
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
		function sendVerificationEmail() {
		    var email = document.getElementById("memEmail").value;
		    
		    if (email) {
		        $.ajax({
		            url: '${path}/email/verification.do', // 서버에서 이메일을 발송하는 JSP로 요청
		            type: 'POST',
		            data: { memEmail: email },
		            success: function(response) {
		                alert("인증번호가 이메일로 전송되었습니다.");
		            },
		            error: function() {
		                alert("이메일 전송에 실패했습니다.");
		            }
		        });
		    } else {
		        alert("이메일을 입력하세요.");
		    }
		}
		
		function verifyEmail() {
		    var emailCheck = document.getElementById("memEmailCheck").value;
		    
		    if (emailCheck) {
		        $.ajax({
		            url: '${path}/email/verification/result.do', // 인증번호를 확인하는 JSP로 요청
		            type: 'POST',
		            data: { memEmailCheck: emailCheck },
		            success: function(response) {
		                if (response === "success") {
		                    alert("이메일 인증이 완료되었습니다.");
		                } else {
		                    alert("인증번호가 틀렸습니다. 다시 시도하세요.");
		                }
		            },
		            error: function() {
		                alert("인증 확인에 실패했습니다.");
		            }
		        });
		    } else {
		        alert("인증번호를 입력하세요.");
		    }
		}
		
		document.getElementById('search-address-btn').addEventListener('click', () => {
		    window.open('${path}/member/addressSearch.do', '주소 검색', `width=400px,height=400px`);
		});
		
		const fn_invalidate=()=>{
			const userId=document.querySelector("#memId").value;
			if(userId.length<4){
				alert("아이디는 4글자이상 입력해주세요!");
				document.querySelector("#memId").focus();
				return false;	
			}	
			const passwordReg=/(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()]).{8,}/;
			const password=document.querySelector("#memPw").value;
			if(!passwordReg.test(password)){
				alert("비밀번호는 영문자,숫자,특수기호(!@#$%^&*())를 포함한 8글자 이상으로 입력해 주세요");
				return false;
			}
			const userName = document.querySelector("#memName").value;
			if(userName == "" && userName.empty){
				alert("이름을 입력해주세요!");
				document.quertSelector("#memName").focus();
				return false;
			}
			const userGender = document.querySelector("input[name='memGender']").value;
			if(!userGender){
				alert("성별을 체크해 주세요");
				return false;
			}
		}
		
		document.querySelector("#memPwCheck").addEventListener("keyup",e=>{
			const password=document.querySelector("#memPw").value;
			const passwordcheck=e.target.value;
			const $span=document.querySelector("#checkResult");
			if(password.length>=4&&passwordcheck.length>=4){
				if(password===passwordcheck){
					$span.innerText="비밀번호가 일치합니다.";
					$span.style.color="green";
					document.querySelector("input[value='회원가입']").disabled=false;
				}else{
					$span.innerText="비밀번호가 일치하지 않습니다.";
					$span.style.color="red";
					document.querySelector("input[value='회원가입']").disabled=true;
				}
			}
		});
		
		const checkDuplicate=(e)=>{
			const memId=$("#memId").val();
			open("${path}/member/idCheck.do?id="+memId,"_blank","width=400px,height=300px");
		}
		
		let request;
		$("#memId").keyup(e=>{
			if(request) clearTimeout(request);
			request=setTimeout(()=>{
				$.get("${path}/member/idCheckResult.do?memId="+e.target.value,
					data=>{
					if(data=='true'){
						$("#idresult").text("사용할 수 있는 아이디입니다.");
					}else{
						$("#idresult").text("사용할 수 없는 아이디입니다.");
					}
				})
			},500);
		});
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>