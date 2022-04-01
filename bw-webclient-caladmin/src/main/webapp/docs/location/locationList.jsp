<%@ taglib uri='struts-logic' prefix='logic' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>locationList</page>
<tab>main</tab>

<locations>
  <c:if test="${not empty sessionScope.bw_editable_locations_list}">
    <logic:iterate id="location" name="bw_editable_locations_list"
                   scope="session">
      <%@include file="/docs/location/emitLocation.jsp"%>
    </logic:iterate>
  </c:if>
</locations>

<%@include file="/docs/footer.jsp"%>

</bedework>
