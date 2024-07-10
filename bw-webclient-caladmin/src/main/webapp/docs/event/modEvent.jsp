
<bedework>
<%@include file="/docs/header.jsp"%>
  <%
    try {
  %>
<page>modEvent</page>

<%@include file="/docs/event/eventForm.jsp"%>
  <%
    } catch (Throwable t) {
      t.printStackTrace();
    }
  %>
<%@include file="/docs/footer.jsp"%>

</bedework>
