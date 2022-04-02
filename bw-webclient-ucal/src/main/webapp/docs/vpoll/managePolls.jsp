<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
  try {
%>

  <page>managePolls</page>

  <vpoll>
    <bw:emitText name="calForm" property="requestedUid" tagName="uid" />
    <tab><c:if test="${not empty sessionScope.bw_req_vpoll_tab}" ><c:out value="${bw_req_vpoll_tab}" /></c:if></tab>
    <defaultCalendarPath><c:if test="${not empty sessionScope.bw_default_event_calendar}" ><c:out value="${bw_default_event_calendar}"/></c:if></defaultCalendarPath>
  </vpoll>

<%
  } catch (final Throwable t) {
    t.printStackTrace();
  }
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>