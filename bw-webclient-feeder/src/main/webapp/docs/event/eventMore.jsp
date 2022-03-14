<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@ include file="/docs/header.jsp" %>
<%
try {
%>
  <page>event</page>
  <%-- Wrapper for a single event (emitEvent.jsp) --%>
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
