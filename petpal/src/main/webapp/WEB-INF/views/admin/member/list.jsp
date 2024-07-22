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
            display: none;
            position: fixed;
            z-index: 3; 
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.7); /* 반투명 배경 색상 변경 */
        }
        
        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 60%;
            position: relative;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3); /* 그림자 효과 추가 */
            border-radius: 10px; 
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
        .overlay {
            display: none;
            position: fixed;
            z-index: 2; 
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7); /* 어두운 배경 */
        }
    </style>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberadmin.css">

    <script>
        $(document).ready(function() {
            $('.close').on('click', function() {
                $('#editModal').hide(); 
                $('.overlay').hide(); 
            });

            $(window).on('click', function(event) {
                if ($(event.target).is('#editModal')) {
                    $('#editModal').hide(); 
                    $('.overlay').hide(); 
                }
            });
        });

        function editCustomer(memberNum) {
            $('#editModal').show(); 
            $('.overlay').show(); 

           
            $.get("${pageContext.request.contextPath}/admin/member/" + memberNum, function(data) {
                $('#memberNum').val(data.memberNum);
                $('#email').val(data.email);
                $('#regDate').val(data.regDate);
                $('#notificationConsent').val(data.notificationConsent);
                $('#enabled').val(data.enabled);
                $('#failureCount').val(data.failureCount);
                $('#lastLogin').val(data.lastLogin);
                $('#birth').val(data.birth);
                $('#address1').val(data.address1);
                $('#address2').val(data.address2);
                $('#tel').val(data.tel);
                $('#nickname').val(data.nickname);
                $('#userName').val(data.userName);
                $('#postalCode').val(data.postalCode);
                $('#area').val(data.area);
                $('#membershipNum').val(data.membershipNum);
            });
        }

        function saveChanges() {
            const member = {
                memberNum: $('#memberNum').val(),
                email: $('#email').val(),
                regDate: $('#regDate').val(),
                notificationConsent: $('#notificationConsent').val(),
                enabled: $('#enabled').val(),
                failureCount: $('#failureCount').val(),
                lastLogin: $('#lastLogin').val(),
                birth: $('#birth').val(),
                address1: $('#address1').val(),
                address2: $('#address2').val(),
                tel: $('#tel').val(),
                nickname: $('#nickname').val(),
                userName: $('#userName').val(),
                postalCode: $('#postalCode').val(),
                area: $('#area').val(),
                membershipNum: $('#membershipNum').val()
            };

            $.ajax({
                url: "${pageContext.request.contextPath}/admin/member/" + member.memberNum,
                type: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(member),
                success: function() {
                    $('#editModal').hide();
                    $('.overlay').hide();
                    location.reload(); // 페이지 새로고침하여 변경된 내용 반영
                },
                error: function() {
                    alert("회원 정보 수정에 실패했습니다.");
                }
            });
        }
    </script>
</head>
<body>
    <div id="mainOverlay" class="overlay"></div>
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
