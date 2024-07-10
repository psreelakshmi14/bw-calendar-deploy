<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<notifications>
    <c:if test="${not empty globals.notificationInfo}" >
        <c:set var="notificationInfo" value="${globals.notificationInfo}" />
        <%@include file="/docs/notifications/notificationInfo.jsp"%>
    </c:if>
</notifications>

