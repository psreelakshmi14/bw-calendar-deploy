<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>inbox</page>

<%--  Display inbox --%>
<c:set var="boxInfo" value="${calForm.inBoxInfo}" />
<inbox>
  <%@include file="/docs/schedule/inoutbox.jsp"%>
</inbox>

<%@include file="/docs/footer.jsp"%>

</bedework>
