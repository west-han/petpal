<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
.login-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: #ef9937;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 12px;
}

.form .message a {
	color: #ed8712;
	text-decoration: none;
}

.form .register-form {
	display: none;
}

.container {
	position: relative;
	z-index: 1;
	max-width: 300px;
	margin: 0 auto;
}

.container:before, .container:after {
	content: "";
	display: block;
	clear: both;
}

.container .info {
	margin: 50px auto;
	text-align: center;
}

.container .info h1 {
	margin: 0 0 15px;
	padding: 0;
	font-size: 36px;
	font-weight: 300;
	color: #1a1a1a;
}

.container .info span {
	color: #4d4d4d;
	font-size: 12px;
}

.container .info span a {
	color: #000000;
	text-decoration: none;
}

.container .info span .fa {
	color: #EF3B3A;
}

body {
	background: #f6c48c;
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.body-container {
	max-width: 800px;
}
</style>

<script type="text/javascript">
	function sendLogin() {
		const f = document.loginForm;
		let str;

		str = f.email.value.trim();
		if (!str) {
			f.email.focus();
			return;
		}

		str = f.userPwd.value.trim();
		if (!str) {
			f.userPwd.focus();
			return;
		}

		f.action = "${pageContext.request.contextPath}/member/login";
		f.submit();
	}
</script>

</head>
<body>
	<div class="login-page">
		<div class="form">
			<form name="loginForm" action="" method="post">
				<input type="text" name="email" class="form-control"
					placeholder="아이디"> <input type="password" name="userPwd"
					class="form-control" autocomplete="off" placeholder="패스워드">
				<button type="button" class="btn btn-primary float-end"
					onclick="sendLogin();">
					&nbsp;Login&nbsp;<i class="bi bi-check2"></i>
				</button>
				<p class="message">
					아직 회원이 아니신가요?
					<a href="${pageContext.request.contextPath}/member/join"> 회원가입</a>
				</p>
				<p class="message">
					비밀번호를 잊어버리셨나요? 
					<a href="${pageContext.request.contextPath}/member/member">비밀번호 찾기</a>
				</p>
				<p>${message}</p>
			</form>
		</div>
	</div>
</body>
</html>