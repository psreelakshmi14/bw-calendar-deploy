<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>attendees</page>
<c:set var="event" value="${calForm.eventFormatter.event}"/>
<%@ include file="/docs/schedule/emitEventProperties.jsp" %>

<%@ include file="/docs/freeBusy.jsp" %>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
