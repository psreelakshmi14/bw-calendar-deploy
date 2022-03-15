<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<events>
  <logic:iterate id="formattedEvent" name="boxInfo" property="events" >

    <c:set var="event" value="${formattedEvent.event}"/>

    <event>
      <bw:emitText name="event" property="name" />
      <bw:emitText name="event" property="entityType" />

      <bw:emitText name="event" property="scheduleState" />
      <bw:emitText name="event" property="scheduleMethod" />

      <%@ include file="/docs/schedule/emitEventProperties.jsp" %>

      <logic:present  name="event" property="requestStatuses">
        <logic:iterate id="requestStatus" name="event" property="requestStatuses">
          <bw:emitText name="requestStatus" />
        </logic:iterate>
      </logic:present>

      <bw:emitText name="event" property="summary"
                   tagName="title"/>
      <bw:emitText name="event" property="uid" tagName="guid" />
      <bw:emitText name="event" property="recurrenceId" tagName="recurrenceId" />

      <logic:present name="formattedEvent" property="start">
        <start><%-- start date and time --%>
          <c:set var="date" value="${formattedEvent.start}"
                 scope="request" />
          <%@ include file="/docs/event/emitDate.jsp" %>
        </start>
      </logic:present>
      <logic:present name="formattedEvent" property="end">
        <end><%-- end date and time --%>
          <c:set var="date" value="${formattedEvent.end}"
                 scope="request" />
          <%@ include file="/docs/event/emitDate.jsp" %>
        </end>
      </logic:present>
      <%-- last mod date string --%>
      <bw:emitText name="event" property="lastmod" />
      <dtstamp><%-- date stamp and time --%>
        <c:set var="date" value="${formattedEvent.dtstamp}"
               scope="request" />
        <%@ include file="/docs/event/emitDate.jsp" %>
      </dtstamp>

      <bw:emitContainer name="event" indent="      " tagName="calendar" />
      <bw:emitText name="event" property="description" tagName="desc" />
      <bw:emitText name="event" property="status"/>
      <bw:emitText name="event" property="link" />
      <bw:emitText name="event" property="cost" />

      <logic:present name="event" property="location">
        <bw:emitText name="formattedEvent" property="event.location.address.value"
                     tagName="location"/>
      </logic:present>
      <logic:notPresent name="event" property="location">
        <location></location>
      </logic:notPresent>

      <logic:present name="event" property="contact">
        <bw:emitText name="formattedEvent" property="event.contact.cn.value"
                     tagName="contact"/>
      </logic:present>
      <logic:notPresent name="event" property="contact">
        <contact></contact>
      </logic:notPresent>

      <bw:emitText name="formattedEvent" property="event.creatorHref"
                   tagName="creator"/>
    </event>
  </logic:iterate>
</events>

