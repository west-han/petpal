<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page - 나의 펫</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

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
	width: 300px !important;
	height: 150px !important;
	margin: 0 auto !important;
}

.carousel-item {
	display: none;
	align-items: center;
}

.carousel-item.active {
	display: block;
}

.carousel-item img {
	width: 150px;
	height: 150px;
	object-fit: cover;
	border-radius: 50%;
	margin: auto;
}

.crown-icon {
	
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
	position: relative;
	z-index: 1;
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

#addPetModal img,
#editPetModal img {
	width: 150px;
	height: 150px;
	object-fit: cover;
	border-radius: 50%;
	margin: auto;
	display: block;
}

.button-group {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 10px;
}

.btn-group {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.position-relative{
	display: flex;
	justify-content: center;
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
					<li class="list-group-item active"><a href="${pageContext.request.contextPath}/myPage2/mypet">나의 펫</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/mymodify">내 정보</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/myaddress">나의 배송지</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/likelist">찜 리스트</a></li>
					<li class="category-header">my 활동</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/myreview">리뷰관리</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}">1대1 문의 내역</a></li>
				</ul>
			</div>

			<div class="col-md-9 ms-5">
				<h2 class="mt-4">나의 펫</h2>
				<div class="btn-group">
					<button class="btn btn-primary mb-5" data-bs-toggle="modal" data-bs-target="#addPetModal">펫 추가</button>
				</div>
				<c:if test="${not empty list}">
					<div id="petCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="100000000000000">
						<div class="carousel-inner">
							<c:forEach var="pet" items="${list}" varStatus="status">
								<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
									<c:if test="${representativePetNum != null && pet.petNum == representativePetNum}">
									<p><i class="fas fa-crown crown-icon position-relative fa-2x"></i></p>
									</c:if>
									<div class="position-relative">
										<img src="${pageContext.request.contextPath}/uploads/petPhotos/${pet.petPhoto}" alt="펫 사진">
									</div>
									<div class="carousel-caption">
										
										<h5 class="text-dark">${pet.petName}</h5>
										<p class="text-dark">${pet.breedName}</p>
										
										<c:if test="${representativePetNum != null && pet.petNum == representativePetNum}">
										<p class="text-dark">대표 동물</p>
										</c:if>
										<div class="button-group">
											<button class="btn btn-primary" onclick="changeRepresentative(${pet.petNum})">대표 동물로 설정</button>
											<button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#editPetModal_${pet.petNum}">펫 수정</button>
											<form action="${pageContext.request.contextPath}/myPage2/deleteMemberPet" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
												<input type="hidden" name="petNum" value="${pet.petNum}">
												<button type="submit" class="btn btn-danger">펫 삭제</button>
											</form>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#petCarousel" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#petCarousel" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</c:if>
				<c:if test="${empty list}">
					<p>등록된 펫이 없습니다.</p>
				</c:if>

				<!-- 펫 추가 모달 -->
				<div class="modal fade" id="addPetModal" tabindex="-1" aria-labelledby="addPetModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="addPetModalLabel">펫 추가</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form class="pet-form mt-4" id="addPetForm" action="${pageContext.request.contextPath}/myPage2/insertMemberPet" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label for="petSpecies">종류</label><br>
										<input type="radio" id="dog_add" name="petSpecies" value="1" onchange="loadBreeds(1, 'add')">
										<label for="dog_add">강아지</label>
										<input type="radio" id="cat_add" name="petSpecies" value="2" onchange="loadBreeds(2, 'add')">
										<label for="cat_add">고양이</label>
									</div>
									<div class="form-group">
										<label for="breed_add">품종</label>
										<select class="form-control" id="breed_add" name="breedNum">
											<option value="">선택하세요</option>
										</select>
									</div>
									<div class="form-group">
										<label for="petName">이름</label>
										<input type="text" class="form-control" id="petName" name="petName">
									</div>
									<div class="form-group">
										<label for="selectFile">사진</label>
										<input type="file" class="form-control" id="selectFile" name="selectFile" onchange="previewImage(event)">
										<img id="preview" src="" alt="미리보기" style="display:none;">
									</div>
									<div class="form-group">
										<label for="petBirthday">생일</label>
										<input type="date" class="form-control" id="petBirthday" name="petBirth">
									</div>
									<div class="form-group">
										<label for="petGender">성별</label>
										<select class="form-control" id="petGender" name="petGender">
											<option value="1">남</option>
											<option value="2">여</option>
										</select>
									</div>
									<div class="form-group">
										<label for="petWeight">몸무게</label>
										<input type="number" class="form-control" id="petWeight" name="petWeight" value="0">
									</div>
									<div class="form-group">
										<label for="petBodyType">체형</label>
										<select class="form-control" id="petBodyType" name="bodyShape">
											<option value="1">날씬해요</option>
											<option value="2">적당해요</option>
											<option value="3">통통해요</option>
										</select>
									</div>
									<div class="form-group">
										<label for="petRegistrationNumber">동물등록번호</label>
										<input type="text" class="form-control" id="petRegistrationNumber" name="petRegNum">
									</div>
									<button type="submit" class="btn btn-success">저장</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-- 펫 수정 모달 -->
				<c:forEach var="pet" items="${list}">
    			<div class="modal fade" id="editPetModal_${pet.petNum}" tabindex="-1" aria-labelledby="editPetModalLabel_${pet.petNum}" aria-hidden="true">
        		<div class="modal-dialog">
            		<div class="modal-content">
                	<div class="modal-header">
                    <h5 class="modal-title" id="editPetModalLabel_${pet.petNum}">펫 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="pet-form mt-4" id="editPetForm_${pet.petNum}" action="${pageContext.request.contextPath}/myPage2/updateMemberPet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="petNum" value="${pet.petNum}">
                        <div class="form-group">
                            <label for="petType_${pet.petNum}">종류</label><br>
                            <input type="radio" id="dog_${pet.petNum}" name="petSpecies" value="1" <c:if test="${pet.species == 1}">checked</c:if> onchange="loadBreeds(1, ${pet.petNum})">
                            <label for="dog_${pet.petNum}">강아지</label>
                            <input type="radio" id="cat_${pet.petNum}" name="petSpecies" value="2" <c:if test="${pet.species == 2}">checked</c:if> onchange="loadBreeds(2, ${pet.petNum})">
                            <label for="cat_${pet.petNum}">고양이</label>
                        </div>
                        <div class="form-group">
                            <label for="breed_${pet.petNum}">품종</label>
                            <select class="form-control" id="breed_${pet.petNum}" name="breedNum" data-selected-breed="${pet.breedNum}">
                                <option value="">선택하세요</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="petName_${pet.petNum}">이름</label>
                            <input type="text" class="form-control" id="petName_${pet.petNum}" name="petName" value="${pet.petName}">
                        </div>
                        <div class="form-group">
                            <label for="selectFile_${pet.petNum}">사진</label>
                            <input type="file" class="form-control" id="selectFile_${pet.petNum}" name="selectFile" onchange="previewEditImage(event, 'preview_${pet.petNum}')">
                            <img id="preview_${pet.petNum}" src="${pageContext.request.contextPath}/uploads/petPhotos/${pet.petPhoto}" alt="미리보기" class="mt-2" style="width: 150px; height: 150px; border-radius: 50%; object-fit: cover;">
                        </div>
                        <div class="form-group">
                            <label for="petBirthday_${pet.petNum}">생일</label>
                            <input type="date" class="form-control" id="petBirthday_${pet.petNum}" name="petBirth" value="${pet.petBirth}">
                        </div>
                        <div class="form-group">
                            <label for="petGender_${pet.petNum}">성별</label>
                            <select class="form-control" id="petGender_${pet.petNum}" name="petGender">
                                <option value="1" <c:if test="${pet.petGender == 1}">selected</c:if>>남</option>
                                <option value="2" <c:if test="${pet.petGender == 2}">selected</c:if>>여</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="petWeight_${pet.petNum}">몸무게</label>
                            <input type="number" class="form-control" id="petWeight_${pet.petNum}" name="petWeight" value="${pet.petWeight}">
                        </div>
                        <div class="form-group">
                            <label for="petBodyType_${pet.petNum}">체형</label>
                            <select class="form-control" id="petBodyType_${pet.petNum}" name="bodyShape">
                                <option value="1" <c:if test="${pet.bodyShape == 1}">selected</c:if>>날씬해요</option>
                                <option value="2" <c:if test="${pet.bodyShape == 2}">selected</c:if>>적당해요</option>
                                <option value="3" <c:if test="${pet.bodyShape == 3}">selected</c:if>>통통해요</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="petRegistrationNumber_${pet.petNum}">동물등록번호</label>
                            <input type="text" class="form-control" id="petRegistrationNumber_${pet.petNum}" name="petRegNum" value="${pet.petRegNum}">
                        </div>
                        <button type="submit" class="btn btn-success">저장</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
			</div>
		</div>
	</div>


	<script>
	function loadBreeds(species, petNum) {
	    console.log("loadBreeds 호출됨, species: " + species + ", petNum: " + petNum);
	    $.ajax({
	        url: '${pageContext.request.contextPath}/myPage2/breed',
	        type: 'GET',
	        data: { petSpecies: species },
	        success: function(data) {
	            console.log("AJAX 요청 성공, 데이터: ", data);
	            var select = petNum === 'add' ? $('#breed_add') : $('#breed_' + petNum);
	            var selectedBreedNum = select.data('selected-breed');
	            select.empty();
	            select.append('<option value="">선택하세요</option>');
	            $.each(data, function(index, breed) {
	                var selected = breed.breedNum == selectedBreedNum ? 'selected' : '';
	                select.append('<option value="' + breed.breedNum + '" ' + selected + '>' + breed.breedName + '</option>');
	            });
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.log("AJAX 요청 실패", textStatus, errorThrown);
	            alert('품종 정보를 불러오는데 실패했습니다.');
	        }
	    });
	}

	$(document).ready(function() {
	    $('.modal').on('show.bs.modal', function(event) {
	        var modal = $(this);
	        var petNum = modal.find('form').attr('id').split('_')[1];
	        var species = modal.find('input[name="petSpecies"]:checked').val();
	        if (species) {
	            loadBreeds(species, petNum);
	        }
	    });

	    $('input[name="petSpecies"]').on('change', function() {
	        var species = $(this).val();
	        var petNum = $(this).closest('form').attr('id').split('_')[1];
	        loadBreeds(species, petNum);
	    });
	});

	function changeRepresentative(petNum) {
		// AJAX 호출하여 대표 동물로 설정하는 로직 구현
		alert("대표 동물로 설정되었습니다: " + petNum);
	}

	function previewImage(event) {
		var reader = new FileReader();
		reader.onload = function(){
			var output = document.getElementById('preview');
			output.src = reader.result;
			output.style.display = 'block';
		};
		reader.readAsDataURL(event.target.files[0]);
	}

	function previewEditImage(event, previewId) {
		var reader = new FileReader();
		reader.onload = function(){
			var output = document.getElementById(previewId);
			output.src = reader.result;
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	
	// 대표 동물 설정
	function changeRepresentative(petNum) {
    $.ajax({
        url: '${pageContext.request.contextPath}/myPage2/setInsertRegPet',
        type: 'POST',
        data: { petNum: petNum },
        success: function(response) {
            alert(response.message);
            // 필요시 페이지 새로고침 또는 다른 동작 추가
            location.reload(); // 성공 시 페이지 새로고침
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert('대표 동물 설정에 실패했습니다. 다시 시도해주세요.');
            console.log(textStatus, errorThrown);
        }
    });
}
	</script>
</body>
</html>
