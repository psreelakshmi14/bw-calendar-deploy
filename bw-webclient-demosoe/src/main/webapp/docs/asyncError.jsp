<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>

<%
try {
%>
<bedework>
  <page>async</page>
  <status>error: see server log for details</status>
</bedework>

<%
} catch (final Throwable t) {
  t.printStackTrace();
}
%>