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
            <h3><i class="bi bi-chat-right-text"></i> 1대1 문의관리 </h3>
        </div>
        
        <!-- Tabs for filtering -->
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="tab" type="button" role="tab" aria-controls="0" aria-selected="true">전체</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="unanswered-tab" data-bs-toggle="tab" data-bs-target="tab" type="button" role="tab" aria-controls="1" aria-selected="false">미답변</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="answered-tab" data-bs-toggle="tab" data-bs-target="tab" type="button" role="tab" aria-controls="2" aria-selected="false">답변 완료</button>
            </li>
        </ul>

        <div class="tab-content mt-3" id="myTabContent">
        </div>
      </div>
 </div>
 
 <div class="modal fade" id="onetooneModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">1대1 문의 답변</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="onetooneForm">
                    <div class="mb-3">
                        <label for="num" class="form-label">문의번호/유형</label>
                        <input type="text" class="form-control" id="num" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="onetoonesubject" class="form-label">제목</label>
                        <textarea class="form-control" id="onetoonesubject" rows="3" readonly></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="onetooneContent" class="form-label">문의 내용</label>
                        <textarea class="form-control" id="onetooneContent" rows="3" readonly></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="ansSubject" class="form-label">답변 제목</label>
                        <textarea class="form-control" id="ansSubject" name="ansSubject" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="onetooneResponse" class="form-label">답변 내용</label>
                        <textarea class="form-control" id="onetooneResponse" name="answer" rows="3" required></textarea>
                    </div>
                    <input type="hidden" id="numHidden" name="num">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="saveResponse">저장</button>
            </div>
        </div>
    </div>
</div>
 
 <script type="text/javascript">
$(document).ready(function() {
	$('.tab-content').on('click', '.onetoone-link', function(){
	       var num = $(this).data('num');
	        var onetoonesubject = $(this).data('subject');
	        var className = $(this).data('classname');
	        var onetooneContent = $(this).data('content');
	        var ansSubject = $(this).data('anssubject');
	        var onetooneResponse = $(this).data('anscontent');

	        $('#onetooneResponse').val(onetooneResponse);
	        $('#ansSubject').val(ansSubject);
	        $('#numHidden').val(num);
	        $('#num').val(num + ' / ' + className);
	        $('#onetoonesubject').val(onetoonesubject);
	        $('#onetooneContent').val(onetooneContent);
	        $('#onetooneModal .modal-title').text('1대1 문의 답변');
	        $('#onetooneModal').modal('show');
		
	});

    $('#saveResponse').on('click', function() {
        var num = $('#numHidden').val();
        var ansSubject = $('#ansSubject').val();
        var ansContent = $('#onetooneResponse').val();
        var ansRegDate = new Date().toISOString().split('T')[0];

        $.ajax({
            url: '${pageContext.request.contextPath}/admin/onetoone/saveResponse',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                num: num,
                ansRegDate: ansRegDate,
                ansContent: ansContent,
                ansSubject: ansSubject
            }),
            success: function(data) {
                alert('답변이 등록되었습니다.');
                $('#onetooneModal').modal('hide');
                location.reload();
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
	listQna(1);
	
    $("button[role='tab']").on("click", function(e){
		listQna(1);
    });
});

function listQna(page) {
	const $tab = $("button[role='tab'].active");
	let gubun = $tab.attr("aria-controls");
	
	let url = '${pageContext.request.contextPath}/admin/onetoone/qnaList';
	let formData = {pageNo:page, gubun:gubun};
	
	
	const fn = function(data) {
		$('.tab-content').html(data);
	}
	
	ajaxFun(url, "get", formData, "text", fn);
}

</script>

 