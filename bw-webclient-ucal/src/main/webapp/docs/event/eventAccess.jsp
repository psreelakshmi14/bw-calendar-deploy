<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<page>eventAccess</page>

<eventAccess>
  <subscriptionId></subscriptionId>
  <bw:emitText name="calForm" property="event.uid" tagName="guid"/>
  <bw:emitText name="calForm" property="event.recurrenceId"
               tagName="recurrenceId"/>
  <bw:emitContainer name="calForm" property="event"
                    indent="  " tagName="calendar" />

  <c:if test="${not empty calForm.curEventFmt}">
    <c:set var="eventFormatter" value="${calForm.curEventFmt}"/>
    <bw:emitText name="eventFormatter" property="xmlAccess" tagName="access"
                 filter="no"/>
  </c:if>
</eventAccess>



<%@ include file="/docs/footer.jsp" %>

</bedework>
