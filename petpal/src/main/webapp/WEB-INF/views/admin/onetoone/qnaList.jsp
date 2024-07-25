<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


   <div id="allContainer">
       <table class="table table-border table-list">
           <thead>
               <tr class="border-top border-dark table-light text-center">
                   <th width="70">글번호</th>
                   <th width="130">문의유형</th>
                   <th width="100">회원이름</th>
                   <th>제목</th>
                   <th width="180">문의날짜</th>
                   <th width="100">답변여부</th>
                   <th width="180">답변등록일</th>
               </tr>
           </thead>
           <tbody>
               <c:forEach var="dto" items="${list}" varStatus="status">
                   <tr valign="middle" class="text-center">
                       <th>${dataCount - (pageNo-1) * size - status.index}</th>
                       <th>${dto.className}</th>
                       <th>${dto.userName}</th>
                       <th>
                           <a href="#" 
                              class="onetoone-link" 
                              data-num="${dto.num}" 
                              data-subject="${dto.subject}" 
                              data-className="${dto.className}" 
                              data-content="${dto.content}"
                              data-ansSubject="${dto.ansSubject}"
                              data-ansContent="${dto.ansContent}">
                               ${dto.subject}
                           </a>
                       </th>
                       <th>${dto.regDate}</th>
                       <th>
                           <c:choose>
                               <c:when test="${dto.isanswered == 0}">
                                   미답변
                               </c:when>
                               <c:when test="${dto.isanswered != 0}">
                                   답변 완료
                               </c:when>
                           </c:choose>
                       </th>
                       <th>${dto.ansRegDate}</th>
                   </tr>
               </c:forEach>
           </tbody>
       </table>
       <div class="page-navigation">${dataCount == 0 ? "내역이 없습니다." : paging}</div>
   </div>

 