<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>emailOptions</page>

<emailoptionsform>
  <bw:form action="mail/mailEvent">
    <bw:textField name="globals" property="lastEmail"
                  tagName="email" />
    <bw:textField name="globals" property="subject"
                  tagName="subject" />
  </bw:form>
</emailoptionsform>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
