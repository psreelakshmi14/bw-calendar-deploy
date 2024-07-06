<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteResourceConfirm</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<c:set var="curResource" value="${calForm.calSuiteResource}"/>
<currentResource>
  <bw:emitText name="curResource" property="name" />
  <bw:emitText name="curResource" property="contentType"
               tagName="content-type"/>
  <bw:emitText name="curResource" property="rclass"
               tagName="class"/>
  <bw:emitText name="curResource" property="type" />
  <bw:emitText name="curResource" property="path" />
</currentResource>

<%@include file="/docs/footer.jsp"%>
</bedework>
