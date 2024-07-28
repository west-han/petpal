<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<style type="text/css">
.body-main {
	max-width: 900px;
}

.table-article img { max-width: 650px; }
.file-item { padding: 7px; margin-bottom: 3px; border: 1px solid #ced4da; color: #777777; }
</style>



<div class="body-container">
    <div class="body-title">
		<h2><i class="fas fa-clipboard-list"></i> 이벤트 </h2>
    </div>
    
    <div class="body-main">

		<table class="table table-border table-article">
			
			<tbody>
				<tr>
					<td width="50%" align="left">
						이름 : ${dto.userName}
					</td>
				</tr>
				
				<tr style="border-bottom:none;">
					<td colspan="2" valign="top" height="200">
						${dto.content}
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<c:forEach var="vo" items="${listFile}" varStatus="status">
							<p class="file-item">
								<i class="fa-regular fa-folder-open"></i>
								<a href="${pageContext.request.contextPath}/admin/eventManage/download?fileNum=${vo.fileNum}">${vo.originalFilename}</a>
								
							</p>
						</c:forEach>
					</td>
				</tr>			
			</tbody>
		</table>
			
		<table class="table">
			<tr>
				<td width="50%" align="left">
				<td align="right">
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/event/list?${query}';">리스트</button>
				</td>
			</tr>
		</table>
		
	</div>
</div>
