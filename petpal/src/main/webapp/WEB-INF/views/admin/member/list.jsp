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

</style>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberadmin.css">


<body>
    <div class="container">
        <div class="customer-info-management">
            <h2>고객 정보</h2>
            <table class="customer-info-table">
                <thead>
                    <tr>
                        <th>회원번호</th>
                        <th>이메일</th>
                        <th>이름</th>
                        <th>생년월일</th>
                        <th>가입날짜</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${members}">
                        <tr>
                            <td>${dto.memberNum}</td>
                            <td>${dto.email}</td>
                            <td>${dto.userName}</td>
                            <td>${dto.birth}</td>
                            <td>${dto.regDate}</td>
                            <td><button class="action-btn">수정</button></td>
                            <td><button class="action-btn">포인트</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="pagination">
                <button class="pagination-btn"><<</button>
                <button class="pagination-btn current-page">1</button>
                <button class="pagination-btn">>></button>
            </div>
            <div class="search">
                <select id="searchField" class="search-field">
                    <option value="email">이메일</option>
                </select>
                <input type="text" id="searchQuery" class="search-query">
                <button class="search-btn">검색</button>
            </div>
        </div>
    </div>
    <script>
        function editCustomer(memberId) {
            // 수정 버튼 클릭 시 동작할 스크립트
        }

        function viewPoints(memberId) {
            // 포인트 버튼 클릭 시 동작할 스크립트
        }

        function prevPage() {
            // 이전 페이지 버튼 클릭 시 동작할 스크립트
        }

        function nextPage() {
            // 다음 페이지 버튼 클릭 시 동작할 스크립트
        }

        function search() {
            // 검색 버튼 클릭 시 동작할 스크립트
        }
    </script>
</body>
