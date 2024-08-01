<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-title h3 {
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

        <!-- Tabs for filtering -->
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="unanswered-tab" data-bs-toggle="tab" data-bs-target="tab" type="button" role="tab" aria-controls="1" aria-selected="true">미답변</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="answered-tab" data-bs-toggle="tab" data-bs-target="tab" type="button" role="tab" aria-controls="2" aria-selected="false">답변 완료</button>
            </li>
        </ul>

        <div class="tab-content mt-3" id="myTabContent"></div>

            
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
    $('.tab-content').on('click', '.review-link', function(e) {
        
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
                } else {
                    alert('답변 등록 중 오류가 발생했습니다.');
                    console.log(data);
                }
            }
        });
    });
});
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
	listReview(1);
	
    $("button[role='tab']").on("click", function(e){
    	listReview(1);
    });
});

function listReview(page) {
	const $tab = $("button[role='tab'].active");
	let gubun = $tab.attr("aria-controls");
	
	let url = '${pageContext.request.contextPath}/admin/review/reviewList';
	let formData = {pageNo:page, gubun:gubun};
	
	const fn = function(data) {
		$('.tab-content').html(data);
	}
	
	ajaxFun(url, "get", formData, "text", fn);
}



</script>
