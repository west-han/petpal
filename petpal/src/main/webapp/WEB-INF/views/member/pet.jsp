<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">
    <meta charset="UTF-8">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
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

        .btn-container.section3 {
            margin-top: 100px;
            gap: 200px; 
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

        button#next-btn3 {
            margin-left: auto; 
        }

        .radio-group {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px; 
        }

        .radio-item {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100px;
            height: 50px;
            background-color: #efefef;
            border: 1px solid #ccc;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .radio-item.selected {
            background-color: #aacdff;
        }

        .emoji {
            padding: 40px;
            font-size: 6rem;
            min-height: 6rem;
            text-align: center; 
        }
    </style>
</head>
<body>
    <div class="container" id="app">
        <div class="member-container">
            <div class="header">
                <div>회원 가입을 위해</div>
                <div>정보를 입력해주세요</div>
            </div>

            <!-- 페이지 3 : 동물 선택 -->
            <div class="section active" id="section3">
                <div class="emoji" ref="emoji">{{ selectedContent }}</div>
                <div class="radio-group">
                    <div v-for="(animal, index) in animals" :key="animal"
                        class="radio-item" 
                        @click="onTap(animal)"
                        :class="{ selected: animal === selected }"
                        :style="{ backgroundColor: animal === selected ? colors[index] : '#efefef' }">
                        {{ animal }}
                    </div>
                </div>
                <div class="btn-container section3">
                    <button id="prev-btn2">이전</button>
                    <button id="next-btn3">다음</button>
                </div>
            </div>

            <!-- 페이지 4 :  -->
            <div class="section" id="section4">
                <div class="pet-info-name">
                    <div>* 동물 이름</div>
                    <input type="text" />
                </div>
                <div class="pet-info-photo">
                    <div>* 사진</div>
                    <input type="file" accept="image/*" />
                </div>
                <div class="pet-info-birth">
                    <div>* 생일</div>
                    <input type="date" />
                </div>
                <div class="pet-info-gender">
                    <div>* 성별</div>
                    <input type="text" />
                </div>
                <div class="pet-info-weight">
                    <div>* 몸무게</div>
                    <input type="number" step="0.01" />
                </div>
                <div class="pet-info-body-type">
                    <div>* 체형</div>
                    <input type="text" />
                </div>
                <div class="pet-info-reg-number">
                    <div>* 동물등록번호</div>
                    <input type="text" />
                </div>
                <div class="btn-container">
                    <button id="prev-btn3">이전</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function(){
            $("#next-btn3").click(function(){
                $("#section3").removeClass("active");
                $("#section4").addClass("active");
            });

            $("#prev-btn2").click(function(){
                window.location.href = 'member.jsp';
            });

            $("#prev-btn3").click(function(){
                $("#section4").removeClass("active");
                $("#section3").addClass("active");
            });
        });

        const app = new Vue({
            el: "#app",
            data: {
                animals: ["cat", "dog"],
                emojis: ["🐱", "🐶"],
                colors: ["#F7CC45", "#AC6909"],
                selected: "cat"
            },
            computed: {
                selectedContent() {
                    if (this.selected) {
                        return this.emojis[this.animals.indexOf(this.selected)];
                    }
                    return "";
                }
            },
            watch: {
                selected(newValue) {
                    gsap.fromTo(
                        this.$refs.emoji,
                        { scale: 0 },
                        { scale: 1, duration: 0.6, ease: "elastic.out(1, 0.8)" }
                    );
                }
            },
            methods: {
                onTap(animal) {
                    this.selected = animal;
                }
            }
        });
    </script>
</body>
</html>
