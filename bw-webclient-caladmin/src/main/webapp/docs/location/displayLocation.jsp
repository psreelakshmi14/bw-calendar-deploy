<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='struts-html' prefix='html' %>
<html:xhtml/>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>displayLocation</page>
<tab>main</tab>

<locations>
  <logic:iterate id="location" name="calForm" property="editableLocations" >
    <%@include file="/docs/location/emitLocation.jsp"%>
  </logic:iterate>
</locations>

<%@include file="/docs/footer.jsp"%>



</bedework>
