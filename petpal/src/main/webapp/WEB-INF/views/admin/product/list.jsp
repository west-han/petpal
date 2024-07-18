<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">

<style type="text/css">
.body-container {
	max-width: 1300px;
	margin-top: 140px;
	margin-left: 80px;
}
.body-title h3{
	font-size: 26px;
}
.filters {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 20px;
}
.filters .form-check {
    margin-right: 20px;
}
.filters select, .filters input[type="text"] {
    padding: 5px 10px;
    margin-right: 10px;
}
.filters button {
    padding: 5px 10px;
}
</style>

<!-- jQuery and Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
    // 종 선택 변경 시
    $("input[name='species']").change(function() {
        updateProductList();
    });

    // 상위 카테고리 선택 변경 시
    $("#changeCategory").change(function() {
        updateSubCategories();
        updateProductList();
    });

    // 하위 카테고리 선택 변경 시
    $("select[name='categoryNum']").change(function() {
        updateProductList();
    });

    function updateSubCategories() {
        let parentCategory = $("#changeCategory").val();
        let url = "${pageContext.request.contextPath}/admin/product/listSubCategory";
        let query = { parentCategory: parentCategory };

        $.ajax({
            type: "GET",
            url: url,
            data: query,
            dataType: "json",
            success: function(data) {
                $("select[name='categoryNum']").empty();
                $("select[name='categoryNum']").append("<option value=''>:: 하위 카테고리 선택 ::</option>");
                $.each(data.subCategories, function(index, item) {
                    let categoryNum = item.CATEGORYNUM;
                    let categoryName = item.CATEGORYNAME;
                    $("select[name='categoryNum']").append("<option value='"+categoryNum+"'>"+categoryName+"</option>");
                });
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("Error:", textStatus, errorThrown);
            }
        });
    }

    function updateProductList() {
        let species = $("input[name='species']:checked").val();
        let parentCategory = $("#changeCategory").val();
        let categoryNum = $("select[name='categoryNum']").val();
        let url = "${pageContext.request.contextPath}/admin/product/listProduct";
        let query = {
            species: species,
            parentCategory: parentCategory,
            categoryNum: categoryNum
        };

        $.ajax({
            type: "GET",
            url: url,
            data: query,
            dataType: "html",
            success: function(data) {
                $("#productListContainer").html(data);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("Error:", textStatus, errorThrown);
            }
        });
    }

    // 초기 로드 시 상품 리스트 업데이트
    updateProductList();
});
</script>

<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h3><i class="bi bi-app"></i> 상품관리 </h3>
		</div>
		
		<div class="filters">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="species" id="speciesRadio1" value="1" checked>
                <label class="form-check-label" for="speciesRadio1">강아지</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="species" id="speciesRadio2" value="2">
                <label class="form-check-label" for="speciesRadio2">고양이</label>
            </div>
            <select id="changeCategory" name="parentCategory" class="form-select">
                <option value="">:: 상위 카테고리 선택 ::</option>
                <c:forEach items="${categories}" var="category">
                    <option value="${category.CATEGORYNUM}">${category.CATEGORYNAME}</option>
                </c:forEach>
            </select>
            <select name="categoryNum" class="form-select">
                <option value="">:: 하위 카테고리 선택 ::</option>
                <c:if test="${empty categoryNum}">
                    <option value="">상위 카테고리를 먼저 선택하세요</option>
                </c:if>
                <c:if test="${not empty categoryNum}">
                    <c:forEach items="${subCategories}" var="subCategory">
                        <option value="${subCategory.CATEGORYNUM}">${subCategory.CATEGORYNAME}</option>
                    </c:forEach>
                </c:if>
            </select>
           
        </div>
		
		<div class="body-main">
			<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link ${classify==100?'active':''}" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="${classify==0?'true':'false'}">일반상품</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link ${classify==200?'active':''}" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="${classify==1?'true':'false'}">특가상품</button>
				</li>
			</ul>
			
			<div class="tab-content pt-4" id="myTabContent">
				<div class="tab-pane fade show active" id="tab-pane" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
					<form name="productForm" method="post" enctype="multipart/form-data">
    <div class="row">
        
    </div>
</form>

							</div>
						</div>
						<div class="col-auto pt-2 text-end">
							데이터개수/(페이지수/총 페이지)
						</div>
    
    
					</div>
						<div id="productListContainer">
					<table class="table table-border table-list">
						<thead>
						
							<tr class="border-top border-dark table-light">
								<th width="130">상품코드</th>
								<th>카테고리명</th>
								<th>상품명</th>
								<th width="100">가격</th>
								<th width="60">할인율</th>
								<th width="60">재고</th>
								<th width="60">상태</th>
								<th width="80">수정일</th>
								<th width="120">변경</th>
							</tr>
						
						</thead>
						<tbody>
					
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr valign="middle">
									<td>${dto.productNum}</td>
									<td>${dto.categoryName}</td>
									<td class="product-subject left">
										<img src="${pageContext.request.contextPath}/uploads/product/admin">
										${dto.productName}
									</td>
									<td>${dto.price}</td>
									<td>${dto.discountRate}%</td>
									<td>${dto.totalStock}</td>
									<td>
									<c:choose>
											<c:when test="${dto.productStatus == 0}">
                    							판매준비
                							</c:when>
											<c:when test="${dto.productStatus == 1}">
                    							판매중
                							</c:when>
											<c:when test="${dto.productStatus == 2}">
                    							품절
                							</c:when>
											<c:when test="${dto.productStatus == 3}">
                    							판매중단
                							</c:when>
											<c:otherwise>
                    							이게뭐지
                							</c:otherwise>
										</c:choose>
									</td>
									<td>${dto.modifyDate}</td>
									<td>
									
									
										<%-- <c:url var="updateUrl" value="/admin/product/${classify}/update">
											<c:param name="productNum" value="${dto.productNum}"/>
											<c:param name="parentNum" value="${parentNum}"/>
											<c:param name="categoryNum" value="${categoryNum}"/>
											<c:param name="page" value="${page}"/>
											<c:param name="page" value="${page}"/>
										</c:url> --%> 
										<button type="button" class="btn border btn-productStock" data-productNum="${dto.productNum}" data-optionCount="${dto.optionCount}" data-bs-toggle="modal" data-bs-target="#productStockDialogModal">재고</button>
										<button type="button" class="btn border" onclick="location.href='#';">수정</button>
									</td>
								</tr>					
							</c:forEach>
						</tbody>
					</table>
