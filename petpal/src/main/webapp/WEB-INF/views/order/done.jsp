<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

.body-container {
	max-width: 800px;
	margin: 0 auto;
}

.done-box {
	margin-top: 60px;
	border: 2px solid #E4B075;
	padding: 30px 20px; 
}

.done-box .done-title {
	display: flex;
	justify-content: center;
	font-size: 23px;
	color: #434347;
}

hr {
	margin: 25px 20px 50px 20px;
}

.msg-box {
	display: flex;
	justify-content: center;
}

.done-box .done-msg {
	display: flex;
	align-items: center;
	margin-bottom: 30px;
	margin-left: 90px;
}

.done-box .main-btn {
	margin-top: 40px;
	display: flex;
	justify-content: center;
}

.main-btn .btn {
	padding: 10px 100px; 
	font-size: 15px;
	border: none;
	background: #E4B075;
	color: white;
	font-weight: bold;
	border-radius: 10px;
}



img {
	height: 100px;
	width: 100px;

}

</style>

<div class="container">
	<div class="body-container">	

        <div class="body-">
            <div>
                <div class="done-box">
                    <h4 class="done-title">상품 결제 완료</h4>
                    <hr>
                       
	                <div class="msg-box">
						<p class="done-msg">
							결제가 완료되었습니다.
						</p>
						<img src="${pageContext.request.contextPath}/resources/images/foot.png">
	                </div>
	                

                       
                    <div class="main-btn">
                       <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/';">메인화면</button>
                    </div>
                </div>

            </div>
        </div>
	        
	</div>
</div>