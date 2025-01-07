<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>주소 검색</title>
  <style>
    /* 자식 페이지 스타일을 꾸밈 */
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }
    #search-container {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    #search-input {
      width: 70%;
      max-width: 500px;
      padding: 10px;
      font-size: 16px;
    }
    #results {
      list-style: none;
      padding: 0;
      margin: 10px 0;
      max-height: 200px;
      overflow-y: auto;
      border: 1px solid #ddd;
      width: 100%;
      max-width: 500px;
    }
    #results li {
      padding: 10px;
      cursor: pointer;
      border-bottom: 1px solid #ddd;
    }
    #results li:hover {
      background-color: #f0f0f0;
    }
  </style>
</head>
<body>
  <div id="search-container">
    <h2>주소 검색</h2>
    <form action="${path}/member/searchAddressResult.do">
      <input type="text" id="search-input" name="address" value="${address}" placeholder="주소를 입력하세요" />
      <button type="submit">검색</button>
    </form>
    <ul id="results">
	    <c:if test="${not empty results}">
			  <c:forEach var="addressResult" items="${results}">
			    <li onclick="selectAddress('${addressResult.address}', '${addressResult.lat}', '${addressResult.lng}')">
			      ${addressResult.address}
			    </li>
			  </c:forEach>
		</c:if>
		<c:if test="${empty results}">
			<li>조회된 결과가 없습니다.</li>
		</c:if>
	</ul>
	
  </div>

  <script>
    // 주소 선택 시 부모창으로 값 전달
    function selectAddress(address, lat, lng) {
      // 부모창의 #address-input에 주소 입력
      window.opener.document.getElementById('address-input').value = address;
      // 부모창의 #memLatitude와 #memLongitude에 위도, 경도 입력
      window.opener.document.getElementById('memLatitude').value = lat;
      window.opener.document.getElementById('memLongitude').value = lng;
      // 자식 창을 닫음
      window.close();
    }
  </script>
</body>
</html>
