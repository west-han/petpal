<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page - 나의 펫</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

h3, h2 {
	margin-bottom: 20px;
}

.list-group-item.active {
	background-color: #E4B075;
	border-color: #E4B075;
}

.carousel {
	width: 300px !important; /* 원하는 최대 너비로 덮어쓰기 */
	height: 150px !important; /* 세로 길이 */
	margin: 0 auto !important; /* 중앙 정렬을 유지 */
}

.carousel-item {
	display: none;
	flex-direction: column;
	align-items: center;
}

.carousel-item.active {
	display: flex;
}

.carousel-item img {
	width: 150px;
	height: 150px;
	object-fit: cover;
	border-radius: 50%;
	margin: auto;
}

.crown-icon {
	position: absolute;
	top: -10px;
	right: -10px;
	font-size: 30px;
	color: gold;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	background-color: black;
}

.carousel-caption {
	position: static;
	margin-top: 20px;
}

.always-visible {
	text-align: center;
	margin-top: 20px;
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

.mypage {
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
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}/myPage2/orderlist">주문
							내역/배송 조회</a></li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}/myPage2/cancel-return-change">취소/반품/교환/환불
							내역</a></li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}/myPage2/mycoupon">쿠폰함</a></li>
					<li class="list-group-item "><a
						href="${pageContext.request.contextPath}/myPage2/mypoint">적립금</a></li>
					<li class="category-header">my 정보</li>
					<li class="list-group-item active"><a
						href="${pageContext.request.contextPath}/myPage2/mypet">나의 펫</a></li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}/myPage2/mymodify">내
							정보</a></li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}/myPage2/likelist">찜
							리스트</a></li>
					<li class="category-header">my 활동</li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}/myPage2/myreview">리뷰관리</a></li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}">1대1 문의 내역</a></li>
				</ul>
			</div>

			<div class="col-md-9 ms-5">
				<h2>나의 펫</h2>
				<div id="petCarousel" class="carousel slide">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="position-relative">
								<img
									src="${pageContext.request.contextPath}/resources/images/dog.jpg"
									alt="Pet 1"> <i class="fa-solid fa-crown crown-icon"></i>
							</div>
						</div>
						<div class="carousel-item">
							<div class="position-relative">
								<img
									src="${pageContext.request.contextPath}/resources/images/cat.jpg"
									alt="Pet 2">
							</div>
						</div>
						<!-- 추가적인 펫 항목 -->
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#petCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#petCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>

				<div class="always-visible">
					<button class="btn btn-primary" onclick="changeRepresentative()">대표
						동물로 설정</button>
				</div>

				<form class="pet-form mt-4">
					<div class="form-group">
						<label for="petName">이름</label> <input type="text"
							class="form-control" id="petName" value="펫 이름">
					</div>
					<div class="form-group">
						<label for="petPhoto">사진</label> <input type="file"
							class="form-control" id="petPhoto">
					</div>
					<div class="form-group">
						<label for="petBirthday">생일</label> <input type="date"
							class="form-control" id="petBirthday" value="2020-01-01">
					</div>
					<div class="form-group">
						<label for="petGender">성별</label> <select class="form-control"
							id="petGender">
							<option>남</option>
							<option>여</option>
						</select>
					</div>
					<div class="form-group">
						<label for="petWeight">몸무게</label> <input type="number"
							class="form-control" id="petWeight" value="5">
					</div>
					<div class="form-group">
						<label for="petBodyType">체형</label> <input type="text"
							class="form-control" id="petBodyType" value="보통">
					</div>
					<div class="form-group">
						<label for="petRegistrationNumber">동물등록번호</label> <input
							type="text" class="form-control" id="petRegistrationNumber"
							value="123456789">
					</div>
					<button type="submit" class="btn btn-success">저장</button>
				</form>
			</div>
		</div>
	</div>

	<script>
		function changeRepresentative() {
			var activeItem = document
					.querySelector('.carousel-item.active .position-relative');
			var currentCrown = document.querySelector('.fa-crown');
			if (currentCrown) {
				currentCrown.remove();
			}
			var newCrown = document.createElement('i');
			newCrown.className = 'fa-solid fa-crown crown-icon';
			activeItem.appendChild(newCrown);
		}
	</script>

</body>
</html>

