<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<calendar>
  <bw:emitCollection name="calendar" indent="  " full="true" noTag="true" />

  <c:if test="${!globals.guest}">
    <%-- don't publish privs and acls to the public client --%>
    <bw:emitCurrentPrivs name="calendar" property="currentAccess"
                         scope="session"/>
    <bw:emitAcl name="calendar" property="currentAccess"
                scope="session"/>
  </c:if>

  <bw:getChildren id="children" name="calendar" />
  <c:if test="${not empty children}">
    <c:forEach var="cal" items="${children}">
      <c:set var="calendar" value="${cal}" scope="session" />
      <jsp:include page="/docs/calendar/emitCalendar.jsp" />
    </c:forEach>
  </c:if>
</calendar>

