<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>calSuiteRes</page>

<c:set var="csres" value="${calForm.calSuiteResource}" />

  <calSuiteResource>
    <bw:emitText name="csres" property="name" />
    <bw:emitText name="csres" property="rclass" />
    <bw:emitText name="csres" property="type" />
    <bw:emitText name="csres" property="path" />
    <bw:emitText name="csres" property="contentType" />
    <bw:emitText name="csres" property="content" />
  </calSuiteResource>

<%@include file="/docs/footer.jsp"%>



</bedework>