</div>
		
					
					<table class="table table-borderless">
						<tr>
							<td width="150">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/product';"> <i class="bi bi-arrow-clockwise"></i> </button>				
							</td>
							<td align="center">
								<form class="row justify-content-center" name="searchForm" action="${pageContext.request.contextPath}/admin/product/" method="post">
									<div class="col-auto p-1">
										<select name="schType" class="form-select">
											<option value="all" selected>상품명+설명</option>
											<option value="productNum" >상품코드</option>
											<option value="productName">상품명</option>
											<option value="content" >설명</option>
										</select>
									</div>
									<div class="col-auto p-1">
										<input type="text" name="kwd" value="" class="form-control">
										<input type="hidden" name="size" value="">
										<input type="hidden" name="parentNum" value="">
										<input type="hidden" name="categoryNum" value="">
										<input type="hidden" name="productShow" value="">
									</div>
									<div class="col-auto p-1">
										<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
									</div>
								</form>
			
							</td>					
							<td width="150" align="right">
								<c:url var="url" value="/admin/product"/>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/product/write';">상품등록</button>
							</td>
						</tr>
					</table>
					
				</div>
			</div> <!-- tab-content _ end -->

 <!-- body-main -->
	

<!-- 재고 관리 대화상자  -->
<div class="modal fade" id="productStockDialogModal" tabindex="-1" aria-labelledby="productStockDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="productStockDialogModalLabel">재고관리</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="modal-productStock"></div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			dataType:dataType,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

$(function(){
	$('.btn-productStock').click(function(){
		// 재고 관리 대화상자
		let productNum = $(this).attr('data-productNum');
		let optionCount = $(this).attr('data-optionCount');
		let url = '${pageContext.request.contextPath}/admin/product/listProductStock?productNum='+productNum+'&optionCount='+optionCount;
		
		$('.modal-productStock').load(url);
		
		$('#productStockDialogModal').modal('show');
	});
	
	$('.modal-productStock').on('click', '.btn-allStockUpdate', function(){
		// 재고 일괄 변경
		if(! confirm('재고를 일괄 변경 하시겠습니까 ? ')) {
			return false;
		}
		
		let productNum = $(this).attr('data-productNum');
		let url = '${pageContext.request.contextPath}/admin/product/updateProductStock';
		let query = 'productNum='+productNum;
		
		let isValid = true;
		$('.productStcok-list tr').each(function(){
			let $input = $(this).find('input[name=totalStock]');
			let $btn = $(this).find('.btn-stockUpdate');
			
			if(!/^\d+$/.test($input.val().trim())) {
				alert('재고량은 숫자만 가능합니다.');
				$input.focus();
				isValid = false;
				return false;
			}
			
			let stockNum = $btn.attr('data-stockNum');
			let detailNum1 = $btn.attr('data-detailNum1');
			detailNum1 = detailNum1 ? detailNum1 : 0;
			let detailNum2 = $btn.attr('data-detailNum2');
			detailNum2 = detailNum2 ? detailNum2 : 0;
			let totalStock = $input.val().trim();
			
			query += '&stockNums=' + stockNum;
			query += '&detailNums=' + detailNum1;
			query += '&detailNums2=' + detailNum2;
			query += '&totalStocks=' + totalStock;
		});
		
		if( ! isValid ) {
			return false;
		}
		
		const fn = function(data) {
			if(data.state === "true") {
				alert("재고가 일괄 변경 되었습니다.");
			} else {
				alert("재고 일괄 변경이 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);		
	});
	
	$('.modal-productStock').on('click', '.btn-stockUpdate', function(){
		// 재고 변경	
		let productNum = $(this).attr('data-productNum');
		let stockNum = $(this).attr('data-stockNum');
		let detailNum1 = $(this).attr('data-detailNum1');
		detailNum1 = detailNum1 ? detailNum1 : 0;
		let detailNum2 = $(this).attr('data-detailNum2');
		detailNum2 = detailNum2 ? detailNum2 : 0;
		let totalStock = $(this).closest('tr').find('input[name=totalStock]').val().trim();
		
		if(!/^\d+$/.test(totalStock)) {
			alert('재고량은 숫자만 가능합니다.');
			$(this).closest('tr').find('input[name=totalStock]').focus();
			return false;
		}
	
		let url = '${pageContext.request.contextPath}/admin/product/updateProductStock';
		let query = {productNum:productNum, stockNums:stockNum, detailNums:detailNum1, detailNums2:detailNum2, totalStocks:totalStock};
		
		const fn = function(data) {
			if(data.state === "true") {
				alert("재고가 변경 되었습니다.");
			} else {
				alert("재고 변경이 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);		
		
	});
});

const productStockModalEl = document.getElementById('productStockDialogModal');
productStockModalEl.addEventListener('show.bs.modal', function(){
	// 모달 대화상자가 보일때
});

productStockModalEl.addEventListener('hidden.bs.modal', function(){
	// 모달 대화상자가 안보일때
	searchList();
});
</script>
