<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

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

<div class="container">
    <div class="body-container">
        <div class="body-title">
            <h3><i class="bi bi-chat-right-text"></i> 리뷰관리 </h3>
        </div>
        
        <div id="couponlistContainer">
            <table class="table table-border table-list">
                <thead>
                    <tr class="border-top border-dark table-light text-center">
                        <th>평점</th>
                        <th>회원이름</th>
                        <th>상품이름</th>
                        <th>수량</th>
                        <th>리뷰등록일</th>
                        <th>답변자번호</th>
                        <th>답변등록일</th>
                        <th>관리자숨김여부</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${list}" varStatus="status">
                        <tr valign="middle" class="text-center">
                            <th>${dto.rating}</th>
                            <th>${dto.userName}</th>
                            <th><a href="#" class="review-link" data-order="${dto.orderDetailNum}" data-name="${dto.productName}" data-content="${dto.content}">${dto.productName}</a></th>
                            <th>${dto.amount}</th>
                            <th>${dto.reviewDate}</th>
                            <th>
                                <c:choose>
                                    <c:when test="${dto.answerNum == 0}">
                                        미답변
                                    </c:when>
                                    <c:when test="${dto.answerNum != 0}">
                                        ${dto.answerNum}
                                    </c:when>
                                </c:choose>
                            </th>
                            <th>${dto.answerDate}</th>
                            <th>
                                <c:choose>
                                    <c:when test="${dto.showReview == 1}">
                                        공개
                                    </c:when>
                                    <c:when test="${dto.showReview == 0}">
                                        비공개
                                    </c:when>
                                </c:choose>
                            </th>
                        </tr>                   
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <table class="table table-borderless">
            <tr>
                <td width="150">
                    <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/review/list';"> <i class="bi bi-arrow-clockwise"></i> </button>               
                </td>
                <td align="center">
                    <form class="row justify-content-center" name="searchForm" action="${pageContext.request.contextPath}/admin/review/" method="post">
                        <div class="col-auto p-1">
                            <select name="schType" class="form-select">
                                <option value="all" selected>평점+</option>
                                <option value="productNum" >상품이름</option>
                                <option value="userName">회원이름</option>
                                <option value="showReview" >숨김여부</option>
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
            </tr>
        </table>
    </div>
</div>

<!-- 모달 창 HTML -->
<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">리뷰 답변 등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="reviewForm">
                    <div class="mb-3">
                        <label for="orderDetailNum" class="form-label">주문번호 및 상품이름</label>
                        <input type="text" class="form-control" id="orderDetailNum" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="reviewContent" class="form-label">리뷰 내용</label>
                        <textarea class="form-control" id="reviewContent" rows="3" readonly></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="reviewResponse" class="form-label">답변</label>
                        <textarea class="form-control" id="reviewResponse" name="answer" rows="3" required></textarea>
                    </div>
                    <input type="hidden" id="orderDetailNumHidden" name="orderDetailNum">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="saveResponse">저장</button>
            </div>
        </div>
    </div>
</div>


<!-- 모달 창 띄우기 및 AJAX 요청 코드 -->
<!-- jQuery center 함수 정의 -->
<script type="text/javascript">
$.fn.center = function () {
    this.css("position", "absolute");
    this.css("top", ($(window).height() - this.height()) / 2 + $(window).scrollTop() + "px");
    this.css("left", ($(window).width() - this.width()) / 2 + $(window).scrollLeft() + "px");
    return this;
}

$(document).ready(function() {
    $('.review-link').on('click', function(e) {
        e.preventDefault();
        var orderDetailNum = $(this).data('order');
        var productName = $(this).data('name');
        var reviewContent = $(this).data('content');

        $('#orderDetailNumHidden').val(orderDetailNum);
        $('#orderDetailNum').val(orderDetailNum + ' - ' + productName);
        $('#reviewContent').val(reviewContent);
        $('#reviewModal .modal-title').text(productName + ' 리뷰 답변 등록');
        $('#reviewModal').center().modal('show');
    });

    $('#saveResponse').on('click', function() {
        var orderDetailNum = $('#orderDetailNumHidden').val();
        var answer = $('#reviewResponse').val();
        var answerDate = new Date().toISOString().split('T')[0]; // 현재 날짜를 ISO 포맷으로 설정

        $.ajax({
            url: '${pageContext.request.contextPath}/admin/review/saveResponse',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ orderDetailNum: orderDetailNum, answer: answer, answerDate: answerDate }),
            success: function(data) {
                alert('답변이 등록되었습니다.');
                $('#reviewModal').modal('hide');
                location.reload(); // 새로고침하여 업데이트된 내용을 반영
            },
            error: function(xhr, status, error) {
                if (xhr.status === 401) {
                    location.href = '${pageContext.request.contextPath}/member/login';
                	// alert('AJAX : 로그인이 필요합니다.');
                    
                } else {
                    alert('답변 등록 중 오류가 발생했습니다.');
                    console.log(data);
                }
            }
        });
    });
});
</script>
