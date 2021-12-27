<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>게시글 수정/삭제</title>
          <style type="text/css">
#boardForm input.error, #boardForm textarea.error {
	border: 1px dashed red;
}

#boardForm label.error {
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
        <link rel="stylesheet" type="text/css" href="./css/adminboard.css">
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
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="./MemberLogOut.do">로그아웃</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="./BoardInsertm.do">게시글 작성</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="./BoardListService.do">게시글 목록</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">etc</a>
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
                                        <a class="dropdown-item" href="./BoardMain.do">게시판 관리</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">회원 페이지</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">회원 관련 something</a>
                                        <a class="dropdown-item" href="#!">회원 관련 something</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                    <h1 class="mt-4"></h1>
                   <div>
<h1 align="center"></h1>
<form id="boardForm" name="content" action="./BoardUpdate.do" method="post" enctype="multipart/form-data">
<div class="postinserthead">
<br>

<div style="margin: 0 auto; width: 80%;">
<input type="text" style="height: 35px; width: 5%; text-align:center; border: solid 1px;  border-radius: 5px;" id="boardno" name="boardno" value="${boardDTO.boardno}" readonly>
<select id="boardtag" name="boardtag" style="height: 35px; width: 15%;  border-radius: 5px; margin-right: 10px;">
<option value="태그선택">말머리
<option value="삽니다">삽니다
<option value="팝니다">팝니다
<option value="etc">etc
</select>
<input class="postmar02" type="text" id="boardtitle" name="boardtitle" value="${boardDTO.boardtag} - ${boardDTO.boardtitle}">
<textarea id="boardcontent" name="boardcontent" class="postmar03" cols="0" rows="10" value="${boardDTO.boardcontent}" placeholder="${boardDTO.boardcontent}">
</textarea>
<div>
<a href='./BoardDownload.do?attachedfile=${boardDTO.attachedfile}'>${boardDTO.attachedfile}</a>
<input type="file" name="attachedfile" id="attachedfile">
</div>
<div style="text-align: right;">
<button type="submit" class="button01">수정</button>
<button type="button" class="button01" onclick="location.href='./BoardListService.do'">취소</button>
</div>
</div>

</div>
</form>
</div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../js/scripts.js"></script>
    </body>
</html>
