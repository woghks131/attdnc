<%@ tag pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${data.count > 0 }">
	<fmt:parseNumber var="first_page" value="1" integerOnly="true" />
	<fmt:parseNumber var="last_page" value="${(data.count % data.PAGE_SIZE) == 0 ? (data.count / data.PAGE_SIZE) : (data.count / data.PAGE_SIZE) + 1}" integerOnly="true" />
	<fmt:parseNumber var="next_page" value="${data.PAGE+1 > last_page ? last_page : data.PAGE+1}" integerOnly="true" />
	<fmt:parseNumber var="prev_page" value="${data.PAGE-1 >= first_page ? data.PAGE-1 : first_page}" integerOnly="true" />

	<a href="javascript:movePage('${first_page}');" class="btn_first" style="padding-right:5px;"><img src="/images/btn/list/first.gif" alt="처음 페이지로 이동" /></a>
	<a href="javascript:movePage('${data.PAGE-1 > 0 ? data.PAGE-1 : 1}');" class="btn_prev" style="padding-right:5px;"><img src="/images/btn/list/pre.gif" alt="이전 페이지로 이동" /></a>

	<c:forEach var="i" begin="${(data.PAGE-(data.PAGE%10 == 0? data.PAGE : data.PAGE%10)) + 1}" end="${(data.PAGE-(data.PAGE%10)) + (data.PAGE%10 == 0? 0 : 10)}">
		<c:if test="${i <= last_page}">
			<c:choose>
				<c:when test="${data.PAGE == i}" >
					<strong>${i}</strong>
				</c:when>
				<c:otherwise>
					<a href="javascript:movePage('${i}');">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:forEach>
	
	<a href="javascript:movePage('${next_page}');" class="btn_next" style="padding-left:5px;"><img src="/images/btn/list/next.gif" alt="다음 페이지로 이동" /></a>
	<a href="javascript:movePage('${last_page}');" class="btn_last" style="padding-left:5px;"><img src="/images/btn/list/last.gif" alt="마지막 페이지로 이동" /></a>
</c:if>