<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<c:set var="eventFmt" value="${eventFormatter}" />
<c:set var="eventInfo" value="${eventFmt.eventInfo}" scope="request"  />
<c:set var="event" value="${eventFmt.event}" scope="request"  />
<%-- Output a single event. This page handles fields common to all views --%>
<%@ include file="/docs/event/emitEventCommon.jsp" %>

