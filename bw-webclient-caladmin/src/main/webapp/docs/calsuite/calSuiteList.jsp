<%@ taglib uri='struts-logic' prefix='logic' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>calSuiteList</page>
<tab>system</tab>

<calSuites>
  <logic:iterate id="calSuite" name="calForm" property="calSuites" >
    <%@include file="/docs/calsuite/emitCalSuite.jsp"%>
  </logic:iterate>
</calSuites>

<%@include file="/docs/footer.jsp"%>

</bedework>
