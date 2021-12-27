$(function() {
	$("#boardForm").validate({
		rules : {
			sellorbuy : {
				required : true,
			},
			boardtitle : {
				required : true,
				minlength : 5,
				maxlength : 100
			},
			boardcontent : {
				required : true,
				minlength : 1,
				maxlength : 600
			},
			agree : "required"
		},
		messages : {
			sellorbuy : {
				required : "말머리를 선택하세요",
			},
			boardtitle : {
				required : "제목을 입력하세요",
				minlength : "제목은 최소 5자 이상입니다.",
				maxlength : "제목은 최대 100자 이하입니다."
			},
			boardcontent : {
				required : "게시글 내용을 입력하세요",
				minlength : "게시글 내용은 최소 1글자 이상입니다.",
				maxlength : "게시글 내용은 최대 600글자 이하입니다."
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
	if (confirm("아이디를 삭제 하시겠습니까?")) {
		mdelete.submit();
	}
}
function gotradelogin() {
	location.href = "../adminlogin/adminlogin.html"
}

function goMembermain() {
	location.href = "../adminview/membermain.html"
}
function goBoardmain() {
	location.href = "../adminview/boardmain.html"
}
function goBoardlist() {
	location.href = "../adminboard/boardlist.html"
}
function goBoardinsert() {
	location.href = "../adminboard/boardinsert.html"
}
function searchForm() {
	search = document.searchForm

	if (!search.keyword.value) {
		alert("검색어를 입력하세요")
		search.keyword.focus()
		return false;
	}
	// else { 검색어를 넣었을때 어디로 이동할건지
	// location.href ="";
	// }
}

function deleteconfirm() {
	if (!confirm("게시글을 삭제하시겠습니까?")) {
		alert("게시글 삭제를 취소하셨습니다.");
	} else {
		alert("게시글이 삭제되었습니다.");
		location.href = "../adminboard/boardlist.html"
	}
}

// function warnEmpty() {
// alert("댓글을 입력해주세요")
// }
// function dateToString(date) {
// const dateString = date.toISOString();
// const dateToString = dateString.substring(0,10) + " " +
// dateString.substring(11, 19);
// return dateToString
// }
// function submitComment() {
// const newcommentEL = document.getElementById("new-comment")
// const newcomment = newcommentEL.value.trim();
// if (newcomment) {
// const dateEL = document.createElement('div')
// dateEL.classList.add("comment-date")
// const dateString = dateToString(new Date())
// dateEL.innerText = dateString;
//		
// const contentEL = document.createElement('div')
// contentEL.classList.add('comment-content')
// contentEL.innerText = newcomment;
//		
// const commentEL = document.createElement('div')
// commentEL.classLsit.add('comment-row')
// commentEL.appendChild(dateEL)
// commentEL.appendChild(contentEL)
//		
// document.getElementById('comments').appendChild(commentEL)
// newcommentEL.value = ""
//			
// const countEL = document.getElementById('comments-count')
// const count = countEL.innerText
// countEL.innerText = parseInt(count) + 1;
// }
// else warnEmpty();
// }

$(function( ) {
	// 입력 양식의 데이터에 대한 유효성 검사를 하고 전송한다.
	$("#comment_form").submit(function( ) {
	// 시스템의 현재 날짜와 시각을 조회하거나 계산하기 위한 객체를 선언한다.
	date = new Date( );
	// 4 자리수의 연도로 정보를 반환한다.
	yy = date.getFullYear( );
	//월로 정보를 반환하며 월의 인덱스 0부터 11까지이므로 1을 더한다.
	mm = date.getMonth( )+1;
	// 1~31 사이의 날짜로 정보를 반환한다.
	dd = date.getDate( );
	// 0~23 사이의 시간으로 정보를 반환한다.
	hh = date.getHours( );
	// 0~59 사이의 분으로 정보를 반환한다.
	mi = date.getMinutes( );
	// 0~59 사이의 초로 정보를 반환한다.
	ss = date.getSeconds( );
	// 날짜의 형식을 설정하고 할당한다.
	today = yy + "-" + mm + "-" + dd + " " + hh + ":" + mi + ":" + ss;
	new_li = $("<li>");
	//선택한 요소에서 comment_item 클래스를 추가한다.
	new_li.addClass("comment_item");
	writer_p = $("<p>");
	//선택한 요소에서 writer 클래스를 추가한다.
	writer_p.addClass("writer");
	name_span = $("<span>");
	//선택한 요소에서 name 클래스를 추가한다.
	name_span.addClass("name");
	// name 아이디를 탐색하여 속성값으로 반환한 내용을 설정한다.
	name_span.html($("#name").val( ) + "님");
	date_span = $("<span>");
	// 현재 날짜 형식의 내용을 설정한다.
	date_span.html(" / " + today + " ");
	del_input = $("<input>");
	// 선택한 요소의 속성값을 반환한다.
	del_input.prop({
	"type" : "button",
	"class" : "commentbtn02"
	});
	//선택한 요소에서 delete_btn 클래스를 추가한다.
	del_input.addClass("delete_btn");
	content_p = $("<p>");
	// comment 아이디를 탐색하여 속성값으로 반환한 내용을 설정한다.
	content_p.html($("#comment").val( ));
	// 선택한 요소의 끝에 지정된 내용을 삽입한다.
	writer_p.append(name_span).append(date_span).append(del_input);
	new_li.append(writer_p).append(content_p);
	$("#comment_list").append(new_li);
	// name 아이디를 탐색하여 비어있는 속성값으로 반환한다.
	$("#name").val("");
	// comment 아이디를 탐색하여 비어있는 속성값으로 반환한다.
	$("#comment").val("");
	return false;
	});
	// click 이벤트로 요소에 연속해서 원하는 이벤트를 발생시키고 $(document) 함수를 통해서 document 객체를 호출한다.
	$(document).on("click", ".delete_btn", function( ) {
	// 확인과 취소 두 버튼을 가지며 메시지를 지정할 수 있는 대화 상자를 띄운다.
	if(confirm("선택하신 댓글을 삭제하시겠습니까?")) {
	// 선택한 요소의 모든 부모 요소를 반환하고 제거한다.
	$(this).parents(".comment_item").remove( );
	}
	});
	});
	
