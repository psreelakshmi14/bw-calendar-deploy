
<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>upload</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
