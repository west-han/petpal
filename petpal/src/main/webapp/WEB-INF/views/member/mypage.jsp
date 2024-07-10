<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<style type="text/css">
.container {
	margin-top: 30px;
}

.nav-link {
	cursor: pointer;
}
</style>
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>

<body>
	<div class="container">
        <h2 class="text-center">마이페이지</h2>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true">프로필</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="orders-tab" data-toggle="tab" href="#orders" role="tab" aria-controls="orders" aria-selected="false">주문 내역</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="address-tab" data-toggle="tab" href="#address" role="tab" aria-controls="address" aria-selected="false">배송지 정보</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                <h3 class="mt-3">프로필</h3>
                <form>
                    <div class="form-group">
                        <label for="userName">이름</label>
                        <input type="text" class="form-control" id="userName" placeholder="이름을 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="userEmail">이메일</label>
                        <input type="email" class="form-control" id="userEmail" placeholder="이메일을 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="userPhone">전화번호</label>
                        <input type="text" class="form-control" id="userPhone" placeholder="전화번호를 입력하세요">
                    </div>
                    <button type="submit" class="btn btn-primary">저장</button>
                </form>
            </div>
            <div class="tab-pane fade" id="orders" role="tabpanel" aria-labelledby="orders-tab">
                <h3 class="mt-3">주문 내역</h3>
                <table class="table">
                    <thead>
                        <tr>
                            <th>주문 번호</th>
                            <th>상품명</th>
                            <th>수량</th>
                            <th>가격</th>
                            <th>주문 날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 주문 내역 데이터는 여기에 추가 -->
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="address" role="tabpanel" aria-labelledby="address-tab">
                <h3 class="mt-3">배송지 정보</h3>
                <form>
                    <div class="form-group">
                        <label for="userAddress">주소</label>
                        <input type="text" class="form-control" id="userAddress" placeholder="주소를 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="userCity">도시</label>
                        <input type="text" class="form-control" id="userCity" placeholder="도시를 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="userZip">우편번호</label>
                        <input type="text" class="form-control" id="userZip" placeholder="우편번호를 입력하세요">
                    </div>
                    <button type="submit" class="btn btn-primary">저장</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>