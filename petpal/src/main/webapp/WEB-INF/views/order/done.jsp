<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<div class="body-container">	
        <div class="body-container2">
            
                <div class="done-box">
                    <h4 class="done-title">주문 완료</h4>
                    <hr>
                       
	                <div class="msg-box">
						<p class="done-msg">
							상품 주문이 완료되었습니다.
						</p>
						
	                </div>
 
                    <div class="main-btn">
                       <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/${sessionScope.species}';">메인화면</button>
                    </div>
                </div>

            
        </div>        
	</div>
</div>