<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>addLocationKey</page>
<tab>main</tab>

  <c:set var="location" value="${calForm.location}" />
  <%@include file="/docs/location/emitLocation.jsp"%>

  <!-- Mod pages contain only formElements for now; we do this to
       take advantage of Struts' form processing features -->
<formElements>
  <bwhtml:form action="location/addKey" >
    <keyName><html:text size="30" /></keyName>
    <keyValue><html:text size="30" /></keyValue>

    <submitButtons>
      <button type="add">addLocation</button>
      <button type="cancel">forwardto</button>
    </submitButtons>

  </bwhtml:form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
