<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteEventConfirm</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<bw:emitText name="calForm" property="markDeleted"/>
<c:set var="allView" value="true" scope="request"/>
<c:set var="eventFormatter" value="${calForm.curEventFmt}"
       scope="request"/>

<%@ include file="/docs/event/emitEvent.jsp" %>

<%@include file="/docs/footer.jsp"%>

</bedework>
