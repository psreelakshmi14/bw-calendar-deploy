<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

  <%-- Generates standard calendar values for use in the client for forms, etc --%>
  <bw:emitLabels name="moduleState" indent="  " />

<%-- Required to force write in portal-struts bridge --%>
<% pageContext.getOut().flush(); %>

