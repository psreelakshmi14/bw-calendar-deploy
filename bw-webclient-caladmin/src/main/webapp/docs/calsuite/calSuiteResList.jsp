<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='struts-html' prefix='html' %>
<html:xhtml/>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>calSuiteRes</page>
<tab>system</tab>

<calSuiteResources>
  <logic:iterate id="csres" name="calForm" property="calSuiteResources" >
  <calSuiteResource>
    <bw:emitText name="csres" property="name" />
    <bw:emitText name="csres" property="rclass" />
    <bw:emitText name="csres" property="type" />
    <bw:emitText name="csres" property="path" />
    <bw:emitText name="csres" property="contentType" />
  </calSuiteResource>
  </logic:iterate>
</calSuiteResources>

<%@include file="/docs/footer.jsp"%>

</bedework>
