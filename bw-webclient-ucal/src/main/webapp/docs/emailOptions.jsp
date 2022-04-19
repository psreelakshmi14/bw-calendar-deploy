<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='bedework' prefix='bw' %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>emailOptions</page>

<emailoptionsform>
  <bwhtml:form action="mail/mailEvent">
    <bw:textField name="calForm" property="lastEmail"
                  tagName="email" />
    <bw:textField name="calForm" property="lastSubject"
                  tagName="subject" />
  </bwhtml:form>
</emailoptionsform>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
