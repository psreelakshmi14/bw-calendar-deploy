<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<c:set var="event" value="${eventFmt.event}"  />
<%-- Output a single event. This page handles fields common to all views --%>
  <event>
    <bw:emitText name="event" property="entityType"/>
    <bw:emitText name="event" property="scheduleMethod"/>
    <bw:emitText name="event" property="name"/>
    <bw:emitText name="event" property="created"/>
    <start><%-- start date and time --%>
      <bw:emitText name="event" property="noStart"/>
      <c:set var="date" value="${eventFmt.start}"
             scope="request" />
      <%@ include file="/docs/event/emitDate.jsp" %>
    </start>
    <end><%-- end date and time --%>
      <bw:emitText name="event" property="endType" tagName="type"/>
      <c:set var="date" value="${eventFmt.end}"
             scope="request" />
      <%@ include file="/docs/event/emitDate.jsp" %>
    </end>
    <bw:emitText name="event" property="creatorHref" tagName="creator"/>
    <bw:emitText name="event" property="ownerHref" tagName="owner"/>

    <bw:emitText name="event" property="id"/><%--
      Value: integer - event id --%>
    <bw:emitText name="event" property="uid" tagName="guid" />
    <bw:emitText name="event" property="encodedHref" />
    <bw:emitText name="event" property="recurrenceId" />
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

    <%-- Output any event fields with forms specific to short format displays --%>
    <c:if test="${not empty event.location}">
      <c:set var="location" value="${event.location}"/>
      <location>
        <bw:emitText name="location" property="uid"/><%--
            Value: location uid --%>
        <bw:emitText name="location" property="combinedValues" />
        <bw:emitText name="location" property="addressField" tagName="address"/><%--
          Value: string - physical address of the location --%>
        <bw:emitText name="location" property="roomField" />
        <bw:emitText name="location" property="subField1" />
        <bw:emitText name="location" property="subField2" />
        <logic:equal name="location" property="accessible" value="true" >
          <accessible>true</accessible>
        </logic:equal>
        <logic:notEqual name="location" property="accessible" value="true" >
          <accessible>false</accessible>
        </logic:notEqual>
        <bw:emitText name="location" property="geouri" />
        <bw:emitText name="location" property="status" />
        <c:if test="${not empty location.subaddress}">
          <bw:emitText name="location" property="subaddress.value"
                       tagName="subaddress"/><%--
            Value: string - more address information --%>
        </c:if>
        <bw:emitText name="location" property="street" />
        <bw:emitText name="location" property="city" />
        <bw:emitText name="location" property="state" />
        <bw:emitText name="location" property="zip" />
        <bw:emitText name="location" property="link"/>

        <bw:emitText name="location" property="code" />
        <bw:emitText name="location" property="alternateAddress" /><%--
            Value: URI - link to a web address for the location --%>
        <bw:emitText name="location" property="creatorHref" tagName="creator" /><%--
          Value: string - location creator id --%>
      </location>
    </c:if>
    <c:if test="${empty event.location}">
      <location>
        <address></address>
        <uid></uid><%--
          Value: integer - location id --%>
        <subaddress></subaddress><%--
          Value: string - more address information --%>
        <link></link><%--
          Value: URI - link to a web address for the location --%>
        <creator></creator><%--
          Value: string - location creator id --%>
      </location>
    </c:if>

    <bw:emitCategories name="event"  property="categories"
                       tagName="categories" indent="    "/>
    <bw:emitXprops name="event" property="xproperties"/>

    <c:if test="${not empty event.percentComplete}">
      <bw:emitText name="event" property="percentComplete"/>
    </c:if>

    <c:if test="${not empty event.geo}">
      <bw:emitText name="event" property="geo.latitude" tagName="latitude"/>
      <bw:emitText name="event" property="geo.longitude" tagName="longitude"/>
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
    <logic:equal name="calForm" property="guest" value="false">
      <bw:emitCurrentPrivs name="eventInfo" property="currentAccess" />
    </logic:equal>
  </event>
