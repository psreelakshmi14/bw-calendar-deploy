
<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>upload</page>
<tab>system</tab>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
