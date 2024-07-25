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
        
    </style>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberadmin.css">
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

        function editPoints(memberNum,balance) {
        	$('#pointMemberNum').val(memberNum);
        	$('#currentPoints').val(balance);
        	
            $('#pointModal').modal('show'); 

            
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

        function savePoints() {
            const pointsData = {
                memberNum: $('#pointMemberNum').val(),
                point: $('#points').val()
            };

            $.ajax({
                url: "${pageContext.request.contextPath}/admin/member/points/" + pointsData.memberNum,
                type: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(pointsData),
                success: function() {
                    $('#pointModal').modal('hide');
                    location.reload(); 
                },
                error: function() {
                    alert("포인트 수정에 실패했습니다.");
                }
            });
        }

        function searchList() {
            const f = document.searchForm;
            alert('ok');
            f.submit();
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
                            <td><button class="btn btn-primary" onclick="editPoints(${dto.memberNum},${dto.balance})">포인트</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="page-box">
                ${paging}
            </div>
            <div class="search">
                <form name="searchForm" action="${pageContext.request.contextPath}/admin/member/list" method="post">
                    <select id="searchField" class="form-control d-inline w-auto">
                        <option value="email" ${schType=="email"?"selected":""}>이메일</option>
                        <option value="memberNum" ${schType=="memberNum"?"selected":""}>회원번호</option>
                        <option value="userName" ${schType=="userName"?"selected":""}>이름</option>
                    </select>
                    <input type="text" id="searchQuery" name="kwd" value="${kwd}" class="form-control d-inline w-auto">
                    <button class="btn btn-primary" onclick="searchList()">검색</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
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
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="saveChanges()">저장</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Point Modal -->
    <div id="pointModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">포인트 관리</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <input type="hidden" id="pointMemberNum" name="memberNum">
                        <div class="form-group">
                            <label for="currentPoints">현재 포인트:</label>
                            <input type="text" class="form-control" id="currentPoints" name="balance" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="points">지급할 포인트:</label>
                            <input type="text" class="form-control" id="points" name="points">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="savePoints()">저장</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
