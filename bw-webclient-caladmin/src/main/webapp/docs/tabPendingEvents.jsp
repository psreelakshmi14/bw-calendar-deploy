
<bedework>
<%@include file="header.jsp"%>
<%
try {
%>
<page>tabPendingEvents</page>
<tab>pending</tab>

<%@include file="/docs/event/eventListRoot.jsp"%>
<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>
<%@include file="footer.jsp"%>
</bedework>
