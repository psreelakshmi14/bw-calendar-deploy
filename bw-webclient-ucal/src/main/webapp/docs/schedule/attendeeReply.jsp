<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>
<%
try {
%>
  <page>attendeeReply</page>
  <%-- Wrapper for a single event (emitEvent.jsp) --%>

  <guidcals>
  <c:if test="${not empty calForm.meetingCal}">
    <c:set var="cal" value="${calForm.meetingCal}"/>
    <calendar>
      <bw:emitText name="cal" property="name"/>
      <bw:emitText name="cal" property="path"/>
    </calendar>
  </c:if>
  </guidcals>

  <c:set var="allView" value="true" scope="request"/>
  <c:set var="eventFormatter" value="${calForm.curEventFmt}"
         scope="request"/>

  <%@ include file="/docs/event/emitEvent.jsp" %>
<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>
</bedework>
