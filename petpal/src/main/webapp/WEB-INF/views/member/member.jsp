<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<link rel="stylesheet" href="./02-signup.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 기존 CSS 스타일 그대로 유지 */
* {
	box-sizing: border-box;
	font-family: "Noto Sans CJK KR";
	font-style: normal;
}

body {
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 670px;
	height: 960px;
	margin-top: 60px;
	margin-bottom: 60px;
	background: #ffffff;
	border: 1px solid #aacdff;
	box-shadow: 7px 7px 39px rgba(0, 104, 255, 0.25);
	border-radius: 20px;
}

.member-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 470px;
	height: 818px;
	margin-top: 72px;
	margin-bottom: 70px;
}

.header {
	width: 466px;
	height: 94px;
	font-weight: 700;
	font-size: 32px;
	line-height: 47px;
	color: #0068ff;
}

.user-info {
	margin-top: 39px;
}

.user-info div {
	margin-top: 21px;
}

.user-info input {
	font-weight: 400;
	font-size: 16px;
	line-height: 24px;
	color: #797979;
	border: none;
	border-bottom: 1px solid #cfcfcf;
	width: 466px;
	margin-top: 21px;
}

.user-info-email input {
	border-bottom: 1px solid #0068ff;
}

.gender {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 140px;
	height: 23.94px;
	margin-top: 50px;
}

.gender input {
	width: 20px;
	height: 19.95px;
	background: #ebebeb;
	border: 1px solid #d2d2d2;
}

.gender label {
	font-weight: 400;
	font-size: 16px;
	line-height: 24px;
}

.agree-check {
	width: 454px;
	height: 21.06px;
	margin-top: 52.05px;
	font-weight: 400;
	font-size: 14px;
	line-height: 21px;
	color: #000000;
}

.btn {
	display: flex;
	flex-direction: column;
	margin-top: 60px;
	width: 470px;
	height: 106px;
	border-top: 1px solid #e6e6e6;
}

button {
	margin-top: 30px;
	width: 470px;
	height: 75px;
	font-weight: 400;
	font-size: 18px;
	line-height: 27px;
	text-align: center;
	color: #0068ff;
	background: #ffffff;
	border: 1px solid #0068ff;
	border-radius: 10px;
}
</style>
<body>

	<div class="container">
		<div class="member-container">
			<div class="header">
				<div>회원 가입을 위해</div>
				<div>정보를 입력해주세요</div>
			</div>
			<div class="user-info">
				<div class="user-info-email">
					<div>* 이메일</div>
					<input type="email" />
				</div>
				<div class="user-info-name">
					<div>* 이름</div>
					<input type="text" />
				</div>
				<div class="user-info-pw">
					<div>* 비밀번호</div>
					<input type="password" />
				</div>
				<div class="user-info-pw-check">
					<div>* 비밀번호 확인</div>
					<input type="password" />
				</div>
			</div>
			<div class="gender">
				<input type="radio" name="gender" /> <label for="women">여성</label>
				<input type="radio" name="gender" /> <label for="men">남성</label>
			</div>
			<div class="agree-check">
				<input type="checkbox" /> 알림 수신 동의
			</div>
			<div class="btn">
				<button>가입하기</button>
			</div>
		</div>
	</div>
</body>
</html>