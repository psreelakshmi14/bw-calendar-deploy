<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>searchResult</page>

<categories>
  <c:if test="${not empty sessionScope.bw_categories_list}">
    <logic:iterate id="category" name="bw_categories_list" scope="session">
      <%@include file="/docs/category/emitCategory.jsp"%>
    </logic:iterate>
  </c:if>
</categories>

<searchResults>
  <bw:emitText name="moduleState" property="query"/>
  <bw:emitText name="moduleState" property="searchLimits"/>
  <logic:notPresent name="bw_search_result" scope="request">
    <resultSize>0</resultSize>
  </logic:notPresent>

  <c:if name="bw_search_result" scope="request">
    <c:set var="sres" value="${bw_search_result}"/>
    <bw:emitText name="sres" property="found" tagName="resultSize" />
    <logic:iterate id="sre" name="bw_search_list" scope="request">
      <searchResult>
        <bw:emitText name="sre" property="score" />
        <logic:equal name="sre" property="docType" value="event">
          <c:set var="eventFmt" value="${sre.entity}" scope="request"  />
          <c:set var="eventInfo" value="${eventFmt.eventInfo}"
                 scope="request"  />
          <c:set var="event" value="${eventFmt.event}"
                 scope="request"  />

          <event>
            <bw:emitText name="event" property="entityType"/>
            <bw:emitText name="event" property="scheduleMethod"/>
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

            <c:if test="${not empty event.location}">
              <c:set var="location" value="${event.location}"/>
              <location>
                <bw:emitText name="location" property="id"/><%--
                    Value: integer - location id --%>
                <bw:emitText name="location" property="addressField" tagName="address"/><%--
                  Value: string - physical address of the location --%>
                <bw:emitText name="location" property="link"/><%--
                    Value: URI - link to a web address for the location --%>
              </location>
            </c:if>
            <c:if test="${empty event.location}">
              <location>
                <address></address>
              </location>
            </c:if>
          </event>
        </logic:equal>
      </searchResult>
    </logic:iterate>
  </logic:present>

</searchResults>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
