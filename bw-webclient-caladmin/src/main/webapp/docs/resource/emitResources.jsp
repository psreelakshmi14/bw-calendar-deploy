<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<resources>
  <c:forEach var="resource" items="${calForm.calSuiteResources}">
    <resource>
      <bw:emitText name="resource" property="name" />
      <bw:emitText name="resource" property="contentType"
                   tagName="content-type"/>
      <bw:emitText name="resource" property="rclass"
                   tagName="class"/>
      <bw:emitText name="resource" property="type" />
      <bw:emitText name="resource" property="path" />
    </resource>
  </c:forEach>
</resources>
