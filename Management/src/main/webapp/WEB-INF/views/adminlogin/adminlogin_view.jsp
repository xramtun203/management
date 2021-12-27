<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${memberDTO.passwd == passwd}">
<script type="text/javascript">
alert(" ${id} 로그인 되었습니다.")
location.href="./HomeMain.do"
</script>
</c:if>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min_4.5.0.css">
<script src="../js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<script type="text/javascript">
alert(" 로그인에 실패했습니다. \n 아이디와 비밀번호를 확인하세요.")
history.back();
</script>
</head>
<body>
<div class="container p-3 my-3 border">
</div>

</body>
</html>