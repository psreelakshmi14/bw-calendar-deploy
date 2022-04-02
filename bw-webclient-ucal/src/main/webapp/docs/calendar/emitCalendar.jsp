<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<calendar>
  <bw:emitCollection name="calendar" indent="  " full="true" noTag="true" />

  <logic:equal name="calForm" property="guest" value="false">
    <%-- don't publish privs and acls to the public client --%>
    <bw:emitCurrentPrivs name="calendar" property="currentAccess" />
    <bw:emitAcl name="calendar" property="currentAccess" />
  </logic:equal>

  <bw:getChildren id="children" name="calendar" />
  <c:if test="${not empty children}">
    <logic:iterate name="children" id="cal">
      <c:set var="calendar" value="${cal}" scope="session" />
      <jsp:include page="/docs/calendar/emitCalendar.jsp" />
    </logic:iterate>
  </c:if>
</calendar>

