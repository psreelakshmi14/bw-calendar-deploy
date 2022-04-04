<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modCalendar</page>
<tab>system</tab>

<bw:emitText name="calForm" property="addingCalendar"
             tagName="creating"/>

<%@include file="/docs/calendar/displayCalendarCommon.jsp"%>
<%@include file="/docs/calendar/subscriptionStatus.jsp"%>

<%@include file="/docs/calendar/emitCalendars.jsp"%>

<categories>
  <bw:emitCategories name="bw_categories_list" scope="session"
                     tagName="all" indent="  "/>
  <bw:emitCategories name="calForm" property="calendar.categories"
                     tagName="current" indent="  "/>
</categories>

<%@include file="/docs/footer.jsp"%>


</bedework>
