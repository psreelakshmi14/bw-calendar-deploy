<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>locationList</page>

<locations>
  <c:forEach var="location" items="${calForm.editableLocations}" >
    <location>
      <bw:emitText name="location" property="address.value" tagName="address" />
      <c:if test="${not empty location.subaddress}">
        <bw:emitText name="location" property="subaddress.value" tagName="subaddress"/>
      </c:if>
      <bw:emitText name="location" property="link" />
      <bw:emitText name="location" property="uid" />
    </location>
  </c:forEach>
</locations>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
