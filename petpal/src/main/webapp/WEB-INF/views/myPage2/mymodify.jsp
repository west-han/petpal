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
body {
	background-color: #f8f9fa;
}

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
</head>
<body>
<div class="container mt-5">
        <div class="row">
			<div class="col-md-2">
				<h3 class="mypage">마이페이지</h3>
				<ul class="list-group">
					<li class="category-header">my 쇼핑</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/orderlist">주문 내역/배송 조회</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/cancel-return-change">취소/반품/교환/환불 내역</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/mycoupon">쿠폰함</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/mypoint">적립금</a></li>
					<li class="category-header">my 정보</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/mypet">나의 펫</a></li>
					<li class="list-group-item active"><a href="${pageContext.request.contextPath}/myPage2/mymodify">내 정보</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/likelist">찜 리스트</a></li>
					<li class="category-header">my 활동</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/myreview">리뷰관리</a></li>
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
                                <p><strong>이름:</strong> 사용자 이름</p>
                                <p><strong>생년월일:</strong> 1990-01-01</p>
                                <p><strong>전화번호:</strong> 010-1234-5678</p>
                                <p><strong>닉네임:</strong> 닉네임</p>
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
                                <form>
                                    <div class="form-group">
                                        <label for="userName">이름</label>
                                        <input type="text" class="form-control" id="userName" value="사용자 이름">
                                    </div>
                                    <div class="form-group">
                                        <label for="userBirthday">생년월일</label>
                                        <input type="date" class="form-control" id="userBirthday" value="1990-01-01">
                                    </div>
                                    <div class="form-group">
                                        <label for="userPhone">전화번호</label>
                                        <input type="tel" class="form-control" id="userPhone" value="010-1234-5678">
                                    </div>
                                    <div class="form-group">
                                        <label for="userNickname">닉네임</label>
                                        <input type="text" class="form-control" id="userNickname" value="닉네임">
                                    </div>
                                    <button type="submit" class="btn btn-success">저장</button>
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
                                <form>
                                    <div class="form-group">
                                        <label for="currentPassword">현재 비밀번호</label>
                                        <input type="password" class="form-control" id="currentPassword">
                                    </div>
                                    <div class="form-group">
                                        <label for="newPassword">새 비밀번호</label>
                                        <input type="password" class="form-control" id="newPassword">
                                    </div>
                                    <div class="form-group">
                                        <label for="confirmPassword">새 비밀번호 확인</label>
                                        <input type="password" class="form-control" id="confirmPassword">
                                    </div>
                                    <button type="submit" class="btn btn-primary">비밀번호 변경</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>