<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>attendeeRespond</page>

<formElements>
  <c:set var="event" value="${}calForm.event}"/>

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

  <bwhtml:form action="schedule/attendeeRespond">
    <title>
      <html:text name="event" property="summary"/>
    </title>
    <bw:emitContainer name="event" indent="    " tagName="calendar" />
    <allDay><html:checkbox property="eventStartDate.dateOnly"/></allDay>
    <start>
      <yearText>
        <html:text property="eventStartDate.year" size="4"/>
      </yearText>
      <bw:selectDateTime name="calForm"
                         property="eventStartDate"
                         indent="      "/>
    </start>
    <end>
      <bw:emitText name="calForm" property="eventEndType" tagName="type"/>
      <dateTime>
        <yearText>
          <html:text property="eventEndDate.year" size="4"/>
        </yearText>
        <bw:selectDateTime name="calForm"
                           property="eventEndDate"
                           indent="      "/>
      </dateTime>
      <duration>
        <days><html:text property="eventDuration.daysStr" size="2" /></days>
        <hours><html:text property="eventDuration.hoursStr" size="2" /></hours>
        <minutes><html:text property="eventDuration.minutesStr" size="2" /></minutes>
        <weeks><html:text property="eventDuration.weeksStr" size="2" /></weeks>
      </duration>
    </end>
    <desc><html:textarea name="event" property="description"></html:textarea></desc>
    <bw:emitText name="event" property="status"/>
    <bw:emitText name="event" property="transparency"/>
    <link><html:text name="event" property="link"/></link>
    <c:set var="locations" value="${bw_locations_list}" />
    <location>
      <locationmenu>
        <html:select property="locationUid">
          <html:optionsCollection name="locations"
                                  label="address"
                                  value="uid"/>
        </html:select>
      </locationmenu>
      <locationtext><html:text property="locationAddress.value" /></locationtext>
    </location>
  </bwhtml:form>
</formElements>
<c:set var="eventFormatter" value="${calForm.curEventFmt}"
       scope="request"/>
<bw:emitText name="eventFormatter" property="xmlAccess" tagName="access"
                 filter="no"/>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
