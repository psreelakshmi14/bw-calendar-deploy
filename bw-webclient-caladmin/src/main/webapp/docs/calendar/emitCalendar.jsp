<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<calendar>
  <bw:emitCollection name="calendar" indent="  " full="true" noTag="true" />

  <bw:emitCurrentPrivs name="calendar" property="currentAccess" />
  <bw:emitAcl name="calendar" property="currentAccess" />

  <c:choose>
    <c:when test="${requestScope.fullTree == 'true'}">
      <%-- a request has been made by the calling page to descend down the tree
           and ignore the open or closed state of calendars  --%>
      <bw:getChildren id="children" name="calendar" form="calForm" />
      <c:forEach var="cal" items="${children}">
        <c:set var="calendar" value="${cal}" scope="session" />
          <%--
        <c:if test="${requestScope.stopDescent == 'true'}">
          < % - - an explicit request has been made to stop descending the full tree - - % >
          <c:set var="fullTree" value="false" toScope="request"/>
        </c:if>
        --%>
        <c:if test="${!((requestScope.stopDescentAtAliases == 'true') and (internalAlias == 'true' or externalSub == 'true'))}">
          <jsp:include page="/docs/calendar/emitCalendar.jsp" />
        </c:if>
      </c:forEach>
    </c:when>
    <c:otherwise>
      <%-- the default behavior is to descend down the tree
           based on the open or closed state of calendars  --%>
      <c:if test="${calendar.open}">
        <bw:getChildren id="children" name="calendar" form="calForm" />
        <c:forEach var="cal" items="${children}">
          <c:set var="calendar" value="${cal}" scope="session" />
          <jsp:include page="/docs/calendar/emitCalendar.jsp" />
        </c:forEach>
      </c:if>
    </c:otherwise>
  </c:choose>
</calendar>

