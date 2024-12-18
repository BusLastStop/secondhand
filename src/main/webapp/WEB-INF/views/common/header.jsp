<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${path}/resources/images/green.png" type="image/x-icon"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	*{
		font-family: "Noto Sans KR", serif;
		font-optical-sizing: auto;
		font-weight: 500;
		font-style: normal;
		border:1px solid #9ccc65;
		color:#212121;
	}
	body{ overflow-y:scroll;overflow-x:hidden; }
	header{display:flex;flex-direction:column;align-items:center;}
	div#headerUser{display:flex;justify-content:flex-end;align-items:center;width:80%;padding:3px}
	div#headerMenu{display:flex; justify-content:center;align-items:flex-start;width:80%}
	div#headerMenu h2{ margin:0; }
	div#headerMenu button{ background-color:f5f5f5;color:9ccc65;border:1px solid #9ccc65;margin-left:20px;font-size:16px;width:65px;height:32px; }
	div#footer{display:flex;justify-content:space-around;align-items:center}
	#headerUser a{ margin-right:10px; }
	#headerMenu>*{cursor:pointer;}
	#category{display:flex;padding:0;margin-right:5%;justify-contents:center;align-items:center;}
	#category>li{margin-left:10px;margin-right:10px}
	.writer-container{background-color:f5f5f5;}
	.writer-header{display:flex;justify-content:space-between;align-items:center;}
	ul>li{list-style-type:none;}
	a{ text-decoration:none; }
	.dropdown{ overflow:visible;max-height:21px;text-align:right;z-index:10; }
	.dropdown>ul{ padding:0;margin:10px 0 0 0;display:flex;flex-direction:column;justify-content:center;background-color:white; }
	.dropdown li{ padding:2px;text-align:center;width:90px;height:24px; }
	.dropdownList{ display:none;cursor:pointer; }
</style>
<title>온라인 강의 사이트</title>
</head>
<body>
<header>
	<div id="headerMenu">
		<a href="${path}"><img src="${path}/resources/images/green.png" width="100" height="60"></a>
		<div style="width:60%;">
			<form action="" method="get" style="display:flex;justify-content:center;align-items:center;height:60px;margin:0;font-size:16px;">
				<input type="text" name="search" placeholder="검색어 입력" style="width:70%;height:32px;">
				<button type="submit">검색</button>
			</form>
			<div style="display:flex;justify-content:center;align-items:center;">
				<h2 style="margin:5px 0 5px 0;">상품 목록</h2>
				<h2 style="margin:5px 0 5px 0;">지도, 상품</h2>
			</div>
		</div>
		<div style="display:flex;justify-content:center;align-items:center;">
			<h2 style="margin:8px 0 0 10px;">판매하기</h2>
			<h2 style="margin:8px 0 0 10px;">마이페이지</h2>
		</div>
	</div>
	<script>
		const dropdownList=()=>{
			document.querySelectorAll(".dropdownList").forEach(v=>{
				console.log(v.style.display);
				if(v.style.display=="none" || v.style.display=="") v.style.display="block";
				else v.style.display="none";
			})
		}
	</script>
</header>