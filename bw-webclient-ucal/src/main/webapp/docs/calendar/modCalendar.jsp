<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modCalendar</page>
<bw:emitText name="calForm" property="addingCalendar"
             tagName="creating"/>

<%@include file="/docs/calendar/displayCalendarCommon.jsp"%>
<%@include file="/docs/calendar/subscriptionStatus.jsp"%>

<%@include file="/docs/calendar/emitCalendars.jsp"%>

<publicCalendars>
  <c:set var="calendar" value="${bw_public_collection_list}"
         scope="session" />
  <%@include file="/docs/calendar/emitCalendar.jsp"%>
</publicCalendars>

<%@include file="/docs/synchInfo.jsp"%>

<%@include file="/docs/footer.jsp"%>


</bedework>
