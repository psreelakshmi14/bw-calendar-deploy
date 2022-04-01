<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>

<notifications>
    <c:if test="${not empty calForm.notificationInfo}" >
        <c:set var="notificationInfo" value="${calForm.notificationInfo}" />
        <%@include file="/docs/notifications/notificationInfo.jsp"%>
    </c:if>
</notifications>

