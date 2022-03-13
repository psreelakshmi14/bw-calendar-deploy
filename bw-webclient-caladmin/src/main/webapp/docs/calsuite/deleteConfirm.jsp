<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='struts-genurl' prefix='genurl' %>
<%@ taglib uri='bedework' prefix='bw' %>
<html:xhtml/>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteCalSuiteConfirm</page>
<tab>system</tab>

<c:set var="calSuite" value="${calForm.calSuite}"/>
<calSuite>
  <bw:emitText name="calSuite" property="name" />
  <bw:emitText name="calSuite" property="group.name" tagName"group" />
  <bw:emitText name="calSuite" property="calendar.path" tagName"calPath" />
</calSuite>

<formElements>
  <genurl:form action="calSuite/delete.do" >
    <html:submit property="cancelled" value="Cancel"/>
    <html:submit property="deleteCalSuiteOK" value="Delete"/>
  </genurl:form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
