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
<title>아이템 거래 게시판</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="./assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./css/styles.css" rel="stylesheet" />
<link href="./css/adminboard.css" rel="stylesheet" />
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/board-validity.js" type="text/javascript"></script>
</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light">관리자 페이지</div>
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="./MemberLoginm.do">로그아웃</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="./BoardInsertm.do">게시글 작성</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="./BoardListService.do">게시글 목록</a> <a
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
								aria-expanded="false">회원 페이지</a>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdown">
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#!">회원 관련 something</a> <a
										class="dropdown-item" href="#!">회원 관련 something</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- Page content-->
			<div class="container-fluid">
				<h1 class="mt-4"></h1>

				<div style="width: 90%; margin: 0 auto; margin-top: 50px;">
				<p class="allPost">
				검색 글: &nbsp; <strong>${searchlistcount}</strong>개
				</p>
					<table class="tableop01">
						<c:choose>
							<c:when test="${searchlistcount>0}">
								<thead>
									<tr class="lineH01"
										style="background: linear-gradient(to right top, #ccdeff, #ffe9f4);">
										<th scope="col" width="7%" style="text-align: center;">No</th>
										<th scope="col" width="60%" style="text-align: center;">제목
										</th>
										<th scope="col" width="15%" style="text-align: center;">
											글쓴이</th>
										<th scope="col" width="18%" style="text-align: center;">
											등록일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="search" items="${searchBoardlist}">
										<tr class="lineH01">
											<td><a href="./BoardSelect.do?boardno=${search.boardno}">${search.boardno}</a></td>
											<td>${search.boardtag} - ${search.boardtitle}</td>
											<td>${search.id}</td>
											<td>${search.boarddate}</td>
										</tr>
									</c:forEach>
							</c:when>
						</c:choose>
						<c:if test="${searchlistcount==0}">
							<tr>
								<td>등록된 게시글이 없습니다.</td>
							</tr>
						</c:if>
						</tbody>
					</table>
					<div style="text-align: right; margin-top: 10px;">
						<button class="button02"
							onclick="location.href='./BoardInsertm.do'">
							글쓰기<br>
						</button>
					</div>
					<br>
					<div class="paging01">
					<c:choose>
						<c:when test="${page <= 1}"> [이전]&nbsp; </c:when>
						<c:otherwise>
							<a href="./BoardListService.do?page=${page-1}" class="pagingdeco" style="padding-right: 10px;">[이전]</a>&nbsp;
									</c:otherwise>
					</c:choose>
					<c:forEach var="start" begin="${startpage}" end="${endpage}"
						step="1">
						<c:choose>
							<c:when test="${start eq page}">[${start}]</c:when>
							<c:otherwise>
								<a href="./BoardListService.do?page=${start}" class="pagingdeco">[${start}]</a>&nbsp; 
										</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${page >= maxpage}">[다음] </c:when>
						<c:otherwise>
							<a href="./BoardListService.do?page=${page+1}" class="pagingdeco" style="padding-left: 10px;">[다음]</a>
						</c:otherwise>
					</c:choose>
					</div>
					<!-- <p class="paging01">
						<a href="#" class="pagingdeco" style="padding-right: 10px;">
							이전 5개 </a> <span> <strong>1</strong> <a href="#"
							class="pagingdeco">2</a> <a href="#" class="pagingdeco">3</a> <a
							href="#" class="pagingdeco">4</a> <a href="#" class="pagingdeco">5</a>
						</span> <a href="#" class="pagingdeco" style="padding-left: 10px;">다음
							5개</a>
					</p> -->
				</div>
				<div class="postbox01">
					<form action="./BoardSearch.do" method="post" name="searchForm">
						<fieldset>
							<div>
								<label for="keyword"></label> <input type="search"
									class="inputbut01" id="keyword" name="keyword"
									placeholder="검색어를 입력하세요."> <input type="button"
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
	<script src="../js/scripts.js"></script>
</body>
</html>
