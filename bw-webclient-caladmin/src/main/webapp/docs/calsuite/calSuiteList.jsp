<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>calSuiteList</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<calSuites>
  <c:forEach var="calSuite" items="${calForm.calSuites}" >
    <%@include file="/docs/calsuite/emitCalSuite.jsp"%>
  </c:forEach>
</calSuites>

<%@include file="/docs/footer.jsp"%>

</bedework>
