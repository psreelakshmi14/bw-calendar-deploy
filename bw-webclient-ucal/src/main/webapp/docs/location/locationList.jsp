<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>locationList</page>

<locations>
  <c:forEach var="location" items="${sessionScope.bw_editable_locations_list}" >
    <location>
      <bw:emitText name="location" property="addressField" tagName="address" />
      <bw:emitText name="location" property="street" tagName="subaddress"/>
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
