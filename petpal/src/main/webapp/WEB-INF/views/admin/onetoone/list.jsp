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
            <h3><i class="bi bi-chat-right-text"></i> 1대1 문의관리 </h3>
        </div>
        
        <div id="onetoonelistContainer">
            <table class="table table-border table-list">
                <thead>
                    <tr class="border-top border-dark table-light text-center">
                        <th>글번호</th>
                        <th>문의유형</th>
                        <th>회원이름</th>
                        <th>제목</th>
                        <th>문의날짜</th>
                        <th>답변여부</th>
                        <th>답변등록일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${list}" varStatus="status">
                        <tr valign="middle" class="text-center">
                            <th>${dto.num}</th>
                            <th>${dto.className}</th>
                            <th>${dto.userName}</th>
                            <th>
                            <a href="#" 
                            class="onetoone-link" 
                            data-num="${dto.num}" 
                            data-subject="${dto.subject}" 
                            data-className="${dto.className}" 
                            data-content="${dto.content}"
                            data-ansSubject="${dto.ansSubject}"
                            data-ansContent="${dto.ansContent}"
                            >
                            ${dto.subject}
                            </a>
                            </th>
                            <th>${dto.regDate}</th>
                            <th>
                                <c:choose>
                                    <c:when test="${dto.isanswered == 0}">
                                        미답변
                                    </c:when>
                                    <c:when test="${dto.isanswered != 0}">
                                        답변 완료
                                    </c:when>
                                </c:choose>
                            </th>
                            <th>${dto.ansRegDate}</th>
                            
                        </tr>                   
                    </c:forEach>
                </tbody>
            </table>
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
    $('.onetoone-link').on('click', function(e) {
        e.preventDefault();
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
        $('#onetoonesubject').val(onetoonesubject); // 여기서 변수명을 올바르게 참조합니다.
        $('#onetooneContent').val(onetooneContent);
        $('#onetooneModal .modal-title').text('1대1 문의 답변'); // 여기서도 변수명을 올바르게 참조합니다.
        $('#onetooneModal').center().modal('show');
    });

    $('#saveResponse').on('click', function() {
        var num = $('#numHidden').val(); // numHidden 값을 사용해야 합니다.
        var ansSubject = $('#ansSubject').val(); // 여기서 변수명을 올바르게 참조합니다.
        var ansContent = $('#onetooneResponse').val();
        var ansRegDate = new Date().toISOString().split('T')[0]; // 현재 날짜를 ISO 포맷으로 설정

        $.ajax({
            url: '${pageContext.request.contextPath}/admin/onetoone/saveResponse',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ 
                num: num, 
                ansRegDate: ansRegDate, 
                ansContent: ansContent, 
                ansSubject: ansSubject // 여기서 변수명을 올바르게 참조합니다.
            }),
            success: function(data) {
                alert('답변이 등록되었습니다.');
                $('#onetooneModal').modal('hide');
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

