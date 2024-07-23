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
            margin-left: 80px;
        }
        .body-title h3 {
            font-size: 26px;
        }
        .modal-content {
            background-color: #fefefe;
            padding: 30px;
            border: none;
            width: 90%;
            position: relative;
            box-shadow: 0 5px 15px rgba(0,0,0,0.5); 
            border-radius: 15px; 
        }
        .modal-header {
            border-bottom: none;
        }
        .modal-header .close {
            font-size: 1.5rem;
        }
        .modal-body {
            padding-top: 10px;
        }
        .modal-footer {
            border-top: none;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 10px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 20px;
        }
        .btn-secondary {
            border-radius: 20px;
        }
        .pagination .btn {
            border-radius: 20px;
        }
        .search .form-control {
            border-radius: 20px;
        }
        .search .btn {
            border-radius: 20px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberadmin.css">

    <script>
        $(document).ready(function() {
            $('.close, .btn-secondary').on('click', function() {
                $('#editModal').modal('hide'); 
            });

            $(window).on('click', function(event) {
                if ($(event.target).is('#editModal')) {
                    $('#editModal').modal('hide'); 
                }
            });
        });

        function editCustomer(memberNum) {
            $('#editModal').modal('show'); 

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
                    $('#editModal').modal('hide');
                    location.reload(); 
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
    <div class="container body-container">
        <div class="customer-info-management">
            <h2>고객 정보</h2>
            <table class="table table-striped customer-info-table">
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
                            <td><button class="btn btn-primary" onclick="editCustomer(${dto.memberNum})">수정</button></td>
                            <td><button class="btn btn-primary" onclick="editCustomer(${dto.memberNum})">포인트</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="pagination">
                <button class="btn btn-light"><<</button>
                <button class="btn btn-light current-page">1</button>
                <button class="btn btn-light">>></button>
            </div>
            <div class="search">
                <select id="searchField" class="form-control d-inline w-auto">
                    <option value="email">이메일 ▼</option>
                </select>
                <input type="text" id="searchQuery" class="form-control d-inline w-auto">
                <button class="btn btn-primary">검색</button>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div id="editModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">회원 정보 수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <input type="hidden" id="memberNum">
                        <div class="form-group">
                            <label for="email">이메일:</label>
                            <input type="text" class="form-control" id="email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="regDate">가입 날짜:</label>
                            <input type="text" class="form-control" id="regDate">
                        </div>
                        <div class="form-group">
                            <label for="notificationConsent">알림 동의:</label>
                            <input type="text" class="form-control" id="notificationConsent">
                        </div>
                        <div class="form-group">
                            <label for="enabled">활성화 상태:</label>
                            <input type="text" class="form-control" id="enabled">
                        </div>
                        <div class="form-group">
                            <label for="failureCount">실패 횟수:</label>
                            <input type="text" class="form-control" id="failureCount">
                        </div>
                        <div class="form-group">
                            <label for="lastLogin">마지막 로그인:</label>
                            <input type="text" class="form-control" id="lastLogin">
                        </div>
                        <div class="form-group">
                            <label for="birth">생년월일:</label>
                            <input type="text" class="form-control" id="birth">
                        </div>
                        <div class="form-group">
                            <label for="address1">주소 1:</label>
                            <input type="text" class="form-control" id="address1">
                        </div>
                        <div class="form-group">
                            <label for="address2">주소 2:</label>
                            <input type="text" class="form-control" id="address2">
                        </div>
                        <div class="form-group">
                            <label for="tel">전화번호:</label>
                            <input type="text" class="form-control" id="tel">
                        </div>
                        <div class="form-group">
                            <label for="nickname">닉네임:</label>
                            <input type="text" class="form-control" id="nickname">
                        </div>
                        <div class="form-group">
                            <label for="userName">이름:</label>
                            <input type="text" class="form-control" id="userName">
                        </div>
                        <div class="form-group">
                            <label for="postalCode">우편번호:</label>
                            <input type="text" class="form-control" id="postalCode">
                        </div>
                        <div class="form-group">
                            <label for="area">지역:</label>
                            <input type="text" class="form-control" id="area">
                        </div>
                        <div class="form-group">
                            <label for="membershipNum">멤버십 번호:</label>
                            <input type="text" class="form-control" id="membershipNum">
                        </div>
                        <button type="button" class="btn btn-primary" onclick="saveChanges()">저장</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
