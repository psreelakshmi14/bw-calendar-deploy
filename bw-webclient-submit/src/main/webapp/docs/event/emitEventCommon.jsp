<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<%-- Output a single event. This page handles fields common to all views --%>
  <event>
    <bw:emitText name="event" property="entityType"/>
    <bw:emitText name="event" property="scheduleMethod"/>
    <start><%-- start date and time --%>
      <c:set var="date" value="${eventFmt.start}"
             scope="request" />
      <%@ include file="/docs/event/emitDate.jsp" %>
    </start>
    <end><%-- end date and time --%>
      <c:set var="date" value="${eventFmt.end}"
             scope="request" />
      <%@ include file="/docs/event/emitDate.jsp" %>
    </end>
    <bw:emitText name="event" property="creatorHref" tagName="creator"/>
    <bw:emitText name="event" property="ownerHref" tagName="owner"/>
    <bw:emitText name="event" property="calSuite"/>

    <bw:emitText name="event" property="id"/><%--
      Value: integer - event id --%>
    <bw:emitText name="event" property="uid" tagName="guid" />
    <bw:emitText name="event" property="encodedHref" />
    <bw:emitText name="event" property="recurrenceId" tagName="recurrenceId" />
    <bw:emitText name="event" property="summary" /><%--
      Value: string - short description, typically used for the event title  --%>
    <bw:emitText name="event" property="link"/><%--
      Value: URI - link associated with the event --%>
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

    <logic:present  name="event" property="percentComplete">
      <bw:emitText name="event" property="percentComplete"/>
    </logic:present>

    <logic:notPresent name="detailView" scope="request"><%-- look for short form --%>
      <logic:notPresent name="allView" scope="request">
        <jsp:include page="/docs/event/emitEventShort.jsp"/>
      </logic:notPresent>
    </logic:notPresent>

    <logic:present name="detailView" scope="request">
      <jsp:include page="/docs/event/emitEventDetail.jsp"/>
    </logic:present>

    <logic:present name="allView" scope="request">
      <jsp:include page="/docs/event/emitEventDetail.jsp"/>
      <jsp:include page="/docs/event/emitEventAll.jsp"/>
    </logic:present>


    <%-- ****************************************************************
          the following code should not be produced in the public client
         **************************************************************** --%>
    <logic:equal name="calForm" property="guest" value="false">
      <bw:emitCurrentPrivs name="eventInfo" property="currentAccess" />
    </logic:equal>
  </event>
