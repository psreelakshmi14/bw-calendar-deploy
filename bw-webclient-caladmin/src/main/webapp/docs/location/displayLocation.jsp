<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>displayLocation</page>
<tab>main</tab>

<locations>
  <c:forEach var="location" items="${calForm.editableLocations}" >
    <%@include file="/docs/location/emitLocation.jsp"%>
  </c:forEach>
</locations>

<%@include file="/docs/footer.jsp"%>



</bedework>
