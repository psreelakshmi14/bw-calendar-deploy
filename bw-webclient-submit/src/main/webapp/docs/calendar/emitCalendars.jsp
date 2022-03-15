<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>

<calendars>
  <logic:present name="bw_collection_list" scope="session">
    <c:set var="calendar" value="${bw_collection_list}" scope="session"/>
    <%@include file="/docs/calendar/emitCalendar.jsp"%>
  </logic:present>
</calendars>
