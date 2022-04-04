<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>locationList</page>
<tab>main</tab>

<locations>
  <c:if test="${not empty sessionScope.bw_editable_locations_list}">
    <c:forEach var="location" items="${sessionScope.bw_editable_locations_list}">
      <%@include file="/docs/location/emitLocation.jsp"%>
    </c:forEach>
  </c:if>
</locations>

<%@include file="/docs/footer.jsp"%>

</bedework>
