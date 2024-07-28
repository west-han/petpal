<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>이벤트 관리</title>
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
        .btn {
            padding: 5px 10px;
            border: none;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            margin-right: 5px;
        }
        .btn-danger {
            background-color: #dc3545;
        }
        .btn-primary {
            background-color: #007bff;
        }
        .btn:hover {
            opacity: 0.8;
        }
        .page-box, .search {
            margin-top: 20px;
            text-align: center;
        }
        .button-container {
            text-align: right;
            margin-top: 20px;
        }
        .title-link {
            color: black; 
            text-decoration: none;
        }
        .title-link:hover {
            color: #E4A951; 
            text-decoration: none;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/eventmanage.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div id="mainOverlay" class="overlay"></div>
    <div class="container body-container">
        <div class="customer-info-management">
            <h2>이벤트 목록</h2>
            <table class="table customer-info-table">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>시작일</th>
                        <th>종료일</th>
                        <th>작성자 번호</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${list}">
                        <tr>
                            <td>${dto.num}</td>
                            <td class="left">
                                <a href="${pageContext.request.contextPath}/admin/event/article?num=${dto.num}&page=${page}" class="title-link">${dto.subject}</a>
                            </td>
                            <td>${dto.startDate}</td>
                            <td>${dto.endDate}</td>
                            <td>${dto.memberNum}</td>
                            <td><button class="btn btn-primary" onclick="location.href='${articleUrl}&num=${dto.num}'">수정</button></td>
                            <td><button class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/admin/event/delete?num=${dto.num}'">삭제</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="button-container">
                <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/event/write';">이벤트 등록</button>
            </div>
            <div class="page-box">
                <c:if test="${dataCount == 0}">
                    등록된 이벤트가 없습니다.
                </c:if>
                <c:if test="${dataCount > 0}">
                    ${paging}
                </c:if>
            </div>
            <div class="search">
                <form name="searchForm" action="${pageContext.request.contextPath}/admin/event/list" method="get">
                    <select id="searchField" name="schType" class="form-control d-inline w-auto">
                        <option value="num" ${schType=="num"?"selected":""}>글번호</option>
                        <option value="subject" ${schType=="subject"?"selected":""}>제목</option>
                        <option value="memberNum" ${schType=="memberNum"?"selected":""}>작성자</option>
                    </select>
                    <input type="text" id="searchQuery" name="kwd" value="${kwd}" class="form-control d-inline w-auto">
                    <button class="btn btn-primary" type="submit">검색</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
