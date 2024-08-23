<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글목록</title>
    <link rel="stylesheet" href="/jboard/css/style.css">
    
</head>
<body>
    <div id="container">
        <%@ include file="./_header.jsp" %>
        <main>
            <section class="list">
                <h3>글목록</h3>
                <article>
                    <table border="0">
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>날짜</th>
                            <th>조회</th>
                        </tr>
                        <c:set var="currentNumber_"  value="${currentNumber}"></c:set>
                        <c:forEach var="article" items="${articles}">
                        	
							<tr>
								<td>${currentNumber_}</td>
								<td><a href="/jboard/article/view.do?no=${article.no}&pg=${currentPage}">${article.title}</a>&nbsp;[${article.comment}]</td>
								<td>${article.nick}</td>
								<td>${article.rdate}</td>
								<td>${article.hit}</td>
							</tr>
							<c:set var="currentNumber_"  value="${currentNumber_-1}"></c:set>
						</c:forEach>
                    </table>
                </article>

                <!-- 페이지 네비게이션 -->
                <div class="paging">
                	<c:if test="${pageGroup.start > 1}">
                    	<a href="/jboard/article/list.do?pg=${pageGroup.start-1}" class="prev">이전</a>
                    </c:if>
				    <c:forEach var="i" begin="${pageGroup.start}" end="${pageGroup.end}">                
				        <c:if test="${lastPageNum >= i}">
					        <c:choose>
					            <c:when test="${i == currentPage}">
					                <!-- 현재 페이지인 경우 회색으로 스타일 적용 -->
					                <a href="/jboard/article/list.do?pg=${i}" class="num current">${i}</a>
					            </c:when>
					            <c:otherwise>
					                <!-- 일반 페이지 -->
					                <a href="/jboard/article/list.do?pg=${i}" class="num">${i}</a>
					            </c:otherwise>
					        </c:choose>
				        </c:if>
				    </c:forEach>
                    <c:if test="${pageGroup.end < lastPageNum}">
                    	<a href="/jboard/article/list.do?pg=${pageGroup.end+1}" class="next">다음</a>
                    </c:if>
                </div>

                <!-- 글쓰기 버튼 -->
                <a href="/jboard/article/write.do" class="btnWrite">글쓰기</a>
            </section>
        </main>
        <%@ include file="./_footer.jsp" %>
    </div>
</body>
</html>