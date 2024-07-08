<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">
    <meta charset="UTF-8">
    <style>
     
        * {
            box-sizing: border-box;
            font-family: "Noto Sans CJK KR";
            font-style: normal;
        }

        body {
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 670px;
            height: 960px;
            margin-top: 60px;
            margin-bottom: 60px;
            background: #ffffff;
            border: 1px solid #aacdff;
            box-shadow: 7px 7px 39px rgba(0, 104, 255, 0.25);
            border-radius: 20px;
        }

        .member-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 470px;
            margin-top: 72px;
            margin-bottom: 70px;
        }

        .header {
            width: 466px;
            height: 94px;
            font-weight: 700;
            font-size: 32px;
            line-height: 47px;
            color: #0068ff;
        }

        .section {
            display: none;
        }

        .section.active {
            display: block;
        }

        .section div {
            margin-top: 21px;
        }

        .section input {
            font-weight: 400;
            font-size: 16px;
            line-height: 24px;
            color: #797979;
            border: none;
            border-bottom: 1px solid #cfcfcf;
            width: 466px;
            margin-top: 21px;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-top: 30px;
        }

        button {
            width: 150px;
            height: 50px;
            font-weight: 400;
            font-size: 18px;
            line-height: 27px;
            text-align: center;
            color: #0068ff;
            background: #ffffff;
            border: 1px solid #0068ff;
            border-radius: 10px;
        }

        button#next-btn, button#next-btn2 {
            margin-left: auto; 
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
</head>
<body>
    <div class="container" id="app">
        <div class="member-container">
            <div class="header">
                <div>회원 가입을 위해</div>
                <div>정보를 입력해주세요</div>
            </div>
            <!--페이지 1 : 이메일 및 비빌번호 -->
            <div class="section active" id="section1">
                <div class="user-info-email">
                    <div>* 이메일</div>
                    <input type="email" />
                </div>
                <div class="user-info-pw">
                    <div>* 비밀번호</div>
                    <input type="password" />
                </div>
                <div class="btn-container">
                    <button id="next-btn">다음</button>
                </div>
            </div>

            <!-- 페이지 2 : 개인정보-->
            <div class="section" id="section2">
                <div class="extra-info-birth">
                    <div>* 생일</div>
                    <input type="date" />
                </div>
                <div class="extra-info-address">
                    <div>* 주소</div>
                    <input type="text" />
                </div>
                <div class="extra-info-phone">
                    <div>* 전화번호</div>
                    <input type="tel" />
                </div>
                <div class="extra-info-nickname">
                    <div>* 닉네임</div>
                    <input type="text" />
                </div>
                <div class="extra-info-name">
                    <div>* 이름</div>
                    <input type="text" />
                </div>
                <div class="btn-container">
                    <button id="prev-btn">이전</button>
                    <button id="next-btn2">다음</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function(){
            $("#next-btn").click(function(){
                $("#section1").removeClass("active");
                $("#section2").addClass("active");
            });

            $("#prev-btn").click(function(){
                $("#section2").removeClass("active");
                $("#section1").addClass("active");
            });

            $("#next-btn2").click(function(){
                window.location.href = '${pageContext.request.contextPath}/member/pet';
            });
        });
    </script>
</body>
</html>
