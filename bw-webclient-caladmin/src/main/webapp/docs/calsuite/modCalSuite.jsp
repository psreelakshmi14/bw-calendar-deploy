<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri='struts-html' prefix='html' %>
<html:xhtml/>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modCalSuite</page>
<tab>system</tab>

<c:set var="calSuite" value="${calForm.calSuite}"/>
<%@include file="/docs/calsuite/emitCalSuite.jsp"%>

<%@include file="/docs/footer.jsp"%>

</bedework>
