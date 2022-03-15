<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>freeBusy</page>

<%@ include file="/docs/freeBusy.jsp" %>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
