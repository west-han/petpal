<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page - 내 정보</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">


h2, h3 {
	margin-bottom: 20px;
}

.list-group-item.active {
	background-color: #E4B075;
	border-color: #E4B075;
}

.accordion-button:not(.collapsed) {
	color: #007bff;
	background-color: #e9ecef;
}

a {
	text-decoration: none;
}
.category-header {
	list-style-type: none;
	text-align: center;
	padding: 10px 0;
	font-weight: bold;
	font-size: 1.2em;
}
.mypage{
	text-align: center;
}
</style>

<script type="text/javascript">
function memberOk() {
	const f = document.memberForm;
	let str;
	
	str = f.nickname.value;
    const nicknamePattern = /^[a-zA-Z가-힣0-9]{2,6}$/;
    if (!nicknamePattern.test(str)) {
        alert("닉네임은 2글자 이상 6자 이하의 영어, 한글, 숫자만 가능합니다.");
        f.nickname.focus();
        return;
    }
    
    if ($('#userNicknameValid').val() !== 'true') {
        alert("닉네임 중복 체크를 해주세요");
        f.nickname.focus();
        return;
    }
    
    str = f.userName.value;
    if( !/^[가-힣]{2,5}$/.test(str) ) {
        alert("이름을 다시 입력하세요. ");
        f.userName.focus();
        return;
    }
    
    str = f.birth.value;
    if( !str ) {
        alert("생년월일를 입력하세요. ");
        f.birth.focus();
        return;
    }
    
    str = f.tel1.value;
    if( !str ) {
        alert("전화번호를 입력하세요. ");
        f.tel1.focus();
        return;
    }

    str = f.tel2.value;
    if( !/^\d{3,4}$/.test(str) ) {
        alert("숫자만 가능합니다. ");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
    if( !/^\d{4}$/.test(str) ) {
    	alert("숫자만 가능합니다. ");
        f.tel3.focus();
        return;
    }
    f.submit();
}
function userNicknameCheck() {
    // 닉네임 중복 검사
    let nickname = $('#nickname').val();

    const nicknamePattern = /^[a-zA-Z가-힣0-9]{2,6}$/;
    if (!nicknamePattern.test(nickname)) {
        let str = '닉네임은 2글자 이상 6자 이하의 영어, 한글, 숫자만 가능합니다.';
        $('#nickname').focus();
        $('.userNickname-box').find('.help-block').html(str);
        return;
    }
    let url = '${pageContext.request.contextPath}/myPage/userNicknameCheck';

    // AJAX:POST-JSON
    $.post(url, { nickname: nickname }, function(data) {
        let passed = data.passed;

        console.log("AJAX Response:", data); // 응답 확인

        if (passed === 'true') {
            let str = '<span style="color:blue; font-weight: bold;">' + nickname + '</span> 닉네임은 사용 가능합니다.';
            $('.userNickname-box').find('.help-block').html(str);
            $('#userNicknameValid').val('true');
        } else {
            let str = '<span style="color:red; font-weight: bold;">' + nickname + '</span> 닉네임은 사용할 수 없습니다.';
            $('.userNickname-box').find('.help-block').html(str);
            $('#nickname').val('');
            $('#userNicknameValid').val('false');
            $('#nickname').focus();
        }
    }, 'json').fail(function(jqXHR, textStatus, errorThrown) {
        console.error("AJAX Error:", textStatus, errorThrown); // 오류 확인
    });
}

function updatePassWord() {
	const f = document.updatePwdForm;
	let str;
	
	str = f.password.value;
	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) { 
		alert("패스워드를 다시 입력 하세요. ");
		f.password.focus();
		return;
	}
	
	
	str = f.newPassword1.value;
	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) { 
		alert("패스워드를 다시 입력 하세요. ");
		f.newPassword1.focus();
		return;
	}

	if( str !== f.newPassword2.value ) {
        alert("패스워드가 일치하지 않습니다. ");
        f.newPassword2.focus();
        return;
	}
	
	f.submit();
}
</script>
</head>
<body>
<div class="container mt-5">
        <div class="row">
			<div class="col-md-2">
				<h3 class="mypage">마이페이지</h3>
				<ul class="list-group">
					<li class="category-header">my 쇼핑</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/orderlist">주문 내역/배송 조회</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/cancel-return-change">취소/반품/교환/환불 내역</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/mycoupon">쿠폰함</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/mypoint">적립금</a></li>
					<li class="category-header">my 정보</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/mypet">나의 펫</a></li>
					<li class="list-group-item active"><a href="${pageContext.request.contextPath}/myPage/mymodify">내 정보</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/myaddress">나의 배송지</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/likelist">찜 리스트</a></li>
					<li class="category-header">my 활동</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/myreview">리뷰관리</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}">1대1 문의 내역</a></li>
				</ul>
			</div>
            
            <div class="col-md-9 ms-5">
                <h2>내 정보</h2>
                <div class="accordion accordion-flush" id="accordionFlushExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                현재 내 정보
                            </button>
                        </h2>
                        <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">
                                <p><strong>이름:</strong> ${dto.userName }</p>
                                <p><strong>생년월일:</strong> ${dto.birth }</p>
                                <p><strong>전화번호:</strong> ${dto.tel }</p>
                                <p><strong>닉네임:</strong> ${dto.nickname }</p>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                정보 수정
                            </button>
                        </h2>
                        <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">
                                <form action="${pageContext.request.contextPath}/myPage/updateMember" method="post" name="memberForm">
                                    <div class="form-group">
                                        <label for="userName">이름</label>
                                        <input type="text" class="form-control" id="userName" name="userName" value="${dto.userName }">
                                    </div>
                                    <div class="form-group">
                                        <label for="birth">생년월일</label>
                                        <input type="date" class="form-control" id="birth" name="birth" value="${dto.birth}">
                                    </div>
                                    <div class="form-group row">
									    <label for="tel1">전화번호</label>
									    <div class="col-sm-10 row">
									        <div class="col-sm-3 pe-1">
									            <input type="text" name="tel1" id="tel1" class="form-control" maxlength="3" value="${dto.tel1 }">
									        </div>
									        <div class="col-sm-1 px-1">
									            <p class="form-control-plaintext text-center">-</p>
									        </div>
									        <div class="col-sm-3 px-1">
									            <input type="text" name="tel2" id="tel2" class="form-control" maxlength="4" value="${dto.tel2}">
									        </div>
									        <div class="col-sm-1 px-1">
									            <p class="form-control-plaintext text-center">-</p>
									        </div>
									        <div class="col-sm-3 ps-1">
									            <input type="text" name="tel3" id="tel3" class="form-control" maxlength="4" value="${dto.tel3 }">
									        </div>
									    </div>
									</div>
                                    <div class="form-group">
                                        <label for="nickname">닉네임</label>
                                        <div class="input-group userNickname-box">
                                        <input type="text" class="form-control" id="nickname" name="nickname" value="${dto.nickname}">
                                        <button class="btn btn-outline-secondary" type="button" id="nickname-check" onclick="userNicknameCheck();">중복 체크</button>
                                        <small class="form-control-plaintext help-block">닉네임을 중복체크 해주세요.</small>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-end mt-3">
        								<button type="button" class="btn btn-success" onclick="memberOk();">저장</button>
        								<input type="hidden" name="userNicknameValid" id="userNicknameValid" value="false">
    								</div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                비밀번호 변경
                            </button>
                        </h2>
                        <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">
                                <form name="updatePwdForm" action="${pageContext.request.contextPath}/myPage/updatePassWord" method="post">
                                    <div class="form-group">
                                        <label for="password">현재 비밀번호</label>
                                        <input type="password" class="form-control" id="password" name="password">
                                    </div>
                                    <div class="form-group">
                                        <label for="newPassword1">새 비밀번호</label>
                                        <input type="password" class="form-control" id="newPassword1" name="newPassword1">
                                    </div>
                                    <div class="form-group">
                                        <label for="newPassword2">새 비밀번호 확인</label>
                                        <input type="password" class="form-control" id="newPassword2" name="newPassword2">
                                    </div>
                                    <button type="button" class="btn btn-primary" onclick="updatePassWord();">비밀번호 변경</button>
                                </form>
                            </div>
                        </div>
                        <div>
                        ${message}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>