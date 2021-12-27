$(function( ) {
$.validator.addMethod("phone", function (value, element) {
    return this.optional(element) || /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/.test(value);
});
$.validator.addMethod("noblank", function (value, element) {
    return this.optional(element) || value.indexOf(" ") == -1;
} , "메세지");

$("#signupForm").validate({
rules : {
name : "required",
id : {
required : true,
minlength : 7,
maxlength : 20,
noblank : true
},
passwd : {
required : true,
minlength : 7,
maxlength : 20,
noblank : true
},
pwdre : {
required : true,
equalTo : "#passwd",
noblank : true
},
mobile : {
required : true,
maxlength : 20,
noblank : true,
phone : true
},
agree : "required"
},

messages : {
name : "이름을 입력하세요.",
id : {
required : "아이디를 입력하세요.",
minlength : "최소 7글자입니다.",
maxlength : "최대 20글자 입니다.",
noblank : "공백은 입력할 수 없습니다.",
},
passwd : {
required : "비밀번호를 입력하세요.",
minlength : "최소 7자입니다.",
maxlength : "최대 20자입니다.",
noblank : "공백은 입력할 수 없습니다.",
},
pwdre : {
required : "비밀번호를 확인하세요.",
equalTo : "비밀번호가 틀립니다.",
noblank : "공백은 입력할 수 없습니다.",
},
mobile : {
required : "전화번호를 입력하세요.",
maxlength : "최대 20자리입니다.",
noblank : "공백은 입력할 수 없습니다.",
phone : "010-0000-0000 형식입니다."
},
agree : "약관 동의에 체크해 주세요."
}
});
});



$(function( ) {
$("#deleteForm").validate({
rules : {
id : {
required : true,
minlength : 7,
maxlength : 20,
noblank : true
},
passwd : {
required : true,
minlength : 7,
maxlength : 20,
noblank : true
},
agree : "required"
},
messages : {
id : {
required : "  아이디를 입력하세요.",
minlength : "최소 7글자입니다.",
maxlength : "최대 20글자 입니다.",
noblank : "공백은 입력할 수 없습니다."
},
passwd : {
required : "비밀번호를 입력하세요.",
minlength : "최소 7자입니다.",
maxlength : "최대 20글자입니다.",
	noblank : "공백은 입력할 수 없습니다.",
},
agree : "required"
}		
})
})

$(function( ) {
$("#searchForm").validate({
rules : {
id : {
required : true,
minlength : 7,
maxlength : 20,
noblank : true
},
agree : "required"
},
messages : {
id : {
required : " 아이디를 입력하세요.",
minlength : "최소 7글자입니다.",
maxlength : "최대 20글자 입니다.",
noblank : "공백은 입력할 수 없습니다."
},
agree : "required"
}		
})
})
function memberdelete() {
	mdelete = document.memdel;

	if (!mdelete.id.value) {
		alert("아이디를 입력하세요")
		mdelete.id.focus()
		return false;
	}
	if(confirm("아이디를 삭제 하시겠습니까?")){
		mdelete.submit();
	}
}
function gotradelogin() {
	location.href = "../adminlogin/adminlogin.html"
}

function goMembermain() {
	location.href = "../adminview/membermain.html"
}
function goBoarddmain() {
	location.href = "../adminview/boardmain.html"
}

function deleteconfirm() {
	if (!confirm(" 삭제하시겠습니까?")) {
		alert("삭제를 취소하셨습니다.");
	} else {
		alert(" 삭제되었습니다.");
		location.href = "../adminmember/memberlist.jsp"
	}
}






