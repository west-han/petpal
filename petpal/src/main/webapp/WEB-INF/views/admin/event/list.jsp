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
            margin-left: 80px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/eventmanage.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.close, .btn-secondary').on('click', function() {
                $('#editModal').modal('hide'); 
                $('#pointModal').modal('hide'); 
            });

            $(window).on('click', function(event) {
                if ($(event.target).is('#editModal')) {
                    $('#editModal').modal('hide'); 
                }
                if ($(event.target).is('#pointModal')) {
                    $('#pointModal').modal('hide'); 
                }
            });
        });
    </script>
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
                            <td>${dto.subject}</td>
                            <td>${dto.startDate}</td>
                            <td>${dto.endDate}</td>
                            <td>${dto.memberNum}</td>
                            <td><button class="btn btn-primary" onclick="location.href='${articleUrl}&num=${dto.num}'">수정</button></td>
                            <td><button class="btn btn-danger" onclick="location.href='${cp}/admin/event/delete?num=${dto.num}'">삭제</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div>
                <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/write';">이벤트 등록</button>
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
``
