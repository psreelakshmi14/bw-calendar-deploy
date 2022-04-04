<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<properties>
  <c:forEach var="property" items="${properties.property}">
    <property>
      <bw:emitText name="property" property="name" />
      <bw:emitText name="property" property="value" />
    </property>
  </c:forEach>
</properties>
