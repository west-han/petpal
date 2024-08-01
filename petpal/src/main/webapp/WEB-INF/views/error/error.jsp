<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   response.setStatus(HttpServletResponse.SC_OK);
%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>

<div class="container">
	<div class="body-container">	

        <div class="row justify-content-md-center mt-5">
            <div class="col-md-12">
                <div class="border mt-5 p-4">
                       <h4 class="text-center fw-bold"><i class="bi bi-exclamation-triangle"></i> 잘못된 접근입니다.</h4>
                       
	                <div class="d-grid pt-3">
						<p class="alert alert-primary text-center bg-light fs-6">
							입력하신 주소가 정확한지 다시 한 번 확인하시거나,<br>
							펫팔 홈페이지로 이동하여 다른 링크를 이용해 주세요.
						</p>
	                </div>
                       
                       <div class="d-grid">
                           <button type="button" class="btn btn-lg btn-primary" onclick="location.href='${pageContext.request.contextPath}/';">메인화면으로 이동 <i class="bi bi-arrow-counterclockwise"></i> </button>
                       </div>
                </div>
            </div>
        </div>

	</div>
</div>
