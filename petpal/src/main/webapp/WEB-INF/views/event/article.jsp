<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Event Detail</title>
<style type="text/css">
.body-main {
    max-width: 900px;
}

.table-article img {
    max-width: 650px;
    display: block;
    margin: 0 auto;
}

.file-item {
    padding: 7px;
    margin-bottom: 3px;
    border: 1px solid #ced4da;
    color: #777777;
    display: flex;
    align-items: center;
}

.file-item span {
    margin-right: 10px;
    color: #6c757d;
}

.body-title {
    margin-bottom: 20px;
}

.table-article {
    border: none; 
    padding: 15px;
    background-color: #f8f9fa;
}


.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    color: #ffffff;
}
</style>
</head>
<body>

<div class="container">
    <div class="body-container">
        <div class="body-title">
            <h2>이벤트 &#x1F389;</h2> 
        </div>
        
        <div class="body-main p-3 mx-auto m-5">
            <table class="table table-border table-article">
                <tr>
                    <td class="h2">
                        ${dto.subject}
                    </td>
                </tr>
                
                <tr style="border-bottom:none;">
                    <td colspan="2" valign="top" height="200">
                        ${dto.content}
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <c:if test="${not empty list}">
                            <c:forEach var="vo" items="${list}" varStatus="status">
                                <p class="file-item">
                                    <span class="icon">&#128194;</span> 
                                    <a href="${pageContext.request.contextPath}/admin/eventManage/download?fileNum=${vo.eventFileNum}">${vo.eventFileName}</a>
                                </p>
                            </c:forEach>
                        </c:if>
                    </td>
                </tr>                
            </table>
            
            <div class="d-flex justify-content-end">
                <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/event/list';">리스트</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
