<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

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
  <c:url value="/calSuite/delete.do" var="theUrl"/>
  <form id="calForm" method="post" action="${theUrl}">
    <input type="submit" name="cancelled" value="Cancel" />
    <input type="submit" name="deleteCalSuiteOK" value="Delete" />
  </form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
