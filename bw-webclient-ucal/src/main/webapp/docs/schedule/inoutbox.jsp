<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<events>
  <c:forEach var="formattedEvent" items="${boxInfo.events}" >
    <c:set var="event" value="${formattedEvent.event}"/>

    <event>
      <bw:emitText name="event" property="name" />
      <bw:emitText name="event" property="entityType" />

      <bw:emitText name="event" property="scheduleState" />
      <bw:emitText name="event" property="scheduleMethod" />

      <%@ include file="/docs/schedule/emitEventProperties.jsp" %>

      <c:if test="${not empty event.requestStatuses}">
        <c:forEach var="requestStatus" items="${event.requestStatuses}">
          <bw:emitText name="requestStatus" />
        </c:forEach>
      </c:if>

      <bw:emitText name="event" property="summary"
                   tagName="title"/>
      <bw:emitText name="event" property="uid" tagName="guid" />
      <bw:emitText name="event" property="recurrenceId" tagName="recurrenceId" />

      <c:if test="${not empty formattedEvent.start}">
        <start><%-- start date and time --%>
          <bw:emitFormattedDates name="formattedEvent" property="start" />
        </start>
      </c:if>
      <c:if test="${not empty formattedEvent.end}">
        <end><%-- end date and time --%>
          <bw:emitFormattedDates name="formattedEvent" property="end" />
        </end>
      </c:if>
      <%-- last mod date string --%>
      <bw:emitText name="event" property="lastmod" />
      <dtstamp><%-- date stamp and time --%>
        <bw:emitFormattedDates name="formattedEvent" property="dtstamp" />
      </dtstamp>

      <bw:emitContainer name="event" indent="      " tagName="calendar" />
      <bw:emitText name="event" property="description" tagName="desc" />
      <bw:emitText name="event" property="status"/>
      <bw:emitText name="event" property="link" />
      <bw:emitText name="event" property="cost" />

      <c:if test="${not empty event.location}">
        <bw:emitText name="formattedEvent" property="event.location.address.value"
                     tagName="location"/>
      </c:if>
      <c:if test="${empty event.location}">
        <location></location>
      </c:if>

      <c:if test="${not empty event.contact}">
        <bw:emitText name="formattedEvent" property="event.contact.cn.value"
                     tagName="contact"/>
      </c:if>
      <c:if test="${empty event.contact}">
        <contact></contact>
      </c:if>

      <bw:emitText name="formattedEvent" property="event.creatorHref"
                   tagName="creator"/>
    </event>
  </c:forEach>
</events>

