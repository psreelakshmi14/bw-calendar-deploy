<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>addSubscription</page>
<bw:emitText name="calForm" property="addingCalendar"
             tagName="creating"/>

<%@include file="/docs/calendar/emitCalendars.jsp"%>

<publicCalendars>
  <c:set var="calendar" value="${bw_public_collection_list}"
         scope="session" />
  <%@include file="/docs/calendar/emitCalendar.jsp"%>
</publicCalendars>

<%@include file="/docs/footer.jsp"%>

</bedework>
