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
<title>로그인</title>
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
		<div class="border-end" id="sidebar-wrapper">
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
				<h1 class="mt-4 titlegrad01">LOGIN</h1>
				<br>
				<form name="modifiy" action="./MemberLoginCheck.do" method="post"
					onsubmit="return validateForm()"
					enctype="application/x-www-form-urlencoded">
					<fieldset>
						<div class="boxboxbox01">
							<div class="a">
								<p>
									<label for="id"></label> <input type="text" id="id" name="id"
										class="id shadowbox fontS2" minlength="7" maxlength="20"
										size="20" required placeholder="아이디"
										oninvalid="this.setCustomValidity('아이디를 입력하세요.')"
										oninput="setCustomValidity('')">
								</p>
								<p>
									<label for="passwd"></label> <input type="password" id="passwd"
										name="passwd" class="id shadowbox fontS2" minlength="7"
										maxlength="20" size="20" required placeholder="비밀번호"
										oninvalid="this.setCustomValidity('비밀번호를 입력하세요.')"
										oninput="setCustomValidity('')">
								</p>
							</div>
							<input type="submit" class="submit button001 btnsubmit01" value="">
						</div>
						<input type="checkbox" class="checkboxsize" name="remember"
							id="remember" value="Remember Ur ID?"> <label
							class="fontS1" for="remember">Remember ID? </label><a
							href="./MemberNewInsertm.do" class="fontS3"> 회원가입 </a>
					</fieldset>
				</form>
				<p></p>
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
