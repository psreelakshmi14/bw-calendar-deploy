<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<%-- Output a single event. This page handles fields common to all views --%>
  <event>
    <bw:emitText name="event" property="entityType"/>
    <bw:emitText name="event" property="scheduleMethod"/>
    <bw:emitText name="event" property="name"/>
    <bw:emitText name="event" property="created"/>
    <start><%-- start date and time --%>
      <bw:emitText name="event" property="noStart"/>
      <bw:emitFormattedDates name="eventFmt" property="start" />
    </start>
    <end><%-- end date and time --%>
      <bw:emitText name="event" property="endType" tagName="type"/>
      <bw:emitFormattedDates name="eventFmt" property="end" />
    </end>
    <bw:emitText name="event" property="creatorHref" tagName="creator"/>
    <bw:emitText name="event" property="ownerHref" tagName="owner"/>

    <bw:emitText name="event" property="id"/><%--
      Value: integer - event id --%>
    <bw:emitText name="event" property="uid" tagName="guid" />
    <bw:emitText name="event" property="recurrenceId" tagName="recurrenceId" />
    <bw:emitText name="event" property="summary" /><%--
      Value: string - short description, typically used for the event title  --%>
    <bw:emitText name="event" property="color"/>
    <bw:emitText name="event" property="link"/><%--
      Value: URI - link associated with the event --%>
    <bw:emitText name="event" property="deleted"/>
    <bw:emitText name="event"
                 property="publick" tagName="public"/>
    <bw:emitText name="eventInfo" property="editable"/><%--
      Value: true,false - true if user can edit (and delete) event, false otherwise --%>
    <%-- This test does not work - fails if target is not a property
         We never use the result anyway.
    <c:if test="${not empty event.target}">
      <isAnnotation/>
    </c:if>
    --%>
    <bw:emitText name="eventInfo" property="kind"/><%--
      Value: 0 - actual event entry
             1 - 'added event' from a reference
             2 - from a subscription --%>
    <bw:emitText name="event" property="recurring"/><%--
      Value: true,false - true if the event is recurring --%>
    <bw:emitContainer name="event" indent="    " tagName="calendar" />
    <bw:emitText name="event" property="status" /><%-- Status
          Value: string, only one of CONFIRMED, TENTATIVE, or CANCELLED --%>

    <bw:emitXprops name="event" property="xproperties"/>

    <c:if test="${not empty event.percentComplete}">
      <bw:emitText name="event" property="percentComplete"/>
    </c:if>

    <c:if test="${not empty event.geo}">
      <bw:emitText name="event" property="geo.latitude" tagName="latitude"/>
      <bw:emitText name="event" property="geo.longitude" tagName="longitude"/>
    </c:if>

    <c:if test="${empty requestScope.detailView}"><%-- look for short form --%>
      <c:if test="${empty requestScope.allView}">
        <jsp:include page="/docs/event/emitEventShort.jsp"/>
      </c:if>
    </c:if>

    <c:if test="${not empty requestScope.detailView}">
      <%@ include file="/docs/event/emitEventDetail.jsp"%>
    </c:if>

    <c:if test="${not empty requestScope.allView}">
      <%@ include file="/docs/event/emitEventDetail.jsp"%>
      <%@ include file="/docs/event/emitEventAll.jsp" %>
    </c:if>

    <%-- ****************************************************************
          the following code should not be produced in the public client
         **************************************************************** --%>
    <c:if test="${!globals.guest}">
      <bw:emitCurrentPrivs name="eventInfo" property="currentAccess" />
    </c:if>
  </event>
