
<bedework>
<%@include file="header.jsp"%>
<%
try {
%>
<page>tabApprovalQueueEvents</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<%@include file="/docs/event/eventListRoot.jsp"%>
<%
} catch (final Throwable t) {
  t.printStackTrace();
}
%>
<%@include file="footer.jsp"%>
</bedework>
