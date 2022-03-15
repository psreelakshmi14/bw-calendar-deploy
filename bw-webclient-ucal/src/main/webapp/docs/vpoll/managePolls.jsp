<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
  try {
%>

  <page>managePolls</page>

  <vpoll>
    <bw:emitText name="calForm" property="requestedUid" tagName="uid" />
    <tab><logic:present name="bw_req_vpoll_tab" scope="session" ><c:out value="${bw_req_vpoll_tab}" /></logic:present></tab>
    <defaultCalendarPath><logic:present name="bw_default_event_calendar" scope="session" ><c:out value="${bw_default_event_calendar}"/></logic:present></defaultCalendarPath>
  </vpoll>

<%
  } catch (final Throwable t) {
    t.printStackTrace();
  }
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>