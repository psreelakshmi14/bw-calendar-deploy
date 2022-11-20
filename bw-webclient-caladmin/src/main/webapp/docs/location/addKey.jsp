<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>addLocationKey</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

  <c:set var="location" value="${calForm.location}" />
  <%@include file="/docs/location/emitLocation.jsp"%>

  <!-- Mod pages contain only formElements for now; we do this to
       take advantage of Struts' form processing features -->
<formElements>
  <bwhtml:form action="location/addKey" >
    <bw:textField property="key" size="30"
                  tagName="keyName" />
    <bw:textField property="value" size="30"
                    tagName="keyValue" />

    <submitButtons>
      <button type="add">addLocation</button>
      <button type="cancel">forwardto</button>
    </submitButtons>

  </bwhtml:form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
