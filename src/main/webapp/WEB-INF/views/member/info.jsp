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
        min-height: 300px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f9f9f9;
        padding: 20px;
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
                <!-- AJAX로 불러온 내용 표시 -->
                여기에 내용이 표시됩니다.
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
                    return response.text();
                })
                .then(data => {
                    contentArea.innerHTML = data; // 서블릿에서 받은 HTML 내용을 표시
                })
                .catch(error => {
                    contentArea.innerHTML = `<p style="color: red;">${error.message}</p>`;
                });
        });
    });
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>