<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modSubscription</page>
<tab>calsuite</tab>

<bw:emitText name="calForm" property="addingCalendar"
             tagName="creating"/>

<%@include file="/docs/calendar/displayCalendarCommon.jsp"%>

<!-- subscriptions are a subset of calendars; there is no difference to the underlying code. -->
<calendars>
  <c:set var="calendar" value="${bw_user_collection_list}"
         scope="session" />
  <%@include file="/docs/calendar/emitCalendar.jsp"%>
</calendars>

<publicCalendars>
  <c:set var="calendar" value="${bw_public_collection_list}"
         scope="session" />

  <%-- open up the calendars to descend down the tree --%>
  <c:set var="fullTree" value="true" scope="request"/>

  <%@include file="/docs/calendar/emitCalendar.jsp"%>
</publicCalendars>

<categories>
  <bw:emitCategories name="bw_categories_list" scope="session"
                     tagName="all" indent="  "/>
  <bw:emitCategories name="calForm" property="calendar.categories"
                     tagName="current" indent="  "/>
</categories>

<%@include file="/docs/footer.jsp"%>
</bedework>
