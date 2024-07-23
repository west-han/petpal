<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-title h3{
	font-size: 26px;
}
.table-form tr>td { vertical-align: middle; }
.table-form tr:first-child { border-top: 2px solid #212529; }
.table-form tr>td:first-child { text-align: center; }
.table-form tr>td:nth-child(2) { padding-left: 10px; }
.table-form textarea { height: 170px; resize: none; }

.table-form .option-minus, .table-form .option-minus2 { cursor: pointer; }

.table-form .thumbnail-viewer {
	cursor: pointer;
	border: 1px solid #c2c2c2;
	width: 50px; height: 50px; border-radius: 10px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat: no-repeat;
	background-size: cover;
}

.table-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.table-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}
</style>

<script type="text/javascript">
$(function(){
	let mode = "${mode}";

//	if(mode === "write") {
//		let classify = "${classify}";
//		$("select[name=classify]").val(classify);
//		
//		$("#productShow1").prop("checked", true);
//	}
});

function check() {
	const f = document.productForm;
	let str, b;
	let mode = "${mode}";
	
	if(! f.parentCategory.value) {
		alert("상위 카테고리를 선택하세요.");
		f.parentCategory.focus();
		return false;
	}

	if(! f.categoryNum.value) {
		alert("하위 카테고리를 선택하세요.");
		f.categoryNum.focus();
		return false;
	}
	
	if(! f.productName.value.trim()) {
		alert("상품명을 입력하세요.");
		f.productName.focus();
		return false;
	}
	
	if(!/^(\d){1,8}$/.test(f.price.value)) {
		alert("상품가격을 양의 정수로 입력 하세요.");
		f.price.focus();
		return false;
	}
	
	if(!/^(\d){1,2}$/.test(f.discountRate.value)) {
		alert("할인율을 입력 하세요.");
		f.discountRate.focus();
		return false;
	}
	
	if(!/^(\d){1,8}$/.test(f.deliveryCharge.value)) {
		alert("배송비를 양의 정수로 입력 하세요.");
		f.deliveryCharge.focus();
		return false;
	}
	
	let optionCount = parseInt(f.optionCount.value);
	
	if(optionCount > 0) {
		if(! f.optionName.value.trim()) {
			alert("옵션명을 입력 하세요.");
			f.optionName.focus();
			return false;
		}
		
		b = true;
		$("input[name=optionValues]").each(function(){
			if(! $(this).val().trim()) {
				b= false;
				return false;
			}
		});
		
		if(! b) {
			alert("옵션값을 입력 하세요.");
			return false;
		}
	}
	
	if(optionCount > 1) {
		if(! f.optionName2.value.trim()) {
			alert("옵션명 입력 하세요.");
			f.optionName2.focus();
			return false;
		}
		
		b = true;
		$("input[name=optionValues2]").each(function(){
			if(! $(this).val().trim()) {
				b= false;
				return false;
			}
		});
		if(! b) {
			alert("옵션값을 입력 하세요.");
			return false;
		}
	}
	
	b = false;
	for(let ps of f.productStatus) {
		if( ps.checked ) {
			b = true;
			break;
		}
	}
	if( ! b ) {
		alert("상품 상태를 선택하세요.");
		f.productStatus[0].focus();
		return false;
	}
	
	str = f.content.value.trim();
	if( !str || str === "<p><br></p>" ) {
		alert("상품 설명을 입력하세요.");
		f.content.focus();
		return false;
	}

	if(mode === "write" && ! f.thumbnailFile.value) {
		alert("대표 이미지를 등록하세요.");
		f.thumbnailFile.focus();
		return false;
	}
	
	// TODO: classify 구현 이후에 링크 변경
	// f.action = "${pageContext.request.contextPath}/admin/product/${classify}/${mode}";
	
	f.action = "${pageContext.request.contextPath}/admin/product/${mode}";
	return true;
}
</script>

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

