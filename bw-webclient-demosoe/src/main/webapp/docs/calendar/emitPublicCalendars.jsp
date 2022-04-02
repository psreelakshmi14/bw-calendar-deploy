<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>

<calendars>
  <c:if test="${not empty sessionScope.bw_public_collection_list}">
    <c:set var="calendar" value="${bw_public_collection_list}"
           scope="session" />
    <%@include file="/docs/calendar/emitCalendar.jsp"%>
  </c:if>
</calendars>
