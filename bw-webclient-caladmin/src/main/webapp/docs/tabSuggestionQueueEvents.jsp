
<bedework>
<%@include file="header.jsp"%>
<%
try {
%>
<page>tabSuggestionQueueEvents</page>
<tab>suggestionQueue</tab>

<%@include file="/docs/event/eventListRoot.jsp"%>
<%
} catch (final Throwable t) {
  t.printStackTrace();
}
%>
<%@include file="footer.jsp"%>
</bedework>
