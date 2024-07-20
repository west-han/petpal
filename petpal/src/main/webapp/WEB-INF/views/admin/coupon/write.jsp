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
        updateCategories();
    });

    $('#parentCategory').change(function() {
        var parentCategoryId = $(this).val();
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/coupon/listSubCategory',
            type: 'GET',
            data: { parentCategory: parentCategoryId },
            success: function(data) {
                var categoryNum = $('#categoryNum');
                categoryNum.empty();
                categoryNum.append('<option value="">하위 카테고리 선택</option>');
                $.each(data.subCategories, function(index, item) {
                    categoryNum.append(new Option(item.CATEGORYNAME, item.CATEGORYNUM));
                });
            },
            error: function() {
                alert('하위 카테고리를 불러오는 중 오류가 발생했습니다.');
            }
        });
    });


    function updateCategories() {
        var species = $("input[name='species']:checked").val();
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/coupon/listCategory',
            type: 'GET',
            data: { species: species },
            success: function(data) {
                var parentCategory = $('#parentCategory');
                parentCategory.empty();
                parentCategory.append('<option value="">상위 카테고리 선택</option>');
                $.each(data.categories, function(index, item) {
                	parentCategory.append(new Option(item.CATEGORYNAME, item.CATEGORYNUM));
                });
                $('#categoryNum').empty();
                $('#categoryNum').append('<option value="">하위 카테고리 선택</option>');
            },
            error: function() {
                alert('상위 카테고리를 불러오는 중 오류가 발생했습니다.');
            }
        });
    }

    // 초기 로드 시 카테고리 업데이트
    updateCategories();
});
</script>

<div class="container">
    <div class="body-container">
        <div class="body-title">
            <h3><i class="fa-solid fa-ticket"></i> 쿠폰관리 </h3>
        </div>
        <form action="${pageContext.request.contextPath}/admin/coupon/insert" method="post">
            <div>
                <label for="couponName">쿠폰 이름:</label>
                <input type="text" id="couponName" name="couponName" class="form-control" required>
            </div>
            <div>
                <label for="discountRate">할인율:</label>
                <input type="number" id="discountRate" name="discountRate" class="form-control" required>
            </div>
            <div>
                <label for="minPurchaseAmount">최소 결제 금액:</label>
                <input type="number" id="minPurchaseAmount" name="minPayment" class="form-control" required>
            </div>
            <div>
                <label for="validity">유효 기간:</label>
                <input type="date" id="validity" name="validity" class="form-control" required>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="species" id="speciesRadio1" value="1" checked>
                <label class="form-check-label" for="speciesRadio1">강아지</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="species" id="speciesRadio2" value="2">
                <label class="form-check-label" for="speciesRadio2">고양이</label>
            </div>
            <div>
                <label for="parentCategory">상위 카테고리:</label>
                <select id="parentCategory" name="parentCategory" class="form-select" required>
                    <option value="">상위 카테고리 선택</option>
                </select>
            </div>
            <div>
                <label for="categoryNum">하위 카테고리:</label>
                <select id="categoryNum" name="categoryNum" class="form-select" required>
                    <option value="">하위 카테고리 선택</option>
                    <!-- 하위 카테고리 옵션은 AJAX로 동적으로 채워짐 -->
                </select>
            </div>
            
            <div>
            	
                <button type="submit" class="btn btn-primary">쿠폰 등록</button>
            </div>
        </form>
    </div>
</div>
