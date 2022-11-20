
<bedework>
<%@include file="header.jsp"%>
<%
try {
%>
<page>tabPendingEvents</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<%@include file="/docs/event/eventListRoot.jsp"%>
<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>
<%@include file="footer.jsp"%>
</bedework>
