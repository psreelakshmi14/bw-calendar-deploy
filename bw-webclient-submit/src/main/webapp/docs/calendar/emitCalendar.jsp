<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<calendar>
  <bw:emitCollection name="calendar" indent="  " full="true" noTag="true" />
  
  <bw:emitCurrentPrivs name="calendar" property="currentAccess" />
  <bw:emitAcl name="calendar" property="currentAccess" />

  <bw:getChildren id="children" name="calendar" />
  <c:forEach var="cal" items="${children}">
    <c:set var="calendar" value="${cal}" scope="session" />
    <jsp:include page="/docs/calendar/emitCalendar.jsp" />
  </c:forEach>
</calendar>

