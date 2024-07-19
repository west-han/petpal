<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 배송지</title>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .address-item {
            margin-bottom: 15px;
        }
        .list-group-item.active {
            background-color: #E4B075;
            border-color: #E4B075;
        }
        .modal-header {
            background-color: #007bff;
            color: white;
        }
        .mypage {
            text-align: center;
        }
        .category-header {
            list-style-type: none;
            text-align: center;
            padding: 10px 0;
            font-weight: bold;
            font-size: 1.2em;
        }
        a {
            text-decoration: none;
        }
    </style>
    <script type="text/javascript">
    function insertDest() {
		const f = document.addAddressForm;
		let str;
		
		str = f.recipientName.value;
		if( !str ) {
            alert("받는 사람을 입력해주세요 ");
            f.recipientName.focus();
            return;
        }
		
		str = f.tel.value;
		if( !str ) {
            alert("전화번호를 입력해주세요 ");
            f.tel.focus();
            return;
        }
		str = f.postalCode.value;
		if( !str ) {
            alert("우편번호를 입력해주세요 ");
            f.postalCode.focus();
            return;
        }
		str = f.address1.value;
		if( !str ) {
            alert("기본주소를 입력해주세요 ");
            f.postalCode.focus();
            return;
        }
		str = f.address2.value;
		if( !str ) {
            alert("상세주소를 입력해주세요 ");
            f.postalCode.focus();
            return;
        }
		
		f.submit();
		
	}
    
    function updateAddress() {
		const f = document.editAddressForm;
		let str;
		
		str = f.recipientName.value;
		if( !str ) {
            alert("받는 사람을 입력해주세요 ");
            f.recipientName.focus();
            return;
        }
		
		str = f.tel.value;
		if( !str ) {
            alert("전화번호를 입력해주세요 ");
            f.tel.focus();
            return;
        }
		str = f.postalCode.value;
		if( !str ) {
            alert("우편번호를 입력해주세요 ");
            f.postalCode.focus();
            return;
        }
		str = f.address1.value;
		if( !str ) {
            alert("기본주소를 입력해주세요 ");
            f.postalCode.focus();
            return;
        }
		str = f.address2.value;
		if( !str ) {
            alert("상세주소를 입력해주세요 ");
            f.postalCode.focus();
            return;
        }
		
	}
    function confirmDelete() {
        return confirm("정말 삭제하시겠습니까?");
    }
    </script>
    
