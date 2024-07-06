<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@include file="header.jsp"%>

<page>main</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<%--  Generate form elements to be exposed.
      These can be manipulated in the xslt if desired.
<formElements>
  <bw:form action="event/fetchForDisplay.do">
    <bw:textField name="calForm" property="eventId" size="6" />
    <html:submit value="go"/>
  </bw:form>
</formElements>
--%>

<%@include file="footer.jsp"%>
</bedework>

