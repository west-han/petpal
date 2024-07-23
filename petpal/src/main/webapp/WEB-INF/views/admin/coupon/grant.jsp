<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



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

<script type="text/javascript">
$(document).ready(function() {
    $('#memberNum').blur(function() {
        var memberNum = $(this).val();
        if (memberNum) {
            $.ajax({
                url: '${pageContext.request.contextPath}/admin/coupon/checkMember',
                type: 'GET',
                data: { memberNum: memberNum },
                success: function(response) {
                    if (!response.exists) {
                        $('#memberNumError').text('없는 회원번호입니다.');
                    } else {
                        $('#memberNumError').text('');
                    }
                },
                error: function() {
                    $('#memberNumError').text('회원 번호 확인 중 오류가 발생했습니다.');
                }
            });
        }
    });
});
</script>



<div class="container">
    <div class="body-container">
        <div class="body-title">
            <h3><i class="fa-solid fa-ticket"></i> 쿠폰 지급 </h3>
        </div>
        <form action="${pageContext.request.contextPath}/admin/coupon/grant" method="post">
            <div>
                <label for="memberNum">회원 번호:</label>
                <input type="number" id="memberNum" name="memberNum" class="form-control" required>
                <span id="memberNumError" style="color: red;"></span>
            </div>
            <div>
                <label for="couponNum">쿠폰 번호:</label>
                <select id="couponNum" name="couponNum" class="form-select" required>
                    <option value="">쿠폰 선택</option>
                    <c:forEach items="${coupons}" var="coupon">
                        <option value="${coupon.couponNum}">${coupon.couponName}</option>
                    </c:forEach>
                </select>
            </div>          
            <div>
                <button type="submit" class="btn btn-primary">쿠폰 지급</button>
            </div>
        </form>
    </div>
</div>