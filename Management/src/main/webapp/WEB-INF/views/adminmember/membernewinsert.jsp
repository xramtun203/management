<%@page import="csh.trade.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원 가입</title>
<style type="text/css">
#signupForm label[for] {
	width: 120px;
	display: inline-block;
}

#signupForm label {
	font-size: 14px;
	padding: 5px 0;
}

#signupForm input {
	border: 1px solid #ccc;
	padding: 2px 5px;
	vertical-align: middle;
	border-radius: 5px;
}

#signupForm input.error, #signupForm textarea.error {
	border: 1px dashed red;
}

#signupForm label.error {
	color: red;
	width: auto;
	font-size: 12px;
	padding: 0 10px;
}
</style>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="./assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./css/styles.css" rel="stylesheet" />
<link href="./css/member.css" rel="stylesheet" />
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/login-validity.js" type="text/javascript"></script>
</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light">관리자 페이지</div>
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="./MemberLoginm.do">로그인</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="./MemberNewInsertm.do">회원 가입</a> <a
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
						</ul>
					</div>
				</div>
			</nav>
			<!-- Page content-->
			<div class="container-fluid centerbox01">
				<h1 class="mt-4 titlegrad01">회원 가입</h1>
				<br>
				<div>
					<form id="signupForm" name="join" action="./MemberNewInsert.do"
						method="post" enctype="application/x-www-form-urlencoded">
						<fieldset class="middleset">
							<div>
								<p>
									<label for="name"> 이름 * </label> <input type="text" name="name"
										id="name" maxlength="12" placeholder="이름 Varchar2(12)">
								</p>
								<p>
									<label for="id"> 아이디* </label> <input type="text" id="id"
										name="id" maxlength="20" size="20"
										placeholder="아이디 Varchar2(20)">
								</p>
								<p>
									<label for="passwd"> 비밀번호* </label> <input type="password"
										id="passwd" name="passwd" maxlength="20" size="20"
										placeholder="비밀번호 Varchar2(20)">
								</p>
								<p>
									<label for="pwdre"> 비밀번호 확인* </label> <input type="password"
										id="pwdre" name="pwdre" maxlength="20" size="20"
										placeholder="비밀번호 확인">
								</p>
								<p>
									<label for="mobile"> 전화번호* </label> <input type="text"
										id="mobile" name="mobile" maxlength="20" size="20"
										placeholder="전화번호 Varchar2(20)">
								</p>
								<p>
									<label for="address"> 주소 </label> <input type="text"
										id="address" name="address" maxlength="100" size="30"
										placeholder="주소 Varchar2(100)">
								</p>
								<p>
									<label for="birthdate"> 생일 </label> <input type="date"
										name="birthdate" id="birthdate">
								</p>
								<p>
									<label for="agree"> 약관 동의* </label> <label> 동의합니다. <input
										type="checkbox" name="agree" id="agree">
									</label>
								</p>
								<div>
									<input type="submit" value="회원가입" class="submit"> <input
										type="button" style="border-radius: 5px;" value="취소"
										onclick="location.href='./MemberLoginm.do'">
								</div>
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
