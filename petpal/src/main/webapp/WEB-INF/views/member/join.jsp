<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
    <title>회원가입 폼</title>
    <style type="text/css">
        body {
            background-color: #f8f9fa;
        }
        .registration-form {
            max-width: 600px;
            margin: 50px auto;
            background: #ffffff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #007bff;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .help-block {
            color: #6c757d;
        }
    </style>
    
    <script type="text/javascript">
    function memberOk() {
    	const f = document.memberForm;
    	let str;
    	
    	const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(str)) {
            alert("유효한 이메일을 입력해주세요.");
            f.email.focus();
            return;
        }
        
        if ($('#userEmailValid').val() !== 'true') {
            alert("이메일 중복 체크를 해주세요");
            f.email.focus();
            return;
        }
        
        if ($('#userNicknameValid').val() !== 'true') {
            alert("닉네임 중복 체크를 해주세요");
            f.nickname.focus();
            return;
        }
        
        str = f.nickname.value;
        const nicknamePattern = /^[a-zA-Z가-힣0-9]{2,6}$/;
        if (!nicknamePattern.test(str)) {
            alert("닉네임은 2글자 이상 6자 이하의 영어, 한글, 숫자만 가능합니다.");
            f.nickname.focus();
            return;
        }
    	
    	str = f.password.value;
    	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) { 
    		alert("패스워드를 다시 입력 하세요. ");
    		f.password.focus();
    		return;
    	}

    	if( str !== f.password2.value ) {
            alert("패스워드가 일치하지 않습니다. ");
            f.password2.focus();
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
        str = f.postalCode.value;
        if( ! str ) {
        	alert("우편번호를 입력해주세요 ");
            f.postalCode.focus();
            return;
        }
        str = f.address1.value;
        if( ! str ) {
        	alert("기본주소를 입력해주세요 ");
            f.address1.focus();
            return;
        }
        str = f.address2.value;
        if( ! str ) {
        	alert("상세주소를 입력해주세요 ");
            f.address2.focus();
            return;
        }
        
        

       	f.action = "${pageContext.request.contextPath}/member/join";
        f.submit();
    }
    function userEmailCheck() {
        // 이메일 중복 검사
        let email = $('#email').val();

        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
            let str = '유효한 이메일을 입력해주세요.';
            $('#email').focus();
            $('.userEmail-box').find('.help-block').html(str);
            return;
        }

        let url = '${pageContext.request.contextPath}/member/userEmailCheck';

        // AJAX:POST-JSON
        $.post(url, { email: email }, function(data) {
            let passed = data.passed;

            console.log("AJAX Response:", data); // 응답 확인

            if (passed === 'true') {
                let str = '<span style="color:blue; font-weight: bold;">' + email + '</span> 이메일은 사용 가능합니다.';
                $('.userEmail-box').find('.help-block').html(str);
                $('#userEmailValid').val('true');
            } else {
                let str = '<span style="color:red; font-weight: bold;">' + email + '</span> 이메일은 사용할 수 없습니다.';
                $('.userEmail-box').find('.help-block').html(str);
                $('#email').val('');
                $('#userEmailValid').val('false');
                $('#email').focus();
            }
        }, 'json').fail(function(jqXHR, textStatus, errorThrown) {
            console.error("AJAX Error:", textStatus, errorThrown); // 오류 확인
        });
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
        let url = '${pageContext.request.contextPath}/member/userNicknameCheck';

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

        
    </script>
</head>
<body>
    <div class="container">
        <div class="registration-form">
            <h2 class="text-center">회원가입</h2>
            <form name="memberForm" method="post">
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="email">이메일</label>
                    <div class="col-sm-10 userEmail-box">
                        <div class="input-group">
                            <input type="email" class="form-control" name="email" id="email" placeholder="이메일을 입력하세요">                           
                            <button class="btn btn-outline-secondary" type="button" id="email-check" onclick="userEmailCheck();">중복 체크</button>                           
                            <small class="form-control-plaintext help-block">이메일을 입력해주세요.</small>
                        </div>                       
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="password">패스워드</label>
                    <div class="col-sm-10">
                        <input type="password" name="password" id="password" class="form-control" autocomplete="off" placeholder="패스워드">
                        <small class="form-control-plaintext">패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</small>
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="password2">패스워드 확인</label>
                    <div class="col-sm-10">
                        <input type="password" name="password2" id="password2" class="form-control" autocomplete="off" placeholder="패스워드 확인">
                        <small class="form-control-plaintext">패스워드를 한번 더 입력해주세요.</small>
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="userName">이름</label>
                    <div class="col-sm-10">
                        <input type="text" name="userName" id="userName" class="form-control" placeholder="이름">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="nickname">닉네임</label>
                    <div class="col-sm-10 userNickname-box">
                        <div class="input-group">
                            <input type="text" name="nickname" id="nickname" class="form-control" placeholder="닉네임">
                            <button class="btn btn-outline-secondary" type="button" id="nickname-check" onclick="userNicknameCheck();">중복 체크</button>
                            <small class="form-control-plaintext help-block">닉네임을 입력해주세요.</small>
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="birth">생년월일</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" name="birth" id="birth" placeholder="생년월일을 입력하세요">
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="tel1">전화번호</label>
                    <div class="col-sm-10 row">
                        <div class="col-sm-3 pe-1">
                            <input type="text" name="tel1" id="tel1" class="form-control" maxlength="3">
                        </div>
                        <div class="col-sm-1 px-1" style="width: 2%;">
                            <p class="form-control-plaintext text-center">-</p>
                        </div>
                        <div class="col-sm-3 px-1">
                            <input type="text" name="tel2" id="tel2" class="form-control" maxlength="4">
                        </div>
                        <div class="col-sm-1 px-1" style="width: 2%;">
                            <p class="form-control-plaintext text-center">-</p>
                        </div>
                        <div class="col-sm-3 ps-1">
                            <input type="text" name="tel3" id="tel3" class="form-control" maxlength="4">
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="postalCode">우편번호</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" name="postalCode" id="postalCode" class="form-control" placeholder="우편번호" readonly>
                            <button class="btn btn-light" type="button" onclick="daumPostcode();">우편번호 검색</button>
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="address1">주소</label>
                    <div class="col-sm-10">
                        <input type="text" name="address1" id="address1" class="form-control" placeholder="기본 주소" readonly>
                        <div class="mt-2">
                            <input type="text" name="address2" id="address2" class="form-control" placeholder="상세 주소">
                        </div>
                    </div>
                </div>

                <button type="button" class="btn btn-primary w-100" onclick="memberOk();">회원가입</button>
                <input type="hidden" name="userEmailValid" id="userEmailValid" value="false">
                <input type="hidden" name="userNicknameValid" id="userNicknameValid" value="false">
                
                <div class="row">
					<p class="form-control-plaintext text-center">${message}</p>
			    </div>
            </form>
        </div>
    </div>
    

  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postalCode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>  
  
</body>
</html>
