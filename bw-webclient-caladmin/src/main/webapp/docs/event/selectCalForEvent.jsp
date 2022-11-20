<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<page>selectCalForEvent</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<% /* Used when selecting a calendar while adding or editing an event.

      This page will be called when
      a) we add an event by date with no specific calendar selected
      b) we import an event
      c) we add an event ref
      d) we edit an event and change it's calendar (or change it while adding)

      The intention is to load the calendar listing in a pop-up window as a
      tree of writable calendars.
      */ %>

<calendars>
  <c:set var="calendar" value="${bw_collection_list}"
         scope="session" />
  <%@include file="/docs/calendar/emitCalendar.jsp"%>
</calendars>

<%@ include file="/docs/footer.jsp" %>
</bedework>
