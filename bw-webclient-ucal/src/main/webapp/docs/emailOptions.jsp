<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>emailOptions</page>

<emailoptionsform>
  <bwhtml:form action="mail/mailEvent">
    <email><html:text name="calForm" property="lastEmail"/></email>
    <subject><html:text name="calForm" property="lastSubject" /></subject>
  </bwhtml:form>
</emailoptionsform>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
