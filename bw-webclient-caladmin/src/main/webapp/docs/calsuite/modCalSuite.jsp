<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modCalSuite</page>

<c:set var="calSuite" value="${calForm.calSuite}"/>
<%@include file="/docs/calsuite/emitCalSuite.jsp"%>

<%@include file="/docs/footer.jsp"%>

</bedework>
