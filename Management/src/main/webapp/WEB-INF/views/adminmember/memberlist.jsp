<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원 목록</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="./assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./css/styles.css" rel="stylesheet" />
<link href="./css/member.css" rel="stylesheet" />
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/login-validity.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$("#limit").change(function() {
		location.href = "./MemberList.do?limit="+$(this).val();
	})
	if (${!empty param.limit}) {
		$("#limit").val(${param.limit}).prop('selected', true);
	}
})


</script>
</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light">관리자 페이지</div>
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="./MemberLogOut.do">로그아웃</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="./MemberInsertm.do">회원 가입</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="./MemberList.do">회원 목록</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">etc</a>
			</div>
		</div>
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<div class="container-fluid">
					<button class="btn btn-primary" id="sidebarToggle">메뉴</button>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
							<li class="nav-item active"><a class="nav-link" href="#!"></a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
								role="button" data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">관리자 페이지</a>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdown">
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="./MemberMain.do">회원 관리</a> <a
										class="dropdown-item" href="./BoardMain.do">게시판 관리</a>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
								role="button" data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">회원 정보</a>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdown">
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="./MemberLogOut.do">로그 아웃</a> <a
										class="dropdown-item" href="#">회원 정보 수정</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- Page content-->
			<div class="container-fluid centerbox01">
				<h1 class="mt-4 titlegrad01" style="text-align: center;">회원 목록</h1>
				<div style="width: 90%; margin: 0 auto; text-align: center;">
					<p class="allPost" style="float: left;">
						전체 글: &nbsp; <strong>${listcount}</strong>개

					</p>
					<p style="text-align: right;">
						<select name="limit" id="limit">
							<option value="10">10개 보기
							<option value="20">20개 보기
						</select>
					</p>
					<table class="tableop01">
						<thead>
							<tr class="lineH01 shadowbox"
								style="background: linear-gradient(to right top, #ccdeff, #ffe9f4);">
								<th scope="col" width="30%" class="fontsty">이름</th>
								<th scope="col" width="40%" class="fontsty">아이디</th>
								<th scope="col" width="30%" class="fontsty">전화번호</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="memberList" items="${memberList}">
								<tr class="lineH01">
									<td class="fontsty">${memberList.name}</td>
									<td class="fontsty"><a style="text-decoration: none;"
										href="./MemberDetail.do?id=${memberList.id}">${memberList.id}</a></td>
									<td class="fontsty">${memberList.mobile}</td>
								</tr>
							</c:forEach>
							<c:if test="${empty memberList}">
								<tr>
									<td>등록된 회원이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				<br>
				<div class="paging01">
						<c:choose>
							<c:when test="${page <= 1}"> [이전]&nbsp; </c:when>
							<c:otherwise>
								<a href="./MemberList.do?page=${page-1}">[이전]</a>&nbsp;
									</c:otherwise>
						</c:choose>
						<c:forEach var="start" begin="${startpage}" end="${endpage}"
							step="1">
							<c:choose>
								<c:when test="${start eq page}">[${start}]</c:when>
								<c:otherwise>
									<a href="./MemberList.do?page=${start}">[${start}]</a>&nbsp; 
										</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${page >= maxpage}">[다음] </c:when>
							<c:otherwise>
								<a href="./MemberList.do?page=${page+1}">[다음]</a>
							</c:otherwise>
						</c:choose>
					</div>
			</div>
			<div>
				<div class="postbox01">
					<form id="searchForm" action="./MemberSearch.do" method="post" name="searchForm">
						<fieldset>
							<div>
								<label for="keyword"></label> <input type="search"
									class="inputbut01" id="keyword" name="keyword"
									placeholder="검색어를 입력하세요."> <input type="submit"
									class="button03" value="검색">
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="./js/scripts.js"></script>
</body>
</html>
