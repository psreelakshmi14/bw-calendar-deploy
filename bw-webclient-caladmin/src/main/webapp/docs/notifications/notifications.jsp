<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>

<notifications>
    <logic:present name="calForm" property="notificationInfo" >
        <c:set var="notificationInfo" value="${calForm.notificationInfo}" />
        <%@include file="/docs/notifications/notificationInfo.jsp"%>
    </logic:present>
</notifications>

