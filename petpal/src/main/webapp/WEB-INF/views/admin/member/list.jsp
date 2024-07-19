<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>회원 관리</title>
    <style type="text/css">
        .body-container {
            max-width: 1300px;
            margin-top: 140px;
            margin-left: 80px;
        }
        .body-title h3 {
            font-size: 26px;
        }
        .modal {
            display: none; /* 기본적으로 숨김 */
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4); /* 반투명 배경 */
        }
        
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            position: relative;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberadmin.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.close').on('click', function() {
                $('#editModal').hide(); // 모달 창을 숨김
            });

            $(window).on('click', function(event) {
                if ($(event.target).is('#editModal')) {
                    $('#editModal').hide(); // 모달 창 외부 클릭 시 닫기
                }
            });
        });

        function editCustomer(memberNum) {
            $('#editModal').show(); // 모달 창을 보여줍니다
        }
    </script>
</head>
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
                            <td><button class="action-btn" onclick="editCustomer(${dto.memberNum})">수정</button></td>
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

    <!-- Modal -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>회원 정보 수정</h2>
            <form>
                <input type="hidden" id="memberNum">
                <label for="email">이메일:</label>
                <input type="text" id="email"><br>
                <label for="socialLogin">소셜 로그인:</label>
                <input type="text" id="socialLogin"><br>
                <label for="password">비밀번호:</label>
                <input type="password" id="password"><br>
                <label for="regDate">가입 날짜:</label>
                <input type="text" id="regDate"><br>
                <label for="notificationConsent">알림 동의:</label>
                <input type="text" id="notificationConsent"><br>
                <label for="enabled">활성화 상태:</label>
                <input type="text" id="enabled"><br>
                <label for="failureCount">실패 횟수:</label>
                <input type="text" id="failureCount"><br>
                <label for="lastLogin">마지막 로그인:</label>
                <input type="text" id="lastLogin"><br>
                <label for="birth">생년월일:</label>
                <input type="text" id="birth"><br>
                <label for="address1">주소 1:</label>
                <input type="text" id="address1"><br>
                <label for="address2">주소 2:</label>
                <input type="text" id="address2"><br>
                <label for="tel">전화번호:</label>
                <input type="text" id="tel"><br>
                <label for="nickname">닉네임:</label>
                <input type="text" id="nickname"><br>
                <label for="userName">이름:</label>
                <input type="text" id="userName"><br>
                <label for="postalCode">우편번호:</label>
                <input type="text" id="postalCode"><br>
                <label for="area">지역:</label>
                <input type="text" id="area"><br>
                <label for="membershipNum">멤버십 번호:</label>
                <input type="text" id="membershipNum"><br>
                <button type="button" onclick="saveChanges()">저장</button>
            </form>
        </div>
    </div>
</body>
</html>
