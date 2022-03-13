<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>subscriptions</page>
<tab>calsuite</tab>

<!-- subscriptions are a subset of calendars; there is no difference to the underlying code. -->
<calendars>
  <c:set var="calendar" value="${bw_user_collection_list}"
         scope="session" />
  <%@include file="/docs/calendar/emitCalendar.jsp"%>
</calendars>

<%@include file="/docs/footer.jsp"%>
</bedework>
