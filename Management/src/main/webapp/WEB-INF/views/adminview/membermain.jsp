<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 회원 관리</title>
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
            <div class="border-end" id="sidebar-wrapper">
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
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">메뉴</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="#!"></a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리자 페이지</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <div class="dropdown-divider"></div>
                                       <a class="dropdown-item" href="./MemberMain.do">회원 관리</a> 
                                       <a class="dropdown-item" href="./Boardmain.do">게시판 관리</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                   <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그인 메뉴</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="./MemberLogOut.do">로그아웃</a>
                                        <a class="dropdown-item" href="#!">회원정보수정</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid centerbox01" >
                    <h1 class="mt-4">관리자 page</h1><br>
        		    <h3>회원 관리 메인 페이지입니다. <br> 좌측의 메뉴를 이용하여 <br>회원 관리를 진행할 수 있습니다. </h3>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./js/scripts.js"></script>
    </body>
</html>
