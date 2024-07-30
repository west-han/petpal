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

.title-box {
	border-bottom: 3px solid #5D5D5D;
	padding-bottom: 30px;
}

.title {
	font-size: 23px;
}

.title-notice {
	margin-left: 10px;
	font-size: 18px;
	color: #7A7A7A;
}

.content {
	display: flex;
	border-bottom: 1px solid #BDBDBD;
	padding: 20px 30px;
	
}

.con-left {
	display: flex;
}

.con-right {
	display: flex;
	justify-content: space-between;
}

.classify {
	margin-right: 10px;
	width: 130px;
	color: #7A7A7A;
}

.subject:hover {
	cursor: pointer;
	text-decoration: underline;
}

.con-isAnswered {
	color: #E4B075;
}

.button {
	text-align: right;
	margin-top: 15px;
	margin-right: 10px;
}

.button .reg-btn {
	background: #E4B075;
	padding: 5px 10px;
	border: none;
	border-radius: 5px;
	color: white;
}

.page-link {
	border: none;
	color: #434347;
}

.active > .page-link {
	background: #434347;
	border-radius: 50%;
}

.pagination {
	--bs-pagination-disabled-bg: none;
}

</style>


<div>
	<div class="container">	
		<div class="body-container2">
			<div class="title-box">
				<label class="title">1:1 문의 &nbsp;&nbsp; |&nbsp;</label>
				<label class="title-notice">문의글은 작성자 본인만 확인 가능합니다</label>
			</div>
			<div class="content-box">
				<c:forEach var="dto" items="${list}">
					<div class="content">
						<div class="con-left w-75">
							<div class="classify">[${dto.className}]</div>
							<a class="subject" href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
						</div>
						<div class="w-25 con-right">
							<div style="min-width: 100px;" class="text-center">${dto.userName}</div>
							<c:choose>
								<c:when test="${dto.isAnswered == 0}">
									<div>답변대기</div>
								</c:when>
								<c:otherwise>
									<div class="con-isAnswered">답변완료</div>
								</c:otherwise>
							</c:choose>
							<div>${dto.regDate}</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="button">
				<button class="reg-btn" onclick="location.href='${pageContext.request.contextPath}/onetoone/write';">문의하기</button>
			</div>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
		</div>	
	</div>	
</div>