</head>
<body>
    <div class="container">
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
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/mymodify">내 정보</a></li>
                    <li class="list-group-item active"><a href="${pageContext.request.contextPath}/myPage2/myaddress">나의 배송지</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/likelist">찜 리스트</a></li>
                    <li class="category-header">my 활동</li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/myreview">리뷰관리</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}">1대1 문의 내역</a></li>
                </ul>
            </div>
            <div class="col-md-9">
                <h2>나의 배송지</h2>
                <div class="btn-group">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAddressModal">배송지 추가</button>
                </div>
                <div id="addressList">
                    <c:forEach var="dto" items="${list}">
                        <div class="card address-item">
                            <div class="card-body">
                                <c:choose>
									<c:when test="${dto.defaultDest == 0}">
                    					<p class="text-center"><i class="bi bi-caret-right-fill"></i>기본배송지<i class="bi bi-caret-left-fill"></i></p>
                					</c:when>
									<c:when test="${dto.defaultDest == 1}">
                    					
                					</c:when>
                				</c:choose>
                                <p class="card-text">받는 사람: ${dto.recipientName}</p>
                                <p class="card-text">전화번호: ${dto.tel}</p>
                                <p class="card-text">주소: ${dto.address1}</p>
                                <p class="card-text">${dto.address2}</p>
                                <p class="card-text">우편번호: ${dto.postalCode}</p>
                                <p class="card-text">배송 메모: ${dto.note}</p>
                                <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#editAddressModal"
                                        onclick="fillEditForm(${dto.destNum}, '${dto.recipientName}', '${dto.tel}', '${dto.postalCode}', 
                                        '${dto.address1}', '${dto.address2}', '${dto.note}', ${dto.defaultDest})">수정</button>
                                <form action="${pageContext.request.contextPath}/myPage2/deleteAddress" method="post" style="display:inline;" >
                                    <input type="hidden" name="destNum" value="${dto.destNum}">
                                    <button type="submit" class="btn btn-danger" onclick="return confirmDelete();">삭제</button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <!-- 배송지 추가 모달 -->
    <div class="modal fade" id="addAddressModal" tabindex="-1" aria-labelledby="addAddressModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addAddressModalLabel">배송지 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addAddressForm" name="addAddressForm" action="${pageContext.request.contextPath}/myPage2/addAddress" method="post">
                        <div class="mb-3">
                            <label for="recipientName" class="form-label">받는 사람 이름</label>
                            <input type="text" class="form-control" id="recipientName" name="recipientName" required>
                        </div>
                        <div class="mb-3">
                            <label for="tel" class="form-label">전화번호</label>
                            <input type="text" class="form-control" id="tel" name="tel" required>
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
                        <div class="mb-3">
                            <label for="note" class="form-label">배송 메모</label>
                            <input type="text" class="form-control" id="note" name="note">
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="defaultDest" name="defaultDest" value="0">
                            <label class="form-check-label" for="defaultDest">기본 배송지 설정</label>
                        </div>
                        <input type="hidden" id="defaultDestHidden" name="defaultDestHidden">
                        <button type="button" class="btn btn-primary" onclick="insertDest();" >추가</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 배송지 수정 모달 -->
    <div class="modal fade" id="editAddressModal" tabindex="-1" aria-labelledby="editAddressModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editAddressModalLabel">배송지 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editAddressForm" name="editAddressForm" action="${pageContext.request.contextPath}/myPage2/updateAddress" method="post">
                     <input type="hidden" id="editDestNum" name="destNum">
                        <div class="mb-3">
                            <label for="editRecipientName" class="form-label">받는 사람 이름</label>
                            <input type="text" class="form-control" id="editRecipientName" name="recipientName" required>
                        </div>
                        <div class="mb-3">
                            <label for="editPhone" class="form-label">전화번호</label>
                            <input type="text" class="form-control" id="editPhone" name="tel" required>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="editPostalCode">우편번호</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <input type="text" name="postalCode" id="editPostalCode" class="form-control" placeholder="우편번호" readonly>
                                    <button class="btn btn-light" type="button" onclick="daumPostcode2();">우편번호 검색</button>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="editAddress1">주소</label>
                            <div class="col-sm-10">
                                <input type="text" name="address1" id="editAddress1" class="form-control" placeholder="기본 주소" readonly>
                                <div class="mt-2">
                                    <input type="text" name="address2" id="editAddress2" class="form-control" placeholder="상세 주소">
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="editDeliveryNote" class="form-label">배송 메모</label>
                            <input type="text" class="form-control" id="editDeliveryNote" name="note">
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="editDefaultAddress" name="defaultDest" value="0">
                            <label class="form-check-label" for="editDefaultAddress">기본 배송지 설정</label>
                        </div>
                        <input type="hidden" id="editDefaultDestHidden" name="defaultDestHidden" >
                        <button type="submit" class="btn btn-primary" onclick="updateAddress();">수정</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        function daumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var fullAddr = '';
                    var extraAddr = '';

                    if (data.userSelectedType === 'R') {
                        fullAddr = data.roadAddress;
                    } else {
                        fullAddr = data.jibunAddress;
                    }

                    if(data.userSelectedType === 'R'){
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                    }

                    document.getElementById('postalCode').value = data.zonecode;
                    document.getElementById('address1').value = fullAddr;
                    document.getElementById('address2').focus();
                }
            }).open();
        }
        
        function daumPostcode2() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var fullAddr = '';
                    var extraAddr = '';

                    if (data.userSelectedType === 'R') {
                        fullAddr = data.roadAddress;
                    } else {
                        fullAddr = data.jibunAddress;
                    }

                    if(data.userSelectedType === 'R'){
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                    }

                    document.getElementById('editPostalCode').value = data.zonecode;
                    document.getElementById('editAddress1').value = fullAddr;
                    document.getElementById('editAddress2').focus();
                }
            }).open();
        }
        
        function fillEditForm(destNum, recipientName, tel, postalCode, address1, address2, note, defaultDest) {
            document.getElementById('editDestNum').value = destNum;
            document.getElementById('editRecipientName').value = recipientName;
            document.getElementById('editPhone').value = tel;
            document.getElementById('editPostalCode').value = postalCode;
            document.getElementById('editAddress1').value = address1;
            document.getElementById('editAddress2').value = address2;
            document.getElementById('editDeliveryNote').value = note;
            document.getElementById('editDefaultAddress').checked = (defaultDest === 0);
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
</body>
</html>
