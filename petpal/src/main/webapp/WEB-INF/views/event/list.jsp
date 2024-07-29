<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>이벤트 목록</title>
    <style type="text/css">
        .body-container {
            max-width: 1300px;
            margin: 0 auto;
            padding: 20px;
        }
        .events-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        .event-card {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        .event-card img {
            max-width: 100%;
            height: auto;
        }
        .event-card a {
            display: block;
            margin-top: 10px;
            font-size: 16px;
            color: #333;
            text-decoration: none;
        }
        .event-card a:hover {
            color: #007bff;
        }
        .button-container {
            text-align: right;
            margin-top: 20px;
        }
        .page-box {
            text-align: center;
            margin-top: 20px;
        }
        @media (max-width: 600px) {
            .events-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="body-container">
        <h2>이벤트 목록</h2>
        <div class="events-grid">
            <c:forEach var="dto" items="${list}">
                <div class="event-card">
                    <c:if test="${not empty dto.thumbnail}">
                        <img src="${pageContext.request.contextPath}/uploads/event/${dto.thumbnail}" alt="Thumbnail">
                    </c:if>
                    <a href="${pageContext.request.contextPath}/event/article?num=${dto.num}&page=${page}">${dto.subject}</a>
                </div>
            </c:forEach>
        </div>
        <div class="page-box">
            <c:if test="${dataCount == 0}">
                등록된 이벤트가 없습니다.
            </c:if>
            <c:if test="${dataCount > 0}">
                ${paging}
            </c:if>
        </div>
    </div>
</body>
</html>


