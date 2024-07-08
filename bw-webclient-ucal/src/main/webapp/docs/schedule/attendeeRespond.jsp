<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>attendeeRespond</page>
  <c:set var="calInfo" value="${moduleState.calInfo}" />

<formElements>
  <c:set var="event" value="${calForm.event}"/>

  <bw:emitText name="event" property="scheduleState" />
  <bw:emitText name="event" property="scheduleMethod" />

  <subscriptionId></subscriptionId>
  <bw:emitText name="event" property="uid" tagName="guid" />
  <bw:emitText name="event" property="recurrenceId" />

  <guidcals>
    <c:if test="${not empty calForm.meetingCal}">
    <c:set var="cal" value="${calForm.meetingCal}"/>
    <calendar>
      <bw:emitText name="cal" property="name"/>
      <bw:emitText name="cal" property="path"/>
    </calendar>
    </c:if>
  </guidcals>

  <c:if test="${empty event.location}">
    <location>
      <address></address>
      <id></id><%--
        Value: integer - location id --%>
      <subaddress></subaddress><%--
        Value: string - more address information --%>
      <link></link><%--
        Value: URI - link to a web address for the location --%>
      <creator></creator><%--
        Value: string - location creator id --%>
    </location>
  </c:if>

  <%@ include file="/docs/schedule/emitEventProperties.jsp" %>

  <bw:form action="schedule/attendeeRespond">
    <bw:textField name="event" property="summary"
                  tagName="title" />
    <bw:emitContainer name="event" indent="    " tagName="calendar" />
    <bw:checkbox property="eventStartDate.dateOnly"
                 tagName="allDay" />
    <start>
      <bw:textField property="eventStartDate.year" size="4"
                    tagName="yearText" />
      <bw:selectDateTime name="calForm"
                         property="eventStartDate"
                         indent="      "
                         yearVals="${calInfo.yearVals}"/>
    </start>
    <end>
      <bw:emitText name="calForm" property="eventEndType" tagName="type"/>
      <dateTime>
        <bw:textField property="eventEndDate.year" size="4"
                      tagName="yearText" />
        <bw:selectDateTime name="calForm"
                           property="eventEndDate"
                           indent="      "
                           yearVals="${calInfo.yearVals}"/>
      </dateTime>
      <duration>
        <bw:textField property="eventDuration.daysStr" size="2"
                      tagName="days" />
        <bw:textField property="eventDuration.hoursStr" size="2"
                      tagName="hours" />
        <bw:textField property="eventDuration.minutesStr" size="2"
                      tagName="minutes" />
        <bw:textField property="eventDuration.weeksStr" size="2"
                      tagName="weeks"/>
      </duration>
    </end>
    <desc><textarea><c:out value='${event.description}'/></textarea></desc>
    <bw:emitText name="event" property="status"/>
    <bw:emitText name="event" property="transparency"/>
    <bw:textField name="event" property="link"
                  tagName="link" />
    <c:set var="locations" value="${bw_locations_list}" />
    <location>
      <locationmenu>
        <bw:selectLocation name="calForm"
                           property="locationUid"
                           locs="locations"
                           indent="    "/>
      </locationmenu>
      <bw:textField property="locationAddress.value"
                    tagName="locationtext"/>
    </location>
  </bw:form>
</formElements>
<c:set var="eventFormatter" value="${calForm.curEventFmt}"
       scope="request"/>
<bw:emitText name="eventFormatter" property="xmlAccess"
             tagName="access"
             filter="no"/>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
