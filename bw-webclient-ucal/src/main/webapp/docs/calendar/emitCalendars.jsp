<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<calendars>
  <c:set var="calendar" value="${bw_user_collection_list}" scope="session" />
  <%@include file="/docs/calendar/emitCalendar.jsp"%>
</calendars>


