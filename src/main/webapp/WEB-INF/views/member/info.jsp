<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
    .container {
        width: 80%;
        margin-top: 20px;
        display: flex;
        flex-direction: row;
        border: 2px solid #a2d485;
        border-radius: 8px;
        background-color: #fff;
    }

    .menu-bar {
        width: 200px;
        background-color: #dff0d8;
        border-right: 2px solid #a2d485;
        padding: 15px;
        box-sizing: border-box;
    }

    .menu-bar ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .menu-bar li {
        margin: 10px 0;
        padding: 10px;
        text-align: center;
        background-color: #fff;
        border: 1px solid #a2d485;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
    }

    .menu-bar li:hover {
        background-color: #a2d485;
        color: white;
    }

    .content-area {
        flex-grow: 1;
        padding: 20px;
        box-sizing: border-box;
    }

    .content-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .content-header h2 {
        font-size: 24px;
        margin: 0;
        color: #333;
    }

    .content-header button {
        padding: 10px 20px;
        background-color: #ff8a65;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .content-header button:hover {
        background-color: #ff5722;
    }

    .content-display {
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
	
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

    .search-btn {
	    background-color: #5d9cec;
	    border: none;
	    padding: 10px 20px;
	    font-size: 14px;
	    font-weight: bold;
	    color: white;
	    border-radius: 5px;
	    cursor: pointer;
	    margin-left: 10px;
	    transition: background-color 0.3s;
	}
	
	.search-btn:hover {
	    background-color: #4a8bc2;
	}

    .button-group {
        display: flex;
        justify-content: space-around;
        margin-top: 20px;
    }

    .logout-btn, .update-btn, .delete-btn {
        padding: 10px 20px;
        font-size: 16px;
        color: white;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        border: none;
    }

    .logout-btn {
        background-color: #0000d9;
        opacity: 0.4;
    }

    .update-btn {
        background-color: #00d900;
    }

    .delete-btn {
        background-color: #ff0101;
        opacity: 0.44;
    }

    .logout-btn:hover {
        background-color: #0000a3;
    }

    .update-btn:hover {
        background-color: #00b300;
    }

    .delete-btn:hover {
        background-color: #e60000;
    }
    
    .hidden {
	    display: none;
	}
	.custom-input {
    width: calc(100% - 20px); /* 기존 레이아웃에 맞는 너비 */
    padding: 8px; /* 패딩 조정 */
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

	.input-with-message {
	    display: flex;
	    align-items: center;
	    gap: 10px;
	}
	
	.validation-message {
	    font-size: 14px;
	    color: #ff0000;
	    white-space: nowrap;
	}
	
	.custom-radio-group {
	    display: flex;
	    justify-content: flex-start;
	    gap: 15px;
	}
	
	.custom-radio-group label {
	    display: flex;
	    align-items: center;
	    gap: 5px;
	}
</style>
<section>
    <div class="container">
        <nav class="menu-bar">
            <ul>
                <li data-endpoint="/member/info.do">회원정보수정</li>
                <li data-endpoint="/member/notification.do">알림관리</li>
                <li data-endpoint="/member/productList.do">상품등록보기</li>
                <li data-endpoint="/member/downloadHistory.do">다운로드 내역</li>
                <li data-endpoint="/member/cart.do">장바구니</li>
            </ul>
        </nav>
        <main class="content-area">
            <div class="content-header">
                <h2>회원정보수정</h2>
            </div>
            <div class="content-display">
            	<form action="${path}/member/update.do" method="post" onsubmit="return fn_invalidate();">
            		<input type="hidden" id="memLatitude" name="memLatitude" value="${member.memLatitude}">
					<input type="hidden" id="memLongitude" name="memLongitude" value="${member.memLongitude}">
					<input type="hidden" id="memCode" name="memCode" value="${member.memCode}">
	                <div class="div-group">
		                <label for="memId">회원 아이디:</label>
		                <input type="text" id="memId" name="memId" value="${member.memId}" readonly>
		            </div>
		
		            <div class="form-group">
		                <label for="memPw">회원 비밀번호:</label>
		                <input type="password" id="memPw" name="memPw" class="custom-input" value="${member.memPw}">
		            </div>
		            
		            <div class="form-group">
		                <label for="memPw">비밀번호 확인:</label>
		                <div class="input-with-message">
			                <input type="password" id="memPwCheck" name="memPwCheck" class="custom-input" value="">
			                <span id="checkResult" class="validation-message"></span>
		                </div>
		            </div>
		            
		            <div class="div-group">
		                <label for="memName">회원 이름:</label>
		                <input type="text" id="memName" name="memName" value="${member.memName}">
		            </div>
		
		            <div class="form-group">
			            <label>성별</label>
			            <div class="custom-radio-group">
			                <label>
			                    <input type="radio" name="memGender" value="남" ${member.memGender == "남"?"checked":""} readonly> 남
			                </label>
			                <label>
			                    <input type="radio" name="memGender" value="여" ${member.memGender == "여"?"checked":""} readonly> 여
			                </label>
			            </div>
			        </div>
			        
		            <div class="div-group">
		                <label for="memEmail">회원 이메일:</label>
		                <input type="text" id="memEmail" name="memEmail" value="${member.memEmail}">
		                <button type="button" onclick="sendVerificationEmail();" class="search-btn">인증번호 전송</button>
		            </div>
		            
		            <div class="div-group hidden" id="email-verification-section">
		                <label for="memEmail">이메일 인증:</label>
		                <input type="text" id="memEmailCheck" name="memEmailCheck" value="">
		                <button type="button" onclick="verifyEmail();" class="search-btn">이메일 인증</button>
		            </div>
		
		            <div class="div-group">
		                <label for="memPhone">회원 연락처:</label>
		                <input type="text" id="memPhone" name="memPhone" value="${member.memPhone}">
		            </div>
		
		            <div class="div-group">
		                <label for="memBirthDate">회원 생년월일:</label>
		                <input type="text" id="memBirthDate" name="memBirthDate" value="${member.memBirthDate}">
		            </div>
		
		            <div class="div-group">
		                <label for="memAddress">회원 거주지:</label>
		                <input type="text" id="memAddress" name="memAddress" value="${member.memAddress}">
		                <button type="button" id="search-address-btn" class="search-btn">주소명 검색</button>
		            </div>
		            
		            <div style="display: flex; justify-content: space-around;">
		            	<button type="button" style="background-color: #0000d9; opacity : 0.4; border: 1px soild #0000d9; color: #f5f5f5;" onclick="location.replace('${path}/member/logout.do')">로그아웃</button>
		            	<button type="submit" style="background-color: #00d900; border: 1px soild #00d900;">회원정보수정</button>
		            	<button type="button" style="background-color: #ff0101; opacity : 0.44; border: 1px soild #ff0101; color: #f5f5f5;" onclick="location.replace('${path}/member/delete.do?memId=${member.memId}')">회원탈퇴</button>
		            </div>
	            </form>
            </div>
        </main>
    </div>
</section>
<script>
	document.addEventListener("DOMContentLoaded", () => {
	    const menuItems = document.querySelectorAll(".menu-bar li");
	    const contentHeader = document.querySelector(".content-header h2"); // h2 요소 선택
	    const contentArea = document.querySelector(".content-display"); // 내용 표시 영역 선택
	
	    menuItems.forEach(item => {
	        item.addEventListener("click", () => {
	            const endpoint = item.getAttribute("data-endpoint");
	
	            // h2 내용을 클릭한 메뉴의 텍스트로 변경
	            contentHeader.textContent = item.textContent;
	
	            // AJAX 요청
	            fetch(endpoint, {
	                method: "GET",
	            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error("서버에 문제가 발생했습니다.");
                    }
                    return response.json(); // JSON 데이터를 파싱
                })
                .then(data => {
                    switch (endpoint) {
                        case '/member/info.do':
                            contentArea.innerHTML = `
                                <div>
                                    <p>회원 아이디:</p><input type="text" name="memId" value="${data.memId}">
                                    <p>회원 이름:</p><input type="text" name="memName" value="${data.memName}">
                                    <p>회원 성별:</p><input type="text" name="memGender" value="${data.memGender}">
                                    <p>회원 이메일:</p><input type="text" name="memEmail" value="${data.memEmail}">
                                    <p>회원 연락처:</p><input type="text" name="memPhone" value="${data.memPhone}">
                                    <p>회원 생년월일:</p><input type="text" name="memBirthDate" value="${data.memBirthDate}">
                                    <p>회원 거주지:</p><input type="text" name="memAddress" value="${data.memAddress}">
                                </div>
                            `;
                            break;

                        case '/member/notification.do':
                            contentArea.innerHTML = `
                                <div>
                                    <h3>알림 내용</h3>
                                    <p>알림 항목 1: ${data.notification1}</p>
                                    <p>알림 항목 2: ${data.notification2}</p>
                                    <!-- 알림 내용 표시 -->
                                </div>
                            `;
                            break;

                        case '/member/productList.do':
                            contentArea.innerHTML = `
                                <div>
                                    <h3>상품 등록 내역</h3>
                                    <ul>
                                       
                                    </ul>
                                </div>
                            `;
                            break;

                        case '/member/downloadHistory.do':
                            contentArea.innerHTML = `
                                <div>
                                    <h3>다운로드 내역</h3>
                                    <p>${data.downloadHistory}</p>
                                    <!-- 다운로드 내역 표시 -->
                                </div>
                            `;
                            break;

                        case '/member/cart.do':
                            contentArea.innerHTML = `
                                <div>
                                    <h3>장바구니</h3>
                                    <ul>
                                        
                                    </ul>
                                </div>
                            `;
                            break;

                        default:
                            contentArea.innerHTML = "<p>해당 항목에 대한 정보를 찾을 수 없습니다.</p>";
                            break;
                    }
                })
                .catch(error => {
                    contentArea.innerHTML = `<p style="color: red;">${error.message}</p>`;
                });
	        });
	    });
	});
	
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
	
	function sendVerificationEmail() {
	    const email = document.getElementById("memEmail").value;
	    
	    if (email) {
	        $.ajax({
	            url: '${path}/email/verification.do', // 서버에서 이메일을 발송하는 JSP로 요청
	            type: 'POST',
	            data: { memEmail: email },
	            success: function(response) {
	                alert("인증번호가 이메일로 전송되었습니다.");
	                document.getElementById("email-verification-section").classList.remove("hidden");
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
	    const emailCheck = document.getElementById("memEmailCheck").value;
	    
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
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>