$(function() {
	$("form input[name=species]").change(function() {
		const species = $("input[name=species]:checked").val();
		
		$("form select[name=parentCategory]").find("option").remove().end()
			.append("<option value='' selected>:: 상위 카테고리 선택 ::</option>");
		$("#attr").children("td:eq(1)").remove().end().append('<td><p style="color: red;">⚠️ 카테고리를 먼저 선택해 주세요.</p></td>');
		
		let url = "${pageContext.request.contextPath}/admin/product/listCategory";
		let query = "species=" + species;
		
		const fn = function(data) {
			for (let item of data.categories) {
				const categoryNum = item.CATEGORYNUM;
				const categoryName = item.CATEGORYNAME;
				
				let s = '<option value="' + categoryNum + '">' + categoryName + '</option>';
				$("form select[name=parentCategory]").append(s);
			}
		};
		
		ajaxFun(url, "get", query, "json", fn);
	});
});

$(function(){
	$("form select[name=parentCategory]").change(function(){
		let parentCategory = $(this).val();
		
		// NOTE: jQuery의 end() 메소드: 선택한 요소가 선택되기 이전의 요소 선택
		// form 태그의 하위 categoryNum select 요소 선택 -> 그 하위의 option 태그 선택해서 삭제한 뒤
		// end() 메소드로 다시 select 요소를 선택, append() 메소드로 select의 마지막 하위 요소로 option 추가
		$("form select[name=categoryNum]").find('option').remove().end()
			.append("<option value=''>:: 하위 카테고리 선택 ::</option>");	
		
		if(! parentCategory) {
			$("#attr").children("td:eq(1)").remove().end().append('<p style="color: red;">⚠️ 카테고리를 먼저 선택해 주세요.</p>');
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/admin/product/listSubCategory";
		let query = "parentCategory="+parentCategory;
		
		const printSubCategories = function(data) {
			$.each(data.subCategories, function(index, item){
				let categoryNum = item.CATEGORYNUM;
				let categoryName = item.CATEGORYNAME;
				let s = "<option value='"+categoryNum+"'>"+categoryName+"</option>";
				$("form select[name=categoryNum]").append(s);
			});
		};
		ajaxFun(url, "get", query, "json", printSubCategories);
		
		url = "${pageContext.request.contextPath}/admin/product/listAttribute";
		
		const printAttributes = function(data) {
			
			let s = '<td>';
			s += '		<small class="form-detailCategory help-block">등록할 상품에 적합한 속성을 선택하세요</small>';
			s += '		<table>';
			const attributes = data.attributes.filter(
				    (attribute, idx, callback) => 
				        idx === callback.findIndex(
				            (attribute2) => attribute2.attributeNum === attribute.attributeNum
				        )
				    ).map(item => { return {'attributeNum': item.attributeNum, 'attributeName': item.attributeName} } );
			
			for (let attribute of attributes) {
				const attributeDetails = data.attributes.filter(
					(attribute2, idx) => attribute2.attributeNum === attribute.attributeNum
				)
				
				s += '			<tr>';
				s += '				<td>' + attribute.attributeName + '</td>';
				s += '				<td>';
				s += '					<div>';
				
				for (let i in attributeDetails) {
					let attributeDetail = attributeDetails[i];
					let id = 'attrDtl-' + attributeDetail.attrDtlNum;
					let value = attributeDetail.attrDtlNum;
					s += '					  <span class="attrDtl">';
					s += '					  <input class="form-check-input" name="attrDtlNums" type="checkbox" value="' + value +'" id="' + id + '">';
					s += '					  <label class="form-check-label" for="' + id + '">' + attributeDetail.attrDtlName;
					s += '					  </label>';
					s += '					  </span>';
				}
				s += '					</div>';
				s += '</td></tr>';
			}
			s += '</table></td>';
			$("#attr").children("td:eq(1)").remove().end().append(s);
		};
		ajaxFun(url, "get", query, "json", printAttributes);
	});
});
</script>

<c:if test="${mode=='update'}">
	<script type="text/javascript">
	$(function(){
		let count = ${dto.optionCount};
		
		if(count === 0) {
			$('.product-option-1').hide();
			$('.product-option-2').hide();
		} else if(count === 1) {
			$('.product-option-2').hide();
		}
	});
	</script>
</c:if>

<script type="text/javascript">
$(function(){
	$('select[name=optionCount]').change(function(){
		let count = parseInt($(this).val());
		let mode = '${mode}';
		let savedCount = '${dto.optionCount}';
		let totalStock = '${dto.totalStock}';
		if(mode === 'update' && totalStock !== '0') {
			alert('옵션 변경이 불가능 합니다.');
			$(this).val(savedCount);
			return false;
		}
		
		if(count === 0) {
			$('.product-option-1').hide();
			$('.product-option-2').hide();
			
			
		} else if(count === 1) {
			$('.product-option-1').show();
			$('.product-option-2').hide();
			
			
		} else if(count === 2) {
			$('.product-option-1').show();
			$('.product-option-2').show();
		}
	});
});

$(function(){
	$(".btnOptionAdd").click(function(){
		let $el = $(this).closest(".option-area").find(".optionValue-area");
		if($el.find(".input-group").length >= 5) {
			alert("옵션은 최대 5개까지 가능합니다.");
			return false;
		}
		let $option = $(".option-area .optionValue-area .input-group:first-child").clone();
		
		$option.find("input[type=hidden]").remove();
		$option.find("input[name=optionValues]").removeAttr("value");
		$option.find("input[name=optionValues]").val("");
		$el.append($option);
	});
	
	$(".option-area").on("click", ".option-minus", function(){
		let $minus = $(this);
		let $el = $minus.closest(".option-area").find(".optionValue-area");
		
		// 수정에서 등록된 자료 삭제
		let mode = "${mode}";
		if(mode === "update" && $minus.parent(".input-group").find("input[name=detailNums]").length === 1) {
			// 저장된 옵션값중 최소 하나는 삭제되지 않도록 설정
			if($el.find(".input-group input[name=detailNums]").length <= 1) {
				alert("옵션값은 최소 하나이상 필요합니다.");	
				return false;
			}
			
			if(! confirm("옵션값을 삭제 하시겠습니까 ? ")) {
				return false;
			}
			
			let detailNum = $minus.parent(".input-group").find("input[name=detailNums]").val();
			let url = "${pageContext.request.contextPath}/admin/product/deleteOptionDetail";
			$.post(url, {detailNum:detailNum}, function(data){
				if(data.state === "true") {
					$minus.closest(".input-group").remove();
				} else {
					alert("옵션값을 삭제할 수 없습니다.");
				}
			}, "json");
			
			return false;			
		}
		
		if($el.find(".input-group").length <= 1) {
			$el.find("input[name=optionValues]").val("");
			return false;
		}
		
		$minus.closest(".input-group").remove();
	});
});

$(function(){
	$(".btnOptionAdd2").click(function(){
		let $el = $(this).closest(".option-area2").find(".optionValue-area2");
		if($el.find(".input-group").length >= 5) {
			alert("옵션 값은 최대 5개까지 가능합니다.");
			return false;
		}
		let $option = $(".option-area2 .optionValue-area2 .input-group:first-child").clone();
		
		$option.find("input[type=hidden]").remove();
		$option.find("input[name=optionValues2]").removeAttr("value");
		$option.find("input[name=optionValues2]").val("");
		$el.append($option);
	});
	
	$(".option-area2").on("click", ".option-minus2", function(){
		let $minus = $(this);
		let $el = $minus.closest(".option-area2").find(".optionValue-area2");
		
		// 수정에서 등록된 자료 삭제
		let mode = "${mode}";
		if(mode === "update" && $minus.parent(".input-group").find("input[name=detailNums2]").length === 1) {
			// 저장된 옵션값중 최소 하나는 삭제되지 않도록 설정
			if($el.find(".input-group input[name=detailNums2]").length <= 1) {
				alert("옵션값은 최소 하나이상 필요합니다.");	
				return false;
			}
			
			if(! confirm("옵션값을 삭제 하시겠습니까 ? ")) {
				return false;
			}
			
			let detailNum = $minus.parent(".input-group").find("input[name=detailNums2]").val();
			let url = "${pageContext.request.contextPath}/admin/product/deleteOptionDetail";
			$.post(url, {detailNum:detailNum}, function(data){
				if(data.state === "true") {
					$minus.closest(".input-group").remove();
				} else {
					alert("옵션값을 삭제할 수 없습니다.");
				}
			}, "json");
			
		}
		
		if($el.find(".input-group").length <= 1) {
			$el.find("input[name=optionValues2]").val("");
			return false;
		}
		
		$minus.closest(".input-group").remove();
	});
});

$(function() {
	$('input[name=discountAmount]').change(function() {
		if (! $('input[name=price]').val() || ! $(this).val()
				|| isNaN($('input[name=price]').val()) || isNaN($(this).val())) {
			return;
		}
		
		let price = parseInt($('input[name=price]').val());
		
		if (price == 0) {
			return;
		}
		
		let discountAmount = parseInt($(this).val());
		const discountRate = Math.round((1 - (price - discountAmount) / price) * 100);
		$('input[name=discountRate]').val(discountRate);
	});
	
	$('input[name=price]').change(function() {
		if (! $('input[name=discountAmount]').val() || ! $(this).val()
				|| isNaN($('input[name=discountAmount]').val()) || isNaN($(this).val())) {
			return;
		}
		
		let discountAmount = parseInt($('input[name=price]').val());
		let price = parseInt($(this).val());
		
		if (price == 0) {
			return;
		}
		
		const discountRate = Math.round((1 - (price - discountAmount) / price) * 100);
		$('input[name=discountRate]').val(discountRate);
	});
});
</script>


<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h3><img src="${pageContext.request.contextPath}/resources/images/bone.png"> 상품 등록 </h3>
		</div>
		
		<div class="body-main">
		
		</div>
		
			<form name="productForm" method="post" enctype="multipart/form-data">
				
				<table class="table table-form">
				<tr>
					<td class="table-light col-sm-2">대상</td>
					<td>
						<div class="row">
							<div class="col-6 pe-1">
							<div class="form-check">
								  <input class="form-check-input" type="radio" name="species" id="speciesRadio1" value="1" checked>
								  <label class="form-check-label" for="speciesRadio1">
								   	강아지
								  </label>
								</div>
								<div class="form-check">
								  <input class="form-check-input" type="radio" name="species" id="speciesRadio2" value="2">
								  <label class="form-check-label" for="speciesRadio2">
								   	고양이
								  </label>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="table-light col-sm-2">구분</td>
					<td>
						<div class="row">
							<div class="col-6 pe-1">
							<div class="check">
								  <input class="form-check-input" type="radio" name="productClass" id="productClassRadio1" value="0" checked>
								  <label class="form-check-label" for="productClassRadio1">
								   	일반상품
								  </label>
								</div>
								<div class="check">
								  <input class="form-check-input" type="radio" name="productClass" id="productClassRadio2" value="1">
								  <label class="form-check-label" for="productClassRadio2">
								   	특가상품
								  </label>
								</div>
							</div>
						</div>
					</td>
				</tr>
				
					<tr>
						<td class="table-light col-sm-2">카테고리</td>
						<td>
							<div class="row">
								<div class="col-6 pe-1">
									<select name="parentCategory" class="form-select">
										<option value="">:: 상위 카테고리 선택 ::</option>
										<c:forEach items="${categories}" var="category">
											<option value="${category.CATEGORYNUM}">${category.CATEGORYNAME}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-6 ps-1">
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
							</div>
						</td>
					</tr>
					
					<tr id="attr">
						<td class="table-light col-sm-2">속성</td>
						<td>
							<!-- TODO: 디자인 할 때 아이콘 적당한 걸로 변경 -->
							<c:if test="${mode == 'write'}">
								<p style="color: red;">⚠️ 카테고리를 먼저 선택해 주세요.</p>
							</c:if>
						
							<!-- TODO: c:if 태그 써서 mode가 update인 경우에는 c:foreach 태그로 속성 출력 -->
							<c:if test="${mode == 'update'}">
								<small class="form-detailCategory help-block">[사료] 카테고리와 적합한 속성을 선택하세요</small>
								<table>
									<tr>
										<td>급여대상</td>
										<td>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
											  <label class="form-check-label" for="flexCheckDefault">
											    전연령
											  </label>
											</div>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
											  <label class="form-check-label" for="flexCheckDefault">
											    퍼피
											  </label>
											</div>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
											  <label class="form-check-label" for="flexCheckDefault">
											    어덜트
											  </label>
											</div>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
											  <label class="form-check-label" for="flexCheckDefault">
											    시니어
											  </label>
											</div>
										</td>	
										
									</tr>
									<tr>
										<td>주원료</td>
										<td>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
											  <label class="form-check-label" for="flexCheckDefault">
											    소
											  </label>
											</div>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
											  <label class="form-check-label" for="flexCheckDefault">
											    돼지
											  </label>
											</div>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
											  <label class="form-check-label" for="flexCheckDefault">
											    닭
											  </label>
											</div>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
											  <label class="form-check-label" for="flexCheckDefault">
											    오리
											  </label>
											</div>
										</td>	
										
									</tr>
									<tr>
										<td>기능</td>
										<td>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
											  <label class="form-check-label" for="flexCheckDefault">
											    치석
											  </label>
											</div>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
											  <label class="form-check-label" for="flexCheckDefault">
											    눈물
											  </label>
											</div>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
											  <label class="form-check-label" for="flexCheckDefault">
											    알러지
											  </label>
											</div>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
											  <label class="form-check-label" for="flexCheckDefault">
											    관절
											  </label>
											</div>
										</td>	
									</tr>
								</table>
							</c:if>
						</td>
						</tr>
						
					<tr>
						<td class="table-light col-sm-2">상품명</td>
						<td>
							<input type="text" name="productName" class="form-control" value="${dto.productName}">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">브랜드</td>
						<td>
							<input type="text" name="brand" class="form-control" value="">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">제조사</td>
						<td>
							<input type="text" name="manufacturer" class="form-control" value="">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">원산지</td>
						<td>
							<input type="text" name="origin" class="form-control" value="">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품가격</td>
						<td>
							<input type="text" name="price" class="form-control" value="">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">할인액</td>
						<td>
							<input type="text" name="discountAmount" class="form-control" value="">
							<small class="form-control-plaintext help-block">할인액이 0인 경우 상품가격이 판매가격입니다.</small>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">할인율</td>
						<td>
							<input type="text" name="discountRate" class="form-control" value="" readonly>
							<small class="form-control-plaintext help-block">할인율이 0인 경우 상품가격이 판매가격입니다.</small>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">배송비</td>
						<td>
							<input type="text" name="deliveryCharge" class="form-control" value="">
							<small class="form-control-plaintext help-block">배송비가 0인 경우 무료 배송입니다.</small>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품 옵션</td>
						<td>
							<div class="row">
								<div class="col-6">
									<select name="optionCount" class="form-select">
										<option value="2" selected>옵션 둘</option>
										<option value="1" >옵션 하나</option>
										<option value="0">옵션 없음</option>
									</select>
								</div>
							</div>
							<small class="form-control-plaintext help-block">상품 재고가 존재하면 옵션 변경은 불가능합니다.</small>
						</td>
					</tr>
					<tr class="product-option-1">
						<td class="table-light col-sm-2">옵션 1</td>
						<td>
							<div class="mb-2">
								<input type="text" name="optionName" class="form-control" style="width: 250px;" placeholder="옵션명" value="">

							</div>
							<div class="row option-area">
								<div class="col-auto pe-0 d-flex flex-row optionValue-area">
									<c:forEach var="vo" items="${listOptionDetail2}">
										<div class="input-group pe-1">
											<input type='text' name='optionValues' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값' value="">
											<input type="hidden" name="detailNums" value="${vo.detailNum}">
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus2'></i>									
										</div>
									</c:forEach>
									<c:if test="${empty listOptionDetail || listOptionDetail.size() < 1}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값'>
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus'></i>
										</div>
									</c:if>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btnOptionAdd">추가</button>
								</div>
							</div>
							<small class="form-control-plaintext help-block">판매 상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
						</td>
					</tr>
					<tr class="product-option-2">
						<td class="table-light col-sm-2">옵션 2</td>
						<td>
							<div class="mb-2">
								<input type="text" name="optionName2" style="width: 250px;" class="form-control" placeholder="옵션명" value="">
							</div>
							<div class="row option-area2">
								<div class="col-auto pe-0 d-flex flex-row optionValue-area2">
									<c:forEach var="vo" items="${listOptionDetail2}">
										<div class="input-group pe-1">
											<input type='text' name='optionValues2' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값' value="">
											<input type="hidden" name="detailNums2" value="${vo.detailNum}">
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus2'></i>									
										</div>
									</c:forEach>
									<c:if test="${empty listOptionDetail || listOptionDetail.size() < 1}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues2' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값'>
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus'></i>
										</div>
									</c:if>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btnOptionAdd2">추가</button>
								</div>
							</div>
							<small class="form-control-plaintext help-block">판매 상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">상품 상태</td>
						<td>
							<div class="pt-2 pb-2">
							<!-- NOTE: 판매 준비(0) / 판매중(1) / 품절(2) / 판매 중단(3) -->
								<input type="radio" name="productStatus" class="form-check-input" id="productStatus0" value="0" checked> <label class="form-check-label" for="productStatus0">판매 준비</label>
								&nbsp;&nbsp;
								<input type="radio" name="productStatus" class="form-check-input" id="productStatus1" value="1" > <label class="form-check-label" for="productStatus1">판매중</label>
								&nbsp;&nbsp;
								<input type="radio" name="productStatus" class="form-check-input" id="productStatus2" value="2" > <label class="form-check-label" for="productStatus2">품절</label>
								&nbsp;&nbsp;
								<input type="radio" name="productStatus" class="form-check-input" id="productStatus3" value="3" > <label class="form-check-label" for="productStatus3">판매 중단</label>
							</div>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2">상품설명</td>
						<td>
							<textarea name="content" id="ir1" class="form-control" style="max-width: 95%; height: 290px;"></textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">대표이미지</td>
						<td>
							<div class="thumbnail-viewer"></div>
							<input type="file" name="thumbnailFile" accept="image/*" class="form-control" style="display: none;">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">추가이미지</td>
						<td>
							<div class="img-grid">
								<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
								<c:forEach var="vo" items="${listFile}">
									<img src="${pageContext.request.contextPath}/uploads/product/1.jpg"
										class="item delete-img"
										data-fileNum="1"
										data-filename="1.jpg">
								</c:forEach>
							</div>
							<input type="file" name="addFiles" accept="image/*" multiple class="form-control" style="display: none;">
						</td>
					</tr>
					
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td class="text-center">
							<c:url var="url" value="/admin/product/${classify}/main">
								<c:if test="${not empty page}">
									<c:param name="page" value="${page}"/>
								</c:if>
							</c:url>
							<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">등록완료</button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/';">등록취소</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="productNum" value="${dto.productNum}">
								<input type="hidden" name="thumbnail" value="${dto.thumbnail}">
								<input type="hidden" name="page" value="${page}">
								
								<input type="hidden" name="prevOptionNum" value="${empty dto.optionNum ? 0 : dto.optionNum}">
								<input type="hidden" name="prevOptionNum2" value="${empty dto.optionNum2 ? 0 : dto.optionNum2}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
	</div>
</div>

<script type="text/javascript">
// 대표(썸네일) 이미지
$(function(){
	var img = "${dto.thumbnail}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/product/"+img;
		$(".table-form .thumbnail-viewer").empty();
		$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
	}
	
	$(".table-form .thumbnail-viewer").click(function(){
		$("form[name=productForm] input[name=thumbnailFile]").trigger("click");
	});
	
	$("form[name=productForm] input[name=thumbnailFile]").change(function(){
		let file = this.files[0];
		
		if(! file) {
			$(".table-form .thumbnail-viewer").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/product/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { // 파일의 내용을 다 읽었으면
			$(".table-form .thumbnail-viewer").empty();
			$(".table-form .thumbnail-viewer").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});
});

// 수정에서 등록된 추가 이미지 삭제
$(function(){
	$(".delete-img").click(function(){
		if(! confirm("이미지를 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		let $img = $(this);
		let fileNum = $img.attr("data-fileNum");
		let filename = $img.attr("data-filename");
		let url="${pageContext.request.contextPath}/admin/product/deleteFile";
		$.post(url, {fileNum:fileNum, filename:filename}, function(data){
			$img.remove();
		}, "json");
	});
});

// 추가 이미지
$(function(){
	var sel_files = [];
	
	$("body").on("click", ".table-form .img-add", function(){
		$("form[name=productForm] input[name=addFiles]").trigger("click");
	});
	
	$("form[name=productForm] input[name=addFiles]").change(function(){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.productForm.addFiles.files = dt.files;
			
			return false;
		}
		
        for(let file of this.files) {
        	sel_files.push(file);
        	
            const reader = new FileReader();
			const $img = $("<img>", {class:"item img-item"});
			$img.attr("data-filename", file.name);
            reader.onload = e => {
            	$img.attr("src", e.target.result);
            };
			reader.readAsDataURL(file);
            
            $(".img-grid").append($img);
        }
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.productForm.addFiles.files = dt.files;
	});
	
	$("body").on("click", ".table-form .img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.productForm.addFiles.files = dt.files;		
		
		$(this).remove();
	});
});
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
		console.log(e);
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>