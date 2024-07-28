<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
* { padding: 0; margin: 0; }

*, *::after, *::before { box-sizing: border-box; }

.body-container2 {
	max-width: 1300px;
	padding: 50px 50px;
	font-size: 15px;
	color: #434347;
}

.question .ques-title, .answ-title {
	font-size: 23px;
	padding: 0 20px;
	padding-bottom: 10px;
	border-bottom: 3px solid #BDBDBD;
	display: flex; 
}

.question .ques-title .ques-q, .answ-title .answ-a {
	margin-right: 10px;
	color: #BDBDBD;
	font-weight: bold;
}

.answ-title .title-left, .answ-a {
	color: #E4B075 !important;
}

.question .ques-title .title-left {
	display: flex;
}


.question .ques-title .title-left .ques-classify {
	margin-right: 8px; 
}

.question .ques-title .title-right, .answer .answ-date {
	font-size: 13px;
	display: flex;
	align-items: center; 
	justify-content: flex-end;
	padding-top: 10px;
}

.question .ques-title .title-right .ques-date {
	margin-left: 10px;
}

.question .ques-content, .answer .answ-content {
	min-height: 300px;
	font-size: 18px;
	padding: 40px 30px;
	border-bottom: 1px solid #BDBDBD;
	margin-bottom: 15px;
	
}

.question .ques-contents {
	min-height: 140px;
}

.question .ques-imgs {
	padding-top: 30px;
}

.question .ques-imgs img {
	border: none;
	border-radius: 10px;
	height: 130px !important;
	width: 130px !important;
	border: 1px solid #BDBDBD;
	margin-right: 10PX;
}

.question .ques-imgs img:hover {
	cursor: pointer;
}


.answer .answ-title {
	display: flex;
	justify-content: space-between;
	padding-bottom: 15px;
}

.buttons {
	display: flex;
	justify-content: space-between;
	margin: 0 5px;
}

.buttons .list-btn, .delete-btn {
	padding: 8px 18px 5px 18px;
	background: #BDBDBD;
	border: none;
	border-radius: 5px;
	color: white;
}

.buttons .list-btn {
	background: #E4B075;
}


</style>

<script type="text/javascript">
$(function(){
	$('.imageViewer').click(function(){
		const $model = $('#myDialogModal .modal-body');
		
		let src = $(this).attr('src');
		let s = "<img src='"+src+"' class='img-thumbnail w-100 h-100'>";
		$model.html(s);
		
		$('#myDialogModal').modal('show');
	});
});

function deleteQuestion() {
	if(confirm("글을 삭제 하시겠습니까 ?")) {
		let query = "num=${dto.num}&${query}";
		let url = "${pageContext.request.contextPath}/onetoone/delete?"+query;
		location.href = url;
	}
}

</script>


<div>
	<div class="container">	
		<div class="body-container2">
			<div class="question">
				<div class="ques-title">
					<label class="ques-q">Q.</label>
					<div class="title-left w-50">
						<label class="ques-classify">[${dto.className}]</label>
						<label class="ques-subject">${dto.subject}</label>
					</div>
					<div class="title-right w-50">
						<label>${dto.userName} &nbsp;&nbsp; |&nbsp;</label>
						<label class="ques-date">${dto.regDate}</label>
					</div>
				</div>
				
				<div class="ques-content">
					<div class="ques-contents">${dto.content}</div>
					<div class="ques-imgs">
						<c:forEach var="vo" items="${listFile}">
						<img src="${pageContext.request.contextPath}/uploads/onetoone/${vo.qnaFileName}"
							class="imageViewer img-thumbnail">
						</c:forEach>	
					</div>
				</div>
			</div>
			<c:if test="${dto.isAnswered == 1}">
				<div class="answer">
					<div class="answ-title">
						<div class="title-left w-50">
							<label class="answ-a">A.</label>
							<label class="answ-subject">${dto.ansSubject}</label>
						</div>
						<label class="answ-date">${dto.ansRegDate}</label>
					</div>
					<div>
						<div class="answ-content">
							${dto.ansContent}
						</div>
					</div>
				</div>
			</c:if>
			<div class="buttons">
				<button class="delete-btn" onclick="deleteQuestion();">삭제</button>
				<button class="list-btn" onclick="location.href='${pageContext.request.contextPath}/onetoone/list?${query}';">목록</button>
				
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="myDialogModal" tabindex="-1" aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myDialogModalLabel">첨부파일</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
        
			</div>
		</div>
	</div>
</div>