<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<resources>
  <logic:iterate name="calForm" property="calSuiteResources" id="resource">
    <resource>
      <bw:emitText name="resource" property="name" />
      <bw:emitText name="resource" property="contentType"
                   tagName="content-type"/>
      <bw:emitText name="resource" property="rclass"
                   tagName="class"/>
      <bw:emitText name="resource" property="type" />
      <bw:emitText name="resource" property="path" />
    </resource>
  </logic:iterate>
</resources>
