<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<style type="text/css">
    .body-container {
        max-width: 1300px;
        margin: 0 auto;
        padding: 20px;
    }
    .table {
        width: 100%;
        border-collapse: collapse;
    }
    .table th, .table td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }
    .table th {
        background-color: #f2f2f2;
    }
    .file-item {
        padding: 7px;
        margin-bottom: 3px;
        border: 1px solid #ced4da;
        color: #777777;
    }
    .button-container {
        text-align: right;
        margin-top: 20px;
    }
    .btn {
        padding: 5px 10px;
        border: none;
        background-color: #007bff;
        color: white;
        cursor: pointer;
        margin-right: 5px;
    }
    .btn:hover {
        opacity: 0.8;
    }
    .thumbnail {
        max-width: 200px;
    }
</style>

<div class="body-container">
    <div class="body-title">
        <h2><i class="fas fa-clipboard-list"></i> 이벤트 </h2>
    </div>
    
    <div class="body-main">
        <table class="table table-border table-article">
            <tbody>
                <tr>
                    <th width="20%">글번호</th>
                    <td width="80%">${dto.num}</td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>${dto.subject}</td>
                </tr>
                <tr>
                    <th>시작일</th>
                    <td>${dto.startDate}</td>
                </tr>
                <tr>
                    <th>종료일</th>
                    <td>${dto.endDate}</td>
                </tr>
                <tr>
                    <th>작성자 번호</th>
                    <td>${dto.memberNum}</td>
                </tr>
                <tr>
                    <th>썸네일</th>
                    <td>
                        <c:if test="${not empty dto.thumbnail}">
                            <img src="${pageContext.request.contextPath}/uploads/event/${dto.thumbnail}" alt="Thumbnail" class="thumbnail">
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>${dto.content}</td>
                </tr>
                <tr>
                    <th>파일</th>
                    <td>
                        <c:forEach var="vo" items="${listFile}" varStatus="status">
                            <p class="file-item">
                                <i class="fa-regular fa-folder-open"></i>
                                <a href="${pageContext.request.contextPath}/uploads/event/${vo.eventFileName}" download>${vo.eventFileName}</a>
                            </p>
                        </c:forEach>
                    </td>
                </tr>            
            </tbody>
        </table>
            
        <div class="button-container">
            <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/event/list?${query}';">리스트</button>
        </div>
    </div>
</div>
