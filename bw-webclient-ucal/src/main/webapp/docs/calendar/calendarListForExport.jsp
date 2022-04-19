<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>calendarListForExport</page>

<%-- list the public calendars; we can get subscriptions and myCalendars
     from the header xml --%>

<calendars>
  <c:if test="${not empty sessionScope.bw_public_collection_list}">
    <c:set var="calendar"
           value="${bw_public_collection_list}"
           scope="session" />
    <%@include file="/docs/calendar/emitCalendar.jsp"%>
  </c:if>
</calendars>

<formElements>
  <bwhtml:form action="event/editEvent">
    <start>
      <bw:selectDateTime name="calForm"
                         property="eventStartDate"
                         indent="      "
                         noyear="true" />
      <bw:textField property="eventStartDate.year" size="4"
                    tagName="yearText" />
    </start>
    <end>
      <bw:selectDateTime name="calForm"
                         property="eventEndDate"
                         indent="      "
                         noyear="true" />
      <bw:textField property="eventEndDate.year" size="4"
                    tagName="yearText" />
    </end>
  </bwhtml:form>
</formElements>

<%@include file="/docs/footer.jsp"%>
</bedework>
