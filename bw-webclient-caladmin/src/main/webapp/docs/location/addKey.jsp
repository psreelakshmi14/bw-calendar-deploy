<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>addLocationKey</page>

  <c:set var="location" value="${calForm.location}" />
  <%@include file="/docs/location/emitLocation.jsp"%>

  <!-- Mod pages contain only formElements for now; we do this to
       take advantage of Struts' form processing features -->
<formElements>
  <bw:form action="location/addKey" >
    <bw:textField property="key" size="30"
                  tagName="keyName" />
    <bw:textField property="value" size="30"
                    tagName="keyValue" />

    <submitButtons>
      <button type="add">addLocation</button>
      <button type="cancel">forwardto</button>
    </submitButtons>

  </bw:form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
