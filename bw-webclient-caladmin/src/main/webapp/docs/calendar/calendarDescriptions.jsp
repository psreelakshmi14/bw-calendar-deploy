
<bedework>
<%@include file="/docs/header.jsp"%>

<% /*  the same as calendarList.jsp, but will be treated differently  */ %>
<page>calendarDescriptions</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<%@include file="/docs/calendar/emitPublicCalendars.jsp"%>

<%@include file="/docs/footer.jsp"%>
</bedework>
