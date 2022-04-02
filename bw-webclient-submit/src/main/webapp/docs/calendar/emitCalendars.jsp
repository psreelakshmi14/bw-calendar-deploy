<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<calendars>
  <c:if test="${not empty sessionScope.bw_collection_list}">
    <c:set var="calendar" value="${bw_collection_list}" scope="session"/>
    <%@include file="/docs/calendar/emitCalendar.jsp"%>
  </c:if>
</calendars>
