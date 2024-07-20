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
            margin-top: 60px;
            margin-bottom: 60px;
            background: #ffffff;
            border: 1px solid #aacdff;
            box-shadow: 7px 7px 39px rgba(0, 104, 255, 0.25);
            border-radius: 20px;
            padding: 20px;
        }

        .member-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 470px;
        }

        .header {
            width: 100%;
            font-weight: 700;
            font-size: 32px;
            line-height: 47px;
            color: #0068ff;
            text-align: center;
            margin-bottom: 20px;
        }

        .section {
            width: 100%;
            margin-bottom: 30px;
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
            width: 100%;
            margin-top: 21px;
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
            <div class="section">
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
            </div>

            <!-- 페이지 4 : 동물 정보 입력 -->
            <div class="section">
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
            </div>
        </div>
    </div>

    <script>
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
