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
                            <th>${dto.subject}</th>
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










