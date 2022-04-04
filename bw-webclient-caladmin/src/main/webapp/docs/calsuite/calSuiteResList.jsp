
<bedework>
<%@include file="/docs/header.jsp"%>

<page>calSuiteRes</page>
<tab>system</tab>

<calSuiteResources>
  <c:forEach var="csres" items="${calForm.calSuiteResources}" >
  <calSuiteResource>
    <bw:emitText name="csres" property="name" />
    <bw:emitText name="csres" property="rclass" />
    <bw:emitText name="csres" property="type" />
    <bw:emitText name="csres" property="path" />
    <bw:emitText name="csres" property="contentType" />
  </calSuiteResource>
  </c:forEach>
</calSuiteResources>

<%@include file="/docs/footer.jsp"%>

</bedework>